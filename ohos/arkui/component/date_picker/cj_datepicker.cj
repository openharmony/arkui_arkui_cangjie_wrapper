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

package ohos.arkui.component.date_picker

import ohos.arkui.component.common.*
import ohos.arkui.component.text_clock.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.labels.APILevel
import std.time.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DatePickerResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let year: Int64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let month: Int64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let day: Int64

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        year: Int64,
        month: Int64,
        day: Int64
    ) {
        this.year = year
        this.month = month
        this.day = day
    }
}

@C
struct NativeOptionDateTime {
    NativeOptionDateTime(
        let hasValue: Bool,
        let hour: CString,
        let min: CString
    ) {}
}

func convertDateTimeOptionsToNative(value: DateTimeOptions): NativeOptionDateTime {
    unsafe {
        var cHour: ?CString = None
        var cMinute: ?CString = None
        try {
            cHour = LibC.mallocCString(value.hour)
            cMinute = LibC.mallocCString(value.minute)
            return NativeOptionDateTime(
                true,
                cHour.getOrThrow(),
                cMinute.getOrThrow()
            )
        } catch (e: Exception) {
            cHour?.free()
            cMinute?.free()
            throw e
        }
    }
}

@C
struct NativeOptionFfiTime {
    NativeOptionFfiTime(
        let hasValue: Bool,
        let value: FfiTime
    ) {}
}

@C
struct FfiTime {
    FfiTime(
        let year: Int64,
        let month: Int64,
        let day: Int64,
        let hour: Int64,
        let min: Int64,
        let sec: Int64,
        let nsec: Int64
    ) {}
}

func convertTimeToFfiTime(time: DateTime): FfiTime {
    return FfiTime(
        time.year,
        time.month.toInteger(),
        time.dayOfMonth,
        time.hour,
        time.minute,
        time.second,
        time.nanosecond
    )
}

func convertTimeToDateTime(time: FfiTime): DateTime {
    return DateTime.of(year: time.year, month: time.month, dayOfMonth: time.day)
}

foreign {
    func FfiOHOSAceFrameworkDatePickerCreate(start: FfiTime, end: FfiTime, selected: FfiTime): Unit

    func FfiOHOSAceFrameworkDatePickerCreateWithChangeEvent(start: FfiTime, end: FfiTime, selected: FfiTime,
        callback: Int64): Unit

    func FfiOHOSAceFrameworkDatePickerSetLunar(isLunar: Bool): Unit

    func FfiOHOSAceFrameworkDatePickerUseMilitaryTime(isUseMilitaryTime: Bool): Unit

    func FfiOHOSAceFrameworkDatePickerSetOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkDatePickerSetOnDateChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkDatePickerSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkDatePickerSetDisappearTextStyle(color: UInt32, size: Float64, unit: Int32, weight: CString,
        family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkDatePickerSetTextStyle(color: UInt32, size: Float64, unit: Int32, weight: CString,
        family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkDatePickerSetSelectedTextStyle(color: UInt32, size: Float64, unit: Int32, weight: CString,
        family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkDatePickerSetOpacity(opacity: Float64): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class DatePicker <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: DateTime = DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1),
        end!: DateTime = DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31),
        selected!: DateTime = DateTime.now()
    ) {
        let ffiStart = convertTimeToFfiTime(start)
        let ffiEnd = convertTimeToFfiTime(end)
        let ffiSelected = convertTimeToFfiTime(selected)

        unsafe {
            FfiOHOSAceFrameworkDatePickerCreate(ffiStart, ffiEnd, ffiSelected)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lunar(isLunar: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkDatePickerSetLunar(isLunar)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDateChange(callback: (DatePickerResult) -> Unit): This {
        let wrapper = {
            year: Int64, month: Int64, day: Int64 => callback(DatePickerResult(year, month, day))
        }
        let lambdaData = Callback3Param<Int64, Int64, Int64, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkDatePickerSetOnDateChange(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disappearTextStyle(
        color!: ResourceColor = 0xff182431,
        size!: Length = 14.fp,
        weight!: FontWeight = FontWeight.Regular,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var color_ = transAppResourceToResourceColor(color)
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString: ?CString = None
            var fontFamilyCString: ?CString = None
            try {
                weightCString = LibC.mallocCString(weight.getValue())
                fontFamilyCString = LibC.mallocCString(family)
                FfiOHOSAceFrameworkDatePickerSetDisappearTextStyle(color_, size_.value, size_.unitType.getValue(),
                    weightCString.getOrThrow(), fontFamilyCString.getOrThrow(), style.getValue())
            } finally {
                weightCString?.free()
                fontFamilyCString?.free()
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disappearTextStyle(
        color!: ResourceColor = 0xff182431,
        size!: Length,
        weight!: FontWeight = FontWeight.Regular,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        disappearTextStyle(
            color: color,
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textStyle(
        color!: ResourceColor = 0xff182431,
        size!: Length = 16.fp,
        weight!: FontWeight = FontWeight.Regular,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var color_ = transAppResourceToResourceColor(color)
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString: ?CString = None
            var fontFamilyCString: ?CString = None
            try {
                weightCString = LibC.mallocCString(weight.getValue())
                fontFamilyCString = LibC.mallocCString(family)
                FfiOHOSAceFrameworkDatePickerSetTextStyle(color_, size_.value, size_.unitType.getValue(),
                    weightCString.getOrThrow(), fontFamilyCString.getOrThrow(), style.getValue())
            } finally {
                weightCString?.free()
                fontFamilyCString?.free()
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textStyle(
        color!: ResourceColor = 0xff182431,
        size!: Length,
        weight!: FontWeight = FontWeight.Regular,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        textStyle(
            color: color,
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedTextStyle(
        color!: ResourceColor = 0xff007dff,
        size!: Length = 20.vp,
        weight!: FontWeight = FontWeight.Medium,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        var color_ = transAppResourceToResourceColor(color)
        var size_ = transAppResourceToLength(size)
        unsafe {
            var weightCString: ?CString = None
            var fontFamilyCString: ?CString = None
            try {
                weightCString = LibC.mallocCString(weight.getValue())
                fontFamilyCString = LibC.mallocCString(family)
                FfiOHOSAceFrameworkDatePickerSetSelectedTextStyle(color_, size_.value, size_.unitType.getValue(),
                    weightCString.getOrThrow(), fontFamilyCString.getOrThrow(), style.getValue())
            } finally {
                weightCString?.free()
                fontFamilyCString?.free()
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedTextStyle(
        color!: ResourceColor = 0xff007dff,
        size!: Length,
        weight!: FontWeight = FontWeight.Medium,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        selectedTextStyle(
            color: color,
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func opacity(opacityValue: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkDatePickerSetOpacity(opacityValue)
        }
        this
    }
}

