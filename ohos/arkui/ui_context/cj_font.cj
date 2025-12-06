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

package ohos.arkui.ui_context

import ohos.base.{ExternalString, VectorStringHandle, ResourceStr, FFIVectorString, APP_LOG}
import ohos.hilog.HilogChannel
import ohos.resource.{AppResource, getResourceMedia, getResourceString}
import ohos.labels.APILevel
import ohos.arkui.component.util.{transResourceStrToString}
import ohos.business_exception.BusinessException

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

/**
 * Provides a font component.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FontInfo {
    /**
     * The path of the font file.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var path: String

    /**
     * The name of postscript.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var postScriptName: String

    /**
     * The font name.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fullName: String

    /**
     * A set of fonts with a common design.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: String

    /**
     * A subset of the font family.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var subfamily: String

    /**
     * The weight of the font.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: UInt32

    /**
     * The width of the font style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: UInt32

    /**
     * Whether it is italic.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var italic: Bool

    /**
     * Whether it is compact.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var monoSpace: Bool

    /**
     * Whether symbol fonts are supported.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var symbolic: Bool

    init(
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

/**
 * class Font
 *
 * <p><strong>NOTE</strong>:
 * <br>You must first use getFont() in UIContext to obtain a Font instance,
 * and then call the APIs using the obtained instance.
 * </p>
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    private var instanceId_: Int64 = 0

    protected init(instanceId: Int64) {
        this.instanceId_ = instanceId
    }

    /**
     * Register a customized font in the FontManager.
     *
     * @param { ResourceStr } familyName
     * @param { ResourceStr } familySrc
     * @throws { BusinessException } 100001 - Invalid input parameter.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func registerFont(familyName!: ResourceStr, familySrc!: ResourceStr): Unit {
        var src: String = ""
        match (familySrc) {
            case res: AppResource =>
                if (res.resType == RAWFILE_TYPE) {
                    src = getResourceMedia(res)
                } else if (res.resType == STRING_TYPE) {
                    src = getResourceString(res)
                } else {
                    throw BusinessException(100001, "Invalid input parameter.")
                }
            case str: String => src = str
            case _ => throw BusinessException(100001, "Invalid input parameter.")
        }
        unsafe {
            try (nameCStr = LibC.mallocCString(transResourceStrToString(familyName)).asResource(),
                srcCStr = LibC.mallocCString(src).asResource()) {
                FfiFontManagerRegisterFont(nameCStr.value, srcCStr.value)
            }
        }
    }

    /**
     * Gets a list of fonts supported by system.
     *
     * @returns { Array<String> } A list of font names.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getSystemFontList(): Array<String> {
        unsafe {
            let ffiList = FFIVectorString(FfiFontManagerGetSystemFontList())
            let list = Array<String>(ffiList.getSize(), {
                i => ffiList.getElement(i)
            })
            ffiList.free()
            return list
        }
    }

    /**
     * Get font details according to the font name.
     *
     * @param { String } fontName - font name.
     * @returns { ?FontInfo } Returns the font info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getFontByName(fontName: String): ?FontInfo {
        unsafe {
            var result: ?FontInfo = None
            try (name = LibC.mallocCString(fontName).asResource()) {
                let res = FfiFontManagerGetFontByName(name.value)
                if (res.isNull()) {
                    APP_LOG.warn("Can not find system FontInfo for ${fontName}")
                    return None
                }
                let realValue = res.read()
                result = FontInfo(
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
            }
            return result
        }
    }
}
