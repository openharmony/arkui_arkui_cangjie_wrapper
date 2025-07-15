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

import ohos.hi_tracemeter.*
import ohos.matrix4.*
import std.regex.*
import std.math.*
import std.convert.*
import ohos.state_manage.*

public const MAX_CHANNEL_VALUE: UInt8 = 0xff
public const MAX_ALPHA_VALUE: Float32 = 1.0

@OverflowWrapping
func decode(data: Array<UInt8>): Option<Array<UInt8>> {
    var arrLength: Int64 = data.size
    var index: Int64 = 0
    var temp: Array<UInt8> = Array<UInt8>(arrLength / 2, repeat: 0)
    var i: Int64 = 0
    while (i < arrLength) {
        var highFour: UInt8 = unhex(data[i])
        i++
        var lowFour: UInt8 = unhex(data[i])
        i++
        var str: UInt8 = UInt8((highFour << 4) | lowFour)
        temp[index] = str
        index++
    }
    return Option<Array<UInt8>>.Some(temp)
}

@OverflowWrapping
func unhex(c: UInt8): UInt8 {
    match {
        case UInt8(UInt32(r'0')) <= c && c <= UInt8(UInt32(r'9')) => UInt8(UInt32(c) - UInt32(r'0'))
        case UInt8(UInt32(r'a')) <= c && c <= UInt8(UInt32(r'f')) => UInt8(UInt32(c) - UInt32(r'a') + UInt32(10))
        case UInt8(UInt32(r'A')) <= c && c <= UInt8(UInt32(r'F')) => UInt8(UInt32(c) - UInt32(r'A') + UInt32(10))
        case _ => UInt8(0)
    }
}

func processDataBeforeDecode(data: Array<UInt8>): Array<UInt8> {
    var temp: Array<UInt8> = Array<UInt8>(data.size, repeat: 0)
    var index: Int64 = 0
    for (i in 0..data.size) {
        let ch = data[i]
        if (ch.isAsciiHex()) {
            temp[index] = ch
            index++
        } else if (ch == UInt8(UInt32(r'\0'))) {
            break
        } else if (ch == UInt8(UInt32(r'\r')) || ch == UInt8(UInt32(r'\n')) || ch == UInt8(UInt32(r' ')) || ch == UInt8(UInt32(r'\t'))) {
            continue
        } else {
            return Array<UInt8>()
        }
    }
    if (index <= 0 || index % 2 != 0) {
        return Array<UInt8>()
    }
    return temp[0..index]
}

