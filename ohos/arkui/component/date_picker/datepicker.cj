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

package ohos.arkui.component.date_picker

import ohos.arkui.component.common.*
import ohos.arkui.component.text_clock.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import std.time.*

/**
 * Defines the struct of DatePickerResult.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DatePickerResult {
    /**
     * Year of the selected date.
     *
     * <p><strong>NOTE</strong>:
     * <br>Value range: depends on start and end.
     * If start and end are not set, the default range is [1970, 2100].
     * </p>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var year: Int64
    /**
     * Month index of the selected date.
     * The index is zero-based. 0 indicates January, and 11 indicates December.
     *
     * <p><strong>NOTE</strong>:
     * <br>Value range: depends on start and end. If start and end are not set, the default range is [0, 11].
     * </p>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var month: Int64
    /**
     * Day of the selected date.
     *
     * <p><strong>NOTE</strong>:
     * <br>Value range: depends on start and end. If start and end are not set, the default range is [1, 31].
     * </p>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var day: Int64

    /**
     * DatePickerResult constructor.
     *
     * @param { Int64 } year - Year of the selected date.
     * @param { Int64 } month - Month index of the selected date (0-11).
     * @param { Int64 } day - Day of the selected date.
     */
    @!APILevel[
        22,
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

/**
 * Defines DatePicker Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DatePicker <: CommonMethodComponent<DatePicker> & DatePickerAttribute {
    /**
     * Parameters of the date picker.
     *
     * @param { ?DateTime } [start] - Start date of the picker.
     * @param { ?DateTime } [end] - End date of the picker.
     * @param { ?DateTime } [selected] - Date of the selected item.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: ?DateTime = None,
        end!: ?DateTime = None,
        selected!: ?DateTime = None
    ) {
        let ffiStart = convertTimeToFfiTime(start ?? DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1))
        let ffiEnd = convertTimeToFfiTime(end ?? DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31))
        let ffiSelected = convertTimeToFfiTime(selected ?? DateTime.now())

        unsafe {
            FfiOHOSAceFrameworkDatePickerCreate(ffiStart, ffiEnd, ffiSelected)
        }
    }

    /**
     * Specifies whether to display the lunar calendar.
     *
     * @param { ?Bool } value - Whether to display the lunar calendar.
     * <br>- <em>true</em>: Display the lunar calendar.
     * <br>- <em>false</em>: Do not display the lunar.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lunar(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkDatePickerSetLunar(value ?? false)
        }
        this
    }

    /**
     * Triggered when a date is selected.
     *
     * @param { ?Callback<DateTime, Unit> } callback - The callback on date change.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDateChange(callback: ?Callback<DateTime, Unit>): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            y: Int64, m: Int64, d: Int64 => tmpCallback(DateTime.of(year: y, month: Month.of(m), dayOfMonth: d))
        }
        let lambdaData = Callback3Param<Int64, Int64, Int64, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkDatePickerSetOnDateChange(lambdaData.getID())
        }
        this
    }

    /**
     * Sets the text style for the top and bottom items.
     *
     * @param { ?PickerTextStyle } value - Font color, font size, and font weight of the top and bottom items.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disappearTextStyle(value: ?PickerTextStyle): This {
        let tmpValue = value ?? PickerTextStyle()
        var color: UInt32 = 0xff182431
        var size: Length = 14.fp
        var weight: FontWeight = FontWeight.Regular
        var family: String = "HarmonyOS Sans"
        var style: FontStyle = FontStyle.Normal

        if (let Some(v) <- tmpValue.color) {
            color = transAppResourceToResourceColor(v)
        }

        if (let Some(font) <- tmpValue.font) {
            if (let Some(v) <- font.size) {
                size = transAppResourceToLength(v)
            }
            if (let Some(v) <- font.weight) {
                weight = v
            }
            if (let Some(v) <- font.family) {
                family = transResourceStrToString(v)
            }
            if (let Some(v) <- font.style) {
                style = v
            }
        }

        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                 fontFamilyCString = LibC.mallocCString(family).asResource()
            ) {
                FfiOHOSAceFrameworkDatePickerSetDisappearTextStyle(color, size.value, size.unitType.getValue(),
                    weightCString.value, fontFamilyCString.value, style.getValue())
            }
        }
        this
    }

    /**
     * Sets the text style for all items except the top, bottom, and selected items.
     *
     * @param { ?PickerTextStyle } value - Font color, font size, and font weight of all items except the top,
     *   <br>bottom, and selected items.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textStyle(value: ?PickerTextStyle): This {
        let tmpValue = value ?? PickerTextStyle()
        var color: UInt32 = 0xff182431
        var size: Length = 16.fp
        var weight: FontWeight = FontWeight.Regular
        var family: String = "HarmonyOS Sans"
        var style: FontStyle = FontStyle.Normal

        if (let Some(v) <- tmpValue.color) {
            color = transAppResourceToResourceColor(v)
        }

        if (let Some(font) <- tmpValue.font) {
            if (let Some(v) <- font.size) {
                size = transAppResourceToLength(v)
            }
            if (let Some(v) <- font.weight) {
                weight = v
            }
            if (let Some(v) <- font.family) {
                family = transResourceStrToString(v)
            }
            if (let Some(v) <- font.style) {
                style = v
            }
        }

        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                 fontFamilyCString = LibC.mallocCString(family).asResource()
            ) {
                FfiOHOSAceFrameworkDatePickerSetTextStyle(color, size.value, size.unitType.getValue(),
                    weightCString.value, fontFamilyCString.value, style.getValue())
            }
        }
        this
    }

    /**
     * Sets the text style for the selected item.
     *
     * @param { ?PickerTextStyle } value - Font color, font size, and font weight of the selected item.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedTextStyle(value: ?PickerTextStyle): This {
        let tmpValue = value ?? PickerTextStyle()
        var color: UInt32 = 0xff007dff
        var size: Length = 20.fp
        var weight: FontWeight = FontWeight.Medium
        var family: String = "HarmonyOS Sans"
        var style: FontStyle = FontStyle.Normal

        if (let Some(v) <- tmpValue.color) {
            color = transAppResourceToResourceColor(v)
        }

        if (let Some(font) <- tmpValue.font) {
            if (let Some(v) <- font.size) {
                size = transAppResourceToLength(v)
            }
            if (let Some(v) <- font.weight) {
                weight = v
            }
            if (let Some(v) <- font.family) {
                family = transResourceStrToString(v)
            }
            if (let Some(v) <- font.style) {
                style = v
            }
        }

        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                 fontFamilyCString = LibC.mallocCString(family).asResource()
            ) {
                FfiOHOSAceFrameworkDatePickerSetSelectedTextStyle(color, size.value, size.unitType.getValue(),
                    weightCString.value, fontFamilyCString.value, style.getValue())
            }
        }
        this
    }

    protected override func opacityInner(opacityValue: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkDatePickerSetOpacity(opacityValue ?? 1.0)
        }
        this
    }
}
