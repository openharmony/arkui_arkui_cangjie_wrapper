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

foreign {
    func FfiOHOSAceFrameworkCalendarPickerCreate(size: Float64, unit: Int32, date: FfiTime): Unit

    func FfiOHOSAceFrameworkCalendarPickerSetEdgeAlign(alignType: Int32, offset: NativeOffset): Unit

    func FfiOHOSAceFrameworkCalendarPickerSetTextStyle(color: UInt32, size: NativeLength, weight: CString,
        family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkCalendarPickerSetOnChange(callbackId: Int64): Unit

    func FfiOHOSAceFrameworkCalendarPickerDialogShow(options: NativeCalendarDialogOptions): Unit
}

@C
struct NativeOptionalInt32 {
    NativeOptionalInt32(
        let hasValue: Bool,
        let value: Int32
    ) {}
}

@C
struct NativeOptionalLength {
    NativeOptionalLength(
        let hasValue: Bool,
        let value: NativeLength
    ) {}
}

@C
struct NativeOptionalResourceColor {
    NativeOptionalResourceColor(
        let hasValue: Bool,
        let value: UInt32
    ) {}
}

@C
struct NativeOptionalBool {
    NativeOptionalBool(
        let hasValue: Bool,
        let value: Bool
    ) {}
}

@C
struct NativeOptionalCString {
    NativeOptionalCString(
        let hasValue: Bool,
        let value: CString
    ) {}
}

@C
struct NativeOptionalShadow {
    NativeOptionalShadow(
        let hasValue: Bool,
        let value: NativeShadowOptions
    ) {}
}

@C
struct NativeOptionalCallback {
    NativeOptionalCallback(
        let hasValue: Bool,
        let callback: Int64
    ) {}
}

@C
struct NativeOptionalPickerDialogButtonStyle {
    NativeOptionalPickerDialogButtonStyle(
        let hasValue: Bool,
        let style: NativePickerDialogButtonStyle
    ) {}
}

@C
struct NativePickerDialogButtonStyle {
    NativePickerDialogButtonStyle(
        let `type`: NativeOptionalInt32,
        let style: NativeOptionalInt32,
        let role: NativeOptionalInt32,
        let fontSize: NativeOptionalLength,
        let fontColor: NativeOptionalResourceColor,
        let fontWeight: NativeOptionalCString,
        let fontStyle: NativeOptionalInt32,
        let fontFamily: NativeOptionalCString,
        let backgroundColor: NativeOptionalResourceColor,
        let borderRadius: NativeOptionRadius,
        let primary: NativeOptionalBool
    ) {}
}

@C
struct NativeCalendarDialogOptions {
    NativeCalendarDialogOptions(
        let hintRadius: NativeLength,
        let selected: FfiTime,
        let onAccept: NativeOptionalCallback,
        let onCancel: NativeOptionalCallback,
        let onChange: NativeOptionalCallback,
        let backgroundColor: UInt32,
        let backgroundBlurStyle: Int32,
        let acceptButtonStyle: NativeOptionalPickerDialogButtonStyle,
        let cancelButtonStyle: NativeOptionalPickerDialogButtonStyle,
        let onDidAppear: NativeOptionalCallback,
        let onDidDisappear: NativeOptionalCallback,
        let onWillAppear: NativeOptionalCallback,
        let onWillDisappear: NativeOptionalCallback,
        let shadow: NativeOptionalShadow
    ) {}
}

func ParsePickerDialogButtonStyle(style: ?PickerDialogButtonStyle): NativeOptionalPickerDialogButtonStyle {
    match (style) {
        case Some(v) => NativeOptionalPickerDialogButtonStyle(true, v.getNative())
        case _ => NativeOptionalPickerDialogButtonStyle(false, PickerDialogButtonStyle().getNative())
    }
}

func parseCallBackWith1Param(callback: ?(DateTime) -> Unit): NativeOptionalCallback {
    return match (callback) {
        case Some(v) =>
            let wrapper = {
                input: FfiTime =>
                let date = convertTimeToDateTime(input)
                v(date)
            }
            let lambda = Callback1Param<FfiTime, Unit>(wrapper)
            NativeOptionalCallback(true, lambda.getID())
        case _ => NativeOptionalCallback(false, -1)
    }
}

func parseCallBackWith0Param(callback: ?() -> Unit): NativeOptionalCallback {
    return match (callback) {
        case Some(v) =>
            let lambda = Callback0Param<Unit>(v)
            NativeOptionalCallback(true, lambda.getID())
        case _ => NativeOptionalCallback(false, -1)
    }
}

func parseShadowOptions(shadowOptions: ?ShadowOptions): NativeOptionalShadow {
    return match (shadowOptions) {
        case Some(v) => NativeOptionalShadow(
            true,
            shadowOptions2Native(v)
        )
        case _ => NativeOptionalShadow(false, shadowOptions2Native(ShadowOptions()))
    }
}

func shadowOptions2Native(shadowOptions: ShadowOptions): NativeShadowOptions {
    return NativeShadowOptions(
        shadowOptions.radius,
        shadowOptions.shadowType,
        shadowOptions.color,
        shadowOptions.offsetX,
        shadowOptions.offsetY,
        shadowOptions.fill
    )
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CalendarAlign {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case START => 0
            case CENTER => 1
            case END => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class CalendarOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public CalendarOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let hintRadius!: Length = 16.vp,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let selected!: DateTime = DateTime.now()
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PickerDialogButtonStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public PickerDialogButtonStyle(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let `type`!: ?ButtonType = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let style!: ?ButtonStyleMode = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let role!: ?ButtonRole = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fontSize!: ?Length = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fontColor!: ?ResourceColor = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fontWeight!: ?FontWeight = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fontStyle!: ?FontStyle = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let fontFamily!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let backgroundColor!: ?ResourceColor = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let borderRadius!: ?BorderRadiuses = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let primary!: ?Bool = None
    ) {}

    func getNative(): NativePickerDialogButtonStyle {
        return NativePickerDialogButtonStyle(
            match (`type`) {
                case Some(v) => NativeOptionalInt32(true, v.getValue())
                case _ => NativeOptionalInt32(false, -1)
            },
            match (style) {
                case Some(v) => NativeOptionalInt32(true, v.getValue())
                case _ => NativeOptionalInt32(false, -1)
            },
            match (role) {
                case Some(v) => NativeOptionalInt32(true, v.getValue())
                case _ => NativeOptionalInt32(false, -1)
            },
            match (fontSize) {
                case Some(v) =>
                    let len = transAppResourceToLength(v)
                    NativeOptionalLength(true, NativeLength(len.value, len.unitType.getValue()))
                case _ => NativeOptionalLength(false, NativeLength(0.0, 0))
            },
            match (fontColor) {
                case Some(v) => NativeOptionalResourceColor(true, transAppResourceToResourceColor(v))
                case _ => NativeOptionalResourceColor(false, 0)
            },
            match (fontWeight) {
                case Some(v) => NativeOptionalCString(true, unsafe { LibC.mallocCString(v.getValue()) })
                case _ => NativeOptionalCString(false, unsafe { LibC.mallocCString("") })
            },
            match (fontStyle) {
                case Some(v) => NativeOptionalInt32(true, v.getValue())
                case _ => NativeOptionalInt32(false, -1)
            },
            match (fontFamily) {
                case Some(v) => NativeOptionalCString(true, unsafe { LibC.mallocCString(v) })
                case _ => NativeOptionalCString(false, unsafe { LibC.mallocCString("") })
            },
            match (backgroundColor) {
                case Some(v) => NativeOptionalResourceColor(true, transAppResourceToResourceColor(v))
                case _ => NativeOptionalResourceColor(false, 0)
            },
            match (borderRadius) {
                case Some(v) => NativeOptionRadius(true, v.toCBorderRadiuses())
                case _ => NativeOptionRadius(false, BorderRadiuses().toCBorderRadiuses())
            },
            match (primary) {
                case Some(v) => NativeOptionalBool(true, v)
                case _ => NativeOptionalBool(false, false)
            }
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CalendarDialogOptions <: CalendarOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onAccept: ?(DateTime) -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onCancel: ?() -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onChange: ?(DateTime) -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let backgroundColor: ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let backgroundBlurStyle: BlurStyle
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let acceptButtonStyle: ?PickerDialogButtonStyle
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let cancelButtonStyle: ?PickerDialogButtonStyle
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onDidAppear: ?() -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onDidDisappear: ?() -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onWillAppear: ?() -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let onWillDisappear: ?() -> Unit
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let shadow: ?ShadowOptions

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        hintRadius!: Length = 16,
        selected!: DateTime = DateTime.now(),
        onAccept!: ?(DateTime) -> Unit = None,
        onCancel!: ?() -> Unit = None,
        onChange!: ?(DateTime) -> Unit = None,
        backgroundColor!: ResourceColor = Color.TRANSPARENT,
        backgroundBlurStyle!: BlurStyle = BlurStyle.COMPONENT_ULTRA_THICK,
        acceptButtonStyle!: ?PickerDialogButtonStyle = None,
        cancelButtonStyle!: ?PickerDialogButtonStyle = None,
        onDidAppear!: ?() -> Unit = None,
        onDidDisappear!: ?() -> Unit = None,
        onWillAppear!: ?() -> Unit = None,
        onWillDisappear!: ?() -> Unit = None,
        shadow!: ?ShadowOptions = None
    ) {
        super(hintRadius: hintRadius, selected: selected)
        this.onAccept = onAccept
        this.onCancel = onCancel
        this.onChange = onChange
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.acceptButtonStyle = acceptButtonStyle
        this.cancelButtonStyle = cancelButtonStyle
        this.onDidAppear = onDidAppear
        this.onDidDisappear = onDidDisappear
        this.onWillAppear = onWillAppear
        this.onWillDisappear = onWillDisappear
        this.shadow = shadow
    }

    func getNative(): NativeCalendarDialogOptions {
        NativeCalendarDialogOptions(
            NativeLength(hintRadius.value, hintRadius.unitType.getValue()),
            convertTimeToFfiTime(selected),
            parseCallBackWith1Param(onAccept),
            parseCallBackWith0Param(onCancel),
            parseCallBackWith1Param(onChange),
            transAppResourceToResourceColor(backgroundColor),
            backgroundBlurStyle.getValue(),
            ParsePickerDialogButtonStyle(acceptButtonStyle),
            ParsePickerDialogButtonStyle(cancelButtonStyle),
            parseCallBackWith0Param(onDidAppear),
            parseCallBackWith0Param(onDidDisappear),
            parseCallBackWith0Param(onWillAppear),
            parseCallBackWith0Param(onWillDisappear),
            parseShadowOptions(shadow)
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CalendarPicker <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options!: CalendarOptions = CalendarOptions()) {
        let hintRadius = transAppResourceToLength(options.hintRadius)
        let ffiSelected = convertTimeToFfiTime(options.selected)
        unsafe {
            FfiOHOSAceFrameworkCalendarPickerCreate(hintRadius.value, hintRadius.unitType.getValue(), ffiSelected)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func edgeAlign(alignType: CalendarAlign, offset!: Offset = Offset(0, 0)): This {
        unsafe {
            FfiOHOSAceFrameworkCalendarPickerSetEdgeAlign(alignType.getValue(), parseOffset(offset))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
            var weightCString = LibC.mallocCString(weight.getValue())
            var fontFamilyCString = LibC.mallocCString(family)
            FfiOHOSAceFrameworkCalendarPickerSetTextStyle(color_, NativeLength(size_.value, size.unitType.getValue()),
                weightCString, fontFamilyCString, style.getValue())
            LibC.free(weightCString)
            LibC.free(fontFamilyCString)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (DateTime) -> Unit): This {
        let wrapper = {
            value: FfiTime => callback(convertTimeToDateTime(value))
        }
        let lambdaData = Callback1Param<FfiTime, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkCalendarPickerSetOnChange(lambdaData.getID())
        }
        this
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CalendarPickerDialog {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func show(options!: ?CalendarDialogOptions = None): Unit {
        unsafe {
            var nativeOptions: NativeCalendarDialogOptions
            match (options) {
                case Some(v) => nativeOptions = v.getNative()
                case _ => nativeOptions = CalendarDialogOptions().getNative()
            }
            FfiOHOSAceFrameworkCalendarPickerDialogShow(nativeOptions)
            LibC.free(nativeOptions.acceptButtonStyle.style.fontWeight.value)
            LibC.free(nativeOptions.acceptButtonStyle.style.fontFamily.value)
            LibC.free(nativeOptions.cancelButtonStyle.style.fontWeight.value)
            LibC.free(nativeOptions.cancelButtonStyle.style.fontFamily.value)
        }
    }
}
