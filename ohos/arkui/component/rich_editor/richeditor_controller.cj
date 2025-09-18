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

package ohos.arkui.component.rich_editor

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import ohos.multimedia.image.*
import std.collection.ArrayList

// HarmonyOS system default font
let DEFAULT_FONT: String = "HarmonyOS Sans"

@C
struct NativeTextDecoration {
    NativeTextDecoration(
        let decorationType: Int32,
        let color: UInt32
    ) {}
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LeadingMarginType {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LengthType(Length)
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PlaceholderType(LeadingMarginPlaceholder)
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    func getValue(): Int32 {
        match (this) {
            case None => 0
            case LengthType(v) => 1
            case PlaceholderType(v) => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextDecorationOptions {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decorationType: ?TextDecorationType
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(decorationType!: ?TextDecorationType, color!: ?ResourceColor = None) {
        this.decorationType = decorationType ?? throw IllegalArgumentException("The type now is not supported.")
        this.color = transAppResourceToResourceColor(color ?? Color.Black)
    }
}

@C
struct NativeRichEditorTextStyle {
    NativeRichEditorTextStyle(
        let fontColor: UInt32,
        let fontSize: Float64,
        let fontStyle: Int32,
        let fontSizeUnit: Int32,
        let fontWeight: CString,
        let fontFamily: CString,
        let decoration: NativeTextDecoration
    ) {}

    func free() {
        unsafe {
            LibC.free(this.fontWeight)
            LibC.free(this.fontFamily)
        }
    }
}

@C
struct NativeRichEditorTextSpanOptions {
    NativeRichEditorTextSpanOptions(
        let offset: Int32,
        let style: NativeRichEditorTextStyle
    ) {}

    func free() {
        this.style.free()
    }
}

/**
 * Defines the selection menu options.
 *
 * @relation declare interface SelectionMenuOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectionMenuOptions {

    /**
     * Callback function when the selection menu appears.
     *
     * @type { VoidCallback }
     * @relation onAppear?: MenuOnAppearCallback
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onAppear: ?VoidCallback

    /**
     * Callback function when the selection menu disappears.
     *
     * @type { VoidCallback }
     * @relation onDisappear?: Callback<void>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDisappear: ?VoidCallback

    /**
     * SelectionMenuOptions constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(onAppear!: ?() -> Unit = None, onDisappear!: ?() -> Unit = None) {
        this.onAppear = onAppear ?? {=>}
        this.onDisappear = onDisappear ?? {=>}
    }
}

/**
 * Defines the span text style.
 *
 * @relation declare interface RichEditorTextStyle
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextStyle {

    /**
     * font color.
     *
     * @type { ResourceColor }
     * @relation fontColor?: ResourceColor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: ?ResourceColor

    /**
     * font size.
     *
     * @type { Length }
     * @relation fontSize?: Length | number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: ?Length

    /**
     * font style.
     *
     * @type { FontStyle }
     * @relation fontStyle?: FontStyle
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontStyle: ?FontStyle

    /**
     * font weight.
     *
     * @type { FontWeight }
     * @relation fontWeight?: number | FontWeight | string
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: ?FontWeight

    /**
     * font family.
     *
     * @type { ResourceStr }
     * @relation fontFamily?: ResourceStr
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFamily: ?ResourceStr

    /**
     * font decoration.
     *
     * @type { TextDecorationOptions }
     * @relation decoration?: DecorationStyleInterface
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: ?TextDecorationOptions

    /**
     * RichEditorTextStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        fontColor!: ?ResourceColor = None,
        fontSize!: ?Length = None,
        fontStyle!: ?FontStyle = None,
        fontWeight!: ?FontWeight = None,
        fontFamily!: ?ResourceStr = None,
        decoration!: ?TextDecorationOptions = None
    ) {  
        this.fontColor = transAppResourceToResourceColor(fontColor ?? Color.Black)
        this.fontSize = transAppResourceToLength(fontSize ?? 16.vp)
        this.fontStyle = fontStyle ?? FontStyle.Normal
        this.fontWeight = fontWeight ?? FontWeight.Normal
        this.fontFamily = transResourceStrToString(fontFamily ?? DEFAULT_FONT)
        this.decoration = decoration ?? TextDecorationOptions(decorationType: TextDecorationType.None, color: Color.Black)
    }
}

/**
 * Defines the span options of RichEditor.
 *
 * @relation declare interface RichEditorTextSpanOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextSpanOptions {

    /**
     * the offset that add a text span at.
     *
     * @type { Int32 }
     * @relation offset?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Int32

    /**
     * text style.
     *
     * @type { RichEditorTextStyle }
     * @relation style?: RichEditorTextStyle
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ?RichEditorTextStyle

    /**
     * RichEditorTextSpanOptions constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offset!: ?Int32 = None, style!: ?RichEditorTextStyle = None) {
        this.offset = offset ?? Int32.Max
        this.style = style ?? RichEditorTextStyle()
    }
}

func parseRichEditorTextStyle(value: RichEditorTextStyle): NativeRichEditorTextStyle {
    let decoration = value.decoration ?? TextDecorationOptions(decorationType: TextDecorationType.None, color: Color.Black)
    let nativeTextDecoration = NativeTextDecoration((decoration.decorationType ?? TextDecorationType.None).getValue(),
        (decoration.color ?? Color.Black).toUInt32())
    let familyString = transResourceStrToString(value.fontFamily ?? DEFAULT_FONT)

    let result = unsafe {
        var fontWeight: ?CString = None
        var fontFamily: ?CString = None
        try {
            fontWeight = LibC.mallocCString((value.fontWeight ?? FontWeight.Normal).getValue())
            fontFamily = LibC.mallocCString(familyString)
        } catch (e: Exception) {
            fontWeight?.free()
            fontFamily?.free()
            throw e
        }
        NativeRichEditorTextStyle(
            (value.fontColor ?? Color.Black).toUInt32(),
            (value.fontSize ?? 16.vp).value,
            (value.fontSize ?? 16.vp).unitType.getValue(),
            (value.fontStyle ?? FontStyle.Normal).getValue(),
            fontWeight.getOrThrow(),
            fontFamily.getOrThrow(),
            nativeTextDecoration
        )
    }
    return result
}

func parseRichEditorTextSpanOptions(value: RichEditorTextSpanOptions): NativeRichEditorTextSpanOptions {
    let nativeRichEditorTextStyle = parseRichEditorTextStyle(value.style ?? RichEditorTextStyle())
    return NativeRichEditorTextSpanOptions(value.offset ?? Int32.Max, nativeRichEditorTextStyle)
}


@C
struct NativeBorderRadiuses {
    NativeBorderRadiuses(
        let top: Float64,
        let topUnit: Int32,
        let right: Float64,
        let rightUnit: Int32,
        let bottom: Float64,
        let bottomUnit: Int32,
        let left: Float64,
        let leftUnit: Int32
    ) {}
}

@C
struct NativeLayoutStyle {
    NativeLayoutStyle(
        let margin: NativeMargin,
        let borderRadius: NativeBorderRadiuses
    ) {}
}

@C
struct LengthOption {
    LengthOption(
        let value: Float64,
        let unit: Int32,
        let hasValue: Bool
    ) {}
}

@C
struct NativeRichEditorImageSpanStyle {
    NativeRichEditorImageSpanStyle(
        let width: LengthOption,
        let height: LengthOption,
        let verticalAlign: Int32,
        let objectFit: Int32,
        let layoutStyle: NativeLayoutStyle
    ) {}
}

@C
struct NativeRichEditorImageSpanOptions {
    NativeRichEditorImageSpanOptions(
        let offset: Int32,
        let imageStyle: NativeRichEditorImageSpanStyle
    ) {}
}

/**
 * Defines the richEditor Image Layout Style.
 *
 * @relation interface RichEditorLayoutStyle
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorLayoutStyle {
    public var margin: ?Margin
    public var borderRadius: ?BorderRadiuses

    /**
     * RichEditorLayoutStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(margin!: ?Margin = None, borderRadius!: ?BorderRadiuses = None) {
        this.margin = margin ?? Margin()
        this.borderRadius = borderRadius ?? BorderRadiuses()
    }

    /**
     * RichEditorLayoutStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(margin!: ?Length, borderRadius!: ?Length) {
        let tmpMargin = margin ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpBorderRadius = borderRadius ?? throw IllegalArgumentException("The type now is not supported.")
        this.margin = Margin(left: tmpMargin, right: tmpMargin, top: tmpMargin, bottom: tmpMargin)
        this.borderRadius = BorderRadiuses(topLeft: tmpBorderRadius, topRight: tmpBorderRadius,
            bottomLeft: tmpBorderRadius, bottomRight: tmpBorderRadius)
    }

    init(origin: NativeRichEditorLayoutStyleResult) {
        borderRadius = BorderRadiuses.parseFromString(origin.borderRadius.toString()).getOrDefault({ =>
            BorderRadiuses(topLeft: 0.vp, topRight: 0.vp, bottomLeft: 0.vp, bottomRight: 0.vp)}
        )
        margin = Margin.parseFromString(origin.margin.toString()).getOrDefault({ =>
            Margin(left: 0.vp, right: 0.vp, top: 0.vp, bottom: 0.vp)
        })
        unsafe {
            origin.borderRadius.free()
            origin.margin.free()
        }
    }
}

/**
 * Defines the span image style.
 *
 * @relation declare interface RichEditorImageSpanStyle
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanStyle {

    /**
     * image size.
     *
     * @type { Option<(Length, Length)> }
     * @relation size?: [
                    Dimension,
                    Dimension
                 ]
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Option<(Length, Length)>

    /**
     * image vertical align.
     *
     * @type { ImageSpanAlignment }
     * @relation verticalAlign?: ImageSpanAlignment
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ?ImageSpanAlignment

    /**
     * image fit.
     *
     * @type { ImageFit }
     * @relation objectFit?: ImageFit
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ?ImageFit

    let layoutStyle: RichEditorLayoutStyle

    /**
     * RichEditorImageSpanStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        size!: Option<(Length, Length)> = Option.None,
        verticalAlign!: ?ImageSpanAlignment = Option.None,
        objectFit!: ?ImageFit = Option.None
    ) {
        this.size = size ?? throw IllegalArgumentException("The type now is not supported.")
        this.verticalAlign = verticalAlign ?? ImageSpanAlignment.Baseline
        this.objectFit = objectFit ?? ImageFit.Cover
        this.layoutStyle = RichEditorLayoutStyle()
    }
}

/**
 * Defines the image span options of RichEditor.
 *
 * @relation declare interface RichEditorImageSpanOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanOptions {

    /**
     * the offset that add image span at.
     *
     * @type { Int32 }
     * @relation offset?: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Int32

    /**
     * image style.
     *
     * @type { RichEditorImageSpanStyle }
     * @relation imageStyle?: RichEditorImageSpanStyle
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageStyle: ?RichEditorImageSpanStyle

    /**
     * RichEditorImageSpanOptions constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        offset!: ?Int32 = None,
        imageStyle!: ?RichEditorImageSpanStyle = None
    ) {
        this.offset = offset ?? Int32.Max
        this.imageStyle = imageStyle ?? RichEditorImageSpanStyle()
    }
}

func parseRichEditorImageSpanStyle(value: RichEditorImageSpanStyle): NativeRichEditorImageSpanStyle {
    let layoutStyle = value.layoutStyle

    let margin = layoutStyle.margin ?? Margin()
    let nativeMargin = NativeMargin(
        margin.top.value,
        margin.top.unitType.getValue(),
        margin.right.value,
        margin.right.unitType.getValue(),
        margin.bottom.value,
        margin.bottom.unitType.getValue(),
        margin.left.value,
        margin.left.unitType.getValue(),
    )

    let borderRadius = layoutStyle.borderRadius ?? BorderRadiuses()
    let nativeBorderRadiuses = NativeBorderRadiuses(
        (borderRadius.topLeft ?? 0.vp).value,
        (borderRadius.topLeft ?? 0.vp).unitType.getValue(),
        (borderRadius.topRight ?? 0.vp).value,
        (borderRadius.topRight ?? 0.vp).unitType.getValue(),
        (borderRadius.bottomLeft ?? 0.vp).value,
        (borderRadius.bottomLeft ?? 0.vp).unitType.getValue(),
        (borderRadius.bottomRight ?? 0.vp).value,
        (borderRadius.bottomRight ?? 0.vp).unitType.getValue(),
    )

    let nativeLayoutStyle = NativeLayoutStyle(nativeMargin, nativeBorderRadiuses)

    let width = match (value.size) {
        case Some(realSize) => LengthOption(realSize[0].value, realSize[0].unitType.getValue(), true)
        case None => LengthOption(0.0, 0, false)
    }

    let height = match (value.size) {
        case Some(realSize) => LengthOption(realSize[1].value, realSize[1].unitType.getValue(), true)
        case None => LengthOption(0.0, 0, false)
    }

    let result = unsafe {
        NativeRichEditorImageSpanStyle(
            width,
            height,
            (value.verticalAlign ?? ImageSpanAlignment.Baseline).getValue(),
            (value.objectFit ?? ImageFit.Cover).getValue(),
            nativeLayoutStyle
        )
    }

    return result
}

func parseRichEditorImageSpanOptions(value: RichEditorImageSpanOptions): NativeRichEditorImageSpanOptions {
    let nativeRichEditorImageSpanStyle = parseRichEditorImageSpanStyle(value.imageStyle ?? RichEditorImageSpanStyle())
    return NativeRichEditorImageSpanOptions(value.offset ?? Int32.Max, nativeRichEditorImageSpanStyle)
}

@C
struct NativeRichEditorSpanResultList {
    NativeRichEditorSpanResultList(
        let array: CPointer<NativeRichEditorSpanResult>,
        let size: Int64,
        let free_: CFunc<(Int64, CPointer<NativeRichEditorSpanResult>) -> Unit>
    ) {}

    func free(): Unit {
        if (size > 0) {
            unsafe { free_(size, array) }
        }
    }
}

@C
struct NativeLeadingMarginPlaceholder {
    NativeLeadingMarginPlaceholder(
        let pixelMap: Int64,
        let width: Float64,
        let widthUnit: Int32,
        let height: Float64,
        let heightUnit: Int32
    ) {}
}

/**
 * Defines the leading margin placeholder of a paragraph.
 *
 * @relation declare interface LeadingMarginPlaceholder
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LeadingMarginPlaceholder {

    /**
     * Placeholder pixelMap.
     *
     * @type { PixelMap }
     * @relation pixelMap: PixelMap
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var pixelMap: ?PixelMap

    /**
     * Placeholder size.
     *
     * @type { (Length, Length) }
     * @relation size: [
                    Dimension,
                    Dimension
                 ]
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?(Length, Length)

    /**
     * LeadingMarginPlaceholder constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(pixelMap!: ?PixelMap, size!: ?(Length, Length)) {
        this.pixelMap = pixelMap ?? throw IllegalArgumentException("The type now is not supported.")
        this.size = size ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

func parseLeadingMarginPlaceholder(value: LeadingMarginPlaceholder): NativeLeadingMarginPlaceholder {
    return NativeLeadingMarginPlaceholder(
        (value.pixelMap ?? throw IllegalArgumentException("The type now is not supported.")).getID(),
        (value.size ?? throw IllegalArgumentException("The type now is not supported."))[0].value,
        (value.size ?? throw IllegalArgumentException("The type now is not supported."))[0].unitType.getValue(),
        (value.size ?? throw IllegalArgumentException("The type now is not supported."))[1].value,
        (value.size ?? throw IllegalArgumentException("The type now is not supported."))[1].unitType.getValue(),
    )
}

@C
struct NativeRichEditorParagraphStyleResult {
    NativeRichEditorParagraphStyleResult(
        let textAlign: Int32,
        let margin0: ExternalString,
        let margin1: ExternalString,
        let wordBreak: Int32,
        let lineBreakStrategy: Int32
    ) {}
}

@C
struct NativeRichEditorParagraphStyle {
    NativeRichEditorParagraphStyle(
        let textAlign: Int32,
        let marginType: Int32,
        let margin: Float64,
        let marginUnit: Int32,
        let placeholder: NativeLeadingMarginPlaceholder
    ) {}
}

/**
 * Defines the paragraph style.
 *
 * @relation declare interface RichEditorParagraphStyle
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorParagraphStyle {

    /**
     * Text alignment.
     *
     * @type { TextAlign }
     * @relation textAlign?: TextAlign
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textAlign: ?TextAlign

    /**
     * Leading margin.
     *
     * @type { LeadingMarginType }
     * @relation leadingMargin?: Dimension | LeadingMarginPlaceholder
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var leadingMargin: ?LeadingMarginType

    /**
     * RichEditorParagraphStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textAlign!: ?TextAlign = None) {
        this.textAlign = textAlign ?? TextAlign.Start
        this.leadingMargin = LeadingMarginType.None
    }

    /**
     * RichEditorParagraphStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textAlign!: ?TextAlign = None, leadingMargin!: ?Length) {
        let tmpLeadingMargin = leadingMargin ?? throw IllegalArgumentException("The type now is not supported.")
        this.textAlign = textAlign ?? TextAlign.Start
        this.leadingMargin = LeadingMarginType.LengthType(tmpLeadingMargin)
    }

    /**
     * RichEditorParagraphStyle constructor
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textAlign!: ?TextAlign = None, leadingMargin!: ?LeadingMarginPlaceholder) {
        this.textAlign = textAlign ?? TextAlign.Start
        let tmpLeadingMargin = leadingMargin ?? throw IllegalArgumentException("The type now is not supported.")
        this.leadingMargin = LeadingMarginType.PlaceholderType(tmpLeadingMargin)
    }
}

func parseRichEditorParagraphStyle(value: RichEditorParagraphStyle) {
    match (value.leadingMargin ?? LeadingMarginType.None) {
        case LeadingMarginType.None => return NativeRichEditorParagraphStyle(
            (value.textAlign ?? TextAlign.Start).getValue(),
            (value.leadingMargin ?? LeadingMarginType.None).getValue(),
            0.0,
            0,
            NativeLeadingMarginPlaceholder(0, 0.0, 0, 0.0, 0)
        )
        case LeadingMarginType.LengthType(v) => return NativeRichEditorParagraphStyle(
            (value.textAlign ?? TextAlign.Start).getValue(),
            (value.leadingMargin ?? LeadingMarginType.None).getValue(),
            v.value,
            v.unitType.getValue(),
            NativeLeadingMarginPlaceholder(0, 0.0, 0, 0.0, 0)
        )
        case LeadingMarginType.PlaceholderType(v) => return NativeRichEditorParagraphStyle(
            (value.textAlign ?? TextAlign.Start).getValue(),
            (value.leadingMargin ?? LeadingMarginType.None).getValue(),
            0.0,
            0,
            parseLeadingMarginPlaceholder(v)
        )
        case _ => return NativeRichEditorParagraphStyle(
            (value.textAlign ?? TextAlign.Start).getValue(),
            (value.leadingMargin ?? LeadingMarginType.None).getValue(),
            0.0,
            0,
            NativeLeadingMarginPlaceholder(0, 0.0, 0, 0.0, 0)
        )
    }
}

@C
struct NativeRichEditorSymbolSpanStyleResult {
    NativeRichEditorSymbolSpanStyleResult(
        let fontColor: ExternalString,
        let fontSize: Float64,
        let fontWeight: Int32,
        let renderingStrategy: Int32,
        let effectStrategy: Int32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkRichEditorControllerCtor(): Int64

    func FfiOHOSAceFrameworkRichEditorControllerGetCaretOffset(id: Int64): Int64

    func FfiOHOSAceFrameworkRichEditorControllerSetCaretOffset(id: Int64, value: Int64): Bool

    func FfiOHOSAceFrameworkRichEditorControllerAddTextSpan(id: Int64, value: CString,
        params: NativeRichEditorTextSpanOptions): Int32

    func FfiOHOSAceFrameworkRichEditorControllerAddImageSpan(id: Int64, value: CString,
        params: NativeRichEditorImageSpanOptions): Int32

    func FfiOHOSAceFrameworkRichEditorControllerDeleteSpans(id: Int64, start: Int32, end: Int32): Unit

    func FfiOHOSAceFrameworkRichEditorControllerDeleteAllSpans(id: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorControllerCloseSelectionMenu(id: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorControllerUpdateSpanStyleText(id: Int64, start: Int32, end: Int32,
        params: NativeRichEditorTextStyle): Unit

    func FfiOHOSAceFrameworkRichEditorControllerUpdateSpanStyleImage(id: Int64, start: Int32, end: Int32,
        params: NativeRichEditorImageSpanStyle): Unit

    func FfiOHOSAceFrameworkRichEditorControllerGetSpans12(id: Int64, start: Int32, end: Int32): NativeRichEditorSpanResultList

    func FfiOHOSAceFrameworkRichEditorControllerUpdateParagraphStyle(id: Int64, start: Int32, end: Int32,
        style: NativeRichEditorParagraphStyle): Unit
}

/**
 * Provides Base Controller for RichEditor.
 *
 * @relation declare class RichEditorBaseController implements TextEditControllerEx
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class RichEditorBaseController <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    /**
     * Get caret offset from controller.
     *
     * @returns { Int32 }
     * @relation getCaretOffset(): number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getCaretOffset(): Int32 {
        let result: Int32 = unsafe {
            Int32(FfiOHOSAceFrameworkRichEditorControllerGetCaretOffset(this.getID()))
        }
        return result
    }

    /**
     * Set caret offset.
     *
     * @param { Int32 } offset
     * @returns { Bool }
     * @relation setCaretOffset(offset: number): boolean
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setCaretOffset(offset: ?Int32): Bool {
        let tmpOffset = offset ?? throw IllegalArgumentException("The type now is not supported.")
        let result: Bool = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerSetCaretOffset(this.getID(), Int64(tmpOffset))
        }
        return result
    }
}

/**
 * Provides Controller for RichEditor.
 *
 * @relation declare class RichEditorController extends RichEditorBaseController
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorController <: RichEditorBaseController {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkRichEditorControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Add a text span.
     *
     * @param { ResourceStr } value
     * @param { RichEditorTextSpanOptions } options
     * @returns { Int32 }
     * @relation addTextSpan(content: ResourceStr, options?: RichEditorTextSpanOptions): number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addTextSpan(content!: ?ResourceStr, options!: ?RichEditorTextSpanOptions = None): Int32 {
        let tmpContent = content ?? throw IllegalArgumentException("The type now is not supported.")
        let params = parseRichEditorTextSpanOptions(options ?? RichEditorTextSpanOptions())
        let valueString = transResourceStrToString(tmpContent)

        var result: Int32 = 0
        unsafe {
            try (valueResource = LibC.mallocCString(valueString).asResource()) {
                result = FfiOHOSAceFrameworkRichEditorControllerAddTextSpan(this.getID(), valueResource.value, params)
            }
        }
        params.free()
        return result
    }

    /**
     * Add a image span.
     *
     * @param { String } value
     * @param { RichEditorImageSpanOptions } options
     * @returns { Int32 }
     * @relation addImageSpan(value: PixelMap | ResourceStr, options?: RichEditorImageSpanOptions): number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addImageSpan(value!: ?String, options!: ?RichEditorImageSpanOptions = None): Int32 {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let params = unsafe { parseRichEditorImageSpanOptions(options ?? RichEditorImageSpanOptions()) }
        var result: Int32 = 0
        unsafe {
            try (valueCString = LibC.mallocCString(tmpValue).asResource()) {
                result = FfiOHOSAceFrameworkRichEditorControllerAddImageSpan(this.getID(), valueCString.value, params)
            }
        }
        return result
    }

    /**
     * Add a image span.
     *
     * @param { AppResource } value
     * @param { RichEditorImageSpanOptions } options
     * @returns { Int32 }
     * @relation addImageSpan(value: PixelMap | ResourceStr, options?: RichEditorImageSpanOptions): number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addImageSpan(value!: ?AppResource, options!: ?RichEditorImageSpanOptions = None): Int32 {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let params = unsafe { parseRichEditorImageSpanOptions(options ?? RichEditorImageSpanOptions()) }
        var result: Int32 = 0
        unsafe {
            try (valueCString = LibC.mallocCString(getResourceMedia(tmpValue)).asResource()) {
                result = FfiOHOSAceFrameworkRichEditorControllerAddImageSpan(this.getID(), valueCString.value, params)
            }
        }
        return result
    }

    /**
     * Modify span style.
     *
     * @param { Int32 } start
     * @param { Int32 } end
     * @param { RichEditorTextStyle } textStyle
     * @relation updateSpanStyle(value: RichEditorUpdateTextSpanStyleOptions | RichEditorUpdateImageSpanStyleOptions | RichEditorUpdateSymbolSpanStyleOptions): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateSpanStyle(start!: ?Int32 = None, end!: ?Int32 = None, textStyle!: ?RichEditorTextStyle): Unit {
        let tmpTextStyle = textStyle ?? throw IllegalArgumentException("The type now is not supported.")
        let params = unsafe { parseRichEditorTextStyle(tmpTextStyle) }

        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerUpdateSpanStyleText(this.getID(), start ?? 0, end ?? Int32.Max, params)
            params.free()
        }
    }

    /**
     * Modify span style.
     *
     * @param { Int32 } start
     * @param { Int32 } end
     * @param { RichEditorImageSpanStyle } imageStyle
     * @relation updateSpanStyle(value: RichEditorUpdateTextSpanStyleOptions | RichEditorUpdateImageSpanStyleOptions | RichEditorUpdateSymbolSpanStyleOptions): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateSpanStyle(start!: ?Int32 = None, end!: ?Int32 = None, imageStyle!: ?RichEditorImageSpanStyle): Unit {
        let tmpImageStyle = imageStyle ?? throw IllegalArgumentException("The type now is not supported.")
        let params = unsafe { parseRichEditorImageSpanStyle(tmpImageStyle) }

        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerUpdateSpanStyleImage(this.getID(), start ?? 0, end ?? Int32.Max, params)
        }
    }

    /**
     * Delete span.
     *
     * @param { Int32 } start
     * @param { Int32 } end
     * @relation deleteSpans(value?: RichEditorRange): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func deleteSpans(start!: ?Int32 = None, end!: ?Int32 = None): Unit {
        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerDeleteSpans(this.getID(), start ?? 0, end ?? Int32.Max)
        }
    }

    /**
     * close the select menu when menu is on.
     *
     * @relation closeSelectionMenu(): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeSelectionMenu(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerCloseSelectionMenu(this.getID())
        }
    }

    /**
     * Modify span style.
     *
     * @param { Int32 } start
     * @param { Int32 } end
     * @param { RichEditorParagraphStyle } style
     * @relation updateParagraphStyle(value: RichEditorParagraphStyleOptions): void
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateParagraphStyle(start!: ?Int32 = None, end!: ?Int32 = None, style!: ?RichEditorParagraphStyle): Unit {
        let tmpStyle = style ?? throw IllegalArgumentException("The type now is not supported.")
        let nativeStyle = parseRichEditorParagraphStyle(tmpStyle)
        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerUpdateParagraphStyle(this.getID(), start ?? 0, end ?? -1, nativeStyle)
        }
    }

    /**
     * Get span content.
     *
     * @param { Int32 } start
     * @param { Int32 } end
     * @returns { ArrayList<RichEditorSpanResult> }
     * @relation getSpans(value?: RichEditorRange): Array<RichEditorImageSpanResult | RichEditorTextSpanResult>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getSpans(start!: ?Int32 = None, end!: ?Int32 = None): ArrayList<RichEditorSpanResult> {
        let array = ArrayList<RichEditorSpanResult>()
        let result = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerGetSpans12(this.getID(), start ?? -1, end ?? -1)
        }
        if (result.size == 0) {
            return array
        }
        for (i in 0..result.size) {
            let nativeSpanInfo = unsafe { result.array.read(Int64(i)) }
            array.add(parseRichEditorSpanResult(nativeSpanInfo))
        }
        result.free()
        return array
    }
}
