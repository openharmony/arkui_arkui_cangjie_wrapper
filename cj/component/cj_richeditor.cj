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

import ohos.image.PixelMap

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
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextDecorationResult {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TextDecorationResult(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var `type`: TextDecorationType,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var color: String
    ) {}
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorInsertValue {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var insertOffset: Int32
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var insertValue: String
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var previewText: String = ""

    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        insertOffset: Int32,
        insertValue: String
    ) {
        this.insertOffset = insertOffset
        this.insertValue = insertValue
    }

    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        insertOffset: Int32,
        insertValue: String,
        previewText: String
    ) {
        this.insertOffset = insertOffset
        this.insertValue = insertValue
        this.previewText = previewText
    }

    init(origin: NativeRichEditorInsertValue) {
        this.insertOffset = origin.insertOffset
        this.insertValue = origin.insertValue.toString()
        this.previewText = origin.previewText.toString()
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSpanPosition {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public RichEditorSpanPosition(
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var spanIndex: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var spanRange: (Int32, Int32)
    ) {}
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextStyleResult {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: String
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: Float64
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontStyle: FontStyle
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: Int32
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFamily: String
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: TextDecorationResult
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textShadow: Array<ShadowOptionsResult> = []
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lineHeight: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var letterSpacing: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontFeature: String = ""

    @!APILevel[
        12,
        atomicservice: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        fontColor: String,
        fontSize: Float64,
        fontStyle: FontStyle,
        fontWeight: Int32,
        fontFamily: String,
        decoration: TextDecorationResult,
        textShadow: Array<ShadowOptionsResult>,
        lineHeight: Float64,
        letterSpacing: Float64,
        fontFeature: String
    ) {
        this.fontColor = fontColor
        this.fontSize = fontSize
        this.fontStyle = fontStyle
        this.fontWeight = fontWeight
        this.fontFamily = fontFamily
        this.decoration = decoration
        this.textShadow = textShadow
        this.lineHeight = lineHeight
        this.letterSpacing = letterSpacing
        this.fontFeature = fontFeature
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
        let textShadowArrayList = ArrayList<ShadowOptionsResult>([])
        if (origin.textShadowSize > 0) {
            for (i in 0..origin.textShadowSize) {
                let nativeShadowOptions = unsafe { origin.textShadow.read(Int64(i)) }
                textShadowArrayList.add(
                    ShadowOptionsResult(
                        nativeShadowOptions.radius,
                        nativeShadowOptions.color.toString(),
                        nativeShadowOptions.offsetX,
                        nativeShadowOptions.offsetY
                    )
                )
            }
        }
        this.textShadow = textShadowArrayList.toArray()
        this.lineHeight = origin.lineHeight
        this.letterSpacing = origin.letterSpacing
        this.fontFeature = origin.fontFeature.toString()
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
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorLayoutStyleResult {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderRadius: String = ""

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanStyleResult {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Float64, Float64) = (0.0, 0.0)

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.CENTER

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ImageFit = ImageFit.Auto

    @!APILevel[
        19,
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorTextSpanResult {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: RichEditorTextStyleResult
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32)
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var symbolSpanStyle: RichEditorSymbolSpanStyleResult = RichEditorSymbolSpanStyleResult()
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var paragraphStyle: RichEditorParagraphStyleResult = RichEditorParagraphStyleResult()
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var previewText: String = ""

    @!APILevel[
        12,
        atomicservice: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        spanPosition: RichEditorSpanPosition,
        value: String,
        textStyle: RichEditorTextStyleResult,
        offsetInSpan: (Int32, Int32),
        symbolSpanStyle: RichEditorSymbolSpanStyleResult,
        paragraphStyle: RichEditorParagraphStyleResult,
        previewText: String
    ) {
        this.spanPosition = spanPosition
        this.value = value
        this.textStyle = textStyle
        this.offsetInSpan = offsetInSpan
        this.symbolSpanStyle = symbolSpanStyle
        this.paragraphStyle = paragraphStyle
        this.previewText = previewText
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorImageSpanResult {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: (Float64, Float64) = (0.0, 0.0)
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var verticalAlign: ImageSpanAlignment = ImageSpanAlignment.TOP
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var objectFit: ImageFit = ImageFit.Auto
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanPosition: RichEditorSpanPosition = RichEditorSpanPosition(0, (0, 0))
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valuePixelMap: Option<PixelMap> = None
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valueResourceStr: String = ""
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var imageStyle: RichEditorImageSpanStyleResult = RichEditorImageSpanStyleResult()
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetInSpan: (Int32, Int32) = (0, 0)

    @!APILevel[
        12,
        atomicservice: true,
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
        19,
        atomicservice: true,
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
        19,
        atomicservice: true,
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

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DecorationStyleInterface {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var `type`: TextDecorationType = TextDecorationType.None
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor = Color.BLACK
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: TextDecorationStyle = TextDecorationStyle.SOLID

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(`type`!: TextDecorationType, color!: ?ResourceColor = None, style!: ?TextDecorationStyle = None) {
        this.`type` = `type`
        if (let Some(v) <- color) {
            this.color = v
        }
        if (let Some(v) <- style) {
            this.style = v
        }
    }

    func parseToNative(): NativeDecorationStyleInterface {
        var nativeType: Int32 = `type`.getValue()
        var nativeColor: UInt32 = transAppResourceToResourceColor(color)
        var nativeStyle: Int32 = style.getValue()
        return NativeDecorationStyleInterface(nativeType, nativeColor, nativeStyle, true, true)
    }
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

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextDataDetectorConfig {
    private var nativeTypes: ?FFIVectorString = None
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var types: Array<TextDataDetectorType>
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDetectResultUpdate: ?(String) -> Unit = None
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor = None
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var decoration: ?DecorationStyleInterface = None

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        types: Array<TextDataDetectorType>,
        onDetectResultUpdate!: ?(String) -> Unit = None,
        color!: ?ResourceColor = None,
        decoration!: ?DecorationStyleInterface = None
    ) {
        this.types = types
        this.onDetectResultUpdate = onDetectResultUpdate
        this.color = color
        this.decoration = decoration
    }

    func parseToNative(): NativeTextDataDetectorConfig {
        var hasOnDetectResultUpdate: Bool = false
        var hasDecoration: Bool = false
        var hasColor: Bool = false
        var nativeOnDetectResultUpdate: Int64 = 0
        var nativeColor: UInt32 = 0
        var nativeInterface: NativeDecorationStyleInterface = NativeDecorationStyleInterface(0, 0, 0, false, false)

        if (let Some(v) <- onDetectResultUpdate) {
            hasOnDetectResultUpdate = true
            let wrapper = {
                textType: CString => v(textType.toString())
            }
            let lambdaData = Callback1Param<CString, Unit>(wrapper)
            nativeOnDetectResultUpdate = lambdaData.getID()
        }
        if (let Some(v) <- color) {
            hasColor = true
            nativeColor = transAppResourceToResourceColor(v)
        }
        if (let Some(v) <- decoration) {
            hasDecoration = true
            nativeInterface = v.parseToNative()
        }

        let vecTextDataDetectorType = FFIVectorString(types.size)
        for (i in 0..types.size) {
            vecTextDataDetectorType.setElement(i, types[i].getValue())
        }
        this.nativeTypes = vecTextDataDetectorType

        return NativeTextDataDetectorConfig(vecTextDataDetectorType.getNativeHandle(), nativeOnDetectResultUpdate,
            nativeColor, nativeInterface, hasColor, hasOnDetectResultUpdate, hasDecoration)
    }

    func free(): Unit {
        if (let Some(v) <- nativeTypes) {
            v.free()
        }
        nativeTypes = Option.None
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class EditMenuOptions {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onCreateMenu: (Array<TextMenuItem>) -> Array<TextMenuItem>
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onMenuClick: (TextMenuItem, TextRange) -> Bool
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        onCreateMenu: (Array<TextMenuItem>) -> Array<TextMenuItem>,
        onMenuClick: (TextMenuItem, TextRange) -> Bool
    ) {
        this.onCreateMenu = onCreateMenu
        this.onMenuClick = onMenuClick
    }
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

extend Fonts {
    func parseToNative(): NativeFont {
        var nativeFamily: Option<CString> = Option.None
        var nativeWeight: Option<CString> = Option.None
        try {
            unsafe {
                nativeWeight = LibC.mallocCString(weight.getValue())
                nativeFamily = LibC.mallocCString(family)
            }
        } catch (e: Exception) {
            nativeWeight?.free()
            nativeFamily?.free()
            throw BusinessException(MEMORY_OP_ERR, "Memory operation failed!")
        }
        return NativeFont(size.value, size.unitType.getValue(), nativeWeight.getOrThrow(), nativeFamily.getOrThrow(),
            style.getValue())
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PlaceholderStyle {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var font: ?Fonts = None
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontColor: ?ResourceColor = None

    var nativeFont: NativeFont

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(font!: ?Fonts = None, fontColor!: ?ResourceColor = None) {
        this.font = font
        this.fontColor = fontColor
        if (let Some(v) <- font) {
            this.nativeFont = v.parseToNative()
        } else {
            this.nativeFont = Fonts().parseToNative()
        }
    }

    func parseToNative(): NativePlaceholderStyle {
        var hasFont = false
        var hasFontColor = false
        var nativeFontColor: UInt32 = 0

        if (let Some(v) <- font) {
            hasFont = true
        }
        if (let Some(v) <- fontColor) {
            hasFontColor = true
            nativeFontColor = transAppResourceToResourceColor(v)
        }
        return NativePlaceholderStyle(hasFont, hasFontColor, nativeFont, nativeFontColor)
    }

    func free(): Unit {
        nativeFont.free()
    }
}

/**
 * Provides an interface for changes in the text.
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorChangeValue {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rangeBefore: TextRange
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var replacedSpans: Array<RichEditorSpanResult>
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var replacedImageSpans: Array<RichEditorImageSpanResult>
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var replacedSymbolSpans: Array<RichEditorTextSpanResult>

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        rangeBefore: TextRange,
        replacedSpans: Array<RichEditorSpanResult>,
        replacedImageSpans: Array<RichEditorImageSpanResult>,
        replacedSymbolSpans: Array<RichEditorTextSpanResult>
    ) {
        this.rangeBefore = rangeBefore
        this.replacedSpans = replacedSpans
        this.replacedImageSpans = replacedImageSpans
        this.replacedSymbolSpans = replacedSymbolSpans
    }
}

func parseNativeRichEditorChangeValue(nativeValue: NativeRichEditorChangeValue): RichEditorChangeValue {
    var replacedSpans: ArrayList<RichEditorSpanResult> = ArrayList<RichEditorSpanResult>([])
    for (i in 0..nativeValue.replacedSpansSize) {
        if (!nativeValue.replacedSpans.isNull()) {
            let nativeSpansSize = unsafe { nativeValue.replacedSpans.read(Int64(i)) }
            replacedSpans.add(RichEditorSpanResult(nativeSpansSize))
        }
    }

    var replacedImageSpans: ArrayList<RichEditorImageSpanResult> = ArrayList<RichEditorImageSpanResult>([])
    for (i in 0..nativeValue.replacedSpansSize) {
        if (!nativeValue.replacedImageSpans.isNull()) {
            let nativeImageSpanResult = unsafe { nativeValue.replacedImageSpans.read(Int64(i)) }
            replacedImageSpans.add(parseNativeRichEditorImageSpanResult(nativeImageSpanResult))
        }
    }

    var replacedSymbolSpans: ArrayList<RichEditorTextSpanResult> = ArrayList<RichEditorTextSpanResult>([])
    for (i in 0..nativeValue.replacedSpansSize) {
        if (!nativeValue.replacedSymbolSpans.isNull()) {
            let nativeSymbolSpans = unsafe { nativeValue.replacedSymbolSpans.read(Int64(i)) }
            replacedSymbolSpans.add(parseNativeRichEditorTextSpanResult(nativeSymbolSpans))
        }
    }

    return RichEditorChangeValue(
        TextRange(nativeValue.rangeBefore.start, nativeValue.rangeBefore.end),
        replacedSpans.toArray(),
        replacedImageSpans.toArray(),
        replacedSymbolSpans.toArray()
    )
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
    let symbolSpanStyle = RichEditorSymbolSpanStyleResult(value.symbolSpanStyle)
    let paragraphStyle = RichEditorParagraphStyleResult(value.paragraphStyle)
    let previewText = value.previewText.toString()
    unsafe {
        value.previewText.free()
    }

    let result = RichEditorTextSpanResult(
        spanPosition,
        value.value.toString(),
        textStyle,
        (value.offsetInSpanStart, value.offsetInSpanEnd)
    )
    result.symbolSpanStyle = symbolSpanStyle
    result.paragraphStyle = paragraphStyle
    result.previewText = previewText
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSpanResult {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var spanType: SpanType
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textResult: Option<RichEditorTextSpanResult>
    @!APILevel[
        12,
        atomicservice: true,
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

/**
 * Defines range of RichEditor.
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class RichEditorRange {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: Int32
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Int32
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start: Int32, end: Int32) {
        this.start = start
        this.end = end
    }

    init(origin: NativeRichEditorRange) {
        this.start = origin.start
        this.end = origin.end
    }
}

@!APILevel[
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorSelection {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public RichEditorSelection(
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var selection: (Int32, Int32),
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var spans: ArrayList<RichEditorSpanResult>
    ) {}
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
    12,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditorDeleteValue {
    @!APILevel[
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public RichEditorDeleteValue(
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var offset: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction: RichEditorDeleteDirection,
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var length: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var richEditorDeleteSpans: ArrayList<RichEditorSpanResult>
    ) {}
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
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextRange {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TextRange(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var start: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var end: Int32
    ) {}
}

@!APILevel[
    12,
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
        12,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preventDefault(): Unit {
        unsafe { FfiOHOSAceFrameworkRichEditorPreventDefault(this.getID()) }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CopyEvent <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preventDefault(): Unit {
        unsafe { FfiOHOSAceFrameworkRichEditorPreventDefault(this.getID()) }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CutEvent <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preventDefault(): Unit {
        unsafe { FfiOHOSAceFrameworkRichEditorPreventDefault(this.getID()) }
    }
}

@!APILevel[
    12,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RichEditor <: ViewBase {
    @!APILevel[
        12,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller: RichEditorController) {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCreateWithController(controller.getID())
        }
    }

    @!APILevel[
        12,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(builder!: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCustomKeyboard(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    @!APILevel[
        12,
        crossplatform: true,
        atomicservice: true,
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
        12,
        crossplatform: true,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOptions(copyOptions: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCopyOptions(copyOptions.getValue())
        }
        this
    }

    @!APILevel[
        12,
        crossplatform: true,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReady(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnReady(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDeleteComplete(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnDeleteComplete(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
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

    /**
     * Set richEditor placeholder.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholder(value: AppResource, style!: PlaceholderStyle = PlaceholderStyle()): This {
        unsafe {
            try (valueCString = LibC.mallocCString(getResourceString(value)).asResource()) {
                let nativeStyle = style.parseToNative()
                FfiOHOSAceFrameworkRichEditorPlaceholder(valueCString.value, nativeStyle)
                style.free()
            }
        }
        this
    }

    /**
     * Set richEditor placeholder.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholder(value: String, style!: PlaceholderStyle = PlaceholderStyle()): This {
        unsafe {
            try (valueCString = LibC.mallocCString(value).asResource()) {
                let nativeStyle = style.parseToNative()
                FfiOHOSAceFrameworkRichEditorPlaceholder(valueCString.value, nativeStyle)
                style.free()
            }
        }
        this
    }

    /**
     * Called when selection range or caret position is changed.
     * @param The triggered function when change selection range or caret position.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelectionChange(callback: (RichEditorRange) -> Unit): This {
        let wrapper = {
            value: NativeRichEditorRange => callback(RichEditorRange(value.start, value.end))
        }
        let lambdaOnSelectionChange = Callback1Param<NativeRichEditorRange, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnSelectionChange(lambdaOnSelectionChange.getID())
        }
        this
    }

    /**
     * Enable preview text.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enablePreviewText(enable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorEnablePreviewText(enable)
        }
        this
    }

    /**
     * Called when submitted.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: (EnterKeyType, SubmitEvent) -> Unit): This {
        let wrapper = {
            keyType: Int32, event: CJSubmitEvent =>
            let enterKeyType = match (keyType) {
                case 2 => EnterKeyType.Go
                case 3 => EnterKeyType.EntrySearch
                case 4 => EnterKeyType.Send
                case 5 => EnterKeyType.Next
                case 6 => EnterKeyType.Done
                case 7 => EnterKeyType.PREVIOUS
                case 8 => EnterKeyType.NEW_LINE
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
            callback(enterKeyType, event.toSubmitEvent())
        }

        let lambda = Callback2Param<Int32, CJSubmitEvent, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnSubmit(lambda.getID())
        }
        this
    }

    /**
     * Set enter key type of soft keyboard.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enterKeyType(value: EnterKeyType): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorEnterKeyType(value.getValue())
        }
        this
    }

    /**
     * Called before text changed.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillChange(callback: (RichEditorChangeValue) -> Bool): This {
        let wrapper = {
            nativeChangeValue: NativeRichEditorChangeValue =>
            let changeValue: RichEditorChangeValue = parseNativeRichEditorChangeValue(nativeChangeValue)
            return callback(changeValue)
        }
        let lambdaOnWillChange = Callback1Param<NativeRichEditorChangeValue, Bool>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnWillChange(lambdaOnWillChange.getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorCaretColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditingChange(callback: (Bool) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnEditingChange(Callback1Param<Bool, Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: (CopyEvent) -> Unit): This {
        let wrapper = {
            value: Int64 => callback(CopyEvent(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnCopy(Callback1Param<Int64, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: (CutEvent) -> Unit): This {
        let wrapper = {
            value: Int64 => callback(CutEvent(value))
        }
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnCut(Callback1Param<Int64, Unit>(wrapper).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableKeyboardOnFocus(enable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorEnableKeyboardOnFocus(enable)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidIMEInput(callback: (TextRange) -> Unit): This {
        let wrapper = {
            value: NativeTextRange => callback(TextRange(value.start, value.end))
        }
        let lambdaOnDidIMEInput = Callback1Param<NativeTextRange, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRichEditorOnDidIMEInput(lambdaOnDidIMEInput.getID())
        }
        this
    }

    /**
     * Set background color of selected text in rich editor.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedBackgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkRichEditorSelectedBackgroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    /**
     * Enable data detector.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableDataDetector(enable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextEnableDataDetector(enable)
        }
        this
    }

    /**
     * Data detector with config.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dataDetectorConfig(config: TextDataDetectorConfig): This {
        unsafe {
            let nativeConfig = config.parseToNative()
            FfiOHOSAceFrameworkRichEditorDataDetectorConfig(nativeConfig)
            config.free()
        }
        this
    }

    /**
     * Set the custom text menu.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func editMenuOptions(options: EditMenuOptions): This {
        let wrapperOnCreateMenu = {
            value: VectorTextMenuItemHandle =>
            let handle = FFIVectorFfiTextMenuItem(value)
            let arr: Array<TextMenuItem> = Array<TextMenuItem>(handle.getSize()) {
                i => parseTextMenuItem(handle.getElement(i))
            }
            let arrFfi = options.onCreateMenu(arr)
            let vecFfi = FFIVectorFfiTextMenuItem(arrFfi.size)
            for (i in 0..arrFfi.size) {
                vecFfi.setElement(i, arrFfi[i].parseToNative())
            }
            handle.free()
            return vecFfi.getNativeHandle()
        }
        let lambdaOnCreateMenu = Callback1Param<VectorTextMenuItemHandle, VectorTextMenuItemHandle>(wrapperOnCreateMenu)

        let wrapperOnMenuClick = {
            textMenuItemFfi: FfiTextMenuItem, start: Int32, end: Int32 => options.onMenuClick(
                parseTextMenuItem(textMenuItemFfi), TextRange(start, end))
        }
        let lambdaOnMenuClick = Callback3Param<FfiTextMenuItem, Int32, Int32, Bool>(wrapperOnMenuClick)

        unsafe {
            FfiOHOSAceFrameworkRichEditorEditMenuOptions(lambdaOnCreateMenu.getID(), lambdaOnMenuClick.getID())
        }
        this
    }
}
