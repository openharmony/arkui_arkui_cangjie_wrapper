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

package ohos.base

import ohos.labels.APILevel
import ohos.business_exception.*
import std.deriving.Derive

/**
 * Defines the length property.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface Length {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop value: Float64 {
        get() {
            throw BusinessException(10000, "Current type not support get 'value' attribute")
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop unitType: LengthType {
        get() {
            throw BusinessException(10000, "Current type not support get 'unitType' attribute")
        }
    }
}

/**
 * Defines the length property.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface LengthProp {
    /**
     * Defines the length property in units of px.
     *
     * @relation declare type PX = `${number}px`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop px: Length
    /**
     * Defines the length property in units of vp.
     *
     * @relation declare type VP = `${number}vp` | number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop vp: Length
    /**
     * Defines the length property in units of fp.
     *
     * @relation declare type FP = `${number}fp`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop fp: Length
    /**
     * Defines the length property in units of percent.
     *
     * @relation declare type Percentage = `${number}%`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop percent: Length
    /**
     * Defines the length property in units of lpx.
     *
     * @relation declare type LPX = `${number}lpx`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop lpx: Length
}

/**
 * Defines the dimension property with number with units(vp|px|fp|lpx|%)
 *
 * @relation declare type Dimension = PX | VP | FP | LPX | Percentage | Resource
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LengthType <: Length {
    /**
     * Defines the length property in units of px.
     *
     * @relation declare type PX = `${number}px`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    px(Float64)
    /**
     * Defines the length property in units of vp.
     *
     * @relation declare type VP = `${number}vp` | number
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    vp(Float64)
    /**
     * Defines the length property in units of fp.
     *
     * @relation declare type FP = `${number}fp`
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    fp(Float64)
    /**
     * Defines the length property in units of percent.
     *
     * @relation declare type Percentage = `${number}%`
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    percent(Float64)
    /**
     * Defines the length property in units of lpx.
     *
     * @relation declare type LPX = `${number}lpx`
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    lpx(Float64)
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case px(v) => 0
            case vp(v) => 1
            case fp(v) => 2
            case percent(v) => 3
            case lpx(v) => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func parse(value: Int32): LengthType {
        match (value) {
            case 0 => px(Float64(value))
            case 1 => vp(Float64(value))
            case 2 => fp(Float64(value))
            case 3 => percent(Float64(value))
            case 4 => lpx(Float64(value))
            case _ => vp(Float64(value))
        }
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop value: Float64 {
        get() {
            match (this) {
                case px(v) => v
                case vp(v) => v
                case fp(v) => v
                case percent(v) => v
                case lpx(v) => v
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop unitType: LengthType {
        get() {
            this
        }
    }
}

/**
 * Defines the Float64 which can use Length.
 *
 * @relation declare type Length = string | number | Resource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend Float64 <: LengthProp & Length {
    /**
     * Defines the length property in units of px.
     *
     * @relation declare type PX = `${number}px`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop px: Length {
        get() {
            LengthType.px(this)
        }
    }

    /**
     * Defines the length property in units of vp.
     *
     * @relation declare type VP = `${number}vp` | number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop vp: Length {
        get() {
            LengthType.vp(this)
        }
    }

    /**
     * Defines the length property in units of fp.
     *
     * @relation declare type FP = `${number}fp`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop fp: Length {
        get() {
            LengthType.fp(this)
        }
    }

    /**
     * Defines the length property in units of percent.
     *
     * @relation declare type Percentage = `${number}%`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop percent: Length {
        get() {
            LengthType.percent(this / 100.0)
        }
    }

    /**
     * Defines the length property in units of lpx.
     *
     * @relation declare type LPX = `${number}lpx`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop lpx: Length {
        get() {
            LengthType.lpx(this)
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop value: Float64 {
        get() {
            this
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop unitType: LengthType {
        get() {
            LengthType.vp(Float64(this))
        }
    }
}

/**
 * Defines the Int64 which can use Length.
 *
 * @relation declare type Length = string | number | Resource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend Int64 <: LengthProp & Length {
    /**
     * Defines the length property in units of px.
     *
     * @relation declare type PX = `${number}px`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop px: Length {
        get() {
            LengthType.px(Float64(this))
        }
    }
    /**
     * Defines the length property in units of vp.
     *
     * @relation declare type VP = `${number}vp` | number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop vp: Length {
        get() {
            LengthType.vp(Float64(this))
        }
    }
    /**
     * Defines the length property in units of fp.
     *
     * @relation declare type FP = `${number}fp`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop fp: Length {
        get() {
            LengthType.fp(Float64(this))
        }
    }
    /**
     * Defines the length property in units of percent.
     *
     * @relation declare type Percentage = `${number}%`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop percent: Length {
        get() {
            LengthType.percent(Float64(this) / 100.0)
        }
    }
    /**
     * Defines the length property in units of lpx.
     *
     * @relation declare type LPX = `${number}lpx`
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop lpx: Length {
        get() {
            LengthType.lpx(Float64(this))
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop value: Float64 {
        get() {
            Float64(this)
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop unitType: LengthType {
        get() {
            LengthType.vp(Float64(this))
        }
    }
}
