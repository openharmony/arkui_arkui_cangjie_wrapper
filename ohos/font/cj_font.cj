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

package ohos.font

import ohos.base.*
import ohos.ui_resource.*
import ohos.hilog.HilogChannel
import ohos.resource_manager.AppResource
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

public class FontInfo {
    public FontInfo(
        public let path: String,
        public let postScriptName: String,
        public let fullName: String,
        public let family: String,
        public let subfamily: String,
        public let weight: UInt32,
        public let width: UInt32,
        public let italic: Bool,
        public let monoSpace: Bool,
        public let symbolic: Bool
    ) {}
}

foreign func FfiFontManagerRegisterFont(familyName: CString, familySrc: CString): Unit

foreign func FfiFontManagerGetSystemFontList(): VectorStringHandle

foreign func FfiFontManagerGetFontByName(fontName: CString): CPointer<NativeFontInfo4Font>

foreign func FfiFontManagerGetUIFontConfig(): NativeUIFontConfig

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getUIFontConfig(): UIFontConfig {
        unsafe {
            let FFIUIFontConfig = FfiFontManagerGetUIFontConfig()
            let FFIFontDirList = FFIVectorString(FFIUIFontConfig.fontDir)
            let CJFontDirArray = Array<String>(FFIFontDirList.getSize(), {
                i => FFIFontDirList.getElement(i)
            })
            FFIFontDirList.free()
            let FFIGenericList = FFIVectorUIFontGenericInfo(FFIUIFontConfig.generic)
            // CJGenericArray
            let genericListSize = FFIGenericList.getSize()
            let CJGenericInfoArray = Array<UIFontGenericInfo>(
                genericListSize,
                {
                    i =>
                    let FFIGeneric = FFIGenericList.getElement(i)
                    // CJAliasArray
                    let FFIAliasList = FFIVectorUIFontAliasInfo(FFIGeneric.alias)
                    let CJAliasArray = Array<UIFontAliasInfo>(
                        FFIAliasList.getSize(),
                        {
                            i =>
                            let alias = UIFontAliasInfo(
                                FFIAliasList.getElement(i).name.toString(),
                                FFIAliasList.getElement(i).weight
                            )
                            FFIAliasList.getElement(i).name.free()
                            return alias
                        }
                    )
                    FFIAliasList.free()
                    // CJAdjustArray
                    let FFIAdjustList = FFIVectorUIFontAdjustInfo(FFIGeneric.adjust)
                    let CJAdjustArray = Array<UIFontAdjustInfo>(FFIAdjustList.getSize(),
                        {
                            i => UIFontAdjustInfo(
                                FFIAdjustList.getElement(i).weight,
                                FFIAdjustList.getElement(i).to
                            )
                        })
                    FFIAdjustList.free()
                    // CJGenericInfo
                    let CJGenericInfo = UIFontGenericInfo(
                        FFIGeneric.family.toString(),
                        CJAliasArray,
                        CJAdjustArray
                    )
                    FFIGeneric.family.free()
                    return CJGenericInfo
                }
            )
            FFIGenericList.free()
            // CJFallbackGroupInfoArray
            let FFIFallbackGroupsList = FFIVectorUIFontFallbackGroupInfo(FFIUIFontConfig.fallbackGroups)
            let fallbackGroupsListSize = FFIFallbackGroupsList.getSize()
            let CJFallbackGroupInfoArray = Array<UIFontFallbackGroupInfo>(
                fallbackGroupsListSize,
                {
                    i =>
                    let FFIFallbackGroup = FFIFallbackGroupsList.getElement(i)
                    let FFIFallBackList = FFIVectorUIFontFallbackInfo(FFIFallbackGroup.fallback)
                    let CJFallBackArray = Array<UIFontFallbackInfo>(
                        FFIFallBackList.getSize(),
                        {
                            j =>
                            let fallbackInfo = UIFontFallbackInfo(
                                FFIFallBackList.getElement(j).language.toString(),
                                FFIFallBackList.getElement(j).family.toString()
                            )
                            FFIFallBackList.getElement(j).language.free()
                            FFIFallBackList.getElement(j).family.free()
                            return fallbackInfo
                        }
                    )
                    FFIFallBackList.free()
                    let CJFallbackGroupInfo = UIFontFallbackGroupInfo(
                        FFIFallbackGroup.fontSetName.toString(),
                        CJFallBackArray
                    )
                    CJFallbackGroupInfo
                }
            )
            FFIFallbackGroupsList.free()
            let CJUIFontConfig = UIFontConfig(
                CJFontDirArray,
                CJGenericInfoArray,
                CJFallbackGroupInfoArray
            )
            return CJUIFontConfig
        }
    }

    @!APILevel[
        12,
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
        12,
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
        12,
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
        12,
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
