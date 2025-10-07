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

/**
 * Defines the color which can use resource.
 *
 * @typedef { Color | UInt32 | AppResource } ResourceColor
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 * @relation declare type ResourceColor = Color | number | string | Resource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface ResourceColor {
    func toUInt32(): UInt32 {
        throw BusinessException(10000, "AppResource can not get 'UInt32' value from ResourceColor")
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend Int64 <: ResourceColor {
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @OverflowWrapping
    public func toUInt32(): UInt32 {
        return Color.alphaAdapt(UInt32(this))
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend UInt32 <: ResourceColor {
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toUInt32(): UInt32 {
        return Color.alphaAdapt(this)
    }
}

/**
 * common class of color
 *
 * @class Color
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 * @relation declare enum Color
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Color <: ResourceColor {
    private var value_: UInt32 = 0

    /**
     * Black.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Black
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Black: Color = Color(0xff000000)
    /**
     * Blue.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Blue
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Blue: Color = Color(0xff0000ff)
    /**
     * Gray.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Gray
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Gray: Color = Color(0xff808080)
    /**
     * Green.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Green
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Green: Color = Color(0xff008000)
    /**
     * Red.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Red
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Red: Color = Color(0xffff0000)
    /**
     * White.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation White
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let White: Color = Color(0xffffffff)
    /**
     * Transparent.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Transparent
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static let Transparent: Color = Color(0, 0, 0, alpha: 0.0)

    /**
     * Constructor of color.
     * @param { UInt8 } red
     * @param { UInt8 } green
     * @param { UInt8 } blue
     * @param { UInt8 } alpha
     * @returns { Color }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0) {
        let a: UInt32 = match {
            case alpha > 1.0 => 0xff
            case alpha < 0.0 => 0
            case _ => UInt32(alpha * Float32(0xff))
        } << 24
        let r: UInt32 = UInt32(red) << 16
        let g: UInt32 = UInt32(green) << 8
        let b: UInt32 = UInt32(blue)
        this.value_ = a + r + g + b
    }

    /**
     * Constructor of color.
     * @param { UInt32 } value
     * @returns { Color }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: UInt32) {
        this.value_ = alphaAdapt(value)
    }

    protected static func alphaAdapt(origin: UInt32): UInt32 {
        var result: UInt32 = origin
        if ((origin >> 24) == 0) {
            result = origin | 0xff000000
        }
        result
    }

    public func toUInt32(): UInt32 {
        this.value_
    }
}
