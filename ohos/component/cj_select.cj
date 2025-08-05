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

public type VectorNativeSelectOptionHandle = CPointer<Unit>

foreign {
    func FFICJCreateVectorNativeSelectOption(size: Int64): VectorNativeSelectOptionHandle

    func FFICJVectorNativeSelectOptionSetElement(vec: VectorNativeSelectOptionHandle, index: Int64,
        SelectOption: NativeSelectOption): Unit

    func FFICJVectorNativeSelectOptionDelete(vec: VectorNativeSelectOptionHandle): Unit

    func FfiOHOSAceFrameworkSelectCreate(values: VectorNativeSelectOptionHandle): Unit

    func FfiOHOSAceFrameworkSelectSetSelected(value: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetValue(value: CString): Unit

    func FfiOHOSAceFrameworkSelectSetControlSize(value: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetDivider(params: DividerParams): Unit

    func FfiOHOSAceFrameworkSelectSetFont(
        style: Int32,
        weight: CString,
        size: Float64,
        sizeUnit: Int32,
        family: CString
    ): Unit

    func FfiOHOSAceFrameworkSelectSetFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSelectSetSelectedOptionBgColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSelectSetSelectedOptionFont(
        style: Int32,
        weight: CString,
        size: Float64,
        sizeUnit: Int32,
        family: CString
    ): Unit

    func FfiOHOSAceFrameworkSelectSetSelectedOptionFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSelectSetOptionBgColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSelectSetOptionFont(
        style: Int32,
        weight: CString,
        size: Float64,
        sizeUnit: Int32,
        family: CString
    ): Unit

    func FfiOHOSAceFrameworkSelectSetOptionFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSelectSetSpace(width: Float64, widthUnit: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetArrowPosition(value: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetMenuAlign(value: Int32, dx: Float64, dxUnit: Int32, dy: Float64, dyUnit: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetOptionWidth(width: Float64, widthUnit: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetOptionWidthWithMode(value: CString): Unit

    func FfiOHOSAceFrameworkSelectSetOptionHeight(height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetMenuBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSelectSetMenuBackgroundBlurStyle(value: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetPadding(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSelectSetDirection(value: Int32): Unit

    func FfiOHOSAceFrameworkSelectOnSelect(callback: Int64): Unit

    func FfiOHOSAceFrameworkSelectSetBackgroundColor(color: UInt32): Unit
}

@C
struct NativeSelectOption {
    NativeSelectOption(
        let value: CString,
        let icon: CString
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectOption {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: String, icon!: String) {
        this.value = value
        this.icon = icon
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: String, icon!: AppResource) {
        this(value, icon: getResourceMedia(icon))
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: AppResource, icon!: String) {
        this(getResourceString(value), icon: icon)
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: AppResource, icon!: AppResource) {
        this(getResourceString(value), icon: getResourceMedia(icon))
    }

    func parseToNative(): NativeSelectOption {
        var valueCString: ?CString = None
        var iconCString: ?CString = None
        try {
            valueCString = unsafe { LibC.mallocCString(value) }

            iconCString = unsafe { LibC.mallocCString(icon) }
        } catch (e: Exception) {
            valueCString?.free()
            iconCString?.free()
            throw e
        }
        return NativeSelectOption(
            valueCString.getOrThrow(),
            iconCString.getOrThrow()
        )
    }
}

class FFIVectorNativeSelectOption {
    private let vecHandle: VectorNativeSelectOptionHandle

    init(vec: VectorNativeSelectOptionHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeSelectOption(size) }
    }

    func setElement(index: Int64, value: NativeSelectOption): Unit {
        unsafe { FFICJVectorNativeSelectOptionSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorNativeSelectOptionDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeSelectOptionHandle {
        vecHandle
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuOffset {
    public var dx: Length
    public var dy: Length

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(dx: Length, dy: Length) {
        this.dx = transAppResourceToLength(dx)
        this.dy = transAppResourceToLength(dy)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DividerOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let strokeWidth: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let startMargin: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let endMargin: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length, startMargin!: Length, endMargin!: Length, color!: ResourceColor) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        this.startMargin = transAppResourceToLength(startMargin)
        this.endMargin = transAppResourceToLength(endMargin)
        this.color = transAppResourceToResourceColor(color)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Select <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(values: Array<SelectOption>) {
        let vecValueHandle = FFIVectorNativeSelectOption(values.size)
        let elements: Array<NativeSelectOption> = Array(values.size) {
            i => values[i].parseToNative()
        }
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, elements[i])
        }
        unsafe {
            FfiOHOSAceFrameworkSelectCreate(vecValueHandle.getNativeHandle())
        }
        for (i in 0..values.size) {
            let element = elements[i]
            unsafe {
                element.value.free()
                element.icon.free()
            }
        }
        vecValueHandle.free()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetSelected(value)
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
    public func value(content: String): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(content)
            FfiOHOSAceFrameworkSelectSetValue(unsafeContent)
            unsafeContent.free()
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
    public func value(content: AppResource): This {
        value(getResourceString(content))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controlSize(value: ControlSize): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetControlSize(value.getValue())
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
    public func divider(options!: Option<DividerOptions> = Option.None): This {
        unsafe {
            if (let Some(params) <- options) {
                FfiOHOSAceFrameworkSelectSetDivider(
                    DividerParams(
                        params.strokeWidth.value,
                        params.strokeWidth.unitType.getValue(),
                        params.color.toUInt32(),
                        params.startMargin.value,
                        params.startMargin.unitType.getValue(),
                        params.endMargin.value,
                        params.endMargin.unitType.getValue(),
                    )
                )
            } else {
                FfiOHOSAceFrameworkSelectSetDivider(
                    DividerParams(
                        0.0,
                        1,
                        Color.TRANSPARENT.toUInt32(),
                        -1.0,
                        1,
                        -1.0,
                        1,
                    )
                )
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
    public func font(
        style!: FontStyle = FontStyle.Normal,
        weight!: FontWeight = FontWeight.Medium,
        size!: Length = 16.vp,
        family!: String = "sans-serif"
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightValue = LibC.mallocCString(weight.getValue()).asResource(),
                familyValue = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkSelectSetFont(
                    style.getValue(),
                    weightValue.value,
                    size_.value,
                    size_.unitType.getValue(),
                    familyValue.value
                )
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
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetFontColor(transAppResourceToResourceColor(value))
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
    public func selectedOptionBgColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetSelectedOptionBgColor(transAppResourceToResourceColor(value))
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
    public func selectedOptionFont(
        style!: FontStyle = FontStyle.Normal,
        weight!: FontWeight = FontWeight.Medium,
        size!: Length = 16.vp,
        family!: String = "sans-serif"
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightValue = LibC.mallocCString(weight.getValue()).asResource(),
                familyValue = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkSelectSetSelectedOptionFont(
                    style.getValue(),
                    weightValue.value,
                    size_.value,
                    size_.unitType.getValue(),
                    familyValue.value
                )
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
    public func selectedOptionFontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetSelectedOptionFontColor(transAppResourceToResourceColor(value))
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
    public func optionBgColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetOptionBgColor(transAppResourceToResourceColor(value))
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
    public func optionFont(
        style!: FontStyle = FontStyle.Normal,
        weight!: FontWeight = FontWeight.Medium,
        size!: Length = 16.vp,
        family!: String = "sans-serif"
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightValue = LibC.mallocCString(weight.getValue()).asResource(),
                familyValue = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkSelectSetOptionFont(
                    style.getValue(),
                    weightValue.value,
                    size_.value,
                    size_.unitType.getValue(),
                    familyValue.value
                )
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
    public func optionFontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetOptionFontColor(transAppResourceToResourceColor(value))
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
    public func space(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSelectSetSpace(value_.value, value_.unitType.getValue())
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
    public func arrowPosition(value: ArrowPosition): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetArrowPosition(value.getValue())
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
    public func menuAlign(alignType: MenuAlignType, offset!: MenuOffset): This {
        unsafe {
            let dx = offset.dx
            let dy = offset.dy
            FfiOHOSAceFrameworkSelectSetMenuAlign(alignType.getValue(), dx.value, dx.unitType.getValue(), dy.value,
                dy.unitType.getValue())
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
    public func optionWidth(value: OptionWidthMode): This {
        unsafe {
            var optionWidth = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkSelectSetOptionWidthWithMode(optionWidth)
            optionWidth.free()
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
    public func optionWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSelectSetOptionWidth(value_.value, value_.unitType.getValue())
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
    public func optionHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSelectSetOptionHeight(value_.value, value_.unitType.getValue())
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
    public func menuBackgroundColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetMenuBackgroundColor(transAppResourceToResourceColor(value))
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
    public func menuBackgroundBlurStyle(value: BlurStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetMenuBackgroundBlurStyle(value.getValue())
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
    public override func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkSelectSetSize(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
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
    public override func padding(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSelectSetPadding(value_.value, value_.unitType.getValue())
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
    public override func direction(value: Direction): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetDirection(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func backgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetBackgroundColor(transAppResourceToResourceColor(color))
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
    public func onSelect(callback: (Int32, String) -> Unit): This {
        let wrapper = {
            index: Int32, value: CString => callback(index, value.toString())
        }
        let lambdaData = Callback2Param<Int32, CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSelectOnSelect(lambdaData.getID())
        }
        this
    }
}
