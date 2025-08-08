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

package ohos.base

import ohos.labels.APILevel

foreign {
    func FFIOHOSAceFrameworkGetResourceStr(id: Int64, resType: UInt32, param: CString): ExternalString

    func FFIOHOSAceFrameworkGetResourcePluralStr(id: Int64, resType: UInt32, count: Int64, plural: CString): ExternalString

    func FFIOHOSAceFrameworkGetResourceDimension(id: Int64): RetDimension

    func FFIOHOSAceFrameworkGetResourceColor(id: Int64): UInt32

    func FFIOHOSAceFrameworkGetResourceMedia(id: Int64, resType: UInt32, param: CString): ExternalString
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CJResource {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var ty: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var params: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: Int64, ty: UInt32, params: String) {
        this.id = id
        this.ty = ty
        this.params = params
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PluralResource {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var ty: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var count: Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var plural: Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: Int64, ty: UInt32, count: Int64, plural: Int64) {
        this.id = id
        this.ty = ty
        this.count = count
        this.plural = plural
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceString(content: CJResource): String {
    unsafe {
        let unsafeContent = LibC.mallocCString(content.params)
        let unsafeResult = FFIOHOSAceFrameworkGetResourceStr(content.id, content.ty, unsafeContent)
        let res = unsafeResult.toString()
        LibC.free(unsafeContent)
        unsafeResult.free()
        res
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourcePluralString(content: PluralResource): String {
    unsafe {
        let unsafeContent = LibC.mallocCString(content.plural.toString())
        let unsafeResult = FFIOHOSAceFrameworkGetResourcePluralStr(content.id, content.ty, content.count, unsafeContent)
        let res = unsafeResult.toString()
        LibC.free(unsafeContent)
        unsafeResult.free()
        res
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceLength(content: CJResource): Length {
    var dimension = unsafe { FFIOHOSAceFrameworkGetResourceDimension(content.id) }
    var value = dimension.value
    var unitType = LengthType.parse(dimension.unit)
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceColor(content: CJResource): Color {
    var colorInt = unsafe { FFIOHOSAceFrameworkGetResourceColor(content.id) }
    Color(colorInt)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func getResourceMedia(content: CJResource): String {
    unsafe {
        let unsafeContent = LibC.mallocCString(content.params)
        let unsafeResult = FFIOHOSAceFrameworkGetResourceMedia(content.id, content.ty, unsafeContent)
        let result = unsafeResult.toString()
        LibC.free(unsafeContent)
        unsafeResult.free()
        result
    }
}
