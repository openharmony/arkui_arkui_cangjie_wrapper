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

/**
 * Defines the base class of Span.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class BaseSpan <: UINodeBase {
}

/**
 * Defines Span Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Span <: BaseSpan {
    /*
     * Called when text is entered in span.
     * 
     * @params { ?ResourceStr } value
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?ResourceStr) {
        unsafe {
            var unsafeContent = LibC.mallocCString(transResourceStrToString(value ?? ""))
            FfiOHOSAceFrameworkSpanCreate(unsafeContent)
            LibC.free(unsafeContent)
        }
    }

    /*
     * Called when the font size is set.
     * 
     * @params { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontSize(v.value, getLengthUnitOrFp(v).getValue())
        }
        this
    }

    /*
     * Called when the font color is set.
     * 
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /*
     * Called when the font style of a font is set.
     * 
     * @params { ?FontStyle } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontStyle((value ?? FontStyle.Normal).getValue())
        }
        this
    }

    /*
     * Called when the font weight is set.
     * 
     * @params { ?FontWeight } value
     * @returns { This }
     */
    @!APILevel[
        22,
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

    /*
     * Called when the font list of text is set.
     * 
     * @params { ?ResourceStr } value
     * @returns { This }
     */
    @!APILevel[
        22,
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

    /*
     * Called when the text decoration of the text is set.
     * 
     * @params { ?TextDecorationType } decorationType
     * @params { ?ResourceColor } color
     * @returns { This }
     */
    @!APILevel[
        22,
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

    /*
     * Called when the distance between text fonts is set.
     * 
     * @params { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func letterSpacing(value: ?Length): This {
        var v = transAppResourceToLength(value ?? 0.0.px)
        unsafe {
            FfiOHOSAceFrameworkSpanSetLetterSpacing(v.value, v.unitType.getValue())
        }
        this
    }

    /*
     * Called when the type of letter in the text font is set.
     * 
     * @params { ?TextCase } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textCase(value: ?TextCase): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetTextCase((value ?? TextCase.Normal).getValue())
        }
        this
    }

    /*
     * Called when a click event occurs.
     *
     * @params { ?(ClickEvent) -> Unit } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
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
