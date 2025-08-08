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

public type VectorNativeTextShadows = CPointer<Unit>

foreign {
    func FFICJCreateVectorNativeTextShadows(size: Int64): VectorNativeTextShadows

    func FFICJVectorNativeTextShadowsSetElement(vec: VectorNativeTextShadows, index: Int64,
        thisShadow: NativeTextShadows): Unit

    func FFICJVectorNativeTextShadowsDelete(vec: VectorNativeTextShadows): Unit
}

@C
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct NativeTextShadows {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NativeTextShadows(
        let radius: Float64,
        let offsetX: Float64,
        let offsetY: Float64,
        let color: UInt32,
        let fill: Bool,
        let shadowType: Int32
    ) {}
}

class CJVectorNativeTextShadows {
    private let vecHandle: VectorNativeTextShadows

    init(vec: VectorNativeTextShadows) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeTextShadows(size) }
    }

    func setElement(index: Int64, value: NativeTextShadows): Unit {
        unsafe { FFICJVectorNativeTextShadowsSetElement(vecHandle, index, value) }
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextBackgroundStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: UInt32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radiusBorder: BorderRadiuses
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radiusDimension: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        color!: ResourceColor = Color.TRANSPARENT,
        radiusBorder!: BorderRadiuses = BorderRadiuses(),
        radiusDimension!: Length = 0.0
    ) {
        this.color = transAppResourceToResourceColor(color)
        this.radiusBorder = radiusBorder
        this.radiusDimension = transAppResourceToLength(radiusDimension)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Span <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(size!: Length, weight!: FontWeight, family!: String, style!: FontStyle): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(family).asResource(),
                unsafeFontWeight = LibC.mallocCString(weight.getValue()).asResource()) {
                var sizeValue = size_.value
                var unit = size_.unitType
                FfiOHOSAceFrameworkSpanSetFont(
                    unsafeFontFamily.value,
                    sizeValue,
                    unit.getValue(),
                    unsafeFontWeight.value,
                    style.getValue()
                )
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        fontFamily(getResourceString(content))
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSpanSetLineHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func baselineOffset(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            if (value_.unitType.getValue() == LENGTH_PERCENT) {
                FfiOHOSAceFrameworkSpanSetBaselineOffset(0.0, LENGTH_FP)
            } else {
                FfiOHOSAceFrameworkSpanSetBaselineOffset(value_.value, value_.unitType.getValue())
            }
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.COLOR,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        color!: ResourceColor = Color.BLACK,
        fill!: Bool = false
    ): This {
        let thisShadow: NativeTextShadows = NativeTextShadows(radius, offsetX, offsetY,
            transAppResourceToResourceColor(color), fill, Int32(shadowType.getValue()))
        let vecValueHandle = CJVectorNativeTextShadows(1)
        vecValueHandle.setElement(0, thisShadow)
        unsafe {
            FfiOHOSAceFrameworkSpanSetTextShadow(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(values: Array<ShadowOptions>): This {
        let vecValueHandle = CJVectorNativeTextShadows(values.size)
        for (i in 0..values.size) {
            let thisShadow: NativeTextShadows = NativeTextShadows(values[i].radius, values[i].offsetX, values[i].offsetY,
                values[i].color, values[i].fill, Int32(values[i].shadowType))
            vecValueHandle.setElement(i, thisShadow)
        }
        unsafe {
            FfiOHOSAceFrameworkSpanSetTextShadow(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textBackgroundStyle(textBackgroundStyle: TextBackgroundStyle): This {
        if (textBackgroundStyle.radiusDimension.value != 0.0) {
            unsafe {
                FfiOHOSAceFrameworkSpanSetTextBackgroundStyle(textBackgroundStyle.color,
                    textBackgroundStyle.radiusDimension.value, textBackgroundStyle.radiusDimension.unitType.getValue())
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkSpanSetTextBackgroundStyleBorder(textBackgroundStyle.color,
                    textBackgroundStyle.radiusBorder.toCBorderRadiuses())
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
