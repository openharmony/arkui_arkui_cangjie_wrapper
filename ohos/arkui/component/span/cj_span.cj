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

package ohos.arkui.component.span

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

type VectorNativeTextShadows = CPointer<Unit>

foreign {
    func FFICJCreateVectorNativeTextShadows(size: Int64): VectorNativeTextShadows
    func FFICJVectorNativeTextShadowsDelete(vec: VectorNativeTextShadows): Unit
}

class CJVectorNativeTextShadows {
    let vecHandle: VectorNativeTextShadows

    init(vec: VectorNativeTextShadows) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeTextShadows(size) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorNativeTextShadowsDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeTextShadows {
        vecHandle
    }
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
}

public abstract class BaseSpan <: UINodeBase{
}

/**
 * Defines Span Component.
 *
 * @relation declare const Span: SpanInterface;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Span <: BaseSpan {
    /*
     * Called when text is entered in span.
     * 
     * @param { ResourceStr } value
     * @relation (value: string | Resource): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ResourceStr) {
        unsafe {
            var unsafeContent = LibC.mallocCString(transResourceStrToString(value))
            FfiOHOSAceFrameworkSpanCreate(unsafeContent)
            LibC.free(unsafeContent)
        }
    }

    /*
     * Called when the font size is set.
     * 
     * @param { Length } value
     * @returns { This }
     * @relation fontSize(value: number | string | Resource): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontSize(v.value, getLengthUnitOrFp(v).getValue())
        }
        this
    }

    /*
     * Called when the font color is set.
     * 
     * @param { ResourceColor } value
     * @returns { This }
     * @relation fontColor(value: ResourceColor): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /*
     * Called when the font style of a font is set.
     * 
     * @param { FontStyle } value
     * @returns { This }
     * @relation fontStyle(value: FontStyle): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontStyle(value.getValue())
        }
        this
    }

    /*
     * Called when the font weight is set.
     * 
     * @param { FontWeight } value
     * @returns { This }
     * @relation fontWeight(value: number | FontWeight | ResourceStr): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            try (unsafeFontWeight = LibC.mallocCString(value.getValue()).asResource()) {
                FfiOHOSAceFrameworkSpanSetFontWeight(unsafeFontWeight.value)
            }
        }
        this
    }

    /*
     * Called when the font list of text is set.
     * 
     * @param { ResourceStr } value
     * @returns { This }
     * @relation fontFamily(value: string | Resource): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ResourceStr): This {
        unsafe {
            try (unsafeFontWeight = LibC.mallocCString(transResourceStrToString(value)).asResource()) {
                FfiOHOSAceFrameworkSpanSetFontFamily(unsafeFontWeight.value)
            }
        }
        this
    }

    /*
     * Called when the text decoration of the text is set.
     * 
     * @param { TextDecorationType } decorationType
     * @param { ResourceColor } color
     * @returns { This }
     * @relation decoration(value: DecorationStyleInterface): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(decorationType!: TextDecorationType, color!: ?ResourceColor = None): This {
        var colorValue = if (let Some(v) <- color) {
            v
        } else { Color.Black }
        unsafe {
            FfiOHOSAceFrameworkSpanSetDecoration(decorationType.getValue(), transAppResourceToResourceColor(colorValue))
        }
        this
    }

    /*
     * Called when the distance between text fonts is set.
     * 
     * @param { Length } value
     * @returns { This }
     * @relation letterSpacing(value: number | ResourceStr): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func letterSpacing(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSpanSetLetterSpacing(v.value, v.unitType.getValue())
        }
        this
    }

    /*
     * Called when the type of letter in the text font is set.
     * 
     * @param { TextCase } value
     * @returns { This }
     * @relation textCase(value: TextCase): SpanAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textCase(value: TextCase): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetTextCase(value.getValue())
        }
        this
    }

    /*
     * Called when a click event occurs.
     *
     * @param { function } event
     * @returns { This }
     * @relation onClick(event: (event: ClickEvent) => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(callback: (ClickEvent) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent => callback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper);
        unsafe {
            FfiOHOSAceFrameworkSpanSetOnClick(lambdaData.getID())
        }
        this
    }

    public func initial() {
    }

    public func update() {
    }
}
