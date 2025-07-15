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

package ohos.component

import ohos.image.*

// HarmonyOS system default font
let DEFAULT_FONT: String = "HarmonyOS Sans"

@C
struct NativeTextDecoration {
    NativeTextDecoration(
        let `type`: Int32,
        let color: UInt32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextDecoration {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var `type`: TextDecorationType
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(`type`!: TextDecorationType, color!: ResourceColor = Color.BLACK) {
        this.`type` = `type`
        this.color = transAppResourceToResourceColor(color)
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectionMenuOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onAppear: () -> Unit
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDisappear: () -> Unit

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(onAppear!: () -> Unit = {=>}, onDisappear!: () -> Unit = {=>}) {
        this.onAppear = onAppear
        this.onDisappear = onDisappear
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextStyle {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: ResourceColor
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontStyle: FontStyle
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: FontWeight
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFamily: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: TextDecoration

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        fontColor!: ResourceColor = Color.BLACK,
        fontSize!: Length = 16.vp,
        fontStyle!: FontStyle = FontStyle.Normal,
        fontWeight!: FontWeight = FontWeight.Normal,
        fontFamily!: String = DEFAULT_FONT,
        decoration!: TextDecoration = TextDecoration(`type`: TextDecorationType.None, color: Color.BLACK)
    ) {
        this.fontColor = transAppResourceToResourceColor(fontColor)
        this.fontSize = transAppResourceToLength(fontSize)
        this.fontStyle = fontStyle
        this.fontWeight = fontWeight
        this.fontFamily = fontFamily
        this.decoration = decoration
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextSpanOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Int32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: RichEditorTextStyle

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offset!: Int32 = Int32.Max, style!: RichEditorTextStyle = RichEditorTextStyle()) {
        this.offset = offset
        this.style = style
    }
}

func parseRichEditorTextStyle(value: RichEditorTextStyle): NativeRichEditorTextStyle {
    let decoration = value.decoration
    let nativeTextDecoration = NativeTextDecoration(decoration.`type`.getValue(), decoration.color.toUInt32())

    let result = unsafe {
        var fontWeight: ?CString = None
        var fontFamily: ?CString = None
        try {
            fontWeight = LibC.mallocCString(value.fontWeight.getValue())
            fontFamily = LibC.mallocCString(value.fontFamily)
        } catch (e: Exception) {
            fontWeight?.free()
            fontFamily?.free()
            throw e
        }
        NativeRichEditorTextStyle(
            value.fontColor.toUInt32(),
            value.fontSize.value,
            value.fontSize.unitType.getValue(),
            value.fontStyle.getValue(),
            fontWeight.getOrThrow(),
            fontFamily.getOrThrow(),
            nativeTextDecoration
        )
    }
    return result
}

func parseRichEditorTextSpanOptions(value: RichEditorTextSpanOptions): NativeRichEditorTextSpanOptions {
    let nativeRichEditorTextStyle = parseRichEditorTextStyle(value.style)
    return NativeRichEditorTextSpanOptions(value.offset, nativeRichEditorTextStyle)
}

@C
struct NativeMargin {
    NativeMargin(
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Margin {
    let top: Length
    let right: Length
    let bottom: Length
    let left: Length
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp) {
        this.top = transAppResourceToLength(top)
        this.right = transAppResourceToLength(right)
        this.bottom = transAppResourceToLength(bottom)
        this.left = transAppResourceToLength(left)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BorderRadiuses {
    public var topLeft: Length
    public var topRight: Length
    public var bottomLeft: Length
    public var bottomRight: Length

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp) {
        this.topLeft = transAppResourceToLength(topLeft)
        this.topRight = transAppResourceToLength(topRight)
        this.bottomLeft = transAppResourceToLength(bottomLeft)
        this.bottomRight = transAppResourceToLength(bottomRight)
    }

    func toCBorderRadiuses(): CBorderRadiuses {
        return CBorderRadiuses(topLeft, topRight, bottomLeft, bottomRight)
    }
}

@C
struct CBorderRadiuses {
    let topLeftRadiuses: Float64
    let topLeftUnit: Int32
    let topRightRadiuses: Float64
    let topRightUnit: Int32
    let bottomLeftRadiuses: Float64
    let bottomLeftUnit: Int32
    let bottomRightRadiuses: Float64
    let bottomRightUnit: Int32

    init(topLeft: Length, topRight: Length, bottomLeft: Length, bottomRight: Length) {
        topLeftRadiuses = topLeft.value
        topLeftUnit = topLeft.unitType.getValue()
        topRightRadiuses = topRight.value
        topRightUnit = topRight.unitType.getValue()
        bottomLeftRadiuses = bottomLeft.value
        bottomLeftUnit = bottomLeft.unitType.getValue()
        bottomRightRadiuses = bottomRight.value
        bottomRightUnit = bottomRight.unitType.getValue()
    }
}

// unsupport in this ohos version
struct RichEditorLayoutStyle {
    let margin: Margin
    let borderRadius: BorderRadiuses

    init(margin!: Margin = Margin(), borderRadius!: BorderRadiuses = BorderRadiuses()) {
        this.margin = margin
        this.borderRadius = borderRadius
    }
}

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanStyle {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Option<Length>, Option<Length>)
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ImageSpanAlignment
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ImageFit
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let layoutStyle: RichEditorLayoutStyle

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        size!: (Length, Length),
        verticalAlign!: ImageSpanAlignment = ImageSpanAlignment.BASELINE,
        objectFit!: ImageFit = ImageFit.Cover
    ) {
        this.size = (size[0], size[1])
        this.verticalAlign = verticalAlign
        this.objectFit = objectFit
        this.layoutStyle = RichEditorLayoutStyle()
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        verticalAlign!: ImageSpanAlignment = ImageSpanAlignment.BASELINE,
        objectFit!: ImageFit = ImageFit.Cover
    ) {
        this.size = (Option.None, Option.None)
        this.verticalAlign = verticalAlign
        this.objectFit = objectFit
        this.layoutStyle = RichEditorLayoutStyle()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanOptions {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Int32
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageStyle: RichEditorImageSpanStyle

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        offset!: Int32 = Int32.Max,
        imageStyle!: RichEditorImageSpanStyle = RichEditorImageSpanStyle()
    ) {
        this.offset = offset
        this.imageStyle = imageStyle
    }
}

func parseRichEditorImageSpanStyle(value: RichEditorImageSpanStyle): NativeRichEditorImageSpanStyle {
    let layoutStyle = value.layoutStyle

    let margin = layoutStyle.margin
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

    let borderRadius = layoutStyle.borderRadius
    let nativeBorderRadiuses = NativeBorderRadiuses(
        borderRadius.topLeft.value,
        borderRadius.topLeft.unitType.getValue(),
        borderRadius.topRight.value,
        borderRadius.topRight.unitType.getValue(),
        borderRadius.bottomLeft.value,
        borderRadius.bottomLeft.unitType.getValue(),
        borderRadius.bottomRight.value,
        borderRadius.bottomRight.unitType.getValue(),
    )

    let nativeLayoutStyle = NativeLayoutStyle(nativeMargin, nativeBorderRadiuses)

    let width = match (value.size[0]) {
        case Some(realWitdh) => LengthOption(realWitdh.value, realWitdh.unitType.getValue(), true)
        case None => LengthOption(0.0, 0, false)
    }

    let height = match (value.size[1]) {
        case Some(realHeight) => LengthOption(realHeight.value, realHeight.unitType.getValue(), true)
        case None => LengthOption(0.0, 0, false)
    }

    let result = unsafe {
        NativeRichEditorImageSpanStyle(
            width,
            height,
            value.verticalAlign.getValue(),
            value.objectFit.getValue(),
            nativeLayoutStyle
        )
    }

    return result
}

func parseRichEditorImageSpanOptions(value: RichEditorImageSpanOptions): NativeRichEditorImageSpanOptions {
    let nativeRichEditorImageSpanStyle = parseRichEditorImageSpanStyle(value.imageStyle)
    return NativeRichEditorImageSpanOptions(value.offset, nativeRichEditorImageSpanStyle)
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

@!APILevel[
    12,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LeadingMarginPlaceholder {
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var pixelMap: PixelMap
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Length, Length)

    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(pixelMap!: PixelMap, size!: (Length, Length)) {
        this.pixelMap = pixelMap
        this.size = size
    }
}

func parseLeadingMarginPlaceholder(value: LeadingMarginPlaceholder): NativeLeadingMarginPlaceholder {
    return NativeLeadingMarginPlaceholder(
        value.pixelMap.getID(),
        value.size[0].value,
        value.size[0].unitType.getValue(),
        value.size[1].value,
        value.size[1].unitType.getValue(),
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

@!APILevel[
    19,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorParagraphStyleResult {
    public var textAlign: TextAlign = TextAlign.Start
    public var leadingMargin: (String, String) = ("", "")
    public var wordBreak: WordBreak = WordBreak.BreakWord
    public var lineBreakStrategy: LineBreakStrategy = LineBreakStrategy.GREEDY

    init(origin: NativeRichEditorParagraphStyleResult) {
        this.textAlign = TextAlign.parseValue(origin.textAlign)
        this.leadingMargin = (origin.margin0.toString(), origin.margin1.toString())
        this.wordBreak = WordBreak.parseValue(origin.wordBreak)
        this.lineBreakStrategy = LineBreakStrategy.parseValue(origin.lineBreakStrategy)
        unsafe {
            origin.margin0.free()
            origin.margin1.free()
        }
    }

    init() {}
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

@!APILevel[
    12,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorParagraphStyle {
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textAlign: TextAlign
    let marginType: MarginType
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var margin: Option<Length>
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var placeholder: Option<LeadingMarginPlaceholder>

    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textAlign!: TextAlign = TextAlign.Start) {
        this.textAlign = textAlign
        this.marginType = MarginType.None
        this.margin = Option.None
        this.placeholder = Option.None
    }
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textAlign!: TextAlign = TextAlign.Start, leadingMargin!: Length) {
        this.textAlign = textAlign
        this.margin = transAppResourceToLength(leadingMargin)
        this.marginType = MarginType.MarginLength
        this.placeholder = Option.None
    }
    @!APILevel[
        12,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(textAlign!: TextAlign = TextAlign.Start, leadingMargin!: LeadingMarginPlaceholder) {
        this.textAlign = textAlign
        this.placeholder = leadingMargin
        this.marginType = MarginType.MarginPlaceholder
        this.margin = Option.None
    }
}

func parseRichEditorParagraphStyle(value: RichEditorParagraphStyle) {
    match (value.marginType) {
        case MarginType.None => return NativeRichEditorParagraphStyle(
            value.textAlign.getValue(),
            value.marginType.getValue(),
            0.0,
            0,
            NativeLeadingMarginPlaceholder(0, 0.0, 0, 0.0, 0)
        )
        case MarginType.MarginLength => return NativeRichEditorParagraphStyle(
            value.textAlign.getValue(),
            value.marginType.getValue(),
            value.margin.getOrThrow().value,
            value.margin.getOrThrow().unitType.getValue(),
            NativeLeadingMarginPlaceholder(0, 0.0, 0, 0.0, 0)
        )
        case MarginType.MarginPlaceholder => return NativeRichEditorParagraphStyle(
            value.textAlign.getValue(),
            value.marginType.getValue(),
            0.0,
            0,
            parseLeadingMarginPlaceholder(value.placeholder.getOrThrow())
        )
        case _ => return NativeRichEditorParagraphStyle(
            value.textAlign.getValue(),
            value.marginType.getValue(),
            0.0,
            0,
            parseLeadingMarginPlaceholder(value.placeholder.getOrThrow())
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

@!APILevel[
    19,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSymbolSpanStyleResult {
    public var fontColor: String = ""
    public var fontSize: Float64 = 0.0
    public var fontWeight: FontWeight = FontWeight.Normal
    public var renderingStrategy: SymbolRenderingStrategy = SymbolRenderingStrategy.SINGLE
    public var effectStrategy: SymbolEffectStrategy = SymbolEffectStrategy.NONE

    init(origin: NativeRichEditorSymbolSpanStyleResult) {
        this.fontColor = origin.fontColor.toString()
        this.fontSize = origin.fontSize
        this.fontWeight = FontWeight.parseValue(origin.renderingStrategy)
        this.renderingStrategy = SymbolRenderingStrategy.parseValue(origin.renderingStrategy)
        this.effectStrategy = SymbolEffectStrategy.parseValue(origin.effectStrategy)
        unsafe {
            origin.fontColor.free()
        }
    }

    init() {}
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

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorController <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getCaretOffset(): Int64 {
        let result: Int64 = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerGetCaretOffset(this.getID())
        }
        return result
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setCaretOffset(offset: Int64): Bool {
        let result: Bool = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerSetCaretOffset(this.getID(), offset)
        }
        return result
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addTextSpan(value!: String, options!: RichEditorTextSpanOptions = RichEditorTextSpanOptions()): Int32 {
        let params = parseRichEditorTextSpanOptions(options)
        var valueCString: CString
        try {
            valueCString = unsafe { LibC.mallocCString(value) }
        } catch (e: Exception) {
            params.free()
            throw e
        }
        let result: Int32 = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerAddTextSpan(this.getID(), valueCString, params)
        }

        params.free()
        unsafe {
            LibC.free(valueCString)
        }
        return result
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addImageSpan(value!: String, options!: RichEditorImageSpanOptions = RichEditorImageSpanOptions()): Int32 {
        let params = unsafe { parseRichEditorImageSpanOptions(options) }
        let valueCString = unsafe { LibC.mallocCString(value) }
        let result: Int32 = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerAddImageSpan(this.getID(), valueCString, params)
        }
        unsafe {
            LibC.free(valueCString)
        }
        return result
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addImageSpan(value!: AppResource, options!: RichEditorImageSpanOptions = RichEditorImageSpanOptions()): Int32 {
        let params = unsafe { parseRichEditorImageSpanOptions(options) }
        let valueCString = unsafe { LibC.mallocCString(getResourceMedia(value)) }
        let result: Int32 = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerAddImageSpan(this.getID(), valueCString, params)
        }
        unsafe {
            LibC.free(valueCString)
        }
        return result
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateSpanStyle(start!: Int32 = 0, end!: Int32 = Int32.Max, textStyle!: RichEditorTextStyle): Unit {
        let params = unsafe { parseRichEditorTextStyle(textStyle) }

        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerUpdateSpanStyleText(this.getID(), start, end, params)
            params.free()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateSpanStyle(start!: Int32 = 0, end!: Int32 = Int32.Max, imageStyle!: RichEditorImageSpanStyle): Unit {
        let params = unsafe { parseRichEditorImageSpanStyle(imageStyle) }

        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerUpdateSpanStyleImage(this.getID(), start, end, params)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func deleteSpans(start!: Int32 = 0, end!: Int32 = Int32.Max): Unit {
        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerDeleteSpans(this.getID(), start, end)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeSelectionMenu(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerCloseSelectionMenu(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateParagraphStyle(start!: Int32 = 0, end!: Int32 = -1, style!: RichEditorParagraphStyle): Unit {
        let nativeStyle = parseRichEditorParagraphStyle(style)
        unsafe {
            FfiOHOSAceFrameworkRichEditorControllerUpdateParagraphStyle(this.getID(), start, end, nativeStyle)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getSpans(start!: Int32 = -1, end!: Int32 = -1): ArrayList<RichEditorSpanResult> {
        let array = ArrayList<RichEditorSpanResult>()
        let result = unsafe {
            FfiOHOSAceFrameworkRichEditorControllerGetSpans12(this.getID(), start, end)
        }
        if (result.size == 0) {
            return array
        }
        for (i in 0..result.size) {
            let nativeSpanInfo = unsafe { result.array.read(Int64(i)) }
            array.add(RichEditorSpanResult(nativeSpanInfo))
        }
        result.free()
        return array
    }
}
