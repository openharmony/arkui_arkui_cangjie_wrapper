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

import std.time.*
import ohos.labels.APILevel
import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkTimePickerCreate(selected: FfiTime, format: Int32): Unit

    func FfiOHOSAceFrameworkTimePickerSetUseMilitaryTime(value: Bool): Unit

    func FfiOHOSAceFrameworkTimePickerSetDisappearTextStyle(style: NativePickerTextStyle): Unit

    func FfiOHOSAceFrameworkTimePickerSetTextStyle(style: NativePickerTextStyle): Unit

    func FfiOHOSAceFrameworkTimePickerSetSelectedTextStyle(style: NativePickerTextStyle): Unit

    func FfiOHOSAceFrameworkTimePickerSetLoop(value: Bool): Unit

    func FfiOHOSAceFrameworkTimePickerSetEnableHapticFeedback(value: Bool): Unit

    func FfiOHOSAceFrameworkTimePickerDateTimeOptions(hourType: CString, minuteType: CString, secondType: CString): Unit

    func FfiOHOSAceFrameworkTimePickerSetOnChange(callback: Int64): Unit
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TimePickerFormat {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HourMinute
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HourMinuteSecond
    | ...

    func getValue(): Int32 {
        match (this) {
            case HourMinute => 0
            case HourMinuteSecond => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TimePickerResult {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour: Int64

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var minute: Int64

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var second: Int64

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(hour: Int64, minute: Int64, second: Int64) {
        this.hour = hour
        this.minute = minute
        this.second = second
    }
}

/**
 * Defines the TimePicker Component.
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TimePicker <: ViewBase {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selected!: DateTime = DateTime.now(), format!: TimePickerFormat = TimePickerFormat.HourMinute) {
        let ffiSelected = convertTimeToFfiTime(selected)
        unsafe {
            FfiOHOSAceFrameworkTimePickerCreate(ffiSelected, format.getValue())
        }
    }

    /**
     * Time Selector: indicates whether to display the 24-hour clock.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func useMilitaryTime(value: ?Bool): This {
        let innerValue: Bool = match (value) {
            case Some(v) => v
            case None => false
        }
        unsafe {
            FfiOHOSAceFrameworkTimePickerSetUseMilitaryTime(innerValue)
        }
        this
    }

    /**
     * Sets the text style of disappearing items.
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disappearTextStyle(style: ?PickerTextStyle): This {
        let innerValue: PickerTextStyle = match (style) {
            case Some(v) => v
            case None => PickerTextStyle(0xff182431, MyFont(weight: FontWeight.Regular))
        }
        unsafe {
            let PickerTextSytle_ = convertToNativePickerTextStyle(innerValue)
            FfiOHOSAceFrameworkTimePickerSetDisappearTextStyle(PickerTextSytle_)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textStyle(style: ?PickerTextStyle): This {
        let innerValue: PickerTextStyle = match (style) {
            case Some(v) => v
            case None => PickerTextStyle(0xff182431, MyFont(weight: FontWeight.Regular))
        }
        unsafe {
            let PickerTextSytle_ = convertToNativePickerTextStyle(innerValue)
            FfiOHOSAceFrameworkTimePickerSetTextStyle(PickerTextSytle_)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedTextStyle(style: ?PickerTextStyle): This {
        let innerValue: PickerTextStyle = match (style) {
            case Some(v) => v
            case None => PickerTextStyle(0xff007dff, MyFont(size: 20.fp, weight: FontWeight.Regular))
        }
        unsafe {
            let PickerTextSytle_ = convertToNativePickerTextStyle(innerValue)
            FfiOHOSAceFrameworkTimePickerSetSelectedTextStyle(PickerTextSytle_)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func loop(value: ?Bool): This {
        let innerValue: Bool = match (value) {
            case Some(v) => v
            case None => true
        }
        unsafe {
            FfiOHOSAceFrameworkTimePickerSetLoop(innerValue)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableHapticFeedback(value: ?Bool): This {
        let innerValue: Bool = match (value) {
            case Some(v) => v
            case None => true
        }
        unsafe {
            FfiOHOSAceFrameworkTimePickerSetEnableHapticFeedback(innerValue)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dateTimeOptions(hour!: String, minute!: String, second!: String): This {
        unsafe {
            try (hour_ = LibC.mallocCString(hour).asResource(), minute_ = LibC.mallocCString(minute).asResource(), second_ = LibC
                .mallocCString(second)
                .asResource()) {
                FfiOHOSAceFrameworkTimePickerDateTimeOptions(hour_.value, minute_.value, second_.value)
            }
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(TimePickerResult) -> Unit): This {
        if (callback.isNone()) {
            return this
        }
        let innerCallBack = callback.getOrThrow()
        let wrapper = {
            hourArg: Int32, minuteArg: Int32, secondArg: Int32 =>
            let innerCallBack = callback.getOrThrow()
            innerCallBack(TimePickerResult(Int64(hourArg), Int64(minuteArg), Int64(secondArg)))
        }
        let lambdaData = Callback3Param<Int32, Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTimePickerSetOnChange(lambdaData.getID())
        }
        this
    }
}
