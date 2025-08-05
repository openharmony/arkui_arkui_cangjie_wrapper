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

    func FfiOHOSAceFrameworkAlphabetIndexerSelected(selected: UInt32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerPopupPositionWithUnit(x: Float64, xUnit: Int32, y: Float64, yUnit: Int32): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerOnSelected(callback: Int64): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerOnRequestPopupData(callback: Int64): Unit

    func FfiOHOSAceFrameworkAlphabetIndexerOnPopupSelected(callback: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlphabetIndexer <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        19,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoCollapse(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerAutoCollapse(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelectedColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedBackgroundColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelectedBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupBackground(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupBackground(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func usingPopup(usingPopup: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerUsingPopup(usingPopup)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupTitleBackground(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupTitleBackground(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupBackgroundBlurStyle(value: BlurStyle): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupBackgroundBlurStyle(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupItemBackgroundColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupItemBackground(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupUnselectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupUnselectedColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupSelectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupSelectedColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedFont(
        size!: Length = 10.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString = LibC.mallocCString(weight.getValue())
            var fontFamilyCString = LibC.mallocCString(family)
            FfiOHOSAceFrameworkAlphabetIndexerSelectedFont(
                size_.value,
                size_.unitType.getValue(),
                weightCString,
                fontFamilyCString,
                style.getValue()
            )
            LibC.free(weightCString)
            LibC.free(fontFamilyCString)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedFont(
        size!: Length = 10.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        selectedFont(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupFont(
        size!: Length = 24.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString = LibC.mallocCString(weight.getValue())
            var fontFamilyCString = LibC.mallocCString(family)
            FfiOHOSAceFrameworkAlphabetIndexerPopupFont(
                size_.value,
                size_.unitType.getValue(),
                weightCString,
                fontFamilyCString,
                style.getValue()
            )
            LibC.free(weightCString)
            LibC.free(fontFamilyCString)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupFont(
        size!: Length = 24.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        popupFont(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupItemFont(
        size!: Length = 24.vp,
        weight!: FontWeight = FontWeight.Medium,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString = LibC.mallocCString(weight.getValue())
            FfiOHOSAceFrameworkAlphabetIndexerPopupItemFont(
                size_.value,
                size_.unitType.getValue(),
                weightCString
            )
            LibC.free(weightCString)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupItemFont(
        size!: Length = 24.vp,
        weight!: FontWeight = FontWeight.Medium,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        popupItemFont(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: Length = 10.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString = LibC.mallocCString(weight.getValue())
            var fontFamilyCString = LibC.mallocCString(family)
            FfiOHOSAceFrameworkAlphabetIndexerFont(
                size_.value,
                size_.unitType.getValue(),
                weightCString,
                fontFamilyCString,
                style.getValue()
            )
            LibC.free(weightCString)
            LibC.free(fontFamilyCString)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        size!: Length = 10.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        font(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemSize(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerItemSize(size_.value, size_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func itemBorderRadius(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerItemBorderRadius(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popupItemBorderRadius(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerPopupItemBorderRadius(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignStyle(align: IndexerAlign): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerAlignStyle(align.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(idx: UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerSelected(idx)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: (Int64) -> Unit): This {
        let wrapper = {
            value: Int32 => callback(Int64(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerOnSelected(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onRequestPopupData(callback: (Int64) -> Array<String>): This {
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPopupSelect(callback: (Int64) -> Unit): This {
        let wrapper = {
            value: Int32 => callback(Int64(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerOnPopupSelected(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableHapticFeedback(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkAlphabetIndexerEnableHapticFeedback(value)
        }
        this
    }
}
