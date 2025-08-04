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

package ohos.arkui.component.alphabet_indexer

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.ui_resource.*

import std.convert.*

foreign {
    func FfiOHOSAceFrameworkAlphabetIndexerCreate(handle: VectorStringHandle, selected: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerAutoCollapse(autoCollapse: Bool): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupTitleBackground(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupBackgroundBlurStyle(indexerBlurStyle: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupItemBackground(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupUnselectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupItemFont(size: Float64, unit: Int32, weight: CString): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerItemBorderRadius(radius: Float64): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupItemBorderRadius(radius: Float64): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerEnableHapticFeedback(state: Bool): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerSelectedBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupBackground(color: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerUsingPopup(usingPop: Bool): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerSelectedFont(size: Float64, unit: Int32, weight: CString, family: CString,
        style: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupFont(size: Float64, unit: Int32, weight: CString, family: CString,
        style: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerFont(size: Float64, unit: Int32, weight: CString, family: CString,
        style: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerItemSize(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerAlignStyle(alignStyle: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerSelected(selected: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupPositionWithUnit(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerOnSelected(callback: Int64): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerOnRequestPopupData(callback: Int64): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerOnPopupSelected(callback: Int64): Unit
}
/**
 * Defines an AlphabetIndexer callback when onSelect.
 *
 * @typedef { function } OnAlphabetIndexerSelectCallback
 * @param { Int64 } index - selected index
 * @relation declare type OnAlphabetIndexerSelectCallback = (index: number) => void;
 */
public type OnAlphabetIndexerSelectCallback = (Int64) -> Unit

/**
 * Defines an AlphabetIndexer callback when onRequestPopupData.
 *
 * @typedef { function } OnAlphabetIndexerRequestPopupDataCallback
 * @param { Int64 } index - selected index
 * @returns { Array<String> } string array corresponding to the index
 * @relation declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>;
 */
public type OnAlphabetIndexerRequestPopupDataCallback = (Int64) -> Array<String>

/**
 * Defines an AlphabetIndexer callback when onPopupSelect.
 *
 * @typedef { function } OnAlphabetIndexerPopupSelectCallback
 * @param { Int64 } index - selected index
 * @relation declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void;
 */
public type OnAlphabetIndexerPopupSelectCallback = (Int64) -> Unit

/**
 * Defines AlphabetIndexer Component.
 *
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlphabetIndexer <: ViewBase {
    /**
     * Construct the alphabet indexer component.
     * Called when the alphabet indexer component is used.
     *
     * @param { Array<String> } arrayValue - Alphabetical index string array.
     * @param { UInt32 } selected - ID of the selected item.
     * @returns { AlphabetIndexer }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arrayValue!: Array<String>, selected!: UInt32) {
        let vecFfi = FFIVectorString(arrayValue.size)
        for (i in 0..arrayValue.size) {
            vecFfi.setElement(i, arrayValue[i])
        }
        var actualIdx: UInt32 = 0
        if (Int64(selected) < arrayValue.size) {
            actualIdx = selected
        }
        unsafe { FfiOHOSAceFrameworkAlphabetIndexerCreate(vecFfi.getNativeHandle(), actualIdx) }
        vecFfi.free()
    }
    /**
     * Definitions color.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation color(value: ResourceColor): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Select the text color.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation selectedColor(value: ResourceColor): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelectedColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Font color of the pop-up prompt text.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation popupColor(value: ResourceColor): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Select the text background color.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation selectedBackgroundColor(value: ResourceColor): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedBackgroundColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelectedBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Background color of the pop-up window index.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation popupBackground(value: ResourceColor): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupBackground(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupBackground(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Whether to use pop-up index hints.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation usingPopup(value: boolean): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func usingPopup(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerUsingPopup(value)
        }
        this
    }

    /**
     * Select the text text style,
     *
     * @param { Length } size
     * @param { FontWeight } weight
     * @param { ResourceStr } family
     * @param { FontStyle } style
     * @returns { This }
     * @relation selectedFont(value: Font): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedFont(
        size!: Length = 10.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family)).asResource()) {
                FfiOHOSAceFrameworkAlphabetIndexerSelectedFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }
 
    /**	
     * Select the text background color.	
     *	
     * @param { Length } size	
     * @param { FontWeight } weight	
     * @param { ResourceStr } family	
     * @param { FontStyle } style	
     * @returns { This }
     * @relation popupFont(value: Font): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupFont(
        size!: Length = 24.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family)).asResource()) {
                FfiOHOSAceFrameworkAlphabetIndexerPopupFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }

    /**	
     * Definitions fonts.	
     *	
     * @param { Length } size	
     * @param { FontWeight } weight	
     * @param { ResourceStr } family	
     * @param { FontStyle } style	
     * @returns { This }
     * @relation font(value: Font): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: Length = 10.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: ResourceStr = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family)).asResource()) {
                FfiOHOSAceFrameworkAlphabetIndexerFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }

    /**
     * Size of the letter area on the letter index bar. The letter area is a square. Set the length of the square side.
     *
     * @param { Length } value
     * @returns { This }
     * @relation itemSize(value: string | number): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemSize(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerItemSize(size_.value, size_.unitType.getValue())
        }
        this
    }

    /**
     * Alphabet index bar alignment style. The left and right alignment styles are supported,
     * which affects the pop-up position of the pop-up window.
     *
     * @param { IndexerAlign } value - indicates the alignment style of Alphabet index.
     * @returns { This }
     * @relation alignStyle(value: IndexerAlign, offset?: Length): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignStyle(value: IndexerAlign): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerAlignStyle(value.getValue())
        }
        this
    }

    /**
     * Sets the selected index.
     *
     * @param { Int32 } index
     * @returns { This }
     * @relation selected(index: number): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(index: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelected(index)
        }
        this
    }

    /**
     * Position of the pop-up windows, relative to the midpoint of the top border of the indexer bar.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation popupPosition(value: Position): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupPosition(x!: Length = 60.vp, y!: Length = 48.vp): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupPositionWithUnit(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
        }
        this
    }

    /**
     * Index bar selection callback.
     * Anonymous Object Rectification.
     *
     * @param { OnAlphabetIndexerSelectCallback } callback
     * @returns { This }
     * @relation onSelect(callback: OnAlphabetIndexerSelectCallback): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: OnAlphabetIndexerSelectCallback): This {
        let wrapper = {
            value: Int32 => callback(Int64(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerOnSelected(lambdaData.getID())
        }
        this
    }

    /**
     * Index bar selection callback and return the strings which display on pop-up.
     * Anonymous Object Rectification.
     *
     * @param { OnAlphabetIndexerRequestPopupDataCallback } callback
     * @returns { This }
     * @relation onRequestPopupData(callback: OnAlphabetIndexerRequestPopupDataCallback): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onRequestPopupData(callback: OnAlphabetIndexerRequestPopupDataCallback): This {
        let wrapper = {
            value: Int32 =>
            let arr = callback(Int64(value))
            let vecFfi = FFIVectorString(arr.size)
            for (i in 0..arr.size) {
                vecFfi.setElement(i, arr[i])
            }
            return vecFfi.getNativeHandle()
        }
        let lambdaData = Callback1Param<Int32, VectorStringHandle>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerOnRequestPopupData(lambdaData.getID())
        }
        this
    }

    /**
     * Pop-up selection callback.
     * Anonymous Object Rectification.
     *
     * @param { OnAlphabetIndexerPopupSelectCallback } callback
     * @returns { This }
     * @relation onPopupSelect(callback: OnAlphabetIndexerPopupSelectCallback): AlphabetIndexerAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPopupSelect(callback: OnAlphabetIndexerPopupSelectCallback): This {
        let wrapper = {
            value: Int32 => callback(Int64(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerOnPopupSelected(lambdaData.getID())
        }
        this
    }
}
