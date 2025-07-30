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

public type VectorNativeTextShadows = CPointer<Unit>

foreign {
    func FFICJCreateVectorNativeTextShadows(size: Int64): VectorNativeTextShadows

    func FFICJVectorNativeTextShadowsDelete(vec: VectorNativeTextShadows): Unit
}

class CJVectorNativeTextShadows {
    private let vecHandle: VectorNativeTextShadows

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

    func FfiOHOSAceFrameworkSpanSetFont(fontFamily: CString, fontSize: Float64, unit: Int32, fontWeight: CString,
        fontStyle: Int32): Unit

    func FfiOHOSAceFrameworkSpanSetTextShadow(value: VectorNativeTextShadow): Unit

    func FfiOHOSAceFrameworkSpanSetTextBackgroundStyle(color: UInt32, radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSpanSetTextBackgroundStyleBorder(color: UInt32, radius: CBorderRadiuses): Unit

    func FfiOHOSAceFrameworkSpanSetOnClick(callback: Int64): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Span <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: String) {
        unsafe {
            var unsafeContent = LibC.mallocCString(content)
            FfiOHOSAceFrameworkSpanCreate(unsafeContent)
            LibC.free(unsafeContent)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: AppResource) {
        unsafe {
            var unsafeContent = LibC.mallocCString(getResourceString(content))
            FfiOHOSAceFrameworkSpanCreate(unsafeContent)
            LibC.free(unsafeContent)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSpanSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkSpanSetFontWeight(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: String): This {
        unsafe {
            var unsafeFontFamily = LibC.mallocCString(value)
            FfiOHOSAceFrameworkSpanSetFontFamily(unsafeFontFamily)
            LibC.free(unsafeFontFamily)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        fontFamily(getResourceString(content))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(decorationType!: TextDecorationType, color!: ResourceColor = Color.BLACK): This {
        unsafe {
            FfiOHOSAceFrameworkSpanSetDecoration(decorationType.getValue(), transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func letterSpacing(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSpanSetLetterSpacing(value_.value, value_.unitType.getValue())
        }
        this
    }

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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func onClick(callback: (ClickEvent) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent => callback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper);
        unsafe {
            FfiOHOSAceFrameworkSpanSetOnClick(lambdaData.getID())
        }
        this
    }

    /**
     * Span does not need to implement pop function
     *
     * @since 11
     */
    protected func pop(): Unit {}
}
