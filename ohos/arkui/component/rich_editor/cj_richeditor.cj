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

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap
import std.collection.ArrayList
import std.convert.*

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DecorationStyleResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decorationType: TextDecorationType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor

    @!APILevel[
        21,
        stagemodelonly: true,
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorInsertValue {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var insertOffset: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var insertValue: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        insertOffset: Int32,
        insertValue: String
    ) {
        this.insertOffset = insertOffset
        this.insertValue = insertValue
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
 *
 * @relation declare interface RichEditorSpanPosition
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSpanPosition {

    /**
     * Define the index of span.
     *
     * @type { Int32 }
     * @relation spanIndex: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanIndex: Int32

    /**
     * The range of span.
     *
     * @type { (Int32, Int32) }
     * @relation spanRange: [
                    number,
                    number
                 ];
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanRange: (Int32, Int32)

    /**
     * RichEditorSpanPosition constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        spanIndex: Int32,
        spanRange: (Int32, Int32)
    ) {
        this.spanIndex = spanIndex
        this.spanRange = spanRange
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
 *
 * @relation declare interface RichEditorTextStyleResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextStyleResult {

    /**
     * font color.
     *
     * @type { String }
     * @relation fontColor: ResourceColor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: String

    /**
     * font size.
     *
     * @type { Float64 }
     * @relation fontSize: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: Float64

    /**
     * font style.
     *
     * @type { FontStyle }
     * @relation fontStyle: FontStyle
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontStyle: FontStyle

    /**
     * font weight.
     *
     * @type { Int32 }
     * @relation fontWeight: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: Int32

    /**
     * font family.
     *
     * @type { String }
     * @relation fontFamily: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFamily: String

    /**
     * font decoration.
     *
     * @type { DecorationStyleResult }
     * @relation decoration: DecorationStyleResult
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: DecorationStyleResult

    /**
     * RichEditorTextStyleResult constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 *
 * @relation declare interface RichEditorImageSpanStyleResult
 */
@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanStyleResult {

    /**
     * image size.
     *
     * @type { (Float64, Float64) }
     * @relation size: [
                    number,
                    number
                 ];
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Float64, Float64) = (0.0, 0.0)

    /**
     * image vertical align.
     *
     * @type { ImageSpanAlignment }
     * @relation verticalAlign: ImageSpanAlignment
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.Center

    /**
     * image fit.
     *
     * @type { ImageFit }
     * @relation objectFit: ImageFit
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ImageFit = ImageFit.Auto

    /**
     * RichEditor ImageSpan Layout Style.
     *
     * @type { RichEditorLayoutStyle }
     * @relation layoutStyle?: RichEditorLayoutStyle
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var layoutStyle: RichEditorLayoutStyle = RichEditorLayoutStyle()

    init(origin: NativeRichEditorImageSpanStyleResult) {
        this.size = (origin.size0, origin.size1)
        this.verticalAlign = ImageSpanAlignment.parseValue(origin.verticalAlign)
        this.objectFit = ImageFit.parseValue(origin.verticalAlign)
        this.layoutStyle = RichEditorLayoutStyle(origin.layoutStyle)
    }

    init(
        size: (Float64, Float64),
        verticalAlign: ImageSpanAlignment,
        objectFit: ImageFit,
        layoutStyle: RichEditorLayoutStyle
    ) {
        this.size = size
        this.verticalAlign = verticalAlign
        this.objectFit = objectFit
        this.layoutStyle = layoutStyle
    }

    init() {}
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
 *
 * @relation declare interface RichEditorTextSpanResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextSpanResult <: RichEditorSpanResult {

    /**
     * The position of the text span.
     *
     * @type { RichEditorSpanPosition }
     * @relation spanPosition: RichEditorSpanPosition
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition

    /**
     * The content of the text span.
     *
     * @type { String }
     * @relation value: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String

    /**
     * text style.
     *
     * @type { RichEditorTextStyleResult }
     * @relation textStyle?: RichEditorTextStyle
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: RichEditorTextStyleResult

    /**
     * get offset in span.
     *
     * @type { (Int32, Int32) }
     * @relation offsetInSpan: [
                    number,
                    number
                 ]
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32)

    /**
     * RichEditorTextSpanResult constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 *
 * @relation declare interface RichEditorImageSpanResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanResult <: RichEditorSpanResult {

    /**
     * The position of the image span.
     *
     * @type { RichEditorSpanPosition }
     * @relation spanPosition: RichEditorSpanPosition
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition = RichEditorSpanPosition(0, (0, 0))

    /**
     * The pixel map of the image span.
     *
     * @type { Option<PixelMap> }
     * @relation valuePixelMap?: PixelMap
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valuePixelMap: Option<PixelMap> = None

    /**
     * The resource string of the image span.
     *
     * @type { String }
     * @relation valueResourceStr?: ResourceStr
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valueResourceStr: String = ""

    /**
     * image attribute.
     *
     * @type { RichEditorImageSpanStyleResult }
     * @relation imageStyle: RichEditorImageSpanStyleResult
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageStyle: RichEditorImageSpanStyleResult = RichEditorImageSpanStyleResult()

    /**
     * get offset in span.
     *
     * @type { (Int32, Int32) }
     * @relation offsetInSpan: [
                    number,
                    number
                 ]
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32) = (0, 0)

    /**
     * RichEditorImageSpanResult constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        spanPosition: RichEditorSpanPosition,
        valuePixelMap: Option<PixelMap>,
        valueResourceStr: String,
        imageStyle: RichEditorImageSpanStyleResult,
        offsetInSpan: (Int32, Int32)
    ) {
        this.spanPosition = spanPosition
        this.valuePixelMap = valuePixelMap
        this.valueResourceStr = valueResourceStr
        this.imageStyle = imageStyle
        this.offsetInSpan = offsetInSpan
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
        spanPosition,
        valuePixelMap,
        valueResourceStr,
        imageStyle,
        (value.offsetInSpanStart, value.offsetInSpanEnd)
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

@!APILevel[
    21,
    stagemodelonly: true,
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
 *
 * @relation declare interface RichEditorSelection
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSelection {

    /**
     * The location info.
     *
     * @type { (Int32, Int32) }
     * @relation selection: [
                    number,
                    number
                 ]
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selection: (Int32, Int32)

    /**
     * The selected text content.
     *
     * @type { ArrayList<RichEditorSpanResult> }
     * @relation spans: Array<RichEditorTextSpanResult | RichEditorImageSpanResult>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spans: ArrayList<RichEditorSpanResult>

    /**
     * RichEditorSelection constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selection: (Int32, Int32), spans: ArrayList<RichEditorSpanResult>) {
        this.selection = selection
        this.spans = spans
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
 *
 * @relation declare interface RichEditorDeleteValue
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorDeleteValue {

    /**
     * The offset of deleting.
     *
     * @type { Int32 }
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Int32

    /**
     * The deleted direction.
     *
     * @type { RichEditorDeleteDirection }
     * @relation direction: RichEditorDeleteDirection
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: RichEditorDeleteDirection

    /**
     * The deleted text length.
     *
     * @type { Int32 }
     * @relation length: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var length: Int32

    /**
     * The deleted span object.
     *
     * @type { ArrayList<RichEditorSpanResult> }
     * @relation richEditorDeleteSpans: Array<RichEditorTextSpanResult | RichEditorImageSpanResult>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>

    /**
     * RichEditorDeleteValue constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 *
 * @relation declare interface TextRange
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextRange {

    /**
     * Start offset.
     *
     * @type { Int32 }
     * @relation start?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: Int32

    /**
     * End offset.
     *
     * @type { Int32 }
     * @relation end?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Int32

    /**
     * TextRange constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start: Int32, end: Int32) {
        this.start = start
        this.end = end
    }
}

/**
 * Defines the paste event.
 *
 * @relation declare interface PasteEvent
 */
@!APILevel[
    21,
    stagemodelonly: true,
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
     *
     * @relation preventDefault?: Callback<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preventDefault(): Unit {
        unsafe { FfiOHOSAceFrameworkRichEditorPreventDefault(this.getID()) }
    }
}

public type PasteEventCallback = (PasteEvent) -> Unit

public type OnDidChangeCallback = (rangeBefore: TextRange, rangeAfter: TextRange) -> Unit

/**
 * Defines RichEditor Component.
 *
 * @relation declare const RichEditor: RichEditorInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditor <: ViewBase {

    /**
     * Called when create RichEditor.
     *
     * @param { RichEditorController } controller
     * @returns { This }
     * @relation (value: RichEditorOptions): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller: RichEditorController) {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCreateWithController(controller.getID())
        }
    }

    /**
     * Define custom keyboard.
     *
     * @param { CustomBuilder } value
     * @returns { This }
     * @relation customKeyboard(value: CustomBuilder, options?: KeyboardOptions): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(value!: CustomBuilder): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCustomKeyboard(Callback0Param<Unit>(value).getID())
        }
        this
    }

    /**
     * Bind to the selection menu.
     *
     * @param { RichEditorSpanType } spantype
     * @param { CustomBuilder } content
     * @param { ResponseType } responseType
     * @param { SelectionMenuOptions } options
     * @returns { This }
     * @relation bindSelectionMenu(spanType: RichEditorSpanType, content: CustomBuilder, responseType: ResponseType | RichEditorResponseType, options?: SelectionMenuOptions): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSelectionMenu(
        spantype!: RichEditorSpanType = RichEditorSpanType.Text,
        content!: CustomBuilder,
        responseType!: ResponseType = ResponseType.LongPress,
        options!: SelectionMenuOptions
    ): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorBindSelectionMenu(
                spantype.getValue(),
                Callback0Param<Unit>(content).getID(),
                responseType.getValue(),
                Callback0Param<Unit>(options.onAppear).getID(),
                Callback0Param<Unit>(options.onDisappear).getID()
            )
        }
        this
    }

    /**
     * Allow replication.
     *
     * @param { CopyOptions } value
     * @returns { This }
     * @relation copyOptions(value: CopyOptions): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOptions(value: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCopyOptions(value.getValue())
        }
        this
    }

    /**
     * Called when on ready.
     *
     * @param { VoidCallback } callback
     * @returns { This }
     * @relation onReady(callback: Callback<void>): RichEditorAttribute
     */
    @!APILevel[
        21,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReady(callback: VoidCallback): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnReady(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /**
     * Get text value information when about to input.
     *
     * @param { Callback<RichEditorInsertValue, Bool> } callback
     * @returns { This }
     * @relation aboutToIMEInput(callback: Callback<RichEditorInsertValue, boolean>): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToIMEInput(callback: Callback<RichEditorInsertValue, Bool>): This {
        let wrapper = {
            value: NativeRichEditorInsertValue => callback(RichEditorInsertValue(value))
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
     * @param { Callback<RichEditorTextSpanResult, Unit> } callback
     * @returns { RichEditor }
     * @relation onIMEInputComplete(callback: Callback<RichEditorTextSpanResult>): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onIMEInputComplete(callback: Callback<RichEditorTextSpanResult, Unit>): RichEditor {
        let wrapper = {
            value: NativeRichEditorTextSpanResult => callback(parseNativeRichEditorTextSpanResult(value))
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
     * @param { VoidCallback } callback
     * @returns { This }
     * @relation onDeleteComplete(callback: Callback<void>): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDeleteComplete(callback: VoidCallback): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnDeleteComplete(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    /**
     * Get text value information when about to delete.
     *
     * @param { Callback<RichEditorDeleteValue, Bool> } callback
     * @returns { This }
     * @relation aboutToDelete(callback: Callback<RichEditorDeleteValue, boolean>): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToDelete(callback: Callback<RichEditorDeleteValue, Bool>): This {
        let wrapper = {
            value: NativeRichEditorDeleteValue => return callback(parseNativeRichEditorDeleteValue(value))
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
     * @param { Callback<RichEditorSelection, Unit> } callback
     * @returns { This }
     * @relation onSelect(callback: Callback<RichEditorSelection>): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: Callback<RichEditorSelection, Unit>): This {
        let wrapper = {
            value: NativeRichEditorSelection => callback(parseNativeRichEditorSelection(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnSelect12(Callback1Param<NativeRichEditorSelection, Unit>(wrapper).getID())
        }
        this
    }

    /**
     * Defines onPaste callback.
     *
     * @param { PasteEventCallback } callback
     * @returns { This }
     * @relation onPaste(callback: PasteEventCallback): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: PasteEventCallback): This {
        let wrapper = {
            value: Int64 => callback(PasteEvent(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnPaste(Callback1Param<Int64, Unit>(wrapper).getID())
        }
        this
    }

    /**
     * Called after text changed.
     *
     * @param { OnDidChangeCallback } callback
     * @returns { This }
     * @relation onDidChange(callback: OnDidChangeCallback): RichEditorAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidChange(callback: OnDidChangeCallback): This {
        let wrapper = {
            before: NativeTextRange, after: NativeTextRange => callback(
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
