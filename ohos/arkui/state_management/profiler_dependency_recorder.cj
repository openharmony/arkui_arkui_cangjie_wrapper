/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ohos.arkui.state_management

import std.collection.{ArrayList, HashMap}
import ohos.base.{BASE_LOG}

/**
 * Per-property metadata collected at compile time (macro expansion) and read
 * at runtime via std.reflect.ClassTypeInfo from the static arrays embedded in
 * @Component and @Observed classes.
 *
 * Each instance maps one mangled property key to its decorator label, original
 * field name, and owning class name — used during profiler JSON construction.
 */
struct ProfilerFieldMeta {
    let decorator: String
    let fieldName: String
    let className: String

    init(decorator: String, fieldName: String, className: String) {
        this.decorator = decorator
        this.fieldName = fieldName
        this.className = className
    }
}

/** Core fields identifying a sync peer in the profiler chain. */
struct ProfilerPeerConfig {
    let decorator: String
    let propertyName: String
    let propertyId: Int32

    init(decorator: String, propertyName: String, propertyId: Int32) {
        this.decorator = decorator
        this.propertyName = propertyName
        this.propertyId = propertyId
    }
}

/** mangled property name → per-property metadata. Lazily initialized on first access. */
private var fieldMetaMap: ?HashMap<String, ProfilerFieldMeta> = None

/** observer component id → class name */
private let observerClassMap = HashMap<Int64, String>()

/** (observerId, fieldName) → decorator override (for @Link / @Consume) */
private let decoratorOverrideMap = HashMap<Int64, HashMap<String, String>>()

/** Registry for view element IDs — avoids ABI risk of interface default methods on Observer. */
private let profilerViewElementIdRegistry = HashMap<Int64, Int32>()

/** observerId → (info/mangledKey → [elmtId₁, elmtId₂, …]) */
private let profilerDependentDepsRegistry = HashMap<Int64, HashMap<String, ArrayList<Int64>>>()

/** info/mangledKey → property instance id. Registry avoids changing ObservedProperty<T> instance layout. */
private let propertyInstanceIdRegistry = HashMap<String, Int32>()

/** Stack tracking the current observer component during recursive UI tree construction. */
private let profilerObserverStack = ArrayList<Int64>()

/** Monotonic counter for assigning unique property instance IDs. */
private var nextProfilerPropertyInstanceId: Int32 = 1

/**
 * Remove all profiler registrations for the given observer component.
 * Called when an observer is destroyed to prevent stale entries in the
 * dependency registry, class map, view-element map, and decorator overrides.
 *
 * @param observerId - The observer component ID to clean up.
 */
protected func profilerCleanupObserver(observerId: Int64): Unit {
    observerClassMap.remove(observerId)
    profilerViewElementIdRegistry.remove(observerId)
    decoratorOverrideMap.remove(observerId)
    profilerDependentDepsRegistry.remove(observerId)
}

/**
 * Pop the topmost observer from the dependency tracking stack.
 * Must be paired with profilerDependencyPushObserver — called after
 * compilerAssignedUpdateFunc(...).initial() completes so that subsequent
 * state variable reads are attributed to the parent observer.
 */
protected func profilerDependencyPopObserver(): Unit {
    if (profilerObserverStack.isEmpty()) {
        return
    }
    profilerObserverStack.remove(at: profilerObserverStack.size - 1)
}

/**
 * Push an observer component ID onto the dependency tracking stack.
 * While this observer is on the stack, state variable reads during recursive
 * UI tree construction are attributed to it via profilerDependencyCurrentObserver().
 * Must be paired with profilerDependencyPopObserver.
 *
 * @param observerCompId - The observer component ID to push.
 */
protected func profilerDependencyPushObserver(observerCompId: Int64): Unit {
    profilerObserverStack.add(observerCompId)
}

/**
 * Register the mapping from an observer component ID to its view element ID.
 * Called during observeComponentCreation before the component's initial() executes,
 * so that the profiler can later look up which view element owns a given observer.
 *
 * @param observerId - The observer component ID.
 * @param elementId  - The corresponding view element ID.
 */
protected func profilerRegisterViewElementId(observerId: Int64, elementId: Int32): Unit {
    profilerViewElementIdRegistry.add(observerId, elementId)
}

func profilerGetFieldMetaMap(): HashMap<String, ProfilerFieldMeta> {
    match (fieldMetaMap) {
        case Some(m) => m
        case None =>
            let m = HashMap<String, ProfilerFieldMeta>()
            fieldMetaMap = Some(m)
            m
    }
}

