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
import ohos.business_exception.BusinessException

let COLOR_TRANSPARENT_VALUE: UInt32 = 0X00000000

/**
 * Defines the color which can use resource.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface ResourceColor {
    /**
     * The value type of ResourceColor.
     * @returns { UInt32 } - Color value in rgba
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func toUInt32(): UInt32 {
        throw BusinessException(100001, "Internal error.")
    }
}

extend Int64 <: ResourceColor {
    /**
     * The hexadecimal value of the color.
     *
     * @returns { UInt32 } - The rgba value of color
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @OverflowWrapping
    public func toUInt32(): UInt32 {
        return Color.alphaAdapt(UInt32(this))
    }
}

extend UInt32 <: ResourceColor {
    /**
     * The hexadecimal value of the color.
     *
     * @returns { UInt32 } - The rgba value of color
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toUInt32(): UInt32 {
        return Color.alphaAdapt(this)
    }
}

/**
 * Common class of color.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Color <: ResourceColor {
    private var value_: UInt32 = 0

    /**
     * Black.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Black: Color = Color(0xff000000)
    
    /**
     * Blue.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Blue: Color = Color(0xff0000ff)
    
    /**
     * Gray.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Gray: Color = Color(0xff808080)
    
    /**
     * Green.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Green: Color = Color(0xff008000)
    
    /**
     * Red.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Red: Color = Color(0xffff0000)
    
    /**
     * White.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let White: Color = Color(0xffffffff)
    
    /**
     * Transparent.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Transparent: Color = Color(0, 0, 0, alpha: 0.0)

    /**
     * Constructor of Color.
     *
     * @param { UInt8 } red - Red component of color
     * @param { UInt8 } green - Green component of color
     * @param { UInt8 } blue - Blue component of color
     * @param { ?Float32 } alpha - Alpha component of color
     * @default alpha - 1.0
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: ?Float32 = None) {
        let tmpAlpha = alpha ?? 1.0

        let a: UInt32 = match {
            case tmpAlpha > 1.0 => 0xff
            case tmpAlpha < 0.0 => 0
            case _ => UInt32(tmpAlpha * Float32(0xff))
        } << 24
        let r: UInt32 = UInt32(red) << 16
        let g: UInt32 = UInt32(green) << 8
        let b: UInt32 = UInt32(blue)
        this.value_ = a + r + g + b
    }

    /**
     * Constructor of Color.
     *
     * @param { UInt32 } value - The rgba value of color
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: UInt32) {
        this.value_ = alphaAdapt(value)
    }

    protected static func alphaAdapt(origin: UInt32): UInt32 {
        var result: UInt32 = origin
        if (origin == COLOR_TRANSPARENT_VALUE) {
            return result
        }
        if ((origin >> 24) == 0) {
            result = origin | 0xff000000
        }
        return result
    }

    /**
     * The hexadecimal value of the color.
     *
     * @returns { UInt32 } - The rgba value of color
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toUInt32(): UInt32 {
        this.value_
    }
}
