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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.rich_editor

import ohos.arkui.component.common.{FontStyle, FontWeight, CommonMethodComponent, TextDecorationType, ImageSpanAlignment, ImageFit, RichEditorDeleteDirection, CustomBuilder, ResponseType, CopyOptions, RichEditorSpanType}
import ohos.base.{ExternalString, Color, VectorStringHandle, CStringExtend, ResourceColor,VoidCallback, Callback}
import ohos.ffi.{releaseFFIData, Callback0Param, Callback1Param, Callback2Param, RemoteDataLite}
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap
import std.collection.ArrayList
import std.convert.{Parsable}

foreign {
    func FfiOHOSAceFrameworkRichEditorCreateWithController(controller: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorCustomKeyboard(builder: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorBindSelectionMenu(spantype: Int32, content: Int64, responseType: Int32,
        onAppear: Int64, onDisappear: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorCopyOptions(CopyOptions: Int32): Unit

    func FfiOHOSAceFrameworkRichEditorOnReady(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnDeleteComplete(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorAboutToIMEInput12(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnIMEInputComplete12(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorAboutToDelete12(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnSelect12(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnPaste(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorPreventDefault(id: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnDidChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorEnableDataDetector(enable: Bool): Unit

    func FfiOHOSAceFrameworkRichEditorDataDetectorConfig(config: NativeTextDataDetectorConfig): Unit

    func FfiOHOSAceFrameworkRichEditorEditMenuOptions(cjOnCreateMenu: Int64, cjOnMenuItemClick: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorEnablePreviewText(enable: Bool): Unit

    func FfiOHOSAceFrameworkRichEditorPlaceholder(value: CString, style: NativePlaceholderStyle): Unit

    func FfiOHOSAceFrameworkRichEditorCaretColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkRichEditorSelectedBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkRichEditorEnterKeyType(value: Int32): Unit

    func FfiOHOSAceFrameworkRichEditorEnableKeyboardOnFocus(enable: Bool): Unit

    func FfiOHOSAceFrameworkRichEditorCustomKeyboardWithOptions(builder: Int64, options: NativeKeyboardOptions): Unit

    func FfiOHOSAceFrameworkRichEditorOnDidIMEInput(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnSelectionChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnEditingChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnSubmit(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnCut(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnCopy(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorOnWillChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkRichEditorSetEnableHapticFeedBack(enable: Bool): Unit

    func FfiOHOSAceFrameworkRichEditorCreateWithStyledStringController(controller: Int64): Unit
}

func parseColorFromString(color: String): Option<Color> {
    if (!color.startsWith("#")) {
        return Option.None
    }
    var uintString = color.removePrefix("#")
    let uintStringSize = uintString.size
    if (uintStringSize != 8 && uintStringSize != 6) {
        return Option.None
    }
    uintString = "0x" + uintString
    let colorValue = UInt32.tryParse(uintString)
    match (colorValue) {
        case Some(v) => return Color(v)
        case None => return Option.None
    }
}

@C
struct NativeTextRange {
    NativeTextRange(
        let start: Int32,
        let end: Int32
    ) {}
}

@C
struct NativeDecorationStyleResult {
    NativeDecorationStyleResult(
        let decorationType: Int32,
        let color: CString
    ) {}
}

/**
 * Defines the font decoration result.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DecorationStyleResult {
    /**
     * The font decoration type.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decorationType: ?TextDecorationType

    /**
     * The font decoration color.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor

    /**
     * Constructor.
     *
     * @param { TextDecorationType } decorationType - The font decoration type.
     * @param { ResourceColor } color - The font decoration color.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        decorationType: TextDecorationType,
        color: ResourceColor
    ) {
        this.decorationType = decorationType
        this.color = color
    }
}

@C
struct NativeRichEditorInsertValue {
    NativeRichEditorInsertValue(
        let insertOffset: Int32,
        let insertValue: ExternalString,
        let previewText: ExternalString
    ) {}
}

/**
 * Defines the inserted text value info.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorInsertValue {
    /**
     * The location info where the value will be inserted.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var insertOffset: ?Int32
    /**
     * The inserted value.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var insertValue: ?String

    /**
    * Constructor.
    *
    * @param { ?Int32 } insertOffset - The location info where the value will be inserted.
    * @param { ?String } insertValue - The inserted value.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        insertOffset: ?Int32,
        insertValue: ?String
    ) {
        this.insertOffset = insertOffset ?? 0
        this.insertValue = insertValue ?? ""
    }

    init(origin: NativeRichEditorInsertValue) {
        this.insertOffset = origin.insertOffset
        this.insertValue = origin.insertValue.toString()
        unsafe {
            origin.insertValue.free()
            origin.previewText.free()
        }
    }
}

@C
struct NativeRichEditorSpanPosition {
    NativeRichEditorSpanPosition(
        let spanIndex: Int32,
        let spanStart: Int32,
        let spanEnd: Int32
    ) {}
}

/**
 * Defines the span position.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSpanPosition {
    /**
     * Define the index of span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanIndex: ?Int32

    /**
     * The range of span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanRange: ?(Int32, Int32)

    /**
     * RichEditorSpanPosition constructor
     *
     * @param { ?Int32 } spanIndex - Define the index of span.
     * @param { ?(Int32, Int32) } spanRange - The range of span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        spanIndex: ?Int32,
        spanRange: ?(Int32, Int32)
    ) {
        this.spanIndex = spanIndex ?? 0
        this.spanRange = spanRange ?? (0, 0)
    }
}

@C
struct NativeShadowOptionsResult {
    NativeShadowOptionsResult(
        let radius: Float64,
        let color: ExternalString,
        let offsetX: Float64,
        let offsetY: Float64
    ) {}
}

@C
struct NativeRichEditorTextStyleResult {
    NativeRichEditorTextStyleResult(
        let fontColor: ExternalString,
        let fontSize: Float64,
        let fontStyle: Int32,
        let fontWeight: Int32,
        let fontFamily: ExternalString,
        let decoration: NativeDecorationStyleResult,
        let textShadow: CPointer<NativeShadowOptionsResult>,
        let free_: CFunc<(Int64, CPointer<NativeShadowOptionsResult>) -> Unit>,
        let textShadowSize: Int64,
        let lineHeight: Float64,
        let letterSpacing: Float64,
        let fontFeature: ExternalString
    ) {}
}

/**
 * Defines the text style result.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextStyleResult {
    /**
     * font color.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: String

    /**
     * font size.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: Float64

    /**
     * font style.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontStyle: FontStyle

    /**
     * font weight.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: Int32

    /**
     * font family.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFamily: String

    /**
     * font decoration.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: DecorationStyleResult

    /**
     * RichEditorTextStyleResult constructor.
     *
     * @param { String } fontColor - font color.
     * @param { Float64 } fontSize - font size.
     * @param { FontStyle } fontStyle - font style.
     * @param { Int32 } fontWeight - font weight.
     * @param { String } fontFamily - font family.
     * @param { DecorationStyleResult } decoration - font decoration.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        fontColor: String,
        fontSize: Float64,
        fontStyle: FontStyle,
        fontWeight: Int32,
        fontFamily: String,
        decoration: DecorationStyleResult
    ) {
        this.fontColor = fontColor
        this.fontSize = fontSize
        this.fontStyle = fontStyle
        this.fontWeight = fontWeight
        this.fontFamily = fontFamily
        this.decoration = decoration
    }

    init(origin: NativeRichEditorTextStyleResult) {
        this.fontColor = origin.fontColor.toString()
        this.fontSize = origin.fontSize
        this.fontStyle = FontStyle.parseValue(origin.fontStyle)
        this.fontWeight = origin.fontWeight
        this.fontFamily = origin.fontFamily.toString()
        this.decoration = DecorationStyleResult(
            TextDecorationType.parseValue(origin.decoration.decorationType),
            parseColorFromString(origin.decoration.color.toString()).getOrDefault({ => Color(0X000000)})
        )
    }
}

@C
struct NativeRichEditorLayoutStyleResult {
    NativeRichEditorLayoutStyleResult(
        let borderRadius: ExternalString,
        let margin: ExternalString
    ) {}
}

@C
struct NativeRichEditorImageSpanStyleResult {
    NativeRichEditorImageSpanStyleResult(
        let size0: Float64,
        let size1: Float64,
        let verticalAlign: Int32,
        let objectFit: Int32,
        let layoutStyle: NativeRichEditorLayoutStyleResult
    ) {}
}

/**
 * Defines the span image style result.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanStyleResult {
    /**
     * image size.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: ?(Float64, Float64)

    /**
     * image vertical align.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ?ImageSpanAlignment

    /**
     * image fit.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ?ImageFit

    /**
     * RichEditor ImageSpan Layout Style.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var layoutStyle: ?RichEditorLayoutStyle

    init(origin: NativeRichEditorImageSpanStyleResult) {
        this.size = (origin.size0, origin.size1)
        this.verticalAlign = ImageSpanAlignment.parseValue(origin.verticalAlign)
        this.objectFit = ImageFit.parseValue(origin.verticalAlign)
        this.layoutStyle = RichEditorLayoutStyle(origin.layoutStyle)
    }

    init(
        size!: ?(Float64, Float64) = None,
        verticalAlign!: ?ImageSpanAlignment = None,
        objectFit!: ?ImageFit = None,
        layoutStyle!: ?RichEditorLayoutStyle = None
    ) {
        this.size = size ?? (0.0, 0.0)
        this.verticalAlign = verticalAlign ?? ImageSpanAlignment.Center
        this.objectFit = objectFit ?? ImageFit.Auto
        this.layoutStyle = layoutStyle ?? RichEditorLayoutStyle()
    }
}

@C
struct NativeRichEditorTextSpanResult {
    NativeRichEditorTextSpanResult(
        let spanPosition: NativeRichEditorSpanPosition,
        let value: ExternalString,
        let textStyle: NativeRichEditorTextStyleResult,
        let offsetInSpanStart: Int32,
        let offsetInSpanEnd: Int32,
        let symbolSpanStyle: NativeRichEditorSymbolSpanStyleResult,
        let paragraphStyle: NativeRichEditorParagraphStyleResult,
        var previewText: ExternalString
    ) {}
}

/**
 * Defines the text span result.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextSpanResult <: RichEditorSpanResult {
    /**
     * The position of the text span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition

    /**
     * The content of the text span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String

    /**
     * text style.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: RichEditorTextStyleResult

    /**
     * get offset in span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32)

    /**
     * RichEditorTextSpanResult constructor.
     *
     * @param { RichEditorSpanPosition } spanPosition - The position of the text span.
     * @param { String } value - The content of the text span.
     * @param { RichEditorTextStyleResult } textStyle - text style.
     * @param { (Int32, Int32) } offsetInSpan - get offset in span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        spanPosition: RichEditorSpanPosition,
        value: String,
        textStyle: RichEditorTextStyleResult,
        offsetInSpan: (Int32, Int32)
    ) {
        this.spanPosition = spanPosition
        this.value = value
        this.textStyle = textStyle
        this.offsetInSpan = offsetInSpan
    }
}

@C
struct NativeRichEditorImageSpanResult {
    NativeRichEditorImageSpanResult(
        let spanPosition: NativeRichEditorSpanPosition,
        let valuePixelMap: Int64,
        let valueResourceStr: ExternalString,
        let imageStyle: NativeRichEditorImageSpanStyleResult,
        let offsetInSpanStart: Int32,
        let offsetInSpanEnd: Int32
    ) {}
}

/**
 * Defines the image span.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanResult <: RichEditorSpanResult {
    /**
     * The position of the image span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: ?RichEditorSpanPosition

    /**
     * The pixel map of the image span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valuePixelMap: Option<PixelMap>

    /**
     * The resource string of the image span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valueResourceStr: ?String

    /**
     * image attribute.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageStyle: ?RichEditorImageSpanStyleResult

    /**
     * get offset in span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: ?(Int32, Int32)

    /**
     * RichEditorImageSpanResult constructor.
     *
     * @param { ?RichEditorSpanPosition } spanPosition - The position of the image span.
     * @param { Option<PixelMap> } valuePixelMap - The pixel map of the image span.
     * @param { ?String } valueResourceStr - The resource string of the image span.
     * @param { ?RichEditorImageSpanStyleResult } imageStyle - image attribute.
     * @param { ?(Int32, Int32) offsetInSpan - get offset in span.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        spanPosition!: ?RichEditorSpanPosition = Option.None,
        valuePixelMap!: Option<PixelMap> = Option.None,
        valueResourceStr!: ?String = None,
        imageStyle!: ?RichEditorImageSpanStyleResult = None,
        offsetInSpan!: ?(Int32, Int32) = None
    ) {
        this.spanPosition = spanPosition ??  RichEditorSpanPosition(0, (0, 0))
        this.valuePixelMap = valuePixelMap
        this.valueResourceStr = valueResourceStr ?? ""
        this.imageStyle = imageStyle ?? RichEditorImageSpanStyleResult()
        this.offsetInSpan = offsetInSpan ?? (0, 0)
    }
}

@C
struct NativeDecorationStyleInterface {
    NativeDecorationStyleInterface(
        let decorationType: Int32,
        let color: UInt32,
        let style: Int32,
        let hasColor: Bool,
        let hasStyle: Bool
    ) {}
}

@C
struct NativeTextDataDetectorConfig {
    NativeTextDataDetectorConfig(
        let types: VectorStringHandle,
        let onDetectResultUpdate: Int64,
        let color: UInt32,
        let decoration: NativeDecorationStyleInterface,
        let hasColor: Bool,
        let hasOnDetectResultUpdate: Bool,
        let hasDecoration: Bool
    ) {}
}

@C
struct NativeFont {
    NativeFont(
        var size: Float64,
        var sizeUnit: Int32,
        var weight: CString,
        var family: CString,
        var style: Int32
    ) {}

    func free(): Unit {
        weight.free()
        family.free()
    }
}

@C
struct NativePlaceholderStyle {
    NativePlaceholderStyle(
        var hasFont: Bool,
        var hasFontColor: Bool,
        var font: NativeFont,
        var fontColor: UInt32
    ) {}
}

@C
struct NativeKeyboardOptions {
    NativeKeyboardOptions(let supportAvoidance: Bool) {}
}

@C
struct NativeRichEditorChangeValue {
    NativeRichEditorChangeValue(
        let rangeBefore: NativeTextRange,
        let replacedSpans: CPointer<NativeRichEditorSpanResult>,
        let replacedSpansSize: Int64,
        let replacedImageSpans: CPointer<NativeRichEditorImageSpanResult>,
        let replacedImageSpansSize: Int64,
        let replacedSymbolSpans: CPointer<NativeRichEditorTextSpanResult>,
        let replacedSymbolSpansSize: Int64
    ) {}
}

func parseNativeRichEditorImageSpanResult(value: NativeRichEditorImageSpanResult): RichEditorImageSpanResult {
    let nativeSpanPosition = value.spanPosition

    let spanPosition = RichEditorSpanPosition(
        nativeSpanPosition.spanIndex,
        (nativeSpanPosition.spanStart, nativeSpanPosition.spanEnd)
    )

    let valuePixelMap: Option<PixelMap> = if (value.valuePixelMap > 0) {
        PixelMap(value.valuePixelMap)
    } else {
        Option.None
    }

    let valueResourceStr = value.valueResourceStr.toString()
    let imageStyle = RichEditorImageSpanStyleResult(value.imageStyle)
    let res = RichEditorImageSpanResult(
        spanPosition: spanPosition,
        valuePixelMap: valuePixelMap,
        valueResourceStr: valueResourceStr,
        imageStyle: imageStyle,
        offsetInSpan: (value.offsetInSpanStart, value.offsetInSpanEnd)
    )
    unsafe { value.valueResourceStr.free() }
    return res
}

func parseNativeRichEditorTextSpanResult(value: NativeRichEditorTextSpanResult): RichEditorTextSpanResult {
    let nativeSpanPosition = value.spanPosition
    let nativeTextStyle = value.textStyle
    let spanPosition = RichEditorSpanPosition(
        nativeSpanPosition.spanIndex,
        (nativeSpanPosition.spanStart, nativeSpanPosition.spanEnd)
    )

    let textStyle = RichEditorTextStyleResult(nativeTextStyle)
    unsafe {
        value.previewText.free()
    }

    let result = RichEditorTextSpanResult(
        spanPosition,
        value.value.toString(),
        textStyle,
        (value.offsetInSpanStart, value.offsetInSpanEnd)
    )
    return result
}

@C
struct NativeRichEditorSpanResult {
    NativeRichEditorSpanResult(
        let isText: Bool,
        let textResult: NativeRichEditorTextSpanResult,
        let imageResult: NativeRichEditorImageSpanResult
    ) {}
}

/**
 * Defines the span result.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface RichEditorSpanResult {}

func parseRichEditorSpanResult(native: NativeRichEditorSpanResult): RichEditorSpanResult {
    if (native.isText) {
        return parseNativeRichEditorTextSpanResult(native.textResult)
    } else {
        return parseNativeRichEditorImageSpanResult(native.imageResult)
    }
}

@C
struct NativeRichEditorSelection {
    NativeRichEditorSelection(
        let selectionStart: Int32,
        let selectionEnd: Int32,
        let spans: CPointer<NativeRichEditorSpanResult>,
        let spanSize: Int64
    ) {}
}

@C
struct NativeRichEditorRange {
    NativeRichEditorRange(
        let start: Int32,
        let end: Int32
    ) {}
}

/**
 * Defines the text information for editing.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSelection {
    /**
     * The location info.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selection: ?(Int32, Int32)

    /**
     * The selected text content.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spans: ?ArrayList<RichEditorSpanResult>

    /**
     * RichEditorSelection constructor
     *
     * @param { ?(Int32, Int32) } selection - the location info.
     * @param { ?ArrayList<RichEditorSpanResult> } spans - the selected text content.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selection: ?(Int32, Int32), spans: ?ArrayList<RichEditorSpanResult>) {
        this.selection = selection ?? (0, 0)
        this.spans = spans ?? ArrayList<RichEditorSpanResult>()
    }
}

@C
struct NativeRichEditorDeleteValue {
    NativeRichEditorDeleteValue(
        let offset: Int32,
        let direction: Int32,
        let length: Int32,
        let richEditorDeleteSpans: CPointer<NativeRichEditorSpanResult>,
        let spanSize: Int64
    ) {}
}

/**
 * Provides an interface for deleting value from text.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorDeleteValue {
    /**
     * The offset of deleting.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Int32

    /**
     * The deleted direction.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: RichEditorDeleteDirection

    /**
     * The deleted text length.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var length: Int32

    /**
     * The deleted span object.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>

    /**
     * RichEditorDeleteValue constructor
     *
     * @param { Int32 } offset - the offset of deleting.
     * @param { RichEditorDeleteDirection } direction - the deleted direction.
     * @param { Int32 } length - the deleted text length.
     * @param { ArrayList<RichEditorSpanResult> } richEditorDeleteSpans - the deleted span object.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        offset: Int32,
        direction: RichEditorDeleteDirection,
        length: Int32,
        richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
    ) {
        this.offset = offset
        this.direction = direction
        this.length = length
        this.richEditorDeleteSpans = richEditorDeleteSpans
    }
}

func parseNativeRichEditorSelection(value: NativeRichEditorSelection): RichEditorSelection {
    let spans = ArrayList<RichEditorSpanResult>()
    for (i in 0..value.spanSize) {
        let nativeSpanInfo = unsafe { value.spans.read(Int64(i)) }
        spans.add(parseRichEditorSpanResult(nativeSpanInfo))
    }
    return RichEditorSelection((value.selectionStart, value.selectionEnd), spans)
}

func parseNativeRichEditorDeleteValue(value: NativeRichEditorDeleteValue): RichEditorDeleteValue {
    let spans = ArrayList<RichEditorSpanResult>()
    for (i in 0..value.spanSize) {
        let nativeSpanInfo = unsafe { value.richEditorDeleteSpans.read(Int64(i)) }
        spans.add(parseRichEditorSpanResult(nativeSpanInfo))
    }
    return RichEditorDeleteValue(
        value.offset,
        RichEditorDeleteDirection.parseValue(value.direction),
        value.length,
        spans
    )
}

/**
 * Defines range of text type component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextRange {
    /**
     * Start offset.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: ?Int32

    /**
     * End offset.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: ?Int32

    /**
     * TextRange constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start: ?Int32, end: ?Int32) {
        this.start = start ?? -1
        this.end = end ?? -1
    }
}

/**
 * Defines the paste event.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PasteEvent <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Override system paste event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preventDefault(): Unit {
        unsafe { FfiOHOSAceFrameworkRichEditorPreventDefault(this.getID()) }
    }
}

/**
 * Callback function when a paste operation is performed.
 *
 * @param { PasteEvent } event - The paste event.
 */
public type PasteEventCallback = (PasteEvent) -> Unit

/**
 * Callback after content changed.
 * 
 * @param { TextRange } rangeBefore - Range of content that had been replaced.
 * @param { TextRange } rangeAfter - Range of content that newly added.
 */
public type OnDidChangeCallback = (rangeBefore: TextRange, rangeAfter: TextRange) -> Unit

/**
 * Defines RichEditor Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditor <: CommonMethodComponent<RichEditor> & RichEditorAttribute {

    /**
     * Called when create RichEditor.
     *
     * @param { ?RichEditorController } controller
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller: ?RichEditorController) {
        let tmpController = controller ?? RichEditorController()
        unsafe {
            FfiOHOSAceFrameworkRichEditorCreateWithController(tmpController.getID())
        }
    }

    /**
     * Define custom keyboard.
     *
     * @param { ?CustomBuilder } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(value!: ?CustomBuilder): This {
        let tmpValue = value ?? { => }
        unsafe {
            FfiOHOSAceFrameworkRichEditorCustomKeyboard(Callback0Param<Unit>(tmpValue).getID())
        }
        this
    }

    /**
     * Bind to the selection menu.
     *
     * @param { ?RichEditorSpanType } spantype
     * @param { ?CustomBuilder } content
     * @param { ?ResponseType } responseType
     * @param { ?SelectionMenuOptions } options
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSelectionMenu(
        spantype!: ?RichEditorSpanType = None,
        content!: ?CustomBuilder,
        responseType!: ?ResponseType = None,
        options!: ?SelectionMenuOptions
    ): This {
        let tmpSpantype = spantype ?? RichEditorSpanType.Text
        let tmpResponseType = responseType ?? ResponseType.LongPress
        let tmpOptions = options ?? SelectionMenuOptions()
        unsafe {
            FfiOHOSAceFrameworkRichEditorBindSelectionMenu(
                tmpSpantype.getValue(),
                Callback0Param<Unit>(content ?? { => }).getID(),
                tmpResponseType.getValue(),
                Callback0Param<Unit>(tmpOptions.onAppear ?? {=>}).getID(),
                Callback0Param<Unit>(tmpOptions.onDisappear ?? {=>}).getID()
            )
        }
        this
    }

    /**
     * Allow replication.
     *
     * @param { ?CopyOptions } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOptions(value: ?CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCopyOptions((value ?? CopyOptions.LocalDevice).getValue())
        }
        this
    }

    /**
     * Called when on ready.
     *
     * @param { ?VoidCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReady(callback: ?VoidCallback): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnReady(Callback0Param<Unit>(callback ?? { => }).getID())
        }
        this
    }

    /**
     * Get text value information when about to input.
     *
     * @param { ?Callback<RichEditorInsertValue, Bool> } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToImeInput(callback: ?Callback<RichEditorInsertValue, Bool>): This {
        let tmpCallback = callback ?? { _ => false }
        let wrapper = {
            value: NativeRichEditorInsertValue => tmpCallback(RichEditorInsertValue(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorAboutToIMEInput12(
                Callback1Param<NativeRichEditorInsertValue, Bool>(wrapper).getID())
        }
        this
    }

    /**
     * Get text value information when completed input.
     *
     * @param { ?Callback<RichEditorTextSpanResult, Unit> } callback
     * @returns { RichEditor }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onImeInputComplete(callback: ?Callback<RichEditorTextSpanResult, Unit>): RichEditor {
        let tmpCallback = callback ?? { _ => false }
        let wrapper = {
            value: NativeRichEditorTextSpanResult => tmpCallback(parseNativeRichEditorTextSpanResult(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnIMEInputComplete12(
                Callback1Param<NativeRichEditorTextSpanResult, Unit>(wrapper).getID())
        }
        this
    }

    /**
     * Notify that the deletion has been completed.
     *
     * @param { ?VoidCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDeleteComplete(callback: ?VoidCallback): This {
        let tmpCallback = callback ?? { => }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnDeleteComplete(Callback0Param<Unit>(tmpCallback).getID())
        }
        this
    }

    /**
     * Get text value information when about to delete.
     *
     * @param { ?Callback<RichEditorDeleteValue, Bool> } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToDelete(callback: ?Callback<RichEditorDeleteValue, Bool>): This {
        let tmpCallback = callback ?? { _ => false }
        let wrapper = {
            value: NativeRichEditorDeleteValue => return tmpCallback(parseNativeRichEditorDeleteValue(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorAboutToDelete12(
                Callback1Param<NativeRichEditorDeleteValue, Bool>(wrapper).getID())
        }
        this
    }

    /**
     * Called when the content is selected.
     *
     * @param { ?Callback<RichEditorSelection, Unit> } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: ?Callback<RichEditorSelection, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            value: NativeRichEditorSelection => tmpCallback(parseNativeRichEditorSelection(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnSelect12(Callback1Param<NativeRichEditorSelection, Unit>(wrapper).getID())
        }
        this
    }

    /**
     * Defines onPaste callback.
     *
     * @param { ?PasteEventCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: ?PasteEventCallback): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            value: Int64 => tmpCallback(PasteEvent(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnPaste(Callback1Param<Int64, Unit>(wrapper).getID())
        }
        this
    }

    /**
     * Called after text changed.
     *
     * @param { ?OnDidChangeCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidChange(callback: ?OnDidChangeCallback): This {
        let tmpCallback = callback ?? { rangeBefore: TextRange, rangeAfter: TextRange => }
        let wrapper = {
            before: NativeTextRange, after: NativeTextRange => tmpCallback(
                TextRange(before.start, before.end),
                TextRange(after.start, after.end)
            )
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnDidChange(
                Callback2Param<NativeTextRange, NativeTextRange, Unit>(wrapper).getID())
        }
        this
    }
}