func escapeProfilerJsonString(s: String): String {
    s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r")
}

/**
 * Return the observer component ID currently on top of the dependency stack,
 * or PROFILER_INVALID_ELEMENT_ID if the stack is empty.
 * Used by recordDependentUpdate to attribute a property read to the correct observer.
 */
func profilerDependencyCurrentObserver(): Int64 {
    if (profilerObserverStack.isEmpty()) {
        return PROFILER_INVALID_ELEMENT_ID
    }
    profilerObserverStack[profilerObserverStack.size - 1]
}

/**
 * Extract all element IDs that depend on a given property for the specified observer.
 * Looks up profilerDependentDepsRegistry[observerCompId] and returns the element ID
 * list matching the property info key. Used during JSON dump to populate the
 * dependentElmtIdsCsv field in the profiler output.
 *
 * @param info            - Mangled property key.
 * @param observerCompId  - The observer to query.
 * @returns ArrayList of dependent element IDs (empty if none).
 */
func profilerGetDependentElementIdsForDump(info: String, observerCompId: Int64): ArrayList<Int64> {
    let result = ArrayList<Int64>()
    for (entry in profilerDependentDepsRegistry.get(observerCompId) ?? HashMap<String, ArrayList<Int64>>()) {
        if (entry[0] == info) {
            for (elementId in entry[1]) {
                result.add(elementId)
            }
            return result
        }
    }
    result
}

func profilerGetObserverClassName(observerId: Int64): String {
    observerClassMap.get(observerId) ?? ""
}

func profilerGetViewElementId(observerId: Int64): Int32 {
    profilerViewElementIdRegistry.get(observerId) ?? -1
}

func profilerLookupDecoratorOverride(observerId: Int64, fieldName: String): String {
    match (decoratorOverrideMap.get(observerId)) {
        case Some(m) => m.get(fieldName) ?? ""
        case None => ""
    }
}

func profilerLookupFieldMeta(mangledKey: String): Option<ProfilerFieldMeta> {
    profilerGetFieldMetaMap().get(mangledKey)
}

func profilerNextPropertyInstanceId(): Int32 {
    let id = nextProfilerPropertyInstanceId
    nextProfilerPropertyInstanceId += 1
    id
}

func profilerGetOrCreatePropertyId(info: String, className: String): Int32 {
    let key = info + "_" + className
    match (propertyInstanceIdRegistry.get(key)) {
        case Some(id) => id
        case None =>
            let id = profilerNextPropertyInstanceId()
            propertyInstanceIdRegistry.add(key, id)
            id
    }
}

/**
 * Clear all property instance ID assignments.
 * Called when the profiler is disabled, so that re-enabling starts fresh.
 */
func profilerClearPropertyInstanceIdRegistry(): Unit {
    propertyInstanceIdRegistry.clear()
}

/**
 * Discard the field metadata map.
 * Called when the profiler is disabled, so the next profiler session
 * re-populates metadata via reflection.
 */
func profilerClearFieldMetaMap(): Unit {
    fieldMetaMap = None
}

/**
 * Traverse all observers in the dependency registry and remove rmElmtId
 * from any dependency list keyed by the given property info.
 * The caller does not know which observer owns the dependency, so a full
 * scan is necessary.
 *
 * @param info     - Mangled property key to match.
 * @param rmElmtId - Element ID to remove from matching dependency lists.
 */
func profilerPurgeDepsForProperty(info: String, rmElmtId: Int64): Unit {
    for (entry in profilerDependentDepsRegistry) {
        let perObserver = entry[1]
        for (propEntry in perObserver) {
            if (propEntry[0] == info) {
                propEntry[1].removeIf({ v => v == rmElmtId })
            }
        }
    }
}

/**
 * Record that element elmtId depends on the property identified by
 * (observerId, info). Lazy-initializes the three-level map structure:
 * observerId → info → [elmtIds].
 *
 * @param observerId - The observer component that owns the property.
 * @param info       - Mangled property key.
 * @param elmtId     - The dependent UI element ID.
 */
func profilerRecordDependentUpdate(observerId: Int64, info: String, elmtId: Int64): Unit {
    let perObserver = match (profilerDependentDepsRegistry.get(observerId)) {
        case Some(m) => m
        case None =>
            let m = HashMap<String, ArrayList<Int64>>()
            profilerDependentDepsRegistry.add(observerId, m)
            m
    }
    let deps = match (perObserver.get(info)) {
        case Some(list) => list
        case None =>
            let list = ArrayList<Int64>()
            perObserver.add(info, list)
            list
    }
    deps.add(elmtId)
}

