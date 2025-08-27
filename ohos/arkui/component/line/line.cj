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

package ohos.arkui.component.line

import ohos.arkui.component.shape.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkLineCreate(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkLineSetStart(x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkLineSetEnd(x: Float64, y: Float64): Unit
}

/**
 * Defines Line Component.
 *
 * @relation declare const Line: LineInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Line <: ShapeComponent {
    /**
     * Create a Line.
     *
     * @param { Length } windth - Width of the rectangle where the line resides.
     * @param { Length } height - Height of the rectangle where the line resides.
     * @returns { This }
     * @relation (options?: LineOptions): LineAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length = 0.vp, height!: Length = 0.vp) {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkLineCreate(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
        }
    }

    /**
     * Coordinate of the start point of the line (relative coordinate).
     *
     * @param { (Float64, Float64) } value
     * @returns { This }
     * @relation startPoint(value: Array<any>): LineAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startPoint(value: (Float64, Float64)): This {
        unsafe {
            FfiOHOSAceFrameworkLineSetStart(value[0], value[1])
        }
        this
    }

    /**
     * Line end coordinates (relative coordinates).
     *
     * @param { (Float64, Float64) } value
     * @returns { This }
     * @relation endPoint(value: Array<any>): LineAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endPoint(value: (Float64, Float64)): This {
        unsafe {
            FfiOHOSAceFrameworkLineSetEnd(value[0], value[1])
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
