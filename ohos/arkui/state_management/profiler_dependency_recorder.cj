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

private let profilerObserverStack = ArrayList<Int64>()

protected func profilerDependencyPushObserver(observerCompId: Int64): Unit {
    profilerObserverStack.add(observerCompId)
}

protected func profilerDependencyPopObserver(): Unit {
    if (profilerObserverStack.isEmpty()) {
        return
    }
    profilerObserverStack.remove(at: profilerObserverStack.size - 1)
}

func profilerDependencyCurrentObserver(): Int64 {
    if (profilerObserverStack.isEmpty()) {
        return PROFILER_INVALID_ELEMENT_ID
    }
    profilerObserverStack[profilerObserverStack.size - 1]
}

private var nextProfilerPropertyInstanceId: Int32 = 1

func profilerNextPropertyInstanceId(): Int32 {
    let id = nextProfilerPropertyInstanceId
    nextProfilerPropertyInstanceId += 1
    id
}

private var pendingProfilerClassName: String = ""

private let profilerClassNameRegistry = HashMap<Int64, String>()

protected func profilerConsumePendingClassName(): String {
    let name = pendingProfilerClassName
    pendingProfilerClassName = ""
    name
}

protected func profilerGetClassName(observerId: Int64): String {
    profilerClassNameRegistry.get(observerId) ?? ""
}

func profilerRegisterClassName(observerId: Int64, className: String): Unit {
    if (!className.isEmpty() && !profilerClassNameRegistry.contains(observerId)) {
        profilerClassNameRegistry.add(observerId, className)
    }
}

private let profilerDecoratorRegistry = HashMap<Int64, HashMap<String, String>>()

func profilerRegisterDecoratorOverride(observerId: Int64, fieldName: String, decorator: String): Unit {
    var fieldMap = match (profilerDecoratorRegistry.get(observerId)) {
        case Some(m) => m
        case None =>
            let m = HashMap<String, String>()
            profilerDecoratorRegistry.add(observerId, m)
            m
    }
    if (!fieldMap.contains(fieldName)) {
        fieldMap.add(fieldName, decorator)
    }
}

func profilerLookupDecoratorOverride(observerId: Int64, fieldName: String): String {
    match (profilerDecoratorRegistry.get(observerId)) {
        case Some(m) => m.get(fieldName) ?? ""
        case None => ""
    }
}

protected func profilerCleanupObserver(observerId: Int64): Unit {
    profilerClassNameRegistry.remove(observerId)
    profilerDecoratorRegistry.remove(observerId)
}

func profilerSetPendingClassName(className: String): Unit {
    if (!className.isEmpty()) {
        pendingProfilerClassName = className
    }
}

func escapeProfilerJsonString(s: String): String {
    s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r")
}

func decodeProfilerInitInfo(raw: String): (String, Option<(String, String, String)>, Option<String>) {
    let parts = raw.split("|")
    if (parts.size < 4 || parts[0] != "cjprf") {
        return (raw, None, None)
    }
    let dec = parts[1]
    let fieldName = parts[2]
    let baseInfo = parts[3]
    let className = if (parts.size >= 5) { parts[4] } else { "" }
    let meta = Option.Some((dec, fieldName, className))
    if (dec == "@Publish") {
        return (baseInfo, meta, Option.Some(fieldName))
    }
    return (baseInfo, meta, None)
}

func profilerStorageInfoForSuper(raw: String): String {
    decodeProfilerInitInfo(raw)[0]
}
