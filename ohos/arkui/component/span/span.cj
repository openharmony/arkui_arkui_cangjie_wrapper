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

package ohos.arkui.component.span

import ohos.arkui.component.common.{UINodeBase, FontStyle, FontWeight, TextDecorationType, ClickEvent, CallbackCJClickEvent, TextCase, parseCJClickEvent}
import ohos.arkui.component.native_struct.{VectorNativeTextShadow, CBorderRadiuses, CJClickEvent}
import ohos.arkui.component.util.{transAppResourceToLength, transAppResourceToResourceColor, transResourceStrToString, getLengthUnitOrFp}
import ohos.base.{ResourceStr, Length, ResourceColor, LengthProp, Color}
import ohos.labels.{APILevel}

type VectorNativeTextShadows = CPointer<Unit>

foreign {
    func FFICJCreateVectorNativeTextShadows(size: Int64): VectorNativeTextShadows
    func FFICJVectorNativeTextShadowsDelete(vec: VectorNativeTextShadows): Unit
}

foreign {
    func FfiOHOSAceFrameworkSpanCreate(content: CString): Unit
    func FfiOHOSAceFrameworkSpanSetOnClick(callback: Int64): Unit
    func FfiOHOSAceFrameworkSpanSetFontSize(fontSize: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetFontWeight(fontWeight: CString): Unit
    func FfiOHOSAceFrameworkSpanSetFontColor(textColor: UInt32): Unit
    func FfiOHOSAceFrameworkSpanSetFontStyle(fontStyle: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetFontFamily(fontFamily: CString): Unit
    func FfiOHOSAceFrameworkSpanSetLetterSpacing(space: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetTextCase(textCase: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetDecoration(typeValue: Int32, colorValue: UInt32): Unit
    func FfiOHOSAceFrameworkSpanSetLineHeight(lineHeight: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetBaselineOffset(baselineOffset: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetTextShadow(value: VectorNativeTextShadow): Unit
    func FfiOHOSAceFrameworkSpanSetTextBackgroundStyle(color: UInt32, radius: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkSpanSetTextBackgroundStyleBorder(color: UInt32, radius: CBorderRadiuses): Unit
    func FfiOHOSAceFrameworkSpanSetFont(fontFamily: CString, fontSize: Float64, unit: Int32, fontWeight: CString, fontStyle: Int32): Unit
    func FfiOHOSAceFrameworkSpanResetFontSize(): Unit
    func FfiOHOSAceFrameworkSpanResetFontColor(): Unit
}

/**
 * Defines the base class of Span.
 * Contains common methods and properties for span components.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class BaseSpan <: UINodeBase {
}

/**
 * Defines Span Component.
 * A component for displaying formatted text segments within a Text component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Span <: BaseSpan {
    /**
     * Called when text is entered in span.
     * Creates a span with the specified text content.
     *
     * @param { ?ResourceStr } value - The text content of the span.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?ResourceStr) {
        unsafe {
            var unsafeContent = LibC.mallocCString(transResourceStrToString(value ?? ""))
            FfiOHOSAceFrameworkSpanCreate(unsafeContent)
            LibC.free(unsafeContent)
        }
    }

    /**
     * Called when the font size is set.
     * Sets the font size for the text in the span.
     *
     * @param { ?Length } value - The font size.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        if (let Some(v) <- value) {
            var v_ = transAppResourceToLength(v)
            if (v_.value < 0.0) {
                unsafe {
                    FfiOHOSAceFrameworkSpanResetFontSize()
                }
                return this
            }
            unsafe {
                FfiOHOSAceFrameworkSpanSetFontSize(v_.value, getLengthUnitOrFp(v_).getValue())
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkSpanResetFontSize()
            }
        }
        this
    }

    /**
     * Called when the font color is set.
     * Sets the font color for the text in the span.
     *
     * @param { ?ResourceColor } value - The font color.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkSpanSetFontColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkSpanResetFontColor()
            }
        }
        this
    }

    /**
     * Called when the font style of a font is set.
     * Sets the font style (normal or italic) for the text in the span.
     *
     * @param { ?FontStyle } value - The font style.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontStyle((value ?? FontStyle.Normal).getValue())
        }
        this
    }

    /**
     * Called when the font weight is set.
     * Sets the font weight (thickness) for the text in the span.
     *
     * @param { ?FontWeight } value - The font weight.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        unsafe {
            try (unsafeFontWeight = LibC.mallocCString((value ?? FontWeight.Normal).getValue()).asResource()) {
                FfiOHOSAceFrameworkSpanSetFontWeight(unsafeFontWeight.value)
            }
        }
        this
    }

    /**
     * Called when the font list of text is set.
     * Sets the font family for the text in the span.
     *
     * @param { ?ResourceStr } value - The font family.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        unsafe {
            try (unsafeFontWeight = LibC.mallocCString(transResourceStrToString(value ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkSpanSetFontFamily(unsafeFontWeight.value)
            }
        }
        this
    }

    /**
     * Called when the text decoration of the text is set.
     * Sets the text decoration (e.g., underline, strikethrough) for the text in the span.
     * 
     * @param { ?TextDecorationType } decorationType - The type of text decoration.
     * @param { ?ResourceColor } color - The color of the text decoration.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(decorationType!: ?TextDecorationType, color!: ?ResourceColor = None): This {
        var colorValue = if (let Some(v) <- color) {
            v
        } else { Color.Black }
        unsafe {
            FfiOHOSAceFrameworkSpanSetDecoration((decorationType ?? TextDecorationType.None).getValue(), transAppResourceToResourceColor(colorValue))
        }
        this
    }

    /**
     * Called when the distance between text fonts is set.
     * Sets the letter spacing (tracking) for the text in the span.
     *
     * @param { ?Length } value - The letter spacing.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func letterSpacing(value: ?Length): This {
        var v = transAppResourceToLength(value ?? 0.0.px)
        unsafe {
            FfiOHOSAceFrameworkSpanSetLetterSpacing(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the type of letter in the text font is set.
     * Sets the text case transformation (e.g., uppercase, lowercase) for the text in the span.
     *
     * @param { ?TextCase } value - The text case.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textCase(value: ?TextCase): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetTextCase((value ?? TextCase.Normal).getValue())
        }
        this
    }

    /**
     * Called when a click event occurs.
     * Sets the click event handler for the span.
     *
     * @param { ?(ClickEvent) -> Unit } event - The click event handler.
     * @returns { This } Returns Span component instance itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(event: ?(ClickEvent) -> Unit): This {
        let tmpEvent = event ?? { _ => }
        let wrapper = {
            evt: CJClickEvent => tmpEvent(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper);
        unsafe {
            FfiOHOSAceFrameworkSpanSetOnClick(lambdaData.getID())
        }
        this
    }

    protected func initial() {}

    protected func update() {}
}
