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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DatePickerResult {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public DatePickerResult(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let year: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let month: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let day: Int64
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PickerTextStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public PickerTextStyle(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let color: ResourceColor,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let font: MyFont
    ) {}
}

@C
struct NativePickerTextStyle {
    NativePickerTextStyle(
        let hasValue: Bool,
        let color: UInt32,
        let size: Float64,
        let unit: UInt32,
        let weight: CString,
        let family: CString,
        let style: UInt32
    ) {}
}

func convertToNativePickerTextStyle(value: PickerTextStyle): NativePickerTextStyle {
    var color = value.color
    var size = value.font.size
    var weight = value.font.weight
    var family = value.font.family
    var style = value.font.style
    var color_ = transAppResourceToResourceColor(color)
    var size_ = transAppResourceToLength(size)
    unsafe {
        var cWeight: ?CString = None
        var cFamily: ?CString = None
        try {
            cWeight = LibC.mallocCString(weight.getValue())
            cFamily = LibC.mallocCString(family)
            return NativePickerTextStyle(
                true,
                color_,
                size_.value,
                UInt32(size_.unitType.getValue()),
                cWeight.getOrThrow(),
                cFamily.getOrThrow(),
                UInt32((style.getValue()))
            )
        } catch (e: Exception) {
            cWeight?.free()
            cFamily?.free()
            throw e
        }
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
struct NativeDatePicekrDialogOptions {
    NativeDatePicekrDialogOptions(
        let start: NativeOptionFfiTime,
        let end: NativeOptionFfiTime,
        let selected: NativeOptionFfiTime,
        let lunar: Bool,
        let showTime: Bool,
        let useMilitaryTime: Bool,
        let lunarSwitch: Bool,
        let disappearTextStyle: NativePickerTextStyle,
        let textStyle: NativePickerTextStyle,
        let selectedTextStyle: NativePickerTextStyle,
        let acceptButtonStyle: NativeOptionalPickerDialogButtonStyle,
        let cancelButtonStyle: NativeOptionalPickerDialogButtonStyle,
        let alignment: UInt32,
        let offsetX: NativeOptionOffset,
        let maskRect: NativeOptionRectangle,
        let onCancel: NativeOptionalCallback,
        let onAccept: NativeOptionalCallback,
        let onChange: NativeOptionalCallback,
        let backgroundColor: UInt32,
        let backgroundBlurStyle: Int32,
        let onDidAppear: NativeOptionalCallback,
        let onDidDisappear: NativeOptionalCallback,
        let onWillAppear: NativeOptionalCallback,
        let onWillDisappear: NativeOptionalCallback,
        let shadow: NativeOptionalShadow,
        let dateTimeOption: NativeOptionDateTime
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(disappearTextStyle.family)
            LibC.free(textStyle.family)
            LibC.free(selectedTextStyle.family)
            LibC.free(disappearTextStyle.weight)
            LibC.free(textStyle.weight)
            LibC.free(selectedTextStyle.weight)
            LibC.free(dateTimeOption.hour)
            LibC.free(dateTimeOption.min)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DatePickerDialogOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: ?DateTime

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: ?DateTime

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selected: ?DateTime

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lunar: Bool = false

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var showTime: Bool = false

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var useMilitaryTime: Bool = false

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lunarSwitch: Bool = false

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var disappearTextStyle: ?PickerTextStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var textStyle: ?PickerTextStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selectedTextStyle: ?PickerTextStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var acceptButtonStyle: ?PickerDialogButtonStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cancelButtonStyle: ?PickerDialogButtonStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var alignment: ?DialogAlignment

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offset: ?Offset = Offset(0.vp, 0.vp)

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var maskRect: ?Rectangle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onCancel: ?() -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDateAccept: ?(DateTime) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDateChange: ?(DateTime) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ResourceColor = Color.TRANSPARENT

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidAppear: ?() -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onDidDisappear: ?() -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillAppear: ?() -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onWillDisappear: ?() -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadow: ?ShadowOptions

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dateTimeOptions: ?DateTimeOptions

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: DateTime = DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1),
        end!: DateTime = DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31),
        selected!: DateTime = DateTime.now(),
        lunar!: Bool = false,
        showTime!: Bool = false,
        useMilitaryTime!: Bool = false,
        lunarSwitch!: Bool = false,
        disappearTextStyle!: ?PickerTextStyle = None,
        textStyle!: ?PickerTextStyle = None,
        selectedTextStyle!: ?PickerTextStyle = None,
        acceptButtonStyle!: ?PickerDialogButtonStyle = None,
        cancelButtonStyle!: ?PickerDialogButtonStyle = None,
        alignment!: ?DialogAlignment = None,
        offset!: ?Offset = None,
        maskRect!: ?Rectangle = None,
        onCancel!: ?() -> Unit = None,
        onDateAccept!: ?(DateTime) -> Unit = None,
        onDateChange!: ?(DateTime) -> Unit = None,
        backgroundColor!: ResourceColor = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        onDidAppear!: ?() -> Unit = None,
        onDidDisappear!: ?() -> Unit = None,
        onWillAppear!: ?() -> Unit = None,
        onWillDisappear!: ?() -> Unit = None,
        shadow!: ?ShadowOptions = None,
        dateTimeOptions!: ?DateTimeOptions = None
    ) {
        this.start = start
        this.end = end
        this.selected = selected
        this.lunar = lunar
        this.showTime = showTime
        this.useMilitaryTime = useMilitaryTime
        this.lunarSwitch = lunarSwitch
        this.disappearTextStyle = disappearTextStyle
        this.textStyle = textStyle
        this.selectedTextStyle = selectedTextStyle
        this.acceptButtonStyle = acceptButtonStyle
        this.cancelButtonStyle = cancelButtonStyle
        this.alignment = alignment
        this.offset = offset
        this.maskRect = maskRect
        this.onCancel = onCancel
        this.onDateAccept = onDateAccept
        this.onDateChange = onDateChange
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.onDidAppear = onDidAppear
        this.onDidDisappear = onDidDisappear
        this.onWillAppear = onWillAppear
        this.onWillDisappear = onWillDisappear
        this.shadow = shadow
        this.dateTimeOptions = dateTimeOptions
    }

    func getNative(): NativeDatePicekrDialogOptions {
        unsafe {
            let nativeMaskRect = match (maskRect) {
                case Some(value) => NativeOptionRectangle(true, value.parseToNative())
                case None => NativeOptionRectangle(false, Rectangle().parseToNative())
            }
            let nativeOffset = match (offset) {
                case Some(value) => NativeOptionOffset(true, parseOffset(value))
                case None => NativeOptionOffset(false, parseOffset(Offset(0.vp, 0.vp)))
            }
            let nativeStart = match (start) {
                case Some(value) => NativeOptionFfiTime(true, convertTimeToFfiTime(value))
                case None => NativeOptionFfiTime(false,
                    convertTimeToFfiTime(DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1)))
            }
            let nativeEnd = match (end) {
                case Some(value) => NativeOptionFfiTime(true, convertTimeToFfiTime(value))
                case None => NativeOptionFfiTime(false,
                    convertTimeToFfiTime(DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31)))
            }
            let nativeSelected = match (selected) {
                case Some(value) => NativeOptionFfiTime(true, convertTimeToFfiTime(value))
                case None => NativeOptionFfiTime(false, convertTimeToFfiTime(DateTime.now()))
            }
            let alignmentValue = match (alignment) {
                case Some(value) => value
                case None => DialogAlignment.Default
            }
            let font = MyFont()

            let nativeDisappearTextStyle = match (disappearTextStyle) {
                case Some(value) => convertToNativePickerTextStyle(value)
                case None =>
                    var cRegular: ?CString = None
                    var cFamily: ?CString = None
                    try {
                        cRegular = LibC.mallocCString(FontWeight.Regular.getValue())
                        cFamily = LibC.mallocCString(font.family)
                        NativePickerTextStyle(false, 0xff182431, 14.0, UInt32(LengthType.fp(1.0).getValue()),
                            cRegular.getOrThrow(), cFamily.getOrThrow(), UInt32(font.style.getValue()))
                    } finally {
                        cRegular?.free()
                        cFamily?.free()
                    }
            }

            let nativetextStyle = match (textStyle) {
                case Some(value) => convertToNativePickerTextStyle(value)
                case None =>
                    var cRegular: ?CString = None
                    var cFamily: ?CString = None
                    try {
                        cRegular = LibC.mallocCString(FontWeight.Regular.getValue())
                        cFamily = LibC.mallocCString(font.family)
                        NativePickerTextStyle(false, 0xff182431, 16.0, UInt32(LengthType.fp(1.0).getValue()),
                            cRegular.getOrThrow(), cFamily.getOrThrow(), UInt32(font.style.getValue()))
                    } catch (e: Exception) {
                        cRegular?.free()
                        cFamily?.free()
                        throw e
                    }
            }

            let nativeSelectedTextStyle = match (selectedTextStyle) {
                case Some(value) => convertToNativePickerTextStyle(value)
                case None =>
                    var cRegular: ?CString = None
                    var cFamily: ?CString = None
                    try {
                        cRegular = LibC.mallocCString(FontWeight.Regular.getValue())
                        cFamily = LibC.mallocCString(font.family)
                        NativePickerTextStyle(false, 0xff007dff, 20.0, UInt32(LengthType.vp(1.0).getValue()),
                            cRegular.getOrThrow(), cFamily.getOrThrow(), UInt32(font.style.getValue()))
                    } catch (e: Exception) {
                        cRegular?.free()
                        cFamily?.free()
                        throw e
                    }
            }

            let op = DateTimeOptions()

            let nativeDateTimeOptions = match (dateTimeOptions) {
                case Some(value) => convertDateTimeOptionsToNative(value)
                case None =>
                    var cHour: ?CString = None
                    var cMinute: ?CString = None
                    try {
                        cHour = LibC.mallocCString(op.hour)
                        cMinute = LibC.mallocCString(op.minute)
                        NativeOptionDateTime(false, cHour.getOrThrow(), cMinute.getOrThrow())
                    } catch (e: Exception) {
                        cHour?.free()
                        cMinute?.free()
                        throw e
                    }
            }

            NativeDatePicekrDialogOptions(
                nativeStart,
                nativeEnd,
                nativeSelected,
                lunar,
                showTime,
                useMilitaryTime,
                lunarSwitch,
                nativeDisappearTextStyle,
                nativetextStyle,
                nativeSelectedTextStyle,
                ParsePickerDialogButtonStyle(acceptButtonStyle),
                ParsePickerDialogButtonStyle(cancelButtonStyle),
                UInt32(alignmentValue.getValue()),
                nativeOffset,
                nativeMaskRect,
                parseCallBackWith0Param(onCancel),
                parseCallBackWith1Param(onDateAccept),
                parseCallBackWith1Param(onDateChange),
                transAppResourceToResourceColor(backgroundColor),
                backgroundBlurStyle.getValue(),
                parseCallBackWith0Param(onDidAppear),
                parseCallBackWith0Param(onDidDisappear),
                parseCallBackWith0Param(onWillAppear),
                parseCallBackWith0Param(onWillDisappear),
                parseShadowOptions(shadow),
                nativeDateTimeOptions
            )
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MyFont {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var weight: FontWeight

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var family: String

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: FontStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal) {
        this.size = size
        this.weight = weight
        this.family = family
        this.style = style
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: AppResource,
        style!: FontStyle = FontStyle.Normal) {
        this(size: size, weight: weight, family: getResourceString(family), style: style)
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

    func FfiOHOSAceFrameworkDatePickerDialogShow(options: NativeDatePicekrDialogOptions): Unit

    func FfiOHOSAceFrameworkDatePickerSetOpacity(opacity: Float64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class DatePicker <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: DateTime = DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1),
        end!: DateTime = DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31),
        selected!: (DateTime, (DateTime) -> Unit)
    ) {
        let ffiStart = convertTimeToFfiTime(start)
        let ffiEnd = convertTimeToFfiTime(end)
        let ffiSelected = convertTimeToFfiTime(selected[0])
        let selectedChangeEvent = selected[1]

        let wrapper = {
            value: FfiTime =>
            // FFiTime to DateTime for CJ Application
            selectedChangeEvent(convertTimeToDateTime(value))
        }
        let lambdaData = Callback1Param<FfiTime, Unit>(wrapper)

        unsafe {
            FfiOHOSAceFrameworkDatePickerCreateWithChangeEvent(ffiStart, ffiEnd, ffiSelected, lambdaData.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        16,
        atomicservice: true,
        crossplatform: true,
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DatePickerDialog {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(options!: ?DatePickerDialogOptions = None): Unit {
        unsafe {
            var nativeOptions: NativeDatePicekrDialogOptions
            match (options) {
                case Some(v) => nativeOptions = v.getNative()
                case _ => nativeOptions = DatePickerDialogOptions().getNative()
            }
            FfiOHOSAceFrameworkDatePickerDialogShow(nativeOptions)
            nativeOptions.free()
        }
    }
}
