/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.state_management

import ohos.base.{BASE_LOG}
import ohos.labels.{APILevel, Hide}
import std.collection.{ArrayList}

func isEqual<T>(value: T, newValue: T): Bool {
    newValue is Equatable<T> && (newValue as Equatable<T>).getOrThrow() == value
}

/**
 * Defines class ObservedProperty.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ObservedProperty<T> <: ObservedPropertyAbstract {
    private var internalValue: T
    private let subProps_ = ArrayList<ObservedProperty<T>>()

    private let profilerBindings_ = ArrayList<(Observer, String, String)>()
    /** Parsed from `info` when macro encodes cjprf|@Publish|... */
    private var profilerObservedPublishFieldName: Option<String> = None
    /** Parsed from `info` when macro encodes cjprf|decorator|fieldName|mangle|className */
    private var profilerMacroFromInfo_: Option<(String, String, String)> = None
    /** Persistent unique id for profiler reporting, assigned at construction time. */
    private let profilerId_: Int32

    /**
     * ObservedProperty constructor.
     *
     * @param { String } info - Information about the property.
     * @param { T } initValue - Initial value for the property.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public init(info: String, initValue: T) {
        super(profilerStorageInfoForSuper(info))
        profilerId_ = profilerNextPropertyInstanceId()
        let parsed = decodeProfilerInitInfo(info)
        profilerMacroFromInfo_ = parsed[1]
        match (parsed[1]) {
            case Some((_, _, className)) => profilerSetPendingClassName(className)
            case _ => ()
        }
        match (parsed[2]) {
            case Some(n) => profilerObservedPublishFieldName = Option.Some(n)
            case None => ()
        }
        this.internalValue = initValue
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) => v.setDependentElementIds(dependentElementIds_)
            case _ => ()
        }
    }

    protected open func subscribeExFromObservedModel(observer: Observer): Unit {
        match (profilerObservedPublishFieldName) {
            case Some(n) =>
                subscribeExWithProfiler(observer, "@Publish", n)
            case None =>
                subscribeEx(observer)
        }
    }

    private func getProfilerBindingAt(bindings: ArrayList<(Observer, String, String)>, idx: Int64): (Observer, String, String) {
        bindings[Int64(idx)]
    }

    /** ArkTS dumpSyncPeers: nested chain; each peer carries dependentElmtIdsCsv for C++ to expand to propertyDependencies. */
    private func buildSingleProfilerPeerJson(
        decorator: String,
        propertyName: String,
        newStr: String,
        owningViewId: Int32,
        propertyId: Int32,
        dependentCsv: String,
        nestedSyncPeersJson: String
    ): String {
        let escNew = escapeProfilerJsonString(newStr)
        let escDec = escapeProfilerJsonString(decorator)
        let escName = escapeProfilerJsonString(propertyName)
        let escCsv = escapeProfilerJsonString(dependentCsv)
        let componentName = getProfilerViewElementName(owningViewId)
        let escCompName = escapeProfilerJsonString(componentName)
        "{\"decorator\":\"" + escDec + "\",\"propertyName\":\"" + escName + "\",\"id\":" + propertyId.toString() + ",\"value\":\"" + escNew +
            "\",\"inRenderingElementId\":" + PROFILER_INVALID_ELEMENT_ID.toString() + ",\"dependentElementIds\":{\"mode\":\"Compatible Mode\",\"trackPropertiesDependencies\":[],\"propertyDependencies\":[]}" +
            ",\"owningView\":{\"id\":" + owningViewId.toString() +
            ",\"componentName\":\"" + escCompName + "\"},\"length\":-1,\"dependentElmtIdsCsv\":\"" + escCsv + "\",\"syncPeers\":" + nestedSyncPeersJson + "}"
    }

    private func buildSyncPeersValueForIndexWithBindings(
        bindings: ArrayList<(Observer, String, String)>,
        fromIdx: Int64,
        newStr: String
    ): String {
        if (fromIdx >= bindings.size) {
            return "[]"
        }
        let nestedInner = buildSyncPeersValueForIndexWithBindings(bindings, fromIdx + 1, newStr)
        let peerTuple = getProfilerBindingAt(bindings, fromIdx)
        let o = peerTuple[0]
        let dec = peerTuple[1]
        let name = peerTuple[2]
        let depCsv = joinInt64Csv(getProfilerDependentElementIdsForDump(o.id()))
        let peerJson = buildSingleProfilerPeerJson(
            dec,
            name,
            newStr,
            o.getProfilerViewElementId(),
            profilerId_,
            depCsv,
            nestedInner
        )
        "[" + peerJson + "]"
    }

    private func notifyProfilerFromSet(_: T, newVal: T): Unit {
        if (!getStateProfilerStatus()) {
            return
        }
        let bindingsToUse: ArrayList<(Observer, String, String)> = if (!profilerBindings_.isEmpty()) {
            let copy = ArrayList<(Observer, String, String)>()
            for (b in profilerBindings_) {
                copy.add(b)
            }
            copy
        } else {
            let syn = ArrayList<(Observer, String, String)>()
            match (profilerMacroFromInfo_) {
                case Some((dec, pub, _)) =>
                    if (!dec.isEmpty()) {
                        for (o in getObservers()) {
                            syn.add((o, dec, pub))
                        }
                    }
                case _ => ()
            }
            syn
        }
        if (bindingsToUse.isEmpty()) {
            BASE_LOG.warn("notifyProfilerFromSet skip no profiler bindings and no observer fallback info=${info}")
            return
        }
        BASE_LOG.debug("notifyProfilerFromSet entry info=${info} profilerBindings=${bindingsToUse.size.toString()}")
        let newStr = valueToString(newVal)
        let renderEl = ViewStackProcessor.getElmtIdToAccountFor()
        var bi: Int64 = 0
        for (b in bindingsToUse) {
            let o = b[0]
            let decorator = b[1]
            let publicName = b[2]
            let effectiveDecorator = match (profilerLookupDecoratorOverride(o.id(), publicName)) {
                case "" => decorator
                case d => d
            }
            if (effectiveDecorator.isEmpty()) {
                BASE_LOG.error("notifyProfilerFromSet skip empty decorator slot observerId=${o.id().toString()} info=${info}")
                bi += 1
                continue
            }
            let viewId = o.getProfilerViewElementId()
            let deps = getProfilerDependentElementIdsForDump(o.id())
            let syncPeers = buildSyncPeersValueForIndexWithBindings(bindingsToUse, bi + 1, newStr)
            pushStateChangeForProfiler(
                ProfilerStateChangeRecord(
                    viewId,
                    "",
                    effectiveDecorator,
                    publicName,
                    newStr,
                    inRenderingElementId: renderEl,
                    dependentElementIds: deps,
                    syncPeersJson: syncPeers,
                    propertyId: profilerId_
                )
            )
            bi += 1
        }
    }

    private func setInternalValue(newValue: T) {
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) =>
                let newObservedObject = newValue as ObservedComplexAbstract
                v.set(newObservedObject.getOrThrow())
            case _ => this.internalValue = newValue
        }
    }

    /**
     * Gets the current value of the observed property. And record the dependency elements that need to be updated.
     *
     * @returns { T } The current value of the property.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func get(): T {
        recordDependentUpdate()
        this.internalValue
    }

    @!Hide
    protected func getInner(): T {
        this.internalValue
    }

    /**
     * Sets a new value for the observed property. Enable observers to receive updated information whenever state variables change.
     * If the new value is equal to the current value, no changes will be made.
     * Otherwise, it updates the value and notifies all subscribers of the change.
     *
     * @param { T } newValue - The new value to set.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public open func set(newValue: T): Unit {
        if (isEqual<T>(internalValue, newValue)) {
            return
        }
        let oldVal = getInner()
        this.setInternalValue(newValue)
        this.notifyChanges()
        for (subProp in subProps_) {
            subProp.set(newValue)
        }
        notifyProfilerFromSet(oldVal, newValue)
    }

    /**
     * Subscribes an observer to this property and its nested observed objects.
     * The observer will be notified when the property value changes.
     *
     * @param { Observer } observer - The observer to subscribe.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func subscribeEx(observer: Observer): Unit {
        let (parentDec, parentPub) = match (profilerMacroFromInfo_) {
            case Some((dec, pub, _)) => (dec, pub)
            case None => ("", "")
        }
        subscribeExWithProfiler(observer, parentDec, parentPub)
    }

    /**
     * Subscribes an observer with Deveco Profiler metadata (decorator + public property name per CustomView).
     */
    @!APILevel[
        since: "26.0.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    private func subscribeExWithProfiler(observer: Observer, profilerDecorator: String, profilerPublicName: String): Unit {
        let firstSubscription = !isSubscribed(observer)
        if (firstSubscription) {
            subscribe(observer)
            let observedObject = internalValue as ObservedComplexAbstract
            match (observedObject) {
                case Some(v) =>
                    v.subscribeInner(observer)
                    v.setInfo(info)
                case _ => ()
            }
        }
        if (!profilerDecorator.isEmpty()) {
            profilerBindings_.removeIf({
                t => t[0].id() == observer.id()
            })
            profilerBindings_.add((observer, profilerDecorator, profilerPublicName))
            profilerRegisterDecoratorOverride(observer.id(), profilerPublicName, profilerDecorator)
        }
        // Register class name from self-subscriptions (property owns its component's class name).
        match (profilerMacroFromInfo_) {
            case Some((_, _, className)) => profilerRegisterClassName(observer.id(), className)
            case _ => ()
        }
    }

    /**
     * Unsubscribes an observer from this property and its nested observed objects.
     *
     * @param { Observer } observer - The observer to unsubscribe.
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func unsubscribeEx(observer: Observer): Unit {
        profilerBindings_.removeIf({
            t => t[0].id() == observer.id()
        })
        unsubscribe(observer)
        let observedObject = internalValue as ObservedComplexAbstract
        match (observedObject) {
            case Some(v) =>
                v.unsubscribeInner(observer)
            case _ => ()
        }
    }

    /**
     * Creates a new property that shares the same value as this property.
     *
     * @param { String } info - Information about the new property.
     * @returns { ObservedProperty<T> } A new ObservedProperty instance sharing the same value.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func createProp(info: String): ObservedProperty<T> {
        let result = ObservedProperty<T>(info, internalValue)
        subProps_.add(result)
        result
    }
}
