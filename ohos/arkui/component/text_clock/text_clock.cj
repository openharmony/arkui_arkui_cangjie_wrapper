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

package ohos.arkui.component.text_clock

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

import std.convert.*

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
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DateTimeOptions {
    /**
     * Valid locale ID, for example, "zh-Hans-CN". The default value is the current system locale.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var locale: ?String

    /**
     * Date display format. The value can be: "long", "short", "medium", "full", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dateStyle: ?String

    /**
     * Time display format. The value can be: "long", "short", "medium", "full", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeStyle: ?String

    /**
     * Hour cycle. The value can be: "h11", "h12", "h23", or "h24".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hourCycle: ?String

    /**
     * Time zone in use. The value is a valid IANA time zone ID.
     *
     */
    @!APILevel[
        22,
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
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var numberingSystem: ?String

    /**
     * Whether to use the 12-hour clock. The value true means to use the 12-hour clock, and the value false means the
     * opposite. If both hour12 and hourCycle are set, hourCycle does not take effect. If hour12 and hourCycle are not
     * set and the 24-hour clock is turned on, the default value of hour12 is false.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour12: ?Bool

    /**
     * Week display format. The value can be: "long", "short", "narrow", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weekday: ?String

    /**
     * Epoch display format. The value can be: "long", "short", "narrow", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var era: ?String

    /**
     * Year display format. The value can be: "numeric" or "2-digit".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var year: ?String

    /**
     * Month display format. The value can be: "numeric", "2-digit", "long", "short", "narrow", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var month: ?String

    /**
     * Day display format. The value can be: "numeric" or "2-digit".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var day: ?String

    /**
     * Hour display format. The value can be: "numeric" or "2-digit".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour: ?String

    /**
     * Minute display format. The value can be: "numeric" or "2-digit".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var minute: ?String

    /**
     * Second display format. The value can be: "numeric" or "2-digit".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var second: ?String

    /**
     * Localized representation of a time zone name. The value can be: "long", "short", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZoneName: ?String

    /**
     * Time period display format. The value can be: "long", "short", "narrow", or "auto".
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dayPeriod: ?String

    /**
     * Locale matching algorithm. The value can be:
     * "lookup": exact match.
     * "best fit": best match.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localeMatcher: ?String

    /**
     * Format matching algorithm. The value can be:
     * "basic": exact match.
     * "best fit": best match.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var formatMatcher: ?String

    /**
     * DateTimeOptions Constructor.
     */
    @!APILevel[
        22,
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
}

/**
 * Provides a way to control the textclock status.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClockController <: RemoteDataLite {
    /**
     * constructor.
     *
     */
    @!APILevel[
        22,
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
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextClockControllerStart(this.getID())
        }
    }
    /**
     * Provides a stop event for textclock.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextClockControllerStop(this.getID())
        }
    }
}

/**
 * Defines TextClock Component.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClock <: CommonMethodComponent<TextClockAttribute> & TextClockAttribute {
    /**
     * Construct the text clock component.
     * Specifies the current time zone.
     * The valid value is an integer ranging from - 14 to 12,
     * Where a negative value indicates the eastern time zone, for example, -8.
     * Anonymous Object Rectification.
     *
     * @params { ?Float32 } timeZoneOffset
     * @params { TextClockController } controller
     * @returns { TextClock }
     */
    @!APILevel[
        22,
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
     * @params { function } event - Listening date event callback.
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * set display time format,such as "yyyy/mm/dd","yyyy-mm-dd".
     * support time format：yyyy,mm,mmm(English month abbreviation),mmmm(Full name of the month in English),
     * dd,ddd(English Week abbreviation),dddd(Full name of the week in English),
     * HH/hh(24-hour clock/12-hour clock),MM/mm(minute),SS/ss(second).
     * The default value is "hh:mm:ss" when TextClock is not in a form.
     * The default value is "hh:mm" when TextClock is in a form.
     * If the value has second or millisecond, the value will be set to the default value.
     *
     * @params { ResourceStr } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * Called when the value of TextClock fontSize is set
     *
     * @params { Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 16.0.fp)
        unsafe {
            FfiOHOSAceFrameworkTextClockFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

    /**
     * Called when the value of TextClock fontColor is set
     *
     * @params { ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextClockTextColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Called when the value of TextClock fontStyle is set
     *
     * @params { FontStyle } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * Called when the value of TextClock fontWeight is set
     *
     * @params { FontWeight } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * Called when the value of TextClock fontFamily is set
     *
     * @params { ResourceStr } value
     * @returns { This }
     */
    @!APILevel[
        22,
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
     * Called when the text shadow is set.
     *
     * @params { Array<ShadowOptions> } value - The shadow options.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(values: ?Array<ShadowOptions>): This {
        let tmpValues = values ?? throw IllegalArgumentException("The type now is not supported.")
        let vecValueHandle = CJVectorNativeTextShadow(tmpValues.size)
        for (i in 0..tmpValues.size) {
            vecValueHandle.setElement(i, tmpValues[i].toNative())
        }
        unsafe {
            FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    /**
     * Called when the text shadow is set.
     *
     * @params { ShadowOptions } value - The shadow options.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: ?ShadowOptions): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let thisShadow: NativeTextShadowV2 = NativeTextShadowV2(tmpValue.radius ?? 0.0,
            tmpValue.offsetX ?? 0.0, tmpValue.offsetY ?? 0.0,
            transAppResourceToResourceColor(tmpValue.color ?? Color.Black), tmpValue.fill ?? false, (tmpValue.shadowType ?? ShadowType.Color).getValue())
        let vecValueHandle = CJVectorNativeTextShadow(1)
        vecValueHandle.setElement(0, thisShadow)
        unsafe {
            FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }
}
