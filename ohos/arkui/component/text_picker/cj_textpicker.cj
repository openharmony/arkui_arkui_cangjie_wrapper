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

package ohos.arkui.component.text_picker

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct TextPickerResult {
    TextPickerResult(
        let value: CString,
        let index: UInt32
    ) {}
}

@C
struct CJDialogShow {
    CJDialogShow(
        let selected: UInt32,
        let height: Float64,
        let heightUnit: Int32,
        let accept: Int64,
        let cancel: Int64,
        let change: Int64
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkTextPickerDialogShow(handle: VectorStringHandle, value: CJDialogShow): Unit

    func FfiOHOSAceFrameworkTextPickerCreate(handle: VectorStringHandle, selected: UInt32, value: CString): Unit

    func FfiOHOSAceFrameworkTextPickerSetDefaultPickerItemHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextPickerSetCanLoop(value: Bool): Unit

    func FfiOHOSAceFrameworkTextPickerOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextPickerSetTextStyle(color: UInt32, size: Float64, unit: UInt32, weight: CString,
        family: CString, style: UInt32): Unit

    func FfiOHOSAceFrameworkTextPickerSetSelectedTextStyle(color: UInt32, size: Float64, unit: UInt32, weight: CString,
        family: CString, style: UInt32): Unit

    func FfiOHOSAceFrameworkTextPickerSetGradientHeight(length: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextPickerSetDivider(params: DividerParams): Unit

    func FfiOHOSAceFrameworkTextPickerSetSelectedIndexSingle(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextPickerSetSelectedIndexMulti(values: VectorUInt32Handle): Unit

    func FfiOHOSAceFrameworkTextPickerSetOpacity(opacityValue: Float64): Unit
}

class CallbackTextPickerResult <: BaseCallBack {
    CallbackTextPickerResult(let closure: (TextPickerResult) -> Unit) {
        registerSelf()
    }

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 1) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackTextPickerResult")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<TextPickerResult>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackTextPickerResult")
            throw InvalidArgsException()
        }
        let arg0 = unsafe { ptrArg0.read() }
        closure(arg0)
    }
}

func checkSelect(range: Array<String>, value: String): UInt32 {
    var res: UInt32 = 0
    for (i in 0..range.size) {
        if (range[i] == value) {
            res = UInt32(i)
            break
        }
    }
    res
}

/**
 * Callback of TextPicker item is selected event.
 *
 * @typedef {function} OnTextPickerChangeCallback
 * @param { String } selectItem - Value of the selected item.
 * @param { UInt32 } index - Index of the selected item.
 * @relation type OnTextPickerChangeCallback = (selectItem: string | string[], index: number | number[]) => void
 */
public type OnTextPickerChangeCallback = (String, UInt32) -> Unit

/**
 * Creates a text picker based on the selection range specified by range.
 *
 * @relation const TextPicker: TextPickerInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextPicker <: ViewBase {
    /**
     * Defines the TextPicker constructor.
     *
     * @param { Array<String> } range
     * @param { ?UInt32 } selected
     * @param { ?String } value
     * @returns { TextPicker }
     * @relation (options?: TextPickerOptions): TextPickerAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        range!: Array<String>,
        selected!: ?UInt32 = Option.None,
        value!: ?String = Option.None
    ) {
        let vecFFi = FFIVectorString(range.size)
        for (i in 0..range.size) {
            vecFFi.setElement(i, range[i])
        }

        var getSelected: UInt32 = 0
        match (selected) {
            case None => match (value) {
                case None => getSelected = 0
                case Some(v) => getSelected = checkSelect(range, v)
            }
            case Some(v) => getSelected = v
        }

        var defValue: String = ""
        match (value) {
            case None => defValue = range[0]
            case Some(v) => defValue = v
        }
        unsafe {
            try (tempValue = LibC.mallocCString(defValue).asResource()) {
                FfiOHOSAceFrameworkTextPickerCreate(vecFFi.getNativeHandle(), getSelected, tempValue.value)
                vecFFi.free()
            }
        }
    }

    /**
     * Sets the height of each item in the picker.
     *
     * @param { Length } value - Height of each item in the picker.
     * <br>For the number type, the value range is [0, +∞).
     * <br>For the string type, only numeric string values, for example, "56", are supported.
     * @returns { This }
     * @default 56 vp (selected) and 36 vp (unselected).
     * @relation defaultPickerItemHeight(value: number | string): TextPickerAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func defaultPickerItemHeight(value: Length): This {
        var height = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextPickerSetDefaultPickerItemHeight(height.value, height.unitType.getValue())
        }
        this
    }

    /**
     * Sets whether scrolling is loopable.
     *
     * @param { Bool } value - Whether scrolling is loopable. true: loopable; false: not loopable.
     * @default true
     * @returns { This }
     * @relation canLoop(value: boolean): TextPickerAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func canLoop(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextPickerSetCanLoop(value)
        }
        this
    }

    /**
     * Triggered when an item in the picker is selected.
     * When the picker contains text only or both text and imagery,
     * value indicates the text of the selected item.
     * When the picker contains imagery only, value is empty.
     *
     * @param { OnTextPickerChangeCallback } callback - the callback of onChange.
     * @returns { This }
     * @relation onChange(callback: (value: string | string[], index: number | number[]) => void): TextPickerAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: OnTextPickerChangeCallback): This {
        let wrapper = {
            data: TextPickerResult =>
            let value = data.value.toString()
            let index = data.index
            callback(value.toString(), index)
        }
        let lambdaData = CallbackTextPickerResult(wrapper);
        unsafe {
            FfiOHOSAceFrameworkTextPickerOnChange(lambdaData.getID())
        }
        this
    }
}
