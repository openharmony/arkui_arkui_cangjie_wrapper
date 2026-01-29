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

package ohos.arkui.component.text_clock

import ohos.arkui.component.common.{CommonMethodComponent, FontStyle, FontWeight, ShadowOptions, ShadowType}
import ohos.arkui.component.native_struct.{VectorNativeTextShadow, NativeTextShadowV2}
import ohos.arkui.component.util.{transResourceStrToString, transAppResourceToLength, transAppResourceToResourceColor, getLengthUnitOrFp, lessNotEqual, LENGTH_PERCENT}
import ohos.ffi.{RemoteDataLite, Callback1Param, releaseFFIData}
import ohos.base.{ResourceStr, Length, ResourceColor, Color, LengthProp}
import ohos.labels.{APILevel}

foreign {
    func FFICJCreateVectorNativeTextShadowV2(size: Int64): VectorNativeTextShadow

    func FFICJVectorNativeTextShadowSetElementV2(vec: VectorNativeTextShadow, index: Int64,
        thisShadow: NativeTextShadowV2): Unit

    func FFICJVectorNativeTextShadowDeleteV2(vec: VectorNativeTextShadow): Unit
}

class CJVectorNativeTextShadow {
    private let vecHandle: VectorNativeTextShadow

    init(vec: VectorNativeTextShadow) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeTextShadowV2(size) }
    }

    func setElement(index: Int64, value: NativeTextShadowV2): Unit {
        unsafe { FFICJVectorNativeTextShadowSetElementV2(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorNativeTextShadowDeleteV2(vecHandle) }
    }

    func getNativeHandle(): VectorNativeTextShadow {
        vecHandle
    }
}

