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

protected package ohos.arkui.component.divider

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkDividerCreate(): Unit

    func FfiOHOSAceFrameworkDividerSetVertical(isVertical: Bool): Unit

    func FfiOHOSAceFrameworkDividerSetLineCap(style: Int32): Unit

    func FfiOHOSAceFrameworkDividerSetDividerColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkDividerSetStrokeWidth(width: Float64, unit: Int32): Unit
}

/**
 * Defines Divider Component.
 *
 * @relation const Divider: DividerInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Divider <: ViewBase {
    /**
    * Return Divider.
    *
    * @returns { Divider }
    * @relation (): DividerAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkDividerCreate()
        }
    }

    /**
    * Indicates whether to use a horizontal splitter or a vertical splitter.
    * The options are as follows: false: horizontal splitter; true: vertical splitter.
    *
    * @param { Bool } value
    * @returns { Divider }
    * @relation vertical(value: boolean): DividerAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vertical(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkDividerSetVertical(value)
        }
        this
    }

    /**
    * Sets the color of the divider line.
    *
    * @param { ResourceColor } value
    * @returns { Divider }
    * @relation color(value: ResourceColor): DividerAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkDividerSetDividerColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
    * Sets the width of the dividing line.
    *
    * @param { Length } value
    * @returns { Divider }
    * @relation strokeWidth(value: number | string): DividerAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeWidth(value: Length): This {
        var width_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkDividerSetStrokeWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    /**
    * Sets the end style of the split line. The default value is Butt.
    *
    * @param { LineCapStyle } value
    * @returns { Divider }
    * @relation lineCap(value: LineCapStyle): DividerAttribute;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineCap(value: LineCapStyle): This {
        unsafe {
            FfiOHOSAceFrameworkDividerSetLineCap(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected func pop(): Unit {
        this
    }
}
