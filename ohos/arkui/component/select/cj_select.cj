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

package ohos.arkui.component.select

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

type VectorNativeSelectOptionHandle = CPointer<Unit>

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

/**
 * Callback of selecting an item from the select event.
 * 
 * @typedef {function} OnSelectCallback
 * @param {Int32} The index of the selected item.
 * @param {String} The value of the selected item.
 */
public type OnSelectCallback = (Int32, String) -> Unit;

/**
 * The declare of selectOption.
 *
 * @interface SelectOption
 * @relation interface SelectOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectOption {
    /**
     * Option string.
     *
     * @type { ResourceStr }
     * @relation value: ResourceStr
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: ResourceStr
    /**
     * Option icon.
     *
     * @type { ResourceStr }
     * @relation icon?: ResourceStr
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: ResourceStr

    /**
     * Constructor selectOption.
     *
     * @param { ResourceStr } value
     * @param { ResourceStr } icon
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ResourceStr, icon!: ResourceStr) {
        this.value = value
        this.icon = icon
    }

    func parseToNative(): NativeSelectOption {
        var valueCString: ?CString = None
        var iconCString: ?CString = None
        var value_ = match(value) {
            case v: AppResource => getResourceString(v)
            case v: String => v
            case _ => ""
        }
        var icon_ = match(icon) {
            case v: AppResource => getResourceMedia(v)
            case v: String => v
            case _ => ""
        }
        try {
            valueCString = unsafe { LibC.mallocCString(value_) }
            iconCString = unsafe { LibC.mallocCString(icon_) }
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

/**
 * Defines Select Component.
 *
 * @relation const Select: SelectInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Select <: ViewBase {
    /**
     * Called when the select is set.
     *
     * @param { Array<SelectOption> } options
     * @returns { This }
     * @relation (options: Array<SelectOption>): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: Array<SelectOption>) {
        let vecValueHandle = FFIVectorNativeSelectOption(options.size)
        let elements: Array<NativeSelectOption> = Array(options.size) {
            i => options[i].parseToNative()
        }
        for (i in 0..options.size) {
            vecValueHandle.setElement(i, elements[i])
        }
        unsafe {
            FfiOHOSAceFrameworkSelectCreate(vecValueHandle.getNativeHandle())
        }
        for (i in 0..options.size) {
            let element = elements[i]
            unsafe {
                element.value.free()
                element.icon.free()
            }
        }
        vecValueHandle.free()
    }

    /**
     * Sets the serial number of the select item, starting from 0.
     *
     * @param { Int32 } value - the serial number of the select item.
     * @returns { This } the attribute of the select.
     * @relation selected(value: number | Resource): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetSelected(value)
        }
        this
    }

    /**
     * Sets the text display of the select button itself.
     *
     * @param { ResourceStr } value - the text display of the select button itself.
     * @returns { This } the attribute of the select.
     * @relation value(value: ResourceStr): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(value: ResourceStr): This {
        let content = transResourceStrToString(value)
        unsafe {
            try (unsafeContent = LibC.mallocCString(content).asResource()) {
                FfiOHOSAceFrameworkSelectSetValue(unsafeContent.value)
            }
        }
        this
    }

    /**
     * Sets the text properties of the select button itself.
     *
     * @param { FontStyle } style
     * @param { FontWeight } weight
     * @param { Length } size
     * @param { ResourceStr } family
     * @returns { This }
     * @relation font(value: Font): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        style!: FontStyle = FontStyle.Normal,
        weight!: FontWeight = FontWeight.Medium,
        size!: Length = 16.vp,
        family!: ResourceStr = "sans-serif"
    ): This {
        var size_ = transAppResourceToLength(size)
        var family_ = transResourceStrToString(family)
        unsafe {
            try (weightValue = LibC.mallocCString(weight.getValue()).asResource(),
                familyValue = LibC.mallocCString(family_).asResource()) {
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

    /**
     * Sets the text color of the select button itself.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation fontColor(value: ResourceColor): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetFontColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Sets the background color of the selected items in the select.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation selectedOptionBgColor(value: ResourceColor): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedOptionBgColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetSelectedOptionBgColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Sets the text style of the selected items in the select.
     *
     * @param { FontStyle } style
     * @param { FontWeight } weight
     * @param { Length } size
     * @param { String } family
     * @returns { This }
     * @relation selectedOptionFont(selectFont: Optional<Font>): SelectAttribute
     */
    @!APILevel[
        21,
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

    /**
     * Sets the text color of the selected item in the select.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation selectedOptionFontColor(value: ResourceColor): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedOptionFontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetSelectedOptionFontColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Sets the background color of the select item.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation optionBgColor(value: ResourceColor): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func optionBgColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetOptionBgColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Sets the text style for select items.
     *
     * @param { FontStyle } style
     * @param { FontWeight } weight
     * @param { Length } size
     * @param { ResourceStr } family
     * @returns { This }
     * @relation optionFont(value: Font): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func optionFont(
        style!: FontStyle = FontStyle.Normal,
        weight!: FontWeight = FontWeight.Medium,
        size!: Length = 16.vp,
        family!: ResourceStr = "sans-serif"
    ): This {
        var size_ = transAppResourceToLength(size)
        var family_ = transResourceStrToString(family)
        unsafe {
            try (weightValue = LibC.mallocCString(weight.getValue()).asResource(),
                familyValue = LibC.mallocCString(family_).asResource()) {
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

    /**
     * Sets the text color for select items.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation optionFontColor(value: ResourceColor): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func optionFontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetOptionFontColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Set the space for text and icon in select
     *
     * @param { Length } value - indicates the length of the space
     * @returns { This }
     * @relation space(value: Length): SelectAttribute
     */
    @!APILevel[
        21,
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

    /**
     * Set the layout direction for text and arrow in select
     *
     * @param { ArrowPosition } value - indicates the arrow position in the select
     * @returns { This }
     * @relation arrowPosition(value: ArrowPosition): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arrowPosition(value: ArrowPosition): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetArrowPosition(value.getValue())
        }
        this
    }

    /**
     * Set the alignment between select and menu.
     *
     * @param { MenuAlignType } alignType - The type of alignment between select and menu.
     * @param { Offset } offset - The offset between select and menu.
     * @returns { This } the attribute of the select.
     * @relation menuAlign(alignType: MenuAlignType, offset?: Offset): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menuAlign(alignType!: MenuAlignType, offset!: Offset): This {
        unsafe {
            let dx = offset.dx
            let dy = offset.dy
            FfiOHOSAceFrameworkSelectSetMenuAlign(alignType.getValue(), dx.value, dx.unitType.getValue(), dy.value,
                dy.unitType.getValue())
        }
        this
    }

    /** 
     * Set the width of each option and set whether the option width fit the trigger.
     *
     * @param { OptionWidthMode } value - The length of option width and decide option width to fit trigger or content.
     * @returns { This } the attribute of the select.
     * @relation optionWidth(value: Dimension | OptionWidthMode ): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func optionWidth(value: OptionWidthMode): This {
        unsafe {
            try (optionWidth = LibC.mallocCString(value.getValue()).asResource()) {
                FfiOHOSAceFrameworkSelectSetOptionWidthWithMode(optionWidth.value)
            }
        }
        this
    }

    /** 
     * Set the width of each option and set whether the option width fit the trigger.
     *
     * @param { Length } value - The length of option width and decide option width to fit trigger or content.
     * @returns { This } the attribute of the select.
     * @relation optionWidth(value: Dimension | OptionWidthMode ): SelectAttribute
     */
    @!APILevel[
        21,
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

    /** 
     * Set the height of each option.
     * 
     * @param { Length } value - The length of option height.
     * @returns { This } the attribute of the select.
     * @relation optionHeight(value: Dimension): SelectAttribute
     */
    @!APILevel[
        21,
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

    /**
     * set the menu's background color
     *
     * @param { ResourceColor } value - The backgroundColor of menu.
     * @returns { This } the attribute of the select.
     * @relation menuBackgroundColor(value: ResourceColor): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menuBackgroundColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetMenuBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * set menu background blur Style
     *
     * @param { BlurStyle } value - The BackgroundBlurStyle of menu.
     * @returns { This } the attribute of the select.
     * @relation menuBackgroundBlurStyle(value: BlurStyle): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menuBackgroundBlurStyle(value: BlurStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetMenuBackgroundBlurStyle(value.getValue())
        }
        this
    }

    protected override func sizeInner(width: Length, height: Length): This {
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

    protected override func paddingInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSelectSetPadding(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func directionInner(value: Direction): This {
        unsafe {
            FfiOHOSAceFrameworkSelectSetDirection(value.getValue())
        }
        this
    }

    /**
     * Callback for selecting an item from the select.
     *
     * @param { function } callback
     * @returns { This }
     * @relation onSelect(callback: (index: number, value: string) => void): SelectAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: OnSelectCallback): This {
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
