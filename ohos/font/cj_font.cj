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

protected package ohos.font

import ohos.base.*
import ohos.hilog.HilogChannel
import ohos.resource.*
import ohos.labels.APILevel

const RAWFILE_TYPE: Int32 = 30000
const STRING_TYPE: Int32 = 10003

@C
struct NativeFontInfo4Font {
    NativeFontInfo4Font(
        let path: ExternalString,
        let postScriptName: ExternalString,
        let fullName: ExternalString,
        let family: ExternalString,
        let subfamily: ExternalString,
        let weight: UInt32,
        let width: UInt32,
        let italic: Bool,
        let monoSpace: Bool,
        let symbolic: Bool
    ) {}
}

@C
struct NativeOptionFontInfo {
    NativeOptionFontInfo(
        let hasValue: Bool,
        let info: CPointer<NativeFontInfo4Font>
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FontInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let path: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let postScriptName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let fullName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let family: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let subfamily: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let weight: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let width: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let italic: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let monoSpace: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let symbolic: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        path: String,
        postScriptName: String,
        fullName: String,
        family: String,
        subfamily: String,
        weight: UInt32,
        width: UInt32,
        italic: Bool,
        monoSpace: Bool,
        symbolic: Bool
    ) {
        this.path = path
        this.postScriptName = postScriptName
        this.fullName = fullName
        this.family = family
        this.subfamily = subfamily
        this.weight = weight
        this.width = width
        this.italic = italic
        this.monoSpace = monoSpace
        this.symbolic = symbolic
    }
}

foreign func FfiFontManagerRegisterFont(familyName: CString, familySrc: CString): Unit

foreign func FfiFontManagerGetSystemFontList(): VectorStringHandle

foreign func FfiFontManagerGetFontByName(fontName: CString): CPointer<NativeFontInfo4Font>

foreign func FfiFontManagerGetUIFontConfig(): NativeUIFontConfig

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func registerFont(familyName!: String, familySrc!: String): Unit {
        unsafe {
            let name = LibC.mallocCString(familyName)
            let src = LibC.mallocCString(familySrc)
            FfiFontManagerRegisterFont(name, src)
            LibC.free(name)
            LibC.free(src)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func registerFont(familyName!: AppResource, familySrc!: AppResource): Unit {
        var src: String = ""
        if (familySrc.resType == RAWFILE_TYPE) {
            src = getResourceMedia(familySrc)
        } else if (familySrc.resType == STRING_TYPE) {
            src = getResourceString(familySrc)
        } else {
            throw IllegalArgumentException("Font.registerFont: not support res type.")
        }
        Font.registerFont(familyName: getResourceString(familyName), familySrc: src)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getSystemFontList(): Array<String> {
        unsafe {
            let ffiList = FFIVectorString(FfiFontManagerGetSystemFontList())
            let list = Array<String>(ffiList.getSize(), {
                i => ffiList.getElement(i)
            })
            ffiList.free()
            return list
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getFontByName(fontName: String): ?FontInfo {
        unsafe {
            let name = LibC.mallocCString(fontName)
            let res = FfiFontManagerGetFontByName(name)
            if (res.isNull()) {
                AppLog.warn("Can not find system FontInfo for ${fontName}")
                LibC.free(name)
                return None
            }
            let realValue = res.read()
            let result = FontInfo(
                realValue.path.toString(),
                realValue.postScriptName.toString(),
                realValue.fullName.toString(),
                realValue.family.toString(),
                realValue.subfamily.toString(),
                realValue.weight,
                realValue.width,
                realValue.italic,
                realValue.monoSpace,
                realValue.symbolic
            )
            realValue.path.free()
            realValue.postScriptName.free()
            realValue.fullName.free()
            realValue.family.free()
            realValue.subfamily.free()
            LibC.free(res)
            LibC.free(name)
            return result
        }
    }
}
