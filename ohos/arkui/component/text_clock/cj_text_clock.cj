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
 * @class DateTimeOptions
 * @relation interface DateTimeOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DateTimeOptions {
    /**
     * Valid locale ID, for example, "zh-Hans-CN". The default value is the current system locale.
     *
     * @type { String }
     * @relation locale?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var locale: String

    /**
     * Date display format. The value can be: "long", "short", "medium", "full", or "auto".
     *
     * @type { String }
     * @relation dateStyle?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dateStyle: String

    /**
     * Time display format. The value can be: "long", "short", "medium", "full", or "auto".
     *
     * @type { String }
     * @relation timeStyle?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeStyle: String

    /**
     * Hour cycle. The value can be: "h11", "h12", "h23", or "h24".
     *
     * @type { String }
     * @relation hourCycle?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hourCycle: String

    /**
     * Time zone in use. The value is a valid IANA time zone ID.
     *
     * @type { String }
     * @relation timeZone?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZone: String

    /**
     * Numbering system. The value can be: "adlm", "ahom", "arab", "arabext", "bali", "beng", "bhks",
     * "brah", "cakm", "cham", "deva", "diak", "fullwide", "gong", "gonm", "gujr", "guru", "hanidec", "hmng", "hmnp",
     * "java", "kali", "khmr", "knda", "lana", "lanatham", "laoo", "latn", "lepc", "limb", "mathbold", "mathdbl",
     * "mathmono", "mathsanb", "mathsans", "mlym", "modi", "mong", "mroo", "mtei", "mymr", "mymrshan", "mymrtlng",
     * "newa", "nkoo", "olck", "orya", "osma", "rohg", "saur", "segment", "shrd", "sind", "sinh", "sora", "sund",
     * "takr", "talu", "tamldec", "telu", "thai", "tibt", "tirh", "vaii", "wara", or "wcho".
     *
     * @type { String }
     * @relation numberingSystem?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var numberingSystem: String

    /**
     * Whether to use the 12-hour clock. The value true means to use the 12-hour clock, and the value false means the
     * opposite. If both hour12 and hourCycle are set, hourCycle does not take effect. If hour12 and hourCycle are not
     * set and the 24-hour clock is turned on, the default value of hour12 is false.
     *
     * @type { Bool }
     * @relation hour12?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour12: Bool

    /**
     * Week display format. The value can be: "long", "short", "narrow", or "auto".
     *
     * @type { String }
     * @relation weekday?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weekday: String

    /**
     * Epoch display format. The value can be: "long", "short", "narrow", or "auto".
     *
     * @type { String }
     * @relation era?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var era: String

    /**
     * Year display format. The value can be: "numeric" or "2-digit".
     *
     * @type { String }
     * @relation year?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var year: String

    /**
     * Month display format. The value can be: "numeric", "2-digit", "long", "short", "narrow", or "auto".
     *
     * @type { String }
     * @relation month?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var month: String

    /**
     * Day display format. The value can be: "numeric" or "2-digit".
     *
     * @type { String }
     * @relation day?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var day: String

    /**
     * Hour display format. The value can be: "numeric" or "2-digit".
     *
     * @type { String }
     * @relation hour?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour: String

    /**
     * Minute display format. The value can be: "numeric" or "2-digit".
     *
     * @type { String }
     * @relation minute?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var minute: String

    /**
     * Second display format. The value can be: "numeric" or "2-digit".
     *
     * @type { String }
     * @relation second?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var second: String

    /**
     * Localized representation of a time zone name. The value can be: "long", "short", or "auto".
     *
     * @type { String }
     * @relation timeZoneName?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZoneName: String

    /**
     * Time period display format. The value can be: "long", "short", "narrow", or "auto".
     *
     * @type { String }
     * @relation dayPeriod?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dayPeriod: String

    /**
     * Locale matching algorithm. The value can be:
     * "lookup": exact match.
     * "best fit": best match.
     *
     * @type { String }
     * @relation localeMatcher?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localeMatcher: String

    /**
     * Format matching algorithm. The value can be:
     * "basic": exact match.
     * "best fit": best match.
     *
     * @type { String }
     * @relation formatMatcher?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var formatMatcher: String

    /**
     * DateTimeOptions Constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(locale!: String = "zh-Hans-CN", dateStyle!: String = "long", timeStyle!: String = "long",
        hourCycle!: String = "h11", timeZone!: String = "", numberingSystem!: String = "adlm", hour12!: Bool = false,
        weekday!: String = "long", era!: String = "long", year!: String = "numeric", month!: String = "numeric",
        day!: String = "numeric", hour!: String = "numeric", minute!: String = "numeric", second!: String = "numeric",
        timeZoneName!: String = "long", dayPeriod!: String = "long", localeMatcher!: String = "lookup",
        formatMatcher!: String = "basic") {
        this.locale = locale
        this.dateStyle = dateStyle
        this.timeStyle = timeStyle
        this.hourCycle = hourCycle
        this.timeZone = timeZone
        this.numberingSystem = numberingSystem
        this.hour12 = hour12
        this.weekday = weekday
        this.era = era
        this.year = year
        this.month = month
        this.day = day
        this.hour = hour
        this.minute = minute
        this.second = second
        this.timeZoneName = timeZoneName
        this.dayPeriod = dayPeriod
        this.localeMatcher = localeMatcher
        this.formatMatcher = formatMatcher
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
 * @relation class TextClockController
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClockController <: RemoteDataLite {
    /**
     * constructor.
     *
     * @relation constructor()
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation start(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation stop(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 * @relation const TextClock: TextClockInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class TextClock <: ViewBase {
    /**
     * Construct the text clock component.
     * Specifies the current time zone.
     * The valid value is an integer ranging from - 14 to 12,
     * Where a negative value indicates the eastern time zone, for example, -8.
     * Anonymous Object Rectification.
     *
     * @param { ?Float32 } timeZoneOffset
     * @param { TextClockController } controller
     * @returns { TextClock }
     * @relation (options?: TextClockOptions): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timeZoneOffset!: ?Float32 = None, controller!: TextClockController = TextClockController()) {
        unsafe {
            match (timeZoneOffset) {
                case Some(v) =>
                    FfiOHOSAceFrameworkTextClockCreateV2(v, controller.getID())
                case _ =>
                    FfiOHOSAceFrameworkTextClockCreateSimple(controller.getID())
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
     * @param { function } event - Listening date event callback.
     * @returns { This }
     * @relation onDateChange(event: (value: number) => void): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDateChange(callback: (Int64) -> Unit): This {
        let lambdaData = Callback1Param<Int64, Unit>(callback)
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
     * @param { ResourceStr } value
     * @returns { This }
     * @relation format(value: ResourceStr): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func format(value: ResourceStr): This {
        let value_ = transResourceStrToString(value)
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
     * @param { Length } value
     * @returns { This }
     * @relation fontSize(value: Length): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextClockFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

    /**
     * Called when the value of TextClock fontColor is set
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation fontColor(value: ResourceColor): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkTextClockTextColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Called when the value of TextClock fontStyle is set
     *
     * @param { FontStyle } value
     * @returns { This }
     * @relation fontStyle(value: FontStyle): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkTextClockFontStyle(value.getValue())
        }
        this
    }

    /**
     * Called when the value of TextClock fontWeight is set
     *
     * @param { FontWeight } value
     * @returns { This }
     * @relation fontWeight(value: number | FontWeight | string): TextClockAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkTextClockFontWeight(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    /**
     * Called when the value of TextClock fontFamily is set
     *
     * @param { ResourceStr } value
     * @returns { This }
     * @relation fontFamily(value: ResourceStr): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ResourceStr): This {
        let value_ = transResourceStrToString(value)
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
     * @param { Array<ShadowOptions> } value - The shadow options.
     * @returns { This }
     * @relation textShadow(value: ShadowOptions | Array<ShadowOptions>): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(values: Array<ShadowOptions>): This {
        let vecValueHandle = CJVectorNativeTextShadow(values.size)
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, values[i].toNative())
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
     * @param { ShadowOptions } value - The shadow options.
     * @returns { This }
     * @relation textShadow(value: ShadowOptions | Array<ShadowOptions>): TextClockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: ShadowOptions): This {
        let thisShadow: NativeTextShadowV2 = NativeTextShadowV2(value.radius, value.offsetX, value.offsetY,
            transAppResourceToResourceColor(value.color), value.fill, value.shadowType.getValue())
        let vecValueHandle = CJVectorNativeTextShadow(1)
        vecValueHandle.setElement(0, thisShadow)
        unsafe {
            FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }
}