func profilerRegisterDecoratorOverride(observerId: Int64, fieldName: String, decorator: String): Unit {
    var fieldMap = match (decoratorOverrideMap.get(observerId)) {
        case Some(m) => m
        case None =>
            let m = HashMap<String, String>()
            decoratorOverrideMap.add(observerId, m)
            m
    }
    if (!fieldMap.contains(fieldName)) {
        fieldMap.add(fieldName, decorator)
    }
}

/**
 * Register an observer-to-class-name mapping if not already registered.
 * Extracts the observer ID from the given object via the Observer interface,
 * and records the class name for profiler JSON output.
 *
 * @param obj       - An object that may implement Observer.
 * @param className - The class name to associate with the observer.
 */
func profilerRegisterObserverClassIfNeeded(obj: Any, className: String): Unit {
    match (obj as Observer) {
        case Some(o) =>
            if (!observerClassMap.contains(o.id())) {
                observerClassMap.add(o.id(), className)
            }
        case None => ()
    }
}

/**
 * Build the JSON object string for a single profiler sync peer.
 * Includes decorator, property name, owning view info, dependent element IDs
 * (as CSV), and recursively nested sync peers JSON.
 */
func buildSingleProfilerPeerJson(
    config: ProfilerPeerConfig,
    newValueStr: String,
    observerCompId: Int64,
    nestedSyncPeersJson: String,
    info: String
): String {
    let escNewValue = escapeProfilerJsonString(newValueStr)
    let escDecorator = escapeProfilerJsonString(config.decorator)
    let escPropertyName = escapeProfilerJsonString(config.propertyName)
    let owningViewId = profilerGetViewElementId(observerCompId)
    let componentName = profilerGetObserverClassName(observerCompId)
    let dependentCsv = joinInt64Csv(profilerGetDependentElementIdsForDump(info, observerCompId))
    let escCsv = escapeProfilerJsonString(dependentCsv)
    let escCompName = escapeProfilerJsonString(componentName)
    "{\"decorator\":\"" + escDecorator + "\",\"propertyName\":\"" + escPropertyName + "\",\"id\":" + config.propertyId.toString() + ",\"value\":\"" + escNewValue +
        "\",\"inRenderingElementId\":" + PROFILER_INVALID_ELEMENT_ID.toString() + ",\"dependentElementIds\":{\"mode\":\"Compatible Mode\",\"trackPropertiesDependencies\":[],\"propertyDependencies\":[]}" +
        ",\"owningView\":{\"id\":" + owningViewId.toString() +
        ",\"componentName\":\"" + escCompName + "\"},\"length\":-1,\"dependentElmtIdsCsv\":\"" + escCsv + "\",\"syncPeers\":" + nestedSyncPeersJson + "}"
}

/**
 * Recursively build the sync-peers JSON array from right to left.
 * Each recursion step wraps the peer JSON from the next index inside the
 * current peer's array, producing a right-nested structure.
 * When startIndex reaches bindings.size, returns "[]" as the base case.
 */
func buildSyncPeersValueForIndexWithBindings(
    bindings: ArrayList<(Observer, String, String)>,
    startIndex: Int32,
    newValueStr: String,
    info: String
): String {
    if (Int64(startIndex) >= bindings.size) {
        return "[]"
    }
    let nestedSyncPeersJson = buildSyncPeersValueForIndexWithBindings(bindings, startIndex + 1, newValueStr, info)
    let binding = bindings[Int64(startIndex)]
    let observer = binding[0]
    let decorator = binding[1]
    let propertyName = binding[2]
    let componentName = profilerGetObserverClassName(observer.id())
    if (componentName.isEmpty()) {
        BASE_LOG.warn("buildSyncPeers: componentName empty for observerId=${observer.id().toString()} info=${info} startIndex=${startIndex.toString()}")
    }
    let peerConfig = ProfilerPeerConfig(decorator, propertyName, -startIndex)
    let peerJsonString = buildSingleProfilerPeerJson(
        peerConfig, newValueStr, observer.id(), nestedSyncPeersJson, info
    )
    "[" + peerJsonString + "]"
}

/**
 * Load profiler metadata for all observers, then resolve each observer's
 * effective decorator for the property identified by info.
 * Returns a list of (observer, effectiveDecorator, fieldName) tuples — the
 * "bindings" that form the sync-peer chain for state change reporting.
 *
 * @param observers - All observers of the changed property.
 * @param info      - Mangled property key used to look up field metadata.
 * @returns List of profiler bindings (empty if the property has no decorator metadata).
 */