/**
 * Defines the options for a DateTimeOptions object. Since API version 9, the DateTimeOptions attribute is changed
 * from mandatory to optional.
 * Provides configuration options for date and time formatting in TextClock component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DateTimeOptions {
    /**
     * Valid locale ID, for example, "zh-Hans-CN". The default value is the current system locale.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var locale: ?String

    /**
     * Date display format. The value can be: "long", "short", "medium", "full", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dateStyle: ?String

    /**
     * Time display format. The value can be: "long", "short", "medium", "full", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeStyle: ?String

    /**
     * Hour cycle. The value can be: "h11", "h12", "h23", or "h24".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hourCycle: ?String

    /**
     * Time zone in use. The value is a valid IANA time zone ID.
     * Specifies the time zone for date and time display.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZone: ?String

    /**
     * Numbering system. The value can be: "adlm", "ahom", "arab", "arabext", "bali", "beng", "bhks",
     * "brah", "cakm", "cham", "deva", "diak", "fullwide", "gong", "gonm", "gujr", "guru", "hanidec", "hmng", "hmnp",
     * "java", "kali", "khmr", "knda", "lana", "lanatham", "laoo", "latn", "lepc", "limb", "mathbold", "mathdbl",
     * "mathmono", "mathsanb", "mathsans", "mlym", "modi", "mong", "mroo", "mtei", "mymr", "mymrshan", "mymrtlng",
     * "newa", "nkoo", "olck", "orya", "osma", "rohg", "saur", "segment", "shrd", "sind", "sinh", "sora", "sund",
     * "takr", "talu", "tamldec", "telu", "thai", "tibt", "tirh", "vaii", "wara", or "wcho".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var numberingSystem: ?String

    /**
     * Whether to use the 12-hour clock. The value true means to use the 12-hour clock, and the value false means the
     * opposite. If both hour12 and hourCycle are set, hourCycle does not take effect. If hour12 and hourCycle are not
     * set and the 24-hour clock is turned on.
     * Controls whether to use 12-hour or 24-hour time format.
     * @default false
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour12: ?Bool

    /**
     * Week display format. The value can be: "long", "short", "narrow", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weekday: ?String

    /**
     * Epoch display format. The value can be: "long", "short", "narrow", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var era: ?String

    /**
     * Year display format. The value can be: "numeric" or "2-digit".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var year: ?String

    /**
     * Month display format. The value can be: "numeric", "2-digit", "long", "short", "narrow", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var month: ?String

    /**
     * Day display format. The value can be: "numeric" or "2-digit".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var day: ?String

    /**
     * Hour display format. The value can be: "numeric" or "2-digit".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour: ?String

    /**
     * Minute display format. The value can be: "numeric" or "2-digit".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var minute: ?String

    /**
     * Second display format. The value can be: "numeric" or "2-digit".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var second: ?String

    /**
     * Localized representation of a time zone name. The value can be: "long", "short", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZoneName: ?String

    /**
     * Time period display format. The value can be: "long", "short", "narrow", or "auto".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dayPeriod: ?String

    /**
     * Locale matching algorithm. The value can be:
     * "lookup": exact match.
     * "best fit": best match.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localeMatcher: ?String

    /**
     * Format matching algorithm. The value can be:
     * "basic": exact match.
     * "best fit": best match.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var formatMatcher: ?String

    /**
     * Creates a new DateTimeOptions instance with the specified formatting options.
     *
     * @param { ?String } locale - Valid locale ID, for example, "zh-Hans-CN".
     * @param { ?String } dateStyle - Date display format.
     * @param { ?String } timeStyle - Time display format.
     * @param { ?String } hourCycle - Hour cycle.
     * @param { ?String } timeZone - Time zone in use.
     * @param { ?String } numberingSystem - Numbering system.
     * @param { ?Bool } hour12 - Whether to use the 12-hour clock.
     * @param { ?String } weekday - Week display format.
     * @param { ?String } era - Epoch display format.
     * @param { ?String } year - Year display format.
     * @param { ?String } month - Month display format.
     * @param { ?String } day - Day display format.
     * @param { ?String } hour - Hour display format.
     * @param { ?String } minute - Minute display format.
     * @param { ?String } second - Second display format.
     * @param { ?String } timeZoneName - Localized representation of a time zone name.
     * @param { ?String } dayPeriod - Time period display format.
     * @param { ?String } localeMatcher - Locale matching algorithm.
     * @param { ?String } formatMatcher - Format matching algorithm.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(locale!: ?String = None, dateStyle!: ?String = None, timeStyle!: ?String = None,
        hourCycle!: ?String = None, timeZone!: ?String = None, numberingSystem!: ?String = None, hour12!: ?Bool = None,
        weekday!: ?String = None, era!: ?String = None, year!: ?String = None, month!: ?String = None,
        day!: ?String = None, hour!: ?String = None, minute!: ?String = None, second!: ?String = None,
        timeZoneName!: ?String = None, dayPeriod!: ?String = None, localeMatcher!: ?String = None,
        formatMatcher!: ?String = None) {

        this.locale = locale ?? "zh-Hans-CN"
        this.dateStyle = dateStyle ?? "long"
        this.timeStyle = timeStyle ?? "long"
        this.hourCycle = hourCycle ?? "h11"
        this.timeZone = timeZone ?? ""
        this.numberingSystem = numberingSystem ?? "adlm"
        this.hour12 = hour12 ?? false
        this.weekday = weekday ?? "long"
        this.era = era ?? "long"
        this.year = year ?? "numeric"
        this.month = month ?? "numeric"
        this.day = day ?? "numeric"
        this.hour = hour ?? "numeric"
        this.minute = minute ?? "numeric"
        this.second = second ?? "numeric"
        this.timeZoneName = timeZoneName ?? "long"
        this.dayPeriod = dayPeriod ?? "long"
        this.localeMatcher = localeMatcher ?? "lookup"
        this.formatMatcher = formatMatcher ?? "basic"
    }
}

foreign {
    func FfiOHOSAceFrameworkTextClockCreate(timeZoneOffset: Int32, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextClockCreateV2(timeZoneOffset: Float32, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextClockCreateSimple(controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextClockFormat(value: CString): Unit

    func FfiOHOSAceFrameworkTextClockOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextClockTextColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkTextClockFontSize(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextClockFontWeight(fontWeight: CString): Unit

    func FfiOHOSAceFrameworkTextClockFontStyle(value: Int32): Unit

    func FfiOHOSAceFrameworkTextClockFontFamily(fontFamily: CString): Unit

    func FfiOHOSAceFrameworkTextClockTextShadowV2(value: VectorNativeTextShadow): Unit

    func FfiOHOSAceFrameworkTextClockFontFeature(value: CString): Unit

    func FfiOHOSAceFrameworkTextClockControllerCtor(): Int64

    func FfiOHOSAceFrameworkTextClockControllerStart(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextClockControllerStop(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextClockDateTimeOptions(hourOptions: CString): Unit

    func FfiOHOSAceFrameworkTextClockResetTextColor(): Unit
}

/**
 * Provides a way to control the textclock status.
 * Allows starting and stopping the TextClock component updates.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClockController <: RemoteDataLite {
    /**
     * TextClockController constructor.
     * Creates a new TextClockController instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkTextClockControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    /**
     * Provides a start event for textclock.
     * Starts the TextClock updates.
     *
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextClockControllerStart(this.getID())
        }
    }
    /**
     * Provides a stop event for textclock.
     * Stops the TextClock updates.
     *
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextClockControllerStop(this.getID())
        }
    }
}

/**
 * A component that displays the current date and time, automatically updating at regular intervals.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClock <: CommonMethodComponent<TextClock> & TextClockAttribute {
    /**
     * Construct the text clock component.
     * Specifies the current time zone.
     * The valid value is an integer ranging from -14 to 12,
     * where a negative value indicates the western time zone and a positive value indicates the eastern time zone.
     *
     * @param { ?Float32 } timeZoneOffset - The time zone offset in hours.
     * @param { ?TextClockController } controller - The controller for the text clock.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timeZoneOffset!: ?Float32 = None, controller!: ?TextClockController = None) {
        let tmpController = controller ?? TextClockController()
        unsafe {
            match (timeZoneOffset) {
                case Some(v) =>
                    FfiOHOSAceFrameworkTextClockCreateV2(v, tmpController.getID())
                case _ =>
                    FfiOHOSAceFrameworkTextClockCreateSimple(tmpController.getID())
            }
        }
    }

    /**
     * Provides a date change callback.
     * The callback parameter is Unix Time Stamp,
     * The number of milliseconds that have elapsed since January 1, 1970 (UTC).
     * The minimum callback interval for this event default is seconds when TextClock is not in a form.
     * The minimum callback interval for this event is minutes when TextClock is in a form.
     * If visibility is Hidden the callback be disabled when TextClock is in a form.
     * You can listen to this callback,
     * Use the format attribute method to customize data display in the callback.
     *
     * @param { ?(Int64) -> Unit } callback - Listening date event callback.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDateChange(callback: ?(Int64) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        let lambdaData = Callback1Param<Int64, Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkTextClockOnChange(lambdaData.getID())
        }
        this
    }

    /**
     * Set display time format, such as "yyyy/mm/dd","yyyy-mm-dd".
     * Supports time format: yyyy,mm,mmm(English month abbreviation),mmmm(Full name of the month in English),
     * dd,ddd(English Week abbreviation),dddd(Full name of the week in English),
     * HH/hh(24-hour clock/12-hour clock),MM/mm(minute),SS/ss(second).
     * The default value is "hh:mm:ss" when TextClock is not in a form.
     * The default value is "hh:mm" when TextClock is in a form.
     * If the value has second or millisecond, the value will be set to the default value.
     *
     * @param { ?ResourceStr } value - The time format string.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func format(value: ?ResourceStr): This {
        let tmpValue = value ?? ""
        let value_ = transResourceStrToString(tmpValue)
        unsafe {
            try (valueCString = LibC.mallocCString(value_).asResource()) {
                FfiOHOSAceFrameworkTextClockFormat(valueCString.value)
            }
        }
        this
    }

    /**
     * Configures the font size of the text displayed in the TextClock.
     *
     * @param { ?Length } value - The font size.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 16.0.fp)
        if (lessNotEqual(value_.value, 0.0) || value_.unitType.getValue() == LENGTH_PERCENT) {
            value_ = 16.0.fp
        }
        unsafe {
            FfiOHOSAceFrameworkTextClockFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

    /**
     * Configures the font color of the text displayed in the TextClock.
     *
     * @param { ?ResourceColor } value - The font color resource.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkTextClockTextColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextClockResetTextColor()
            }
        }
        this
    }

    /**
     * Configures the font style of the text displayed in the TextClock.
     *
     * @param { ?FontStyle } value - The font style.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        let tmpValue = value ?? FontStyle.Normal
        unsafe {
            FfiOHOSAceFrameworkTextClockFontStyle(tmpValue.getValue())
        }
        this
    }

    /**
     * Configures the font weight of the text displayed in the TextClock.
     *
     * @param { ?FontWeight } value - The font weight.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        let tmpValue = value ?? FontWeight.Normal
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(tmpValue.getValue())
            FfiOHOSAceFrameworkTextClockFontWeight(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    /**
     * Configures the font family of the text displayed in the TextClock.
     *
     * @param { ?ResourceStr } value - The font family.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        let value_ = transResourceStrToString(value ?? "HarmonyOS Sans")
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(value_).asResource()) {
                FfiOHOSAceFrameworkTextClockFontFamily(unsafeFontFamily.value)
            }
        }
        this
    }

    /**
     * Applies a shadow effect to the text displayed in the TextClock.
     *
     * @param { ?Array<ShadowOptions> } values - The shadow options.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(values: ?Array<ShadowOptions>): This {
        if (let Some(v) <- values) {
            let vecValueHandle = CJVectorNativeTextShadow(v.size)
            for (i in 0..v.size) {
                vecValueHandle.setElement(i, v[i].toNative())
            }
            unsafe {
                FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
            }
            vecValueHandle.free()
        }
        this
    }

    /**
     * Applies a shadow effect to the text displayed in the TextClock.
     *
     * @param { ?ShadowOptions } value - The shadow options.
     * @returns { This } Returns the TextClock instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: ?ShadowOptions): This {
        if (let Some(v) <- value) {
            let thisShadow: NativeTextShadowV2 = NativeTextShadowV2(v.radius ?? 0.0,
                v.offsetX ?? 0.0, v.offsetY ?? 0.0,
                transAppResourceToResourceColor(v.color ?? Color.Black), v.fill ?? false, (v.shadowType ?? ShadowType.Color).getValue())
            let vecValueHandle = CJVectorNativeTextShadow(1)
            vecValueHandle.setElement(0, thisShadow)
            unsafe {
                FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
            }
            vecValueHandle.free()
        }
        this
    }
}
