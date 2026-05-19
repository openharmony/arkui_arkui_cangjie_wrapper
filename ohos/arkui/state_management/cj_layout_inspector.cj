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

import std.collection.{ArrayList}
import std.core.{LibC}

foreign {
    func FfiOHOSAceFrameworkRegisterProfilerStatusNotify(callback: CFunc<(Bool) -> Unit>): Unit

    func FfiOHOSAceFrameworkLayoutInspectorPushStateChangeRecord(rec: CPointer<FfiProfilerStateChangeRecord>): Unit
}

let PROFILER_INVALID_ELEMENT_ID: Int64 = -1
let PROFILER_UNKNOWN_DECORATOR = "Unknown"

private var gStateProfilerEnabled: Bool = false

@C
func OHOSAceFrameworkProfilerStatusNotify(enabled: Bool): Unit {
    if (gStateProfilerEnabled && !enabled) {
        profilerClearPropertyInstanceIdRegistry()
        profilerClearFieldMetaMap()
        profilerClearComponentMetaRegistry()
    }
    gStateProfilerEnabled = enabled
}

@C
struct FfiProfilerStateChangeRecord {
    var viewId: Int32 = 0
    var componentNameUtf8: CString = CString(CPointer<UInt8>())
    var decoratorUtf8: CString = CString(CPointer<UInt8>())
    var propertyNameUtf8: CString = CString(CPointer<UInt8>())
    var valueUtf8: CString = CString(CPointer<UInt8>())
    var inRenderingElementId: Int64 = PROFILER_INVALID_ELEMENT_ID
    var propertyId: Int32 = 0
    var dependentElmtIdsCsvUtf8: CString = CString(CPointer<UInt8>())
    var syncPeersJsonUtf8: CString = CString(CPointer<UInt8>())
}

struct ProfilerStateChangeRecord {
    let viewId: Int32
    let componentName: String
    let decorator: String
    let propertyName: String
    let value: String
    let inRenderingElementId: Int64
    let propertyId: Int32
    let dependentElementIds: ArrayList<Int64>
    let syncPeersJson: String

    init(
        viewId: Int32,
        componentName: String,
        decorator: String,
        propertyName: String,
        value: String,
        inRenderingElementId!: Int64 = PROFILER_INVALID_ELEMENT_ID,
        propertyId!: Int32 = 0,
        dependentElementIds!: ArrayList<Int64> = ArrayList<Int64>(),
        syncPeersJson!: String = ""
    ) {
        this.viewId = viewId
        this.componentName = componentName
        this.decorator = decorator
        this.propertyName = propertyName
        this.value = value
        this.inRenderingElementId = inRenderingElementId
        this.propertyId = propertyId
        this.dependentElementIds = dependentElementIds
        this.syncPeersJson = syncPeersJson
    }
}

func joinInt64Csv(ids: ArrayList<Int64>): String {
    if (ids.isEmpty()) {
        return ""
    }
    var parts = ArrayList<String>(ids.size)
    for (id in ids) {
        parts.add(id.toString())
    }
    String.join(parts.toArray(), delimiter: ",")
}

private func registerProfilerStatusNotifyFromNative(): Unit {
    unsafe {
        FfiOHOSAceFrameworkRegisterProfilerStatusNotify(OHOSAceFrameworkProfilerStatusNotify)
    }
}

let _ = registerProfilerStatusNotifyFromNative()

func getStateProfilerStatus(): Bool {
    gStateProfilerEnabled
}

func pushStateChangeForProfiler(change: ProfilerStateChangeRecord): Unit {
    let componentName = change.componentName
    let decorator = change.decorator
    let propertyName = change.propertyName
    let depCsv = joinInt64Csv(change.dependentElementIds)
    let decoratorStr = if (decorator.isEmpty()) {
        PROFILER_UNKNOWN_DECORATOR
    } else {
        decorator
    }
    unsafe {
        try(comp = LibC.mallocCString(componentName).asResource(),
            dec = LibC.mallocCString(decoratorStr).asResource(),
            propCStr = LibC.mallocCString(propertyName).asResource(),
            val = LibC.mallocCString(change.value).asResource(),
            csv = LibC.mallocCString(depCsv).asResource(),
            sync = LibC.mallocCString(change.syncPeersJson).asResource()) {
            var ffi = FfiProfilerStateChangeRecord()
            ffi.viewId = change.viewId
            ffi.componentNameUtf8 = comp.value
            ffi.decoratorUtf8 = dec.value
            ffi.propertyNameUtf8 = propCStr.value
            ffi.valueUtf8 = val.value
            ffi.inRenderingElementId = change.inRenderingElementId
            ffi.propertyId = change.propertyId
            ffi.dependentElmtIdsCsvUtf8 = csv.value
            ffi.syncPeersJsonUtf8 = sync.value
            FfiOHOSAceFrameworkLayoutInspectorPushStateChangeRecord(inout ffi)
        }
    }
}
