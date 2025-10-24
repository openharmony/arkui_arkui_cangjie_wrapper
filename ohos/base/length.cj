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

package ohos.base

import ohos.labels.APILevel
import ohos.business_exception.*
import std.deriving.Derive

/**
 * Defines the length property.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface Length {
    /**
     * The value of length property.
     * @returns { Float64 } - The value of length
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop value: Float64 {
        get() {
            throw BusinessException(100001, "Internal error.")
        }
    }

    /**
     * The unit of length property.
     * @returns { LengthUnit } - The unit of length
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop unitType: LengthUnit {
        get() {
            throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the length property.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface LengthProp {
    /**
     * Defines the length property in units of px.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop px: Length
    
    /**
     * Defines the length property in units of vp.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop vp: Length
    
    /**
     * Defines the length property in units of fp.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop fp: Length
    
    /**
     * Defines the length property in units of percent.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop percent: Length
    
    /**
     * Defines the length property in units of lpx.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop lpx: Length
}

/**
 * Defines class LengthMetrics.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LengthMetrics <: Length {
    let realValue: Float64
    let realUnit: LengthUnit

    /**
     * LengthMetrics constructor.
     *
     * @param { Float64 } value - The value of length
     * @param { LengthUnit } unit - The unit of length
     * @default unit - LengthUnit.Vp
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: Float64, unit!: LengthUnit = LengthUnit.Vp) {
        this.realValue = value
        this.realUnit = unit
    }

    /**
    * Defines the value.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop value: Float64 {
        get() {
            return realValue
        }
    }

    /**
    * Defines the unit.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop unitType: LengthUnit {
        get() {
            return realUnit
        }
    }
}

/**
 * Defines the dimension property with number with units(vp|px|fp|lpx|%).
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LengthUnit {
    /**
     * Defines the length property in units of px.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Px
    
    /**
     * Defines the length property in units of vp.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vp
    
    /**
     * Defines the length property in units of fp.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fp
    
    /**
     * Defines the length property in units of percent.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Percent
    
    /**
     * Defines the length property in units of lpx.
     */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lpx
    | ...

    /**
     * Get the length property of number value.
     *
     * @returns { Int32 } - The integer value of the length unit
     * @throws { BusinessException } - 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Px => 0
            case Vp => 1
            case Fp => 2
            case Percent => 3
            case Lpx => 4
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    /**
     * Parse the length number value to LengthUnit type.
     *
     * @param { Int32 } value - The integer value to parse
     * @returns { LengthUnit } - The corresponding LengthUnit
     * @throws { BusinessException } - 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func parse(value: Int32): LengthUnit {
        match (value) {
            case 0 => LengthUnit.Px
            case 1 => LengthUnit.Vp
            case 2 => LengthUnit.Fp
            case 3 => LengthUnit.Percent
            case 4 => LengthUnit.Lpx
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

extend Float64 <: LengthProp & Length {
    /**
     * Defines the length property in units of px.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop px: Length {
        get() {
            LengthMetrics(this, unit: LengthUnit.Px)
        }
    }

    /**
     * Defines the length property in units of vp.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop vp: Length {
        get() {
            LengthMetrics(this, unit: LengthUnit.Vp)
        }
    }

    /**
     * Defines the length property in units of fp.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop fp: Length {
        get() {
            LengthMetrics(this, unit: LengthUnit.Fp)
        }
    }

    /**
     * Defines the length property in units of percent.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop percent: Length {
        get() {
            LengthMetrics(this / 100.0, unit: LengthUnit.Percent)
        }
    }

    /**
     * Defines the length property in units of lpx.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop lpx: Length {
        get() {
            LengthMetrics(this, unit: LengthUnit.Lpx)
        }
    }

    /**
    * Defines the value.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop value: Float64 {
        get() {
            this
        }
    }

    /**
    * Defines the unit.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop unitType: LengthUnit {
        get() {
            LengthUnit.Vp
        }
    }
}

extend Int64 <: LengthProp & Length {
    /**
     * Defines the length property in units of px.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop px: Length {
        get() {
            LengthMetrics(Float64(this), unit: LengthUnit.Px)
        }
    }
    
    /**
     * Defines the length property in units of vp.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop vp: Length {
        get() {
            LengthMetrics(Float64(this), unit: LengthUnit.Vp)
        }
    }
    
    /**
     * Defines the length property in units of fp.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop fp: Length {
        get() {
            LengthMetrics(Float64(this), unit: LengthUnit.Fp)
        }
    }
    
    /**
     * Defines the length property in units of percent.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop percent: Length {
        get() {
            LengthMetrics(Float64(this) / 100.0, unit: LengthUnit.Percent)
        }
    }
    
    /**
     * Defines the length property in units of lpx.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop lpx: Length {
        get() {
            LengthMetrics(Float64(this), unit: LengthUnit.Lpx)
        }
    }
    
    /**
    * Defines the value.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop value: Float64 {
        get() {
            Float64(this)
        }
    }
    
    /**
    * Defines the unit.
    */   
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop unitType: LengthUnit {
        get() {
            LengthUnit.Vp
        }
    }
}
