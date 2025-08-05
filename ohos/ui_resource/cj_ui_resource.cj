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

package ohos.ui_resource

import ohos.base.*
import ohos.resource_manager.AppResource
import ohos.encoding.json.*
import ohos.labels.APILevel

@C
public struct NativeDimension {
    public NativeDimension(
        public let value: Float64,
        public let unit: Int32
    ) {}
}

@C
public struct NativeResourceObject {
    public NativeResourceObject(
        public let bundleName: CString,
        public let moduleName: CString,
        public let id: Int32,
        public let resType: Int32,
        public let paramsJsonStr: CString
    ) {}
}

foreign {
    func FFIGetResourceString(obj: NativeResourceObject): ExternalString

    func FFIGetResourceMedia(obj: NativeResourceObject): ExternalString

    func FFIGetResourceColor(obj: NativeResourceObject): UInt32

    func FFIGetResourceDimension(obj: NativeResourceObject): NativeDimension

    func FFIGetResourceInt32(obj: NativeResourceObject): Int32

    func FFIGetResourceUInt32(obj: NativeResourceObject): UInt32

    func FFIGetResourceDouble(obj: NativeResourceObject): Float64

    func FFIGetResourceBool(obj: NativeResourceObject): Bool

    func FFIGetResourceVectorUInt32(obj: NativeResourceObject): VectorUInt32Handle

    func FFIGetResourceVectorString(obj: NativeResourceObject): VectorStringHandle

    func FFIGetResourceSymbolId(obj: NativeResourceObject): UInt32
}

public let UNKNOWN_RESOURCE_TYPE: Int32 = -1

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceString(res: AppResource): String {
    var resStr: String = ""
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            let resCstr = FFIGetResourceString(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
            resStr = resCstr.toString()
            resCstr.free()
        }
    }
    resStr
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceMedia(res: AppResource): String {
    var resStr: String = ""
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            let resCstr = FFIGetResourceMedia(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
            resStr = resCstr.toString()
            resCstr.free()
        }
        resStr
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceColor(res: AppResource): Color {
    var color: Color = Color(0x00000000)
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            let colorInt = FFIGetResourceColor(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
            color = Color(colorInt)
        }
        color
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceLength(res: AppResource): Length {
    var dimension: NativeDimension = NativeDimension(0.0, 0)
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            dimension = FFIGetResourceDimension(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
        }
        var value = dimension.value
        let unitType = LengthType.parse(dimension.unit)
        return match (unitType) {
            case px(v) => value.px
            case vp(v) => value.vp
            case fp(v) => value.fp
            case percent(v) =>
                value = value * 100.0
                value.percent
            case lpx(v) => value.lpx
            case _ => value.vp
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceDouble(res: AppResource): Float64 {
    var result: Float64 = 0.0
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            result = FFIGetResourceDouble(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
        }
        result
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceUInt32(res: AppResource): UInt32 {
    var result: UInt32 = 0
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            result = FFIGetResourceUInt32(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
        }
        result
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceInt32(res: AppResource): Int32 {
    var result: Int32 = 0
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            result = FFIGetResourceInt32(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
        }
        result
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceStringArray(res: AppResource): Array<String> {
    var list: Array<String> = []
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            let res = FFIVectorString(
                FFIGetResourceVectorString(
                    NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value)))
            list = Array<String>(res.getSize(), {
                i => res.getElement(i)
            })
            res.free()
        }
        list
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceBool(res: AppResource): Bool {
    var result: Bool = false
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            result = FFIGetResourceBool(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
        }
        result
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceSymbolId(res: AppResource): UInt32 {
    var result: UInt32 = 0
    unsafe {
        try (bundleName = LibC.mallocCString(res.bundleName).asResource(),
            moduleName = LibC.mallocCString(res.moduleName).asResource(),
            paramsStr = LibC.mallocCString(parseResourceParams(res.params)).asResource()) {
            let resType = res.resType ?? UNKNOWN_RESOURCE_TYPE
            result = FFIGetResourceSymbolId(
                NativeResourceObject(bundleName.value, moduleName.value, res.id, resType, paramsStr.value))
        }
        result
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func parseResourceParams(paramsOpt: ?Array<Any>): String {
    let params = paramsOpt ?? []
    let jsonArr = JsonArray()
    for (param in params) {
        if (let Some(v) <- (param as Int64)) {
            jsonArr.add(JsonInt(v))
        } else if (let Some(v) <- (param as String)) {
            jsonArr.add(JsonString(v))
        } else if (let Some(v) <- (param as Float64)) {
            jsonArr.add(JsonFloat(v))
        } else {
            throw IllegalArgumentException("Invalid param type.")
        }
    }
    return jsonArr.toJsonString()
}