func collectProfilerBindings(observers: ArrayList<Observer>, info: String): ArrayList<(Observer, String, String)> {
    for (observer in observers) {
        profilerLoadClassMetadata(observer)
    }
    let fieldMetadata = profilerLookupFieldMeta(info)
    match (fieldMetadata) {
        case Some(meta) where !meta.decorator.isEmpty() =>
            let bindings = ArrayList<(Observer, String, String)>()
            for (observer in observers) {
                profilerRegisterDecoratorOverride(observer.id(), meta.fieldName, meta.decorator)
                let effectiveDecorator = match (profilerLookupDecoratorOverride(observer.id(), meta.fieldName)) {
                    case "" => meta.decorator
                    case d => d
                }
                bindings.add((observer, effectiveDecorator, meta.fieldName))
            }
            bindings
        case _ => ArrayList<(Observer, String, String)>()
    }
}

/**
 * Assemble a ProfilerStateChangeRecord for one binding in the sync-peer chain
 * and push it to the native profiler pipeline via pushStateChangeForProfiler.
 * The binding is identified by bindingIndex within profilerBindings.
 * Sync-peers JSON is built from the remaining bindings (bindingIndex + 1 onward),
 * producing the right-nested peer structure.
 */
func pushProfilerStateChange(
    observer: Observer,
    decorator: String,
    publicName: String,
    newValueStr: String,
    renderingElementId: Int64,
    profilerBindings: ArrayList<(Observer, String, String)>,
    bindingIndex: Int32,
    info: String
): Unit {
    let viewElementId = profilerGetViewElementId(observer.id())
    let dependentElementIds = profilerGetDependentElementIdsForDump(info, observer.id())
    let syncPeersJson = buildSyncPeersValueForIndexWithBindings(profilerBindings, bindingIndex + 1, newValueStr, info)
    let componentName = profilerGetObserverClassName(observer.id())
    let uniqueClassName = if (componentName.isEmpty()) {
        BASE_LOG.warn("pushProfilerStateChange: componentName empty for observerId=${observer.id().toString()} bindingIndex=${bindingIndex.toString()} info=${info}")
        observer.id().toString()
    } else {
        componentName
    }
    let propertyId = if (bindingIndex == 0) { profilerGetOrCreatePropertyId(info, uniqueClassName) } else { -bindingIndex }
    pushStateChangeForProfiler(
        ProfilerStateChangeRecord(
            viewElementId,
            componentName,
            decorator,
            publicName,
            newValueStr,
            inRenderingElementId: renderingElementId,
            dependentElementIds: dependentElementIds,
            syncPeersJson: syncPeersJson,
            propertyId: propertyId
        )
    )
}

/**
 * Entry point for profiler state change notification.
 * Triggered by ObservedProperty.set() after a state variable write.
 * When the profiler is enabled, collects profiler bindings for all observers,
 * then pushes a ProfilerStateChangeRecord for each binding in the sync-peer
 * chain to the native profiler pipeline.
 *
 * @param observers - All observers of the changed property.
 * @param info      - Mangled property key for metadata lookup.
 * @param newVal    - The new property value (converted to string via valueToString).
 */
func notifyProfilerStateChange<T>(
    observers: ArrayList<Observer>,
    info: String,
    newVal: T
): Unit {
    if (!getStateProfilerStatus()) {
        return
    }
    let profilerBindings = collectProfilerBindings(observers, info)
    if (profilerBindings.isEmpty()) {
        BASE_LOG.warn("notifyProfilerStateChange skip no profiler bindings info=${info}")
        return
    }
    BASE_LOG.debug("notifyProfilerStateChange entry info=${info} profilerBindings=${profilerBindings.size.toString()}")
    let newValueStr = valueToString(newVal)
    let renderingElementId = ViewStackProcessor.getElmtIdToAccountFor()
    var bindingIndex: Int32 = 0
    for (binding in profilerBindings) {
        let observer = binding[0]
        let decorator = binding[1]
        let publicName = binding[2]
        if (decorator.isEmpty()) {
            BASE_LOG.error("notifyProfilerStateChange skip empty decorator slot observerId=${observer.id().toString()} info=${info}")
            bindingIndex += 1
            continue
        }
        pushProfilerStateChange(observer, decorator, publicName, newValueStr, renderingElementId, profilerBindings, bindingIndex, info)
        bindingIndex += 1
    }
}
