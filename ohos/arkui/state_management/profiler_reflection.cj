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

import std.reflect.{ClassTypeInfo}
import std.collection.{HashSet}
import ohos.base.{BASE_LOG}

/** Tracks which component classes have already registered property metadata. Cleared on profiler disable. */
private let componentMetaRegistry = HashSet<String>()

/**
 * Clear the component metadata registry, forcing re-reflection of all classes
 * when the profiler is re-enabled.
 */
func profilerClearComponentMetaRegistry(): Unit {
    componentMetaRegistry.clear()
}

/**
 * Load profiler metadata from the static arrays embedded in a @Component or @Observed class
 * via std.reflect.ClassTypeInfo.
 *
 * - For @Component instances: reads __profilerKeys__, __profilerDecs__, __profilerFNames__,
 *   __profilerOverrideDecs__, and __profilerRuntimeKeys__, then populates fieldMetaMap
 *   and registers decorator overrides and observer-to-class mappings.
 * - For @Observed instances: reads the same arrays (except overrides which are empty for
 *   @Observed classes) and populates fieldMetaMap with @Publish metadata.
 * - Idempotent: componentMetaRegistry ensures each class is reflected only once.
 * - Classifying the object: if obj can be cast to Observer it is treated as a @Component
 *   instance; otherwise as an @Observed nested object instance.
 *
 * @param obj - A @Component (Observer) or @Observed instance whose class carries the embedded
 *              static profiler arrays.
 */
func profilerLoadClassMetadata(obj: Any): Unit {
    let classInfo = try {
        ClassTypeInfo.of(obj)
    } catch (e: Exception) {
        BASE_LOG.warn("profilerLoadClassMetadata: ClassTypeInfo.of failed")
        return
    }
    let className = classInfo.name
    let isObserved = match (obj as Observer) {
        case Some(_) => false
        case None => true
    }
    if (componentMetaRegistry.contains(className)) {
        if (!isObserved) {
            profilerRegisterObserverClassIfNeeded(obj, className)
        }
        return
    }
    componentMetaRegistry.add(className)

    let keys = readProfilerStaticArray(classInfo, "__profilerKeys__") ?? return
    let decs = readProfilerStaticArray(classInfo, "__profilerDecs__") ?? return
    let fnames = readProfilerStaticArray(classInfo, "__profilerFNames__") ?? return
    let runtimeKeys = readProfilerStaticArray(classInfo, "__profilerRuntimeKeys__") ?? keys

    registerFieldMetadatas(keys, decs, fnames, runtimeKeys,
        if (isObserved) { "" } else { className })

    if (!isObserved) {
        let overrides = match (readProfilerStaticArray(classInfo, "__profilerOverrideDecs__")) {
            case Some(arr) => arr
            case None => return
        }
        registerComponentOverrides(obj, className, overrides, fnames)
    }
}

/**
 * Read a public static let array of String from a class via std.reflect.
 *
 * @param classInfo - ClassTypeInfo obtained from ClassTypeInfo.of(obj).
 * @param name - Name of the static variable (e.g. "__profilerKeys__").
 * @returns Some(array) on success, None if the variable does not exist, is not an
 *          Array<String>, or if any reflection call throws.
 */
private func readProfilerStaticArray(classInfo: ClassTypeInfo, name: String): Option<Array<String>> {
    try {
        let arrVar = classInfo.getStaticVariable(name)
        match (arrVar.getValue()) {
            case arr: Array<String> => Option<Array<String>>.Some(arr)
            case _ => Option<Array<String>>.None
        }
    } catch (e: Exception) {
        Option<Array<String>>.None
    }
}

/**
 * Populate fieldMetaMap from five parallel arrays read from a class's static let declarations.
 *
 * Each index i corresponds to one decorated property in the source class:
 *   keys[i]   — mangled lookup key (e.g. "stateVarDecl_message_")
 *   decs[i]   — decorator label (e.g. "@State", "@Link", "@Publish")
 *   fnames[i] — original field name from user source (e.g. "message")
 *
 * Registration is first-write-wins (contains check prevents overwriting). The runtimeKeys
 * array provides alternate lookup keys (e.g. AppStorage key "myAppKey" vs. mangled key).
 * In the common case runtimeKeys[i] == keys[i], so the second add is a no-op.
 *
 * @param keys               — mangled property keys (__profilerKeys__)
 * @param decs               — decorator labels (__profilerDecs__)
 * @param fnames             — user-visible field names (__profilerFNames__)
 * @param runtimeKeys        — alternate lookup keys (__profilerRuntimeKeys__)
 * @param effectiveClassName — class name for the ProfilerFieldMeta entries
 */
private func registerFieldMetadatas(
    keys: Array<String>,
    decs: Array<String>,
    fnames: Array<String>,
    runtimeKeys: Array<String>,
    effectiveClassName: String
): Unit {
    for (i in 0..keys.size) {
        if (!profilerGetFieldMetaMap().contains(keys[i])) {
            profilerGetFieldMetaMap().add(keys[i], ProfilerFieldMeta(decs[i], fnames[i], effectiveClassName))
        }
        if (!profilerGetFieldMetaMap().contains(runtimeKeys[i])) {
            profilerGetFieldMetaMap().add(runtimeKeys[i], ProfilerFieldMeta(decs[i], fnames[i], effectiveClassName))
        }
    }
}

/**
 * Register an observer's class name and any non-empty decorator overrides
 * (e.g. "@Link", "@Consume") from the __profilerOverrideDecs__ array.
 *
 * Called only for @Component classes (not @Observed). Each non-empty entry
 * in overrides[i] is registered as a decorator override keyed by
 * (observerId, fnames[i]), so that collectProfilerBindings can later look up
 * the effective decorator for that observer.
 *
 * @param obj       — the @Component instance (cast to Observer for its id)
 * @param className — the component class name for observerClassMap
 * @param overrides — decorator override strings (__profilerOverrideDecs__)
 * @param fnames    — corresponding field names (__profilerFNames__)
 */
private func registerComponentOverrides(obj: Any, className: String, overrides: Array<String>, fnames: Array<String>): Unit {
    profilerRegisterObserverClassIfNeeded(obj, className)
    match (obj as Observer) {
        case Some(o) =>
            for (i in 0..overrides.size) {
                if (!overrides[i].isEmpty()) {
                    profilerRegisterDecoratorOverride(o.id(), fnames[i], overrides[i])
                }
            }
        case None => ()
    }
}