func fromHexStringToArray(data: String): Option<Array<Byte>> {
    var strChArr: Array<UInt8> = unsafe { data.rawData() }
    if (strChArr.size == 0) {
        return Option<Array<UInt8>>.Some(Array<UInt8>())
    }
    var temp: Array<UInt8> = processDataBeforeDecode(strChArr)
    if (temp.size == 0) {
        return Option<Array<UInt8>>.None
    }
    return decode(temp)
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ColorMetrics {
    private var red_: UInt8 = 0
    private var green_: UInt8 = 0
    private var blue_: UInt8 = 0
    private var alpha_: UInt8 = MAX_CHANNEL_VALUE
    private static let hexPattern = Regex("#[0-9A-Fa-f]+")
    private static let rgbPattern = Regex(#"^rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)$"#, IgnoreCase)
    private static let rgbaPattern = Regex(#"^rgba\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+(\.\d+)?)\s*\)$"#,
        IgnoreCase)

    private func clamp(value: UInt8): UInt8 {
        min(max(value, 0), MAX_CHANNEL_VALUE)
    }

    private init(red: UInt8, green: UInt8, blue: UInt8, alpha!: UInt8 = MAX_CHANNEL_VALUE) {
        this.red_ = clamp(red)
        this.green_ = clamp(green)
        this.blue_ = clamp(blue)
        this.alpha_ = clamp(alpha)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toUInt32(): UInt32 {
        (UInt32(this.alpha_) << 24) + (UInt32(this.red_) << 16) + (UInt32(this.green_) << 8) + UInt32(this.blue_)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func numeric(value: UInt32): ColorMetrics {
        let alpha = UInt8((value >> 24) & 0x000000FF)
        let red = UInt8((value >> 16) & 0x000000FF)
        let green = UInt8((value >> 8) & 0x000000FF)
        let blue = UInt8(value & 0x000000FF)
        if (alpha == 0) {
            ColorMetrics(red, green, blue)
        } else {
            ColorMetrics(red, green, blue, alpha: alpha)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func rgba(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = MAX_ALPHA_VALUE): ColorMetrics {
        ColorMetrics(red, green, blue, alpha: UInt8(clamp(alpha, 0.0, MAX_ALPHA_VALUE) * Float32(MAX_CHANNEL_VALUE)))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func resourceColor(color: Color): ColorMetrics {
        numeric(color.toUInt32())
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func resourceColor(color: UInt32): ColorMetrics {
        numeric(color)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func resourceColor(color: String): ColorMetrics {
        if (isHexFormat(color)) {
            hex2ColorMetrics(color2Hex(color))
        } else {
            rgbOrRGBA(color)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func resourceColor(color: AppResource): ColorMetrics {
        numeric(getResourceColor(color).toUInt32())
    }

    private static func isHexFormat(format: String): Bool {
        let len = format.size
        if (len != 4 && len != 5 && len != 7 && len != 9) {
            false
        } else {
            match (hexPattern.find(format)) {
                case None => false
                case _ => true
            }
        }
    }

    private static func color2Hex(color: String): String {
        let hex = color.removePrefix("#")
        let len = hex.size
        if (len == 6 || len == 8) {
            hex
        } else {
            var res = ""
            for (c in hex) {
                res += "${c}${c}"
            }
            res
        }
    }

    private static func hex2ColorMetrics(hex: String): ColorMetrics {
        var r: UInt8 = 0
        var g: UInt8 = 0
        var b: UInt8 = 0
        var a: UInt8 = MAX_CHANNEL_VALUE
        let res: Array<Byte> = fromHexStringToArray(hex).getOrThrow()
        if (res.size == 3) {
            r = res[0]
            g = res[1]
            b = res[2]
        } else if (res.size == 4) {
            a = res[0]
            r = res[1]
            g = res[2]
            b = res[3]
        }
        ColorMetrics(r, g, b, alpha: a)
    }

    private static func rgbOrRGBA(color: String): ColorMetrics {
        let paramException = {
            => throw IllegalArgumentException(
                "Parameter error. The format of the input color string is not RGB or RGBA.")
        }
        if (let Some(c) <- rgbPattern.find(color)) {
            let colors = c.matchString().toAsciiLower().removePrefix("rgb(").removeSuffix(")").split(",")
            let red = UInt8.tryParse(colors.get(0).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            let green = UInt8.tryParse(colors.get(1).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            let blue = UInt8.tryParse(colors.get(2).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            return ColorMetrics(red, green, blue)
        }
        if (let Some(c) <- rgbaPattern.find(color)) {
            let colors = c.matchString().toAsciiLower().removePrefix("rgba(").removeSuffix(")").split(",")
            let red = UInt8.tryParse(colors.get(0).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            let green = UInt8.tryParse(colors.get(1).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            let blue = UInt8.tryParse(colors.get(2).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            let alpha = Float32.tryParse(colors.get(3).getOrThrow(paramException).trimAscii()).getOrThrow(paramException)
            return ColorMetrics.rgba(red, green, blue, alpha: alpha)
        }
        paramException()
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blendColor(overlayColor: ColorMetrics): ColorMetrics {
        let value: UInt32 = unsafe {
            FFIOHOSAceFrameworkBlendColor(this.toUInt32(), overlayColor.toUInt32())
        }
        numeric(value)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop color: String {
        get() {
            "rgba(${this.red_}, ${this.green_}, ${this.blue_}, ${Float32(this.alpha_) / Float32(MAX_CHANNEL_VALUE)})"
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop red: UInt8 {
        get() {
            this.red_
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop green: UInt8 {
        get() {
            this.green_
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop blue: UInt8 {
        get() {
            this.blue_
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop alpha: UInt8 {
        get() {
            this.alpha_
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
public enum FocusPriority {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AUTO
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PRIOR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIOUS
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case AUTO => 0
            case PRIOR => 2000
            case PREVIOUS => 3000
            case _ => throw IllegalArgumentException("The type is not supported.")
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
public enum ChainStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SPREAD
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SPREAD_INSIDE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PACKED
    | ...

    func getValue(): Int32 {
        match (this) {
            case SPREAD => 0
            case SPREAD_INSIDE => 1
            case PACKED => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
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
public class FocusBoxStyle {
    public FocusBoxStyle(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var margin!: ?Length = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var strokeColor!: ?ColorMetrics = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var strokeWidth!: ?Length = None
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PixelRoundPolicy {
    public PixelRoundPolicy(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let start!: ?PixelRoundCalcPolicy = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let top!: ?PixelRoundCalcPolicy = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let end!: ?PixelRoundCalcPolicy = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let bottom!: ?PixelRoundCalcPolicy = None
    ) {}

    func getNative(): CJPixelRoundPolicy {
        let cjStart: Int32
        match (start) {
            case None => cjStart = -1
            case Some(v) => cjStart = v.getValue()
        }
        let cjTop: Int32
        match (top) {
            case None => cjTop = -1
            case Some(v) => cjTop = v.getValue()
        }
        let cjEnd: Int32
        match (end) {
            case None => cjEnd = -1
            case Some(v) => cjEnd = v.getValue()
        }
        let cjBottom: Int32
        match (bottom) {
            case None => cjBottom = -1
            case Some(v) => cjBottom = v.getValue()
        }
        return CJPixelRoundPolicy(
            cjStart,
            cjTop,
            cjEnd,
            cjBottom
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MotionBlurAnchor {
    public MotionBlurAnchor(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let x!: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let y!: Float64
    ) {}

    func getNative(): CJMotionBlurAnchor {
        return CJMotionBlurAnchor(x, y)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MotionBlurOptions {
    public MotionBlurOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let radius!: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let anchor!: MotionBlurAnchor
    ) {}

    func getNative(): CJMotionBlurOptions {
        return CJMotionBlurOptions(radius, anchor.getNative())
    }
}

/**
 * Defines the base class of Component.
 *
 * @since 11
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ViewBase <: InteractableView & ComponentRender {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width<T>(value: Option<T>): This where T <: Length {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => width(i64)
                case f64: Float64 => width(f64)
                case res: AppResource => width(res)
                case length: Length => width(length)
                case _ => throw IllegalArgumentException("Invalid size setting")
            }
            case None => unsafe { FFISetWidthWithEmpty() }
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
    public open func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWidth(value_.value, value_.unitType.getValue())
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
    public func height<T>(value: Option<T>): This where T <: Length {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => height(i64)
                case f64: Float64 => height(f64)
                case res: AppResource => height(res)
                case length: Length => height(length)
            }
            case None => unsafe { FFISetHeightWithEmpty() }
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
    public open func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHeight(value_.value, value_.unitType.getValue())
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
    public open func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
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
    public open func padding(value: Length): This {
        unsafe {
            var value_ = transAppResourceToLength(value)
            FfiOHOSAceFrameworkViewAbstractSetPadding(value_.value, value_.unitType.getValue())
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
    public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This {
        paddingInner(top, right, bottom, left)
        this
    }

    protected open func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPaddings(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
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
    public open func margin(value: Length): This {
        var value_ = transAppResourceToLength(value)
        marginInner(value_)
        this
    }

    protected open func marginInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargin(value_.value, value_.unitType.getValue())
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
    public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This {
        marginInner(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected open func marginInner(top!: Length, right!: Length, bottom!: Length, left!: Length) {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargins(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
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
    public open func layoutWeight(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutWeight(value)
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
    public func constraintSize(
        minWidth!: Length = 0.vp,
        maxWidth!: Length = (Float64.Inf).vp,
        minHeight!: Length = 0.vp,
        maxHeight!: Length = (Float64.Inf).vp
    ): This {
        constraintSizeInner(minWidth, maxWidth, minHeight, maxHeight)
        this
    }

    protected open func constraintSizeInner(
        minWidth: Length,
        maxWidth: Length,
        minHeight: Length,
        maxHeight: Length
    ): This {
        var minWidth_ = transAppResourceToLength(minWidth)
        var maxWidth_ = transAppResourceToLength(maxWidth)
        var minHeight_ = transAppResourceToLength(minHeight)
        var maxHeight_ = transAppResourceToLength(maxHeight)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetConstraintSize(
                CJConstraintSize(
                    minWidth_.value,
                    minWidth_.unitType.getValue(),
                    maxWidth_.value,
                    maxWidth_.unitType.getValue(),
                    minHeight_.value,
                    minHeight_.unitType.getValue(),
                    maxHeight_.value,
                    maxHeight_.unitType.getValue()
                )
            )
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
    public open func align(value: Alignment): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlign(value.getValue())
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
    public open func direction(value: Direction): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDirection(value.getValue())
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
    public open func position(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPosition(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
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
    public open func markAnchor(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMarkAnchor(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
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
    public open func offset(x!: Length, y!: Length): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOffset(x_.value, x_.unitType.getValue(), y_.value, y_.unitType.getValue())
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
    public open func alignRules(value: AlignRuleOption): This {
        let option = CJAlignRuleOption(value)
        unsafe { FfiOHOSAceFrameworkViewAbstractSetAlignRules(option) }
        option.free()
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
    public open func alignRules(value: LocalizedAlignRuleOptions): This {
        let option = CJAlignRuleOption(value)
        unsafe { FfiOHOSAceFrameworkViewAbstractSetAlignRules(option) }
        option.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func chainMode(direction: Axis, style: ChainStyle): This {
        let option = CJChainInfo(direction.getValue(), style.getValue())
        unsafe { FfiOHOSAceFrameworkViewAbstractSetChainMode(option) }
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
    public open func aspectRatio(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAspectRatio(value)
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
    public open func aspectRatio(value: Int64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAspectRatio(Float64(value))
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
    public open func displayPriority(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDisplayPriority(value)
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
    public open func flexBasis(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexBasis(value_.value, value_.unitType.getValue())
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
    public open func flexGrow(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(value)
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
    public open func flexGrow(value: Int64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(Float64(value))
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
    public open func flexShrink(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(value)
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
    public open func flexShrink(value: Int64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(Float64(value))
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
    public open func alignSelf(value: ItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlignSelf(value.getValue())
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
    public open func responseRegion(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegion(
                CJResponseRegion(
                    cjRect.x,
                    cjRect.xUnit,
                    cjRect.y,
                    cjRect.yUnit,
                    cjRect.width,
                    cjRect.widthUnit,
                    cjRect.height,
                    cjRect.heightUnit
                )
            )
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
    public open func responseRegionArray(array: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(array.size)
        var index = 0
        for (rect in array) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }

    func layoutPriority(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutPriority(value)
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
    public open func pixelRound(value: PixelRoundPolicy): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPixelRound(value.getNative())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func motionBlur(value: MotionBlurOptions): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMotionBlur(value.getNative())
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
    public func border(
        width!: Length,
        color!: ResourceColor = Color.BLACK,
        radius!: Length = 0.vp,
        style!: BorderStyle = BorderStyle.Solid
    ): This {
        borderInner(width, color, radius, style)
        this
    }

    protected open func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        var width_ = transAppResourceToLength(width)
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
                )
            )
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
    public open func borderWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidth(width_.value, width_.unitType.getValue())
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
    public open func borderWidth(edgeWidths: EdgeWidths): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidthWithCJEdge(
                CJEdge(
                    edgeWidths.top.value,
                    edgeWidths.top.unitType.getValue(),
                    edgeWidths.right.value,
                    edgeWidths.right.unitType.getValue(),
                    edgeWidths.bottom.value,
                    edgeWidths.bottom.unitType.getValue(),
                    edgeWidths.left.value,
                    edgeWidths.left.unitType.getValue()
                )
            )
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
    public open func borderColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderColor(transAppResourceToResourceColor(color))
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
    public func borderRadius(
        topLeft!: Length = 0.vp,
        topRight!: Length = 0.vp,
        bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp
    ): This {
        borderRadiusInner(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    protected open func borderRadiusInner(
        topLeft!: Length,
        topRight!: Length,
        bottomLeft!: Length,
        bottomRight!: Length
    ): This {
        var topLeft_ = transAppResourceToLength(topLeft)
        var topRight_ = transAppResourceToLength(topRight)
        var bottomLeft_ = transAppResourceToLength(bottomLeft)
        var bottomRight_ = transAppResourceToLength(bottomRight)
        unsafe {
            let value = CJBorderRadius(
                topLeft_.value,
                topLeft_.unitType.getValue(),
                topRight_.value,
                topRight_.unitType.getValue(),
                bottomLeft_.value,
                bottomLeft_.unitType.getValue(),
                bottomRight_.value,
                bottomRight_.unitType.getValue()
            )
            FfiOHOSAceFrameworkViewAbstractSetAllBorderRadius(value)
        }
        this
    }

    protected open func borderRadiusInner(radius: Length): This {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderRadius(radius_.value, radius_.unitType.getValue())
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
    public open func borderRadius(radius: Length): This {
        borderRadiusInner(radius)
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
    public open func borderStyle(style: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderStyle(style.getValue())
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
    public func foregroundBlurStyle(value: ForegroundBlurStyle, options!: Option<ForegroundBlurStyleOptions> = None): This {
        unsafe {
            if (let Some(v) <- options) {
                let ret = CJForegroundBlurStyleOptions(v.colorMode.getValue(), v.adaptiveColor.getValue(),
                    CJBlurOptions(v.blurOptions.grayscale), v.scale)
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyleOption(value.getValue(), ret)
            } else {
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyle(value.getValue())
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
    public open func foregroundColor(value: ColoringStrategy): This {
        unsafe {
            let strategy = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkViewAbstractSetForegroundColor(strategy)
            LibC.free(strategy)
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
    public open func foregroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetForegroundResourceColor(transAppResourceToResourceColor(color))
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
    public open func backgroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(transAppResourceToResourceColor(color))
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
    public func backgroundImage(src!: String, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This {
        var repeatInt32 = repeat.getValue()
        unsafe {
            let unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImage(unsafeSrc, repeatInt32)
            LibC.free(unsafeSrc)
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
    public func backgroundImage(src!: AppResource, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This {
        var srcMedia = getResourceMedia(src)
        backgroundImage(src: srcMedia, repeat: repeat)
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
    public open func backgroundImageSize(imageSize: ImageSize): This {
        var imageSizeInt32 = imageSize.getValue()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSizeType(imageSizeInt32)
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
    public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSize(width_.value, width_.unitType.getValue(),
                height_.value, height_.unitType.getValue())
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
    public open func backgroundImagePosition(align: Alignment): This {
        var alignInt32 = align.getValue()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionAlign(alignInt32)
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
    public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionXY(x_.value, x_.unitType.getValue(), y_.value,
                y_.unitType.getValue())
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
    public func scale(
        x!: Float32 = 1.0,
        y!: Float32 = 1.0,
        z!: Float32 = 1.0,
        centerX!: Length = 50.percent,
        centerY!: Length = 50.percent
    ): This {
        var centerX_ = transAppResourceToLength(centerX)
        var centerY_ = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScale(
                CJSetScale(
                    x,
                    y,
                    z,
                    centerX_.value,
                    centerX_.unitType.getValue(),
                    centerY_.value,
                    centerY_.unitType.getValue()
                )
            )
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
    public open func scale(scaleValue: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleSingle(scaleValue)
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
    public open func scale(scaleValue: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleSingle(Float32(scaleValue))
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
    public open func scaleX(scale: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleX(scale)
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
    public open func scaleX(scale: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleX(Float32(scale))
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
    public open func scaleY(scale: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleY(scale)
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
    public open func scaleY(scale: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScaleY(Float32(scale))
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
    public open func opacity(opacityValue: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOpacity(opacityValue)
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
    public open func opacity(opacityValue: Int64): This {
        opacity(Float64(opacityValue))
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
    public func rotate(
        x!: Float32 = 0.0,
        y!: Float32 = 0.0,
        z!: Float32 = 1.0,
        angle!: Float32 = 0.0,
        centerX!: Length = 50.percent,
        centerY!: Length = 50.percent
    ): This {
        var centerX_ = transAppResourceToLength(centerX)
        var centerY_ = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotate(
                CJSetRotate(
                    x,
                    y,
                    z,
                    angle,
                    centerX_.value,
                    centerX_.unitType.getValue(),
                    centerY_.value,
                    centerY_.unitType.getValue()
                )
            )
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
    public open func rotate(
        x!: Float32,
        y!: Float32,
        z!: Float32,
        angle!: Float32,
        centerX!: AppResource,
        centerY!: AppResource
    ): This {
        rotate(x: x, y: y, z: z, angle: angle, centerX: getResourceLength(centerX), centerY: getResourceLength(centerY))
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
    public open func rotate(rotateZ: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateSingle(rotateZ)
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
    public open func rotate(rotateZ: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateSingle(Float32(rotateZ))
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
    public open func rotateX(rotateVal: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateX(rotateVal)
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
    public open func rotateX(rotateVal: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateX(Float32(rotateVal))
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
    public open func rotateY(rotateVal: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateY(rotateVal)
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
    public open func rotateY(rotateVal: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotateY(Float32(rotateVal))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func transform(matrix: Matrix4Transit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTransform(matrix.id)
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
    public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        var z_ = transAppResourceToLength(z)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslate(
                CJTranslate(
                    x_.value,
                    x_.unitType.getValue(),
                    y_.value,
                    y_.unitType.getValue(),
                    z_.value,
                    z_.unitType.getValue()
                )
            )
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
    public open func translate(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslateSingle(value_.value, value_.unitType.getValue())
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
    public open func translateX(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslateX(value_.value, value_.unitType.getValue())
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
    public open func translateY(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslateY(value_.value, value_.unitType.getValue())
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
    public open func transition(): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTransition()
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
    public open func enabled(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetEnabled(value)
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
    public open func sharedTransition(id: String, options!: SharedTransitionOptions): This {
        unsafe {
            let unsafeId = LibC.mallocCString(id)
            let unsafeCurve = LibC.mallocCString(options.curve.getValue())
            let unsafeMotionPath = LibC.mallocCString(options.motionPath.path)
            let unsafeOptions = CJSharedTransitionOptions(
                options.duration,
                options.delay,
                options.zIndex,
                unsafeCurve,
                CJMotionPathOptions(
                    unsafeMotionPath,
                    options.motionPath.`from`,
                    options.motionPath.to,
                    options.motionPath.rotatable
                ),
                options.`type`.getValue()
            )
            FfiOHOSAceFrameworkViewAbstractSetSharedTransition(unsafeId, unsafeOptions)
            LibC.free(unsafeId)
            LibC.free(unsafeCurve)
            LibC.free(unsafeMotionPath)
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
    public func geometryTransition(id: String, followWithoutTransition!: Bool = false): This {
        unsafe {
            let idCString = LibC.mallocCString(id)
            FfiOHOSAceFrameworkViewAbstractSetGeometryTransition(idCString, followWithoutTransition)
            LibC.free(idCString)
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
    public open func blur(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBlur(value)
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
    public open func blur(value: Int64): This {
        blur(Float64(value))
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
    public open func colorBlend(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetColorBlend(transAppResourceToResourceColor(color))
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
    public open func backdropBlur(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackdropBlur(value)
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
    public open func backdropBlur(value: Int64): This {
        backdropBlur(Float64(value))
        this
    }

    func windowBlur(progress!: Float32 = 0.0, blurStyle!: WindowBlurStyle = WindowBlurStyle.SmallLight): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWindowBlur(progress, blurStyle.getValue())
        }
        this
    }
    func windowBlur(progress!: Int32 = 0, blurStyle!: WindowBlurStyle = WindowBlurStyle.SmallLight): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWindowBlur(Float32(progress), blurStyle.getValue())
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
    public func shadow(
        radius!: Float64,
        color!: ResourceColor = Color(0x666666),
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0
    ): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetShadow(radius, transAppResourceToResourceColor(color), offsetX, offsetY)
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
    public func shadow(
        radius!: Int64,
        color!: ResourceColor = Color(0x666666),
        offsetX!: Int64 = 0,
        offsetY!: Int64 = 0
    ): This {
        shadow(
            radius: Float64(radius),
            color: transAppResourceToResourceColor(color),
            offsetX: Float64(offsetX),
            offsetY: Float64(offsetY)
        )
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
    public open func grayscale(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGrayScale(value)
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
    public open func grayscale(value: Int64): This {
        grayscale(Float64(value))
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
    public open func brightness(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBrightness(value)
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
    public open func brightness(value: Int64): This {
        brightness(Float64(value))
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
    public open func saturate(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSaturate(value)
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
    public open func saturate(value: Int64): This {
        saturate(Float64(value))
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
    public open func contrast(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetContrast(value)
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
    public open func contrast(value: Int64): This {
        contrast(Float64(value))
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
    public open func invert(value: Float64): This {
        var realValue = value
        if (realValue > 1.0) {
            realValue = 1.0
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvert(realValue)
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
    public open func invert(value: Int64): This {
        invert(Float64(value))
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
    public open func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvertWithOptions(low, high, threshold, thresholdRange)
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
    public open func blendMode(value: BlendMode, `type`: BlendApplyType): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBlendMode(value.getValue(), `type`.getValue())
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
    public open func useShadowBatching(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetUseShadowBatching(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func sphericalEffect(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSphericalEffect(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func lightUpEffect(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLightUpEffect(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pixelStretchEffect(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp,
        left!: Length = 0.vp): This {
        pixelStretchEffectInner(top, right, bottom, left)
        this
    }

    protected open func pixelStretchEffectInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top);
        var right_ = transAppResourceToLength(right);
        var bottom_ = transAppResourceToLength(bottom);
        var left_ = transAppResourceToLength(left);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPixelStretchEffect(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func systemBarEffect(): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSystemBarEffect()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func freeze(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFreeze(value)
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
    public open func renderGroup(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRenderGroup(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func linearGradientBlur(value: Float64, options: LinearGradientBlurOptions): This {
        let blurVec = FFIVectorFloat64(options.fractionStops.size)
        let positionVec = FFIVectorFloat64(options.fractionStops.size)
        var index = 0
        for (i in options.fractionStops) {
            blurVec.setElement(index, i[0])
            positionVec.setElement(index, i[1])
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLinearGradientBlur(
                value,
                options.direction.getValue(),
                blurVec.getNativeHandle(),
                positionVec.getNativeHandle()
            )
        }
        blurVec.free()
        positionVec.free()
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
    public func outline(
        width!: Length,
        color!: ResourceColor = Color.BLACK,
        radius!: Length = 0.vp,
        style!: OutlineStyle = OutlineStyle.SOLID
    ): This {
        outlineInner(width, color, radius, style)
        this
    }

    protected open func outlineInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: OutlineStyle
    ): This {
        var width_ = transAppResourceToLength(width)
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutline(
                CJOutline(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
                )
            )
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
    public open func outlineStyle(value: OutlineStyle): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineStyle(value.getValue())
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
    public func outlineStyle(top!: OutlineStyle = OutlineStyle.SOLID, right!: OutlineStyle = OutlineStyle.SOLID,
        bottom!: OutlineStyle = OutlineStyle.SOLID, left!: OutlineStyle = OutlineStyle.SOLID): This {
        outlineStyleInner(top, right, bottom, left)
        this
    }

    protected open func outlineStyleInner(top: OutlineStyle, right: OutlineStyle, bottom: OutlineStyle,
        left: OutlineStyle): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineStyles(
                top.getValue(),
                right.getValue(),
                bottom.getValue(),
                left.getValue()
            )
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
    public open func outlineWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineWidth(
                value_.value,
                value_.unitType.getValue()
            )
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
    public func outlineWidth(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This {
        outlineWidthInner(top, right, bottom, left)
        this
    }

    protected open func outlineWidthInner(top: Length, right: Length, bottom: Length, left: Length): This {
        var top_ = transAppResourceToLength(top);
        var right_ = transAppResourceToLength(right);
        var bottom_ = transAppResourceToLength(bottom);
        var left_ = transAppResourceToLength(left);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineWidths(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
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
    public open func outlineColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineColor(transAppResourceToResourceColor(value))
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
    public func outlineColor(top!: ResourceColor = Color.BLACK, right!: ResourceColor = Color.BLACK,
        bottom!: ResourceColor = Color.BLACK, left!: ResourceColor = Color.BLACK): This {
        outlineColorInner(top, right, bottom, left)
        this
    }

    protected open func outlineColorInner(top: ResourceColor, right: ResourceColor, bottom: ResourceColor,
        left: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineColors(
                transAppResourceToResourceColor(top),
                transAppResourceToResourceColor(right),
                transAppResourceToResourceColor(bottom),
                transAppResourceToResourceColor(left)
            )
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
    public open func outlineRadius(value: Length): This {
        var value_ = transAppResourceToLength(value);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineRadius(
                value_.value,
                value_.unitType.getValue()
            )
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
    public func outlineRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp): This {
        outlineRadiusInner(topLeft, topRight, bottomLeft, bottomRight)
        this
    }

    protected open func outlineRadiusInner(topLeft: Length, topRight: Length, bottomLeft: Length, bottomRight: Length): This {
        var topLeft_ = transAppResourceToLength(topLeft);
        var topRight_ = transAppResourceToLength(topRight);
        var bottomLeft_ = transAppResourceToLength(bottomLeft);
        var bottomRight_ = transAppResourceToLength(bottomRight);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineRadiuses(
                CJBorderRadius(
                    topLeft_.value,
                    topLeft_.unitType.getValue(),
                    topRight_.value,
                    topRight_.unitType.getValue(),
                    bottomLeft_.value,
                    bottomLeft_.unitType.getValue(),
                    bottomRight_.value,
                    bottomRight_.unitType.getValue()
                )
            )
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
    public open func sepia(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSepia(value)
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
    public open func sepia(value: Int64): This {
        sepia(Float64(value))
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
    public open func hueRotate(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHueRotate(value)
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
    public open func hueRotate(value: Int32): This {
        hueRotate(Float32(value))
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
    public open func zIndex(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetZIndex(value)
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
    public open func visibility(value: Visibility): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetVisibility(value.getValue())
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
    public open func clip(isClip: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClip(isClip)
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
    public open func clip(shape: ShapeAbstract): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClipByShape(shape.getID())
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
    public open func mask(shape: ShapeAbstract): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMaskByShape(shape.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func mask(value: ProgressMask): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMaskByProgressMask(value.getID())
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
    public open func accessibilityDescription(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetAccessibilityDescription(unsafeValue)
            LibC.free(unsafeValue)
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
    public open func accessibilityDescription(value: AppResource): This {
        accessibilityDescription(getResourceString(value))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func accessibilityText(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetAccessibilityText(unsafeValue)
            LibC.free(unsafeValue)
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
    public open func accessibilityText(value: AppResource): This {
        accessibilityText(getResourceString(value))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func accessibilityGroup(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAccessibilityGroup(value)
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
    public open func accessibilityLevel(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetAccessibilityLevel(unsafeValue)
            LibC.free(unsafeValue)
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
    public open func accessibilityTextHint(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetAccessibilityTextHint(unsafeValue)
            LibC.free(unsafeValue)
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
    public open func accessibilityVirtualNode(builder: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAccessibilityVirtualNode(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clickEffect(level!: ClickEffectLevel = ClickEffectLevel.LIGHT, scale!: Option<Float32> = Option.None): This {
        unsafe {
            let scaleVal = if (let Some(v) <- scale && v >= 0.0 && v <= 1.0) {
                v
            } else {
                if (level.getValue() == ClickEffectLevel.MIDDLE.getValue() || level.getValue() ==
                    ClickEffectLevel.HEAVY.getValue()) {
                    Float32(0.95)
                } else {
                    Float32(0.9)
                }
            }
            FfiOHOSAceFrameworkViewAbstractSetClickEffect(level.getValue(), scaleVal)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func motionPath(options: MotionPathOptions): This {
        unsafe {
            let unsafeMotionPath = LibC.mallocCString(options.path)
            let unsafeOptions = CJMotionPathOptions(
                unsafeMotionPath,
                options.`from`,
                options.to,
                options.rotatable
            )
            FfiOHOSAceFrameworkViewAbstractSetMotionPath(unsafeOptions)
            LibC.free(unsafeMotionPath)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func background(builder: () -> Unit, align!: Alignment = Alignment.Center): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackground(Callback0Param<Unit>(builder).getID(), align.getValue())
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
    public func backgroundBlurStyle(value!: BlurStyle, options!: Option<BackgroundBlurStyleOptions> = None): This {
        unsafe {
            if (let Some(v) <- options) {
                let ret = CJBackgroundBlurStyleOptions(v.colorMode.getValue(), v.adaptiveColor.getValue(),
                    CJBlurOptions(v.blurOptions.grayscale), v.scale, v.policy.getValue(), v.inactiveColor.toUInt32())
                FfiOHOSAceFrameworkViewAbstractSetBackgroundBlurStyleOption(value.getValue(), ret)
            } else {
                FfiOHOSAceFrameworkViewAbstractSetBackgroundBlurStyle(value.getValue())
            }
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundImageResizable(slice: EdgeWidths): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageResizable(
                CJEdge(
                    slice.top.value,
                    slice.top.unitType.getValue(),
                    slice.right.value,
                    slice.right.unitType.getValue(),
                    slice.bottom.value,
                    slice.bottom.unitType.getValue(),
                    slice.left.value,
                    slice.left.unitType.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundBrightness(rate!: Float64, lightUpDegree!: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundBrightness(rate, lightUpDegree)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func backgroundEffect(value: BackgroundEffectOptions): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundEffect(
                CJBackgroundEffectOptions(
                    value.radius,
                    value.saturation,
                    value.brightness,
                    value.color.toUInt32(),
                    value.adaptiveColor.getValue(),
                    CJBlurOptions(value.blurOptions.grayscale),
                    value.policy.getValue(),
                    value.inactiveColor.toUInt32()
                )
            )
        }
        this
    }

    protected open func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractPop()
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
    public func overlay(
        title!: String,
        align!: Alignment = Alignment.Center,
        offset!: ContentOffset = ContentOffset(x: 0.0, y: 0.0)
    ): This {
        unsafe {
            let titleCString = LibC.mallocCString(title)
            FfiOHOSAceFrameworkViewAbstractSetOverlay(
                titleCString,
                align.getValue(),
                offset.xOffset,
                offset.yOffset
            )
            LibC.free(titleCString)
        }
        this
    }

    func parseToDismissPopupAction(reason: Int32): DismissPopupAction {
        return DismissPopupAction(reason: DismissReason.toEnum(reason))
    }

    func callFFIBindPopup(popup: PopupOptions, primaryActionId: Int64, secondaryActionId: Int64, onStateChangeId: Int64,
        nativeOnWillDismiss: NativeOptionCallBack, nativeTransition: NativeOptionInt64, nativePlacement: Int32,
        show: Bool): Unit {
        unsafe {
            let nativeArrowPointPosition = match (popup.arrowPointPosition) {
                case Some(value) => LibC.mallocCString(value.getValue())
                case None => LibC.mallocCString("")
            }
            let message = LibC.mallocCString(popup.message)
            let primaryValue = LibC.mallocCString(popup.primaryButton.value)
            let secondaryValue = LibC.mallocCString(popup.secondaryButton.value)
            let messageOptions = popup.messageOptions
            let fontWeight = LibC.mallocCString(messageOptions.font.weight.getValue())
            FfiOHOSAceFrameworkViewAbstractBindPopupV2(
                show,
                CJBindPopupParamsV2(message, popup.placementOnTop, primaryValue, primaryActionId, secondaryValue,
                    secondaryActionId, onStateChangeId, messageOptions.textColor.toUInt32(), fontWeight,
                    messageOptions.font.size.value, messageOptions.font.size.unitType.getValue(),
                    messageOptions.font.style.getValue(), popup.arrowOffset.value, popup
                        .arrowOffset
                        .unitType
                        .getValue(), popup.showInSubWindow, popup.mask.toUInt32(), popup.targetSpace.value,
                    popup.targetSpace.unitType.getValue(), nativePlacement, popup.offset.y.value, popup.offset.x.value,
                    popup.enableArrow, popup.popupColor.toUInt32(), popup.autoCancel, popup.width.value,
                    popup.width.unitType.getValue(), nativeArrowPointPosition, popup.arrowWidth.value,
                    popup.arrowWidth.unitType.getValue(), popup.arrowHeight.value, popup
                        .arrowHeight
                        .unitType
                        .getValue(), popup.radius.value, popup.radius.unitType.getValue(), popup.shadow.getValue(),
                    popup.backgroundBlurStyle.getValue(), nativeTransition, nativeOnWillDismiss,
                    popup.followTransformOfTarget)
            )
            LibC.free(message)
            LibC.free(primaryValue)
            LibC.free(secondaryValue)
            LibC.free(nativeArrowPointPosition)
            LibC.free(fontWeight)
        }
    }

    func callFFIBindCustomPopup(popup: CustomPopupOptions, onStateChangeId: Int64,
        nativeOnWillDismiss: NativeOptionCallBack, nativeTransition: NativeOptionInt64, nativePopupColor: UInt32,
        nativeMask: UInt32, show: Bool): Unit {
        unsafe {
            let nativeArrowPointPosition = match (popup.arrowPointPosition) {
                case Some(value) => LibC.mallocCString(value.getValue())
                case None => LibC.mallocCString("")
            }
            FfiOHOSAceFrameworkViewAbstractBindCustomPopupV2(
                CJBindCustomPopupV2(show, Callback0Param<Unit>(popup.builder).getID(), popup.placement.getValue(),
                    popup.maskColor.toUInt32(), popup.backgroundColor.toUInt32(), popup.enableArrow, popup.autoCancel,
                    onStateChangeId, nativePopupColor, popup.arrowOffset.value, popup.arrowOffset.unitType.getValue(),
                    popup.showInSubWindow, nativeMask, popup.targetSpace.value, popup.targetSpace.unitType.getValue(),
                    popup.offset.x, popup.offset.y, popup.width.value, popup.width.unitType.getValue(),
                    nativeArrowPointPosition, popup.arrowWidth.value, popup.arrowWidth.unitType.getValue(),
                    popup.arrowHeight.value, popup.arrowHeight.unitType.getValue(), popup.radius.value,
                    popup.radius.unitType.getValue(), popup.shadow.getValue(), popup.backgroundBlurStyle.getValue(),
                    popup.focusable, nativeTransition, nativeOnWillDismiss, popup.followTransformOfTarget))
            LibC.free(nativeArrowPointPosition)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindPopup(show!: Bool, popup!: PopupOptions): This {
        var primaryActionId = INVALID_CALLBACK_ID
        if (!popup.primaryButton.value.isEmpty()) {
            primaryActionId = Callback0Param<Unit>(popup.primaryButton.action).getID()
        }

        var secondaryActionId = INVALID_CALLBACK_ID
        if (!popup.secondaryButton.value.isEmpty()) {
            secondaryActionId = Callback0Param<Unit>(popup.secondaryButton.action).getID()
        }
        var onStateChangeId = match (popup.onStateChange) {
            case Some(v) =>
                let lambda = {
                    isVisible: Bool => v(StateChangeEvent(isVisible))
                }
                Callback1Param<Bool, Unit>(lambda).getID()
            case None => INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss = match (popup.onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissPopupAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition = match (popup.transition) {
            case Some(value) => NativeOptionInt64(true, value.getID())
            case None => NativeOptionInt64(false, 0)
        }

        let nativePlacement = match (popup.placement) {
            case Some(value) => value.getValue()
            case None => match (popup.placementOnTop) {
                case true => Placement.Top.getValue()
                case false => Placement.Bottom.getValue()
            }
        }
        callFFIBindPopup(popup, primaryActionId, secondaryActionId, onStateChangeId, nativeOnWillDismiss,
            nativeTransition, nativePlacement, show)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindPopup(show!: Bool, popup!: CustomPopupOptions): This {
        var onStateChangeId = match (popup.onStateChange) {
            case Some(v) =>
                let lambda = {
                    isVisible: Bool => v(StateChangeEvent(isVisible))
                }
                Callback1Param<Bool, Unit>(lambda).getID()
            case None => INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss = match (popup.onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissPopupAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition = match (popup.transition) {
            case Some(value) => NativeOptionInt64(true, value.getID())
            case None => NativeOptionInt64(false, 0)
        }

        let nativePopupColor = match (popup.popupColor) {
            case Some(value) => value.toUInt32()
            case None => popup.backgroundColor.toUInt32()
        }

        let nativeMask = match (popup.mask) {
            case Some(value) => value.toUInt32()
            case None => popup.maskColor.toUInt32()
        }

        callFFIBindCustomPopup(popup, onStateChangeId, nativeOnWillDismiss, nativeTransition, nativePopupColor,
            nativeMask, show)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func bindMenu(menuList: Array<Action>): This {
        let valueVecFFi = FFIVectorString(menuList.size)
        var index = 0
        for (i in menuList) {
            BaseLog.debug("bindMenu vecdata: " + i.value)
            valueVecFFi.setElement(index, i.value)
            index++
        }
        let data = MenuActionData(menuList)
        let callback = {
            actionName: CString => data.actionHandle(actionName.toString())
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindMenu(
                valueVecFFi.getNativeHandle(),
                Callback1Param<CString, Unit>(callback).getID()
            )
            valueVecFFi.free()
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
    public open func bindMenu(builder!: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindCustomMenu(Callback0Param<Unit>(builder).getID())
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
    public open func bindContextMenu(builder!: () -> Unit, responseType!: ResponseType,
        options!: ContextMenuOptions): This {
        var optionElement: CJContextMenuOptions = options.parseCContextMenuOptions()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(
                Callback0Param<Unit>(builder).getID(),
                responseType.getValue(),
                optionElement
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindMenu(content: Array<MenuElement>, options!: ?MenuOptions = None): This {
        let elementSize = content.size
        let elements = Array<NativeMenuElement>(elementSize, {index => content[index].parseToNative()})
        let arr: CPointer<NativeMenuElement> = unsafe { LibC.malloc<NativeMenuElement>(count: elementSize) }
        for (i in 0..elementSize) {
            unsafe { arr.write(i, elements[i]) }
        }
        let nativeElements = CArrNativeMenuElement(arr, elementSize)
        var optionElement: CJMenuOptions
        match (options) {
            case Some(value) => optionElement = value.parseCJMenuOptions()
            case None => optionElement = MenuOptions().parseCJMenuOptions()
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindMenuElement(nativeElements, optionElement)
            LibC.free(nativeElements.head)
            LibC.free(optionElement.title.value)
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
    public func bindContextMenu(builder!: () -> Unit, responseType!: ResponseType = ResponseType.LongPress): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindContextMenu(
                Callback0Param<Unit>(builder).getID(),
                responseType.getValue()
            )
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
    public func linearGradient(
        angle!: Option<Float64> = None,
        direction!: GradientDirection = Bottom,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
        let cDirection = direction.getValue()
        let cColorsArr = toCArrCColors(colors)
        unsafe {
            var cAngle = CPointer<Float64>()
            if (let Some(v) <- angle) {
                cAngle = LibC.malloc<Float64>(count: 1)
                cAngle.write(v)
            }
            let linearGradientParam = LinearGradientParam(cAngle, cDirection, cColorsArr, repeating)
            FfiOHOSAceFrameworkViewAbstractLinearGradient(linearGradientParam)
            LibC.free(cAngle)
            LibC.free(cColorsArr.head)
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
    public func sweepGradient(
        center: (Length, Length),
        start!: Float64 = 0.0,
        end!: Float64 = 0.0,
        rotation!: Float64 = 0.0,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
        let cCenter = CTupleLength(center[0].value, center[0].unitType.getValue(), center[1].value,
            center[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors)
        let sweepGradientParam = SweepGradientParam(cCenter, start, end, rotation, cColorsArr, repeating)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSweepGradient(sweepGradientParam)
            LibC.free(cColorsArr.head)
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
    public func radialGradient(
        center: (Length, Length),
        radius: Float64,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
        radialGradient(center, radius.vp, colors: colors, repeating: repeating)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radialGradient(
        center: (Length, Length),
        radius: Length,
        colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        repeating!: Bool = false
    ): This {
        var radius_ = transAppResourceToLength(radius)
        let cCenter = CTupleLength(center[0].value, center[0].unitType.getValue(), center[1].value,
            center[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors)
        let radialGradientParam = RadialGradientParam(cCenter, radius_.value, radius_.unitType.getValue(), cColorsArr,
            repeating)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRadialGradient(radialGradientParam)
            LibC.free(cColorsArr.head)
        }
        this
    }

    func toCArrCColors(colors: Array<(Color, Float64)>): CArrCColors {
        let colorSize = colors.size
        let colorsArr = Array<CColors>(
            colorSize,
            {
                index =>
                let color = colors[index][0].toUInt32()
                let location = colors[index][1]
                CColors(color, location)
            }
        )
        let arr: CPointer<CColors> = unsafe { LibC.malloc<CColors>(count: colorSize) }
        for (i in 0..colorSize) {
            unsafe {
                arr.write(i, colorsArr[i])
            }
        }
        return CArrCColors(arr, colorSize)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>): This {
        unsafe {
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(value.getValue(), cKeys, keys.size, 0)
            LibC.free<Int32>(cKeys)
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
    public open func keyboardShortcut(value: String, keys: Array<ModifierKey>): This {
        unsafe {
            let cValue = LibC.mallocCString(value)
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue, cKeys, keys.size, 0)
            LibC.free(cValue)
            LibC.free<Int32>(cKeys)
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
    public open func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>, action: () -> Unit): This {
        unsafe {
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(value.getValue(), cKeys, keys.size,
                Callback0Param<Unit>(action).getID())
            LibC.free<Int32>(cKeys)
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
    public open func keyboardShortcut(value: String, keys: Array<ModifierKey>, action: () -> Unit): This {
        unsafe {
            let cValue = LibC.mallocCString(value)
            let cKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                cKeys.write(i, keys[i].getValue())
            }
            FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue, cKeys, keys.size,
                Callback0Param<Unit>(action).getID())
            LibC.free(cValue)
            LibC.free<Int32>(cKeys)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func key(value: String): This {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetInspectorKey(unsafeValue)
            LibC.free(unsafeValue)
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
    public open func renderFit(fitMode: RenderFit): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRenderFit(fitMode.getValue())
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
    public open func id(value: String): This {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetId(unsafeValue)
            LibC.free(unsafeValue)
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
    public func expandSafeArea(
        types!: Array<SafeAreaType> = [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD],
        edges!: Array<SafeAreaEdge> = [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]
    ): This {
        var safeAreaType: UInt32 = 0
        for (i in 0..types.size) {
            safeAreaType |= types[i].getValue()
        }
        var safeAreaEdge: UInt32 = 0
        for (i in 0..edges.size) {
            safeAreaEdge |= edges[i].getValue()
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractExpandSafeArea(safeAreaType, safeAreaEdge)
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
    public open func bindContentCover(isShow: Bool, builder: () -> Unit, contentCoverOptions: ContentCoverOptions): This {
        let cjBindCustomPopup = contentCoverOptions.parseCJContentCoverOptions(contentCoverOptions)
        unsafe {
            FFIOHOSAceFrameworkBindContentCoverV2(isShow, Callback0Param<Unit>(builder).getID(), cjBindCustomPopup)
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
    public open func animationStart(animation: AnimateParam): This {
        unsafe {
            let param = NativeOptionAnimateParam(true, parseAnimateParam(animation))
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
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
    public open func animationEnd(): This {
        unsafe {
            let param = NativeOptionAnimateParam(false, NativeAnimateParam())
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
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
    public open func transition(effect: TransitionEffect): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransition(effect.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func monopolizeEvents(monopolize: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkMonopolizeEvents(monopolize)
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
    public open func transition(effect: TransitionEffect, onFinish: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(onFinish);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransitionWithBack(effect.getID(), lambdaData.getID())
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
    public open func focusable(isFocusable: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkFocusable(isFocusable)
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
    public open func tabIndex(index: Int32): This {
        unsafe {
            FFIOHOSAceFrameworkTabIndex(index)
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
    public open func defaultFocus(isDefaultFocus: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkDefaultFocus(isDefaultFocus)
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
    public open func groupDefaultFocus(isGroupDefaultFocus: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkGroupDefaultFocus(isGroupDefaultFocus)
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
    public open func focusOnTouch(isFocusOnTouch: Bool): This {
        unsafe {
            FFIOHOSAceFrameworkFocusOnTouch(isFocusOnTouch)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func focusBox(style: FocusBoxStyle): This {
        let hasMargin = style.margin.isSome()
        let hasStrokeColor = style.strokeColor.isSome()
        let hasStrokeWidth = style.strokeWidth.isSome()
        unsafe {
            FFIOHOSAceFrameworkFocusBox(
                CJFocusBoxStyle(
                    hasMargin,
                    hasStrokeColor,
                    hasStrokeWidth,
                    if (hasMargin) {
                        style.margin.getOrThrow().value
                    } else {
                        0.0
                    },
                    if (hasMargin) {
                        style.margin.getOrThrow().unitType.getValue()
                    } else {
                        0
                    },
                    if (hasStrokeColor) {
                        style.strokeColor.getOrThrow().toUInt32()
                    } else {
                        0
                    },
                    if (hasStrokeWidth) {
                        style.strokeWidth.getOrThrow().value
                    } else {
                        0.0
                    },
                    if (hasStrokeWidth) {
                        style.strokeWidth.getOrThrow().unitType.getValue()
                    } else {
                        0
                    }
                )
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusScopePriority(scopeId: String, priority!: FocusPriority = FocusPriority.AUTO): This {
        unsafe {
            let id = LibC.mallocCString(scopeId)
            FFIOHOSAceFrameworkFocusScopePriority(id, priority.getValue())
            LibC.free(id)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusScopeId(id: String, isGroup!: Bool = false, arrowStepOut!: Bool = true): This {
        unsafe {
            let idCString = LibC.mallocCString(id)
            FFIOHOSAceFrameworkFocusScopeId(idCString, isGroup, arrowStepOut)
            LibC.free(idCString)
        }
        this
    }

    protected init() {
        super()
    }

    protected init(id: Int64) {
        super(id)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func initial(): Unit {
        pop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func update(): Unit {
        pop()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSheet(isShow: Bool, builder: () -> Unit, options!: SheetOptions = SheetOptions()): This {
        let cBuilder = Callback0Param<Unit>(builder).getID()
        let cSheetOption = SheetOptions.parse(options)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractbindSheetParamV2(isShow, cBuilder, cSheetOption)
            if (cSheetOption.detents.hasValue) {
                LibC.free<Int32>(cSheetOption.detents.value.head)
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func startTrace(name: String, taskId: Int32): This {
        HiTraceMeter.startTrace(name, taskId)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func finishTrace(name: String, taskId: Int32): This {
        HiTraceMeter.finishTrace(name, taskId)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func gesture(gesture: GestureType, mask: GestureMask): This {
        Gesture.create(GesturePriorityInner.Low, mask)
        gesture.create()
        gesture.pop()
        Gesture.pop()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func gesture(gesture: GestureType): This {
        this.gesture(gesture, GestureMask.Normal)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func priorityGesture(gesture: GestureType, mask: GestureMask): This {
        Gesture.create(GesturePriorityInner.High, mask)
        gesture.create()
        gesture.pop()
        Gesture.pop()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func priorityGesture(gesture: GestureType): This {
        this.priorityGesture(gesture, GestureMask.Normal)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func parallelGesture(gesture: GestureType, mask: GestureMask): This {
        Gesture.create(GesturePriorityInner.Parallel, mask)
        gesture.create()
        gesture.pop()
        Gesture.pop()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func parallelGesture(gesture: GestureType): This {
        this.parallelGesture(gesture, GestureMask.Normal)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func gestureModifier(modifier: GestureModifier): This {
        let elmtId = ViewStackProcessor.GetElmtIdToAccountFor()
        let gestureEvent: UIGestureEvent = UIGestureEvent(elmtId)
        modifier.applyGesture(gestureEvent)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func onGestureJudgeBegin(callback: (GestureInfo, BaseGestureEvent) -> GestureJudgeResult): This {
        let wrapper = {
            cjGestureInfo: CJGestureInfo, cjGestureEvent: CJBaseGestureEvent =>
            let gestureInfo = parseCJGestureInfo(cjGestureInfo)
            let gestureEvent = parseCJBaseGestureEvent(cjGestureEvent, gestureInfo.`type`)
            let result = callback(gestureInfo, gestureEvent)
            return result.getValue()
        }
        let onJudgeBegin = Callback2Param<CJGestureInfo, CJBaseGestureEvent, Int32>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOnGestureJudgeBegin(onJudgeBegin.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func draggable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDraggable(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func dragPreview(builder: () -> Unit): This {
        let cBuilder = Callback0Param<Unit>(builder).getID()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithBuilder(cBuilder)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func hoverEffect(value: HoverEffect) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractHoverEffect(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func hitTestBehavior(value: HitTestMode) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractHitTestBehavior(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func dragPreview(value: DragItemInfo): This {
        let pixelMapId = match (value.pixelMap) {
            case Some(v) => v.getID()
            case None => 0
        }
        let builderId = match (value.builder) {
            case Some(v) => Callback0Param<Unit>(v).getID()
            case None => 0
        }
        unsafe {
            var unsafeSrc = LibC.mallocCString(value.extraInfo)
            FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithDragItemInfo(
                CJDragItemInfo(
                    pixelMapId: pixelMapId,
                    builderId: builderId,
                    extraInfo: unsafeSrc
                )
            )
            LibC.free(unsafeSrc)
        }
        this
    }

    public open func dragPreview(value: String): This {
        unsafe {
            var unsafeSrc = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithString(unsafeSrc)
            LibC.free(unsafeSrc)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func borderImage(value: BorderImageOption): This {
        let sliceEdge = match (value.slice) {
            case v: LengthType => CJEdge(v, v, v, v)
            case v: EdgeWidths => CJEdge(v.top, v.right, v.bottom, v.left)
            case _ => throw IllegalArgumentException("Not support Type")
        }
        let widthEdge = match (value.width) {
            case v: LengthType => CJEdge(v, v, v, v)
            case v: EdgeWidths => CJEdge(v.top, v.right, v.bottom, v.left)
            case _ => throw IllegalArgumentException("Not support Type")
        }
        let outsetEdge = match (value.outset) {
            case v: LengthType => CJEdge(v, v, v, v)
            case v: EdgeWidths => CJEdge(v.top, v.right, v.bottom, v.left)
            case _ => throw IllegalArgumentException("Not support Type")
        }
        unsafe {
            let option = CBorderImageOption(sliceEdge, widthEdge, outsetEdge, value.repeat.getValue(), value.fill)
            match (value.source) {
                case v: String =>
                    var unsafeSrc = LibC.mallocCString(v)
                    FfiOHOSAceFrameworkViewAbstractSetBorderImageWithString(unsafeSrc, option)
                    LibC.free(unsafeSrc)
                case v: AppResource =>
                    var unsafeSrc = LibC.mallocCString(getResourceMedia(v))
                    FfiOHOSAceFrameworkViewAbstractSetBorderImageWithString(unsafeSrc, option)
                    LibC.free(unsafeSrc)
                case v: LinearGradientOption =>
                    let cDirection = v.direction.getValue()
                    let cColorsArr = toCArrCColors(v.colors)
                    var cAngle = LibC.malloc<Float64>(count: 1)
                    cAngle.write(v.angle)
                    let param = LinearGradientParam(cAngle, cDirection, cColorsArr, v.repeating)
                    FfiOHOSAceFrameworkViewAbstractSetBorderImageWithLinearGradient(param, option)
                    LibC.free(cAngle)
                    LibC.free(cColorsArr.head)
                case _ => throw IllegalArgumentException("Not support Type")
            }
        }
        this
    }
}
