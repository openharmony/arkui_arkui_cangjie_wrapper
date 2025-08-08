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

public type VectorNativeTextShadow = CPointer<Unit>

foreign {
    func FFICJCreateVectorNativeTextShadowV2(size: Int64): VectorNativeTextShadow

    func FFICJVectorNativeTextShadowSetElementV2(vec: VectorNativeTextShadow, index: Int64,
        thisShadow: NativeTextShadowV2): Unit

    func FFICJVectorNativeTextShadowDeleteV2(vec: VectorNativeTextShadow): Unit
}

@C
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public struct NativeTextShadowV2 {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NativeTextShadowV2(
        let radius: Float64,
        let offsetX: Float64,
        let offsetY: Float64,
        let color: UInt32,
        let fill: Bool,
        let shadowType: UInt32
    ) {}
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DateTimeOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var locale: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dateStyle: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeStyle: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hourCycle: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZone: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var numberingSystem: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour12: Bool

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weekday: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var era: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var year: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var month: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var day: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hour: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var minute: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var second: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZoneName: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dayPeriod: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localeMatcher: String

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var formatMatcher: String

    @!APILevel[
        19,
        atomicservice: true,
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClockConfiguration {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZoneOffset: Float32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var started: Bool

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeValue: Int64

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timeZoneOffset!: Float32, started!: Bool, timeValue!: Int64) {
        this.timeZoneOffset = timeZoneOffset
        this.started = started
        this.timeValue = timeValue
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClockOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timeZoneOffset: Float32

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var controller: TextClockController

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timeZoneOffset!: Float32, controller!: TextClockController) {
        this.timeZoneOffset = timeZoneOffset
        this.controller = controller
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextClockController <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextClockControllerStart(this.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextClockControllerStop(this.getID())
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class TextClock <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(timeZoneOffset!: Float32, controller!: TextClockController = TextClockController()) {
        unsafe {
            FfiOHOSAceFrameworkTextClockCreateV2(timeZoneOffset, controller.getID())
        }
    }

    public init(timeZoneOffset!: Int32, controller!: TextClockController = TextClockController()) {
        unsafe {
            FfiOHOSAceFrameworkTextClockCreate(timeZoneOffset, controller.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: TextClockController = TextClockController()) {
        unsafe {
            FfiOHOSAceFrameworkTextClockCreateSimple(controller.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: TextClockOptions) {
        unsafe {
            FfiOHOSAceFrameworkTextClockCreateV2(options.timeZoneOffset, options.controller.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func format(value: String): This {
        unsafe {
            let valueCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextClockFormat(valueCString)
            LibC.free(valueCString)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkTextClockTextColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkTextClockFontStyle(value.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: String): This {
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextClockFontWeight(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFeature(value: String): This {
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextClockFontFeature(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: String): This {
        unsafe {
            var unsafeFontFamily = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextClockFontFamily(unsafeFontFamily)
            LibC.free(unsafeFontFamily)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(getResourceString(content))
            FfiOHOSAceFrameworkTextClockFontFamily(unsafeContent)
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dateTimeOptions(dateTimeOptions: DateTimeOptions): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(dateTimeOptions.hour)
            FfiOHOSAceFrameworkTextClockDateTimeOptions(unsafeContent)
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(values: Array<ShadowOptions>): This {
        let vecValueHandle = CJVectorNativeTextShadow(values.size)
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, values[i].optionToNative())
        }
        unsafe {
            FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.COLOR,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        color!: ResourceColor = Color.BLACK,
        fill!: Bool = false
    ): This {
        let thisShadow: NativeTextShadowV2 = NativeTextShadowV2(radius, offsetX, offsetY,
            transAppResourceToResourceColor(color), fill, shadowType.getValue())
        let vecValueHandle = CJVectorNativeTextShadow(1)
        vecValueHandle.setElement(0, thisShadow)
        unsafe {
            FfiOHOSAceFrameworkTextClockTextShadowV2(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }
}
