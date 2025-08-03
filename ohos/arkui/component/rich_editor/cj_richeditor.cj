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

protected package ohos.arkui.component.rich_editor

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.labels.APILevel
import ohos.image.PixelMap
import std.collection.ArrayList

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

@C
struct NativeTextRange {
    NativeTextRange(
        let start: Int32,
        let end: Int32
    ) {}
}

@C
struct NativeTextDecorationResult {
    NativeTextDecorationResult(
        let `type`: Int32,
        let color: CString
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextDecorationResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var `type`: TextDecorationType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        `type`: TextDecorationType,
        color: String
    ) {
        this.`type` = `type`
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSpanPosition {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanIndex: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanRange: (Int32, Int32)

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

public class ShadowOptionsResult {
    ShadowOptionsResult(
        public let radius: Float64,
        public let color: String,
        public let offsetX: Float64,
        public let offsetY: Float64
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
        let decoration: NativeTextDecorationResult,
        let textShadow: CPointer<NativeShadowOptionsResult>,
        let free_: CFunc<(Int64, CPointer<NativeShadowOptionsResult>) -> Unit>,
        let textShadowSize: Int64,
        let lineHeight: Float64,
        let letterSpacing: Float64,
        let fontFeature: ExternalString
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextStyleResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontStyle: FontStyle
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFamily: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: TextDecorationResult

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
        decoration: TextDecorationResult
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
        this.decoration = TextDecorationResult(
            TextDecorationType.parseValue(origin.decoration.`type`),
            origin.decoration.color.toString()
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorLayoutStyleResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderRadius: String = ""

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var margin: String = ""

    init(origin: NativeRichEditorLayoutStyleResult) {
        borderRadius = origin.borderRadius.toString()
        margin = origin.margin.toString()
        unsafe {
            origin.borderRadius.free()
            origin.margin.free()
        }
    }

    init() {}
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

@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanStyleResult {
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Float64, Float64) = (0.0, 0.0)

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.CENTER

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ImageFit = ImageFit.Auto

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var layoutStyle: RichEditorLayoutStyleResult = RichEditorLayoutStyleResult()

    init(origin: NativeRichEditorImageSpanStyleResult) {
        this.size = (origin.size0, origin.size1)
        this.verticalAlign = ImageSpanAlignment.parseValue(origin.verticalAlign)
        this.objectFit = ImageFit.parseValue(origin.verticalAlign)
        this.layoutStyle = RichEditorLayoutStyleResult(origin.layoutStyle)
    }

    init(
        size: (Float64, Float64),
        verticalAlign: ImageSpanAlignment,
        objectFit: ImageFit,
        layoutStyle: RichEditorLayoutStyleResult
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextSpanResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: RichEditorTextStyleResult
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32)

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Float64, Float64) = (0.0, 0.0)
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.TOP
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ImageFit = ImageFit.Auto

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition = RichEditorSpanPosition(0, (0, 0))
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valuePixelMap: Option<PixelMap> = None
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valueResourceStr: String = ""
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageStyle: RichEditorImageSpanStyleResult = RichEditorImageSpanStyleResult()
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32) = (0, 0)

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        size: (Float64, Float64),
        verticalAlign: ImageSpanAlignment,
        objectFit: ImageFit
    ) {
        this.size = size
        this.verticalAlign = verticalAlign
        this.objectFit = objectFit
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        size: (Float64, Float64),
        verticalAlign: ImageSpanAlignment,
        objectFit: ImageFit,
        spanPosition: RichEditorSpanPosition,
        valuePixelMap: Option<PixelMap>,
        valueResourceStr: String,
        imageStyle: RichEditorImageSpanStyleResult,
        offsetInSpan: (Int32, Int32)
    ) {
        this.size = size
        this.verticalAlign = verticalAlign
        this.objectFit = objectFit
        this.spanPosition = spanPosition
        this.valuePixelMap = valuePixelMap
        this.valueResourceStr = valueResourceStr
        this.imageStyle = imageStyle
        this.offsetInSpan = offsetInSpan
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}
}

@C
struct NativeDecorationStyleInterface {
    NativeDecorationStyleInterface(
        let `type`: Int32,
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
        imageStyle.size,
        imageStyle.verticalAlign,
        imageStyle.objectFit
    )
    res.spanPosition = spanPosition
    res.valuePixelMap = valuePixelMap
    res.valueResourceStr = valueResourceStr
    res.imageStyle = imageStyle
    res.offsetInSpan = (value.offsetInSpanStart, value.offsetInSpanEnd)
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
public class RichEditorSpanResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanType: SpanType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textResult: Option<RichEditorTextSpanResult>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageResult: Option<RichEditorImageSpanResult>

    init(native: NativeRichEditorSpanResult) {
        if (native.isText) {
            this.textResult = parseNativeRichEditorTextSpanResult(native.textResult)
            this.imageResult = Option.None
            this.spanType = SpanType.TEXT
        } else {
            this.imageResult = parseNativeRichEditorImageSpanResult(native.imageResult)
            this.textResult = Option.None
            this.spanType = SpanType.IMAGE
        }
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSelection {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selection: (Int32, Int32)

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spans: ArrayList<RichEditorSpanResult>

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorDeleteValue {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: RichEditorDeleteDirection

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var length: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>

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
        spans.add(RichEditorSpanResult(nativeSpanInfo))
    }
    return RichEditorSelection((value.selectionStart, value.selectionEnd), spans)
}

func parseNativeRichEditorDeleteValue(value: NativeRichEditorDeleteValue): RichEditorDeleteValue {
    let spans = ArrayList<RichEditorSpanResult>()
    for (i in 0..value.spanSize) {
        let nativeSpanInfo = unsafe { value.richEditorDeleteSpans.read(Int64(i)) }
        spans.add(RichEditorSpanResult(nativeSpanInfo))
    }
    return RichEditorDeleteValue(
        value.offset,
        RichEditorDeleteDirection.parseValue(value.direction),
        value.length,
        spans
    )
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextRange {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Int32

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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preventDefault(): Unit {
        unsafe { FfiOHOSAceFrameworkRichEditorPreventDefault(this.getID()) }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditor <: ViewBase {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(builder!: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCustomKeyboard(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSelectionMenu(
        spantype!: RichEditorSpanType = RichEditorSpanType.TEXT,
        content!: () -> Unit,
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOptions(copyOptions: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCopyOptions(copyOptions.getValue())
        }
        this
    }

    @!APILevel[
        21,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReady(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnReady(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToIMEInput(callback: (RichEditorInsertValue) -> Bool): This {
        let wrapper = {
            value: NativeRichEditorInsertValue => callback(RichEditorInsertValue(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorAboutToIMEInput12(
                Callback1Param<NativeRichEditorInsertValue, Bool>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onIMEInputComplete(callback: (RichEditorTextSpanResult) -> Unit): RichEditor {
        let wrapper = {
            value: NativeRichEditorTextSpanResult => callback(parseNativeRichEditorTextSpanResult(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnIMEInputComplete12(
                Callback1Param<NativeRichEditorTextSpanResult, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDeleteComplete(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnDeleteComplete(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToDelete(callback: (RichEditorDeleteValue) -> Bool): This {
        let wrapper = {
            value: NativeRichEditorDeleteValue => return callback(parseNativeRichEditorDeleteValue(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorAboutToDelete12(
                Callback1Param<NativeRichEditorDeleteValue, Bool>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: (RichEditorSelection) -> Unit): This {
        let wrapper = {
            value: NativeRichEditorSelection => callback(parseNativeRichEditorSelection(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnSelect12(Callback1Param<NativeRichEditorSelection, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: (PasteEvent) -> Unit): This {
        let wrapper = {
            value: Int64 => callback(PasteEvent(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnPaste(Callback1Param<Int64, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidChange(callback: (TextRange, TextRange) -> Unit): This {
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
