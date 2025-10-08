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
import ohos.resource.*

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
 * @params { Int64 } index - selected index
 */
public type OnAlphabetIndexerSelectCallback = (Int64) -> Unit

/**
 * Defines an AlphabetIndexer callback when onRequestPopupData.
 *
 * @params { Int64 } index - selected index
 * @returns { Array<String> } string array corresponding to the index
 */
public type OnAlphabetIndexerRequestPopupDataCallback = (Int64) -> Array<String>

/**
 * Defines an AlphabetIndexer callback when onPopupSelect.
 *
 * @params { Int64 } index - selected index
 */
public type OnAlphabetIndexerPopupSelectCallback = (Int64) -> Unit

/**
 * Defines AlphabetIndexer Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlphabetIndexer <: CommonMethodComponent<AlphabetIndexer> & AlphabetIndexerAttribute {
    /**
     * Construct the alphabet indexer component.
     * Called when the alphabet indexer component is used.
     *
     * @params { Array<String> } arrayValue - Alphabetical index string array.
     * @params { ?UInt32 } selected - ID of the selected item.
     * @returns { AlphabetIndexer }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arrayValue!: Array<String>, selected!: ?UInt32) {
        let tmpArrayValue = arrayValue
        let tmpSelected = selected ?? 0
        let vecFfi = FFIVectorString(tmpArrayValue.size)
        for (i in 0..tmpArrayValue.size) {
            vecFfi.setElement(i, tmpArrayValue[i])
        }
        var actualIdx: UInt32 = 0
        if (Int64(tmpSelected) < tmpArrayValue.size) {
            actualIdx = tmpSelected
        }
        unsafe { FfiOHOSAceFrameworkAlphabetIndexerCreate(vecFfi.getNativeHandle(), actualIdx) }
        vecFfi.free()
    }
    /**
     * Definitions color.
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ?ResourceColor): This {
        let tmpValue = value ?? Color(0x99182431)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Select the text color.
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        let tmpValue = value ?? Color(0xFF007DFF)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelectedColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Font color of the pop-up prompt text.
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupColor(value: ?ResourceColor): This {
        let tmpValue = value ?? Color(0xFF007DFF)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Select the text background color.
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedBackgroundColor(value: ?ResourceColor): This {
        let tmpValue = value ?? Color(0x1A007DFF)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelectedBackgroundColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Background color of the pop-up window index.
     *
     * @params { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupBackground(value: ?ResourceColor): This {
        let tmpValue = value ?? Color(0x66808080)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupBackground(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Whether to use pop-up index hints.
     *
     * @params { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func usingPopup(value: ?Bool): This {
        let tmpValue = value ?? false
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerUsingPopup(tmpValue)
        }
        this
    }

    /**
     * Select the text text style,
     *
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedFont(
        size!: ?Length = None,
        weight!: ?FontWeight = None,
        family!: ?ResourceStr = None,
        style!: ?FontStyle = None
    ): This {
        let tmpWeight = weight ?? FontWeight.Normal
        let tmpStyle = style ?? FontStyle.Normal
        var size_ = transAppResourceToLength(size ?? 10.vp)
        unsafe {
            try (weightCString = LibC.mallocCString(tmpWeight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkAlphabetIndexerSelectedFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    tmpStyle.getValue()
                )
            }
        }
        this
    }
 
    /**	
     * Select the text background color.	
     *	
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupFont(
        size!: ?Length = None,
        weight!: ?FontWeight = None,
        family!: ?ResourceStr = None,
        style!: ?FontStyle = None
    ): This {
        let tmpWeight = weight ?? FontWeight.Normal
        let tmpStyle = style ?? FontStyle.Normal
        var size_ = transAppResourceToLength(size ?? 24.vp)
        unsafe {
            try (weightCString = LibC.mallocCString(tmpWeight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkAlphabetIndexerPopupFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    tmpStyle.getValue()
                )
            }
        }
        this
    }

    /**	
     * Definitions fonts.	
     *	
     * @params { ?Length } size
     * @params { ?FontWeight } weight
     * @params { ?ResourceStr } family
     * @params { ?FontStyle } style
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: ?Length = None,
        weight!: ?FontWeight = None,
        family!: ?ResourceStr = None,
        style!: ?FontStyle = None
    ): This {
        let tmpWeight = weight ?? FontWeight.Normal
        let tmpStyle = style ?? FontStyle.Normal
        var size_ = transAppResourceToLength(size ?? 10.vp)
        unsafe {
            try (weightCString = LibC.mallocCString(tmpWeight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(transResourceStrToString(family ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkAlphabetIndexerFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    tmpStyle.getValue()
                )
            }
        }
        this
    }

    /**
     * Size of the letter area on the letter index bar. The letter area is a square. Set the length of the square side.
     *
     * @params { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemSize(size: ?Length): This {
        let tmpSize = size ?? 16.vp
        var size_ = transAppResourceToLength(tmpSize)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerItemSize(size_.value, size_.unitType.getValue())
        }
        this
    }

    /**
     * Alphabet index bar alignment style. The left and right alignment styles are supported,
     * which affects the pop-up position of the pop-up window.
     *
     * @params { ?IndexerAlign } value - indicates the alignment style of Alphabet index.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignStyle(value: ?IndexerAlign): This {
        // not support IndexerAlign.End yet
        let tmpValue = value ?? IndexerAlign.Right
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerAlignStyle(tmpValue.getValue())
        }
        this
    }

    /**
     * Sets the selected index.
     *
     * @params { ?Int32 } index
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(index: ?Int32): This {
        let tmpIndex = index ?? 0
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelected(tmpIndex)
        }
        this
    }

    /**
     * Position of the pop-up windows, relative to the midpoint of the top border of the indexer bar.
     *
     * @params { ?Length } x
     * @params { ?Length } y
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupPosition(x!: ?Length = None, y!: ?Length = None): This {
        var x_ = transAppResourceToLength(x ?? 60.vp)
        var y_ = transAppResourceToLength(y ?? 48.vp)
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
     * @params { ?OnAlphabetIndexerSelectCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: ?OnAlphabetIndexerSelectCallback): This {
        let tmpCallback = callback ?? { _: Int64 => }
        let wrapper = {
            value: Int32 => tmpCallback(Int64(value))
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
     * @params { ?OnAlphabetIndexerRequestPopupDataCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onRequestPopupData(callback: ?OnAlphabetIndexerRequestPopupDataCallback): This {
        let tmpCallback = callback ?? { _: Int64 => Array<String>() }
        let wrapper = {
            value: Int32 =>
            let arr = tmpCallback(Int64(value))
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
     * @params { ?OnAlphabetIndexerPopupSelectCallback } callback
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPopupSelect(callback: ?OnAlphabetIndexerPopupSelectCallback): This {
        let tmpCallback = callback ?? { _: Int64 => }
        let wrapper = {
            value: Int32 => tmpCallback(Int64(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerOnPopupSelected(lambdaData.getID())
        }
        this
    }
}
