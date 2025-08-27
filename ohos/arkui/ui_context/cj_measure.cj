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

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.arkui.component.common.*

@C
struct CJMeasureContextToC {
    CJMeasureContextToC(
        let textContent: CString,
        let fontWeight: CString,
        let fontFamily: CString,
        let constraintWidth: NativeOptionLength,
        let fontSize: NativeOptionLength,
        let lineHeight: NativeOptionLength,
        let baselineOffset: NativeOptionLength,
        let letterSpacing: NativeOptionLength,
        let textIndent: NativeOptionLength,
        let maxLines: UInt32,
        let textAlign: Int32,
        let fontStyle: Int32,
        let overflow: Int32,
        let textCase: Int32,
        let wordBreak: Int32
    ) {}
}

@C
struct SizeCType {
    var width: Float64
    var height: Float64
    init(width: Float64, height: Float64) {
        this.width = width
        this.height = height
    }
}

foreign {
    func FfiMeasureText(context: CJMeasureContextToC): Float64
    func FfiMeasureTextSize(context: CJMeasureContextToC): SizeCType
}

/**
 * Defines the options of MeasureText.
 *
 * @relation export interface MeasureOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MeasureOptions {
    var textContent: String
    var fontWeight: FontWeight
    var fontFamily: String
    let constraintWidth: ?Length
    let fontSize: ?Length
    let lineHeight: ?Length
    let baselineOffset: ?Length
    let letterSpacing: ?Length
    let textIndent: ?Length
    let maxLines: UInt32
    let textAlign: TextAlign
    let fontStyle: FontStyle
    let overflow: TextOverflow
    let textCase: TextCase
    let wordBreak: WordBreak

    /**
     * Create an object of MeasureOptions
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        textContent!: String,
        fontWeight!: FontWeight = FontWeight.Normal,
        fontFamily!: String = "HarmonyOS Sans",
        constraintWidth!: ?Length = None,
        fontSize!: ?Length = 16.fp,
        lineHeight!: ?Length = None,
        baselineOffset!: ?Length = 0.0.vp,
        letterSpacing!: ?Length = None,
        textIndent!: ?Length = None,
        maxLines!: UInt32 = 0,
        textAlign!: TextAlign = TextAlign.Start,
        fontStyle!: FontStyle = FontStyle.Normal,
        overflow!: TextOverflow = TextOverflow.Clip,
        textCase!: TextCase = TextCase.Normal,
        wordBreak!: WordBreak = WordBreak.BreakWord
    ) {
        this.textContent = textContent
        this.fontWeight = fontWeight
        this.fontFamily = fontFamily
        this.constraintWidth = constraintWidth
        this.fontSize = fontSize
        this.lineHeight = lineHeight
        this.baselineOffset = baselineOffset
        this.letterSpacing = letterSpacing
        this.textIndent = textIndent
        this.maxLines = maxLines
        this.textAlign = textAlign
        this.fontStyle = fontStyle
        this.overflow = overflow
        this.textCase = textCase
        this.wordBreak = wordBreak
    }
}

func parseCJMeasureContext(context: MeasureOptions): CJMeasureContextToC {
    let textContentC = unsafe { LibC.mallocCString(context.textContent) }
    let fontFamilyC = unsafe { LibC.mallocCString(context.fontFamily) }
    let fontWeightC = unsafe { LibC.mallocCString(context.fontWeight.getValue()) }
    let constraintWidth = match (context.constraintWidth) {
        case Some(value) => NativeOptionLength(true, NativeLength(value.value, value.unitType.getValue()))
        case None => NativeOptionLength(false, NativeLength(0.0, 0))
    }

    let fontSize = match (context.fontSize) {
        case Some(value) => NativeOptionLength(true, NativeLength(value.value, value.unitType.getValue()))
        case None => NativeOptionLength(false, NativeLength(0.0, 0))
    }

    let lineHeight = match (context.lineHeight) {
        case Some(value) => NativeOptionLength(true, NativeLength(value.value, value.unitType.getValue()))
        case None => NativeOptionLength(false, NativeLength(0.0, 0))
    }

    let baselineOffset = match (context.baselineOffset) {
        case Some(value) => NativeOptionLength(true, NativeLength(value.value, value.unitType.getValue()))
        case None => NativeOptionLength(false, NativeLength(0.0, 0))
    }

    let letterSpacing = match (context.letterSpacing) {
        case Some(value) => NativeOptionLength(true, NativeLength(value.value, value.unitType.getValue()))
        case None => NativeOptionLength(false, NativeLength(0.0, 0))
    }

    let textIndent = match (context.textIndent) {
        case Some(value) => NativeOptionLength(true, NativeLength(value.value, value.unitType.getValue()))
        case None => NativeOptionLength(false, NativeLength(0.0, 0))
    }
    return CJMeasureContextToC(
        textContentC,
        fontWeightC,
        fontFamilyC,
        constraintWidth,
        fontSize,
        lineHeight,
        baselineOffset,
        letterSpacing,
        textIndent,
        context.maxLines,
        context.textAlign.getValue(),
        context.fontStyle.getValue(),
        context.overflow.getValue(),
        context.textCase.getValue(),
        context.wordBreak.getValue()
    )
}

/**
 * Defines the size options.
 *
 * @relation declare interface SizeOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SizeOptions {
    /**
     * Defines the width.
     *
     * @type { Length }
     * @relation width?: Length;
     */
    public var width: Length = 0
    /**
     * Defines the height.
     *
     * @type { Length }
     * @relation height?: Length;
     */
    public var height: Length = 0
    /*
     * constructor
     */
    public init(width!: Length = 0, height!: Length = 0) {
        this.width = width
        this.height = height
    }
}

protected func measureText(options: MeasureOptions): Float64 {
    unsafe {
        let contextC = parseCJMeasureContext(options)
        let result = FfiMeasureText(contextC)
        LibC.free(contextC.textContent)
        LibC.free(contextC.fontWeight)
        LibC.free(contextC.fontFamily)
        result
    }
}

protected func measureTextSize(options: MeasureOptions): SizeOptions {
    unsafe {
        let contextC = parseCJMeasureContext(options)
        let result = FfiMeasureTextSize(contextC)
        LibC.free(contextC.textContent)
        LibC.free(contextC.fontWeight)
        LibC.free(contextC.fontFamily)
        SizeOptions(width: result.width, height: result.height)
    }
}