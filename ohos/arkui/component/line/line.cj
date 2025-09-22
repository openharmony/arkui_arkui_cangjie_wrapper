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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Line <: CommonShapeMethodComponent<LineAttribute> & LineAttribute {
    /**
     * Create a Line.
     *
     * @param { Length } windth - Width of the rectangle where the line resides.
     * @param { Length } height - Height of the rectangle where the line resides.
     * @returns { This }
     * @relation (options?: LineOptions): LineAttribute
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length = None, height!: ?Length = None) {
        var width_ = transAppResourceToLength(width ?? 0.vp)
        var height_ = transAppResourceToLength(height ?? 0.vp)
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func startPoint(value: ?(Float64, Float64)): This {
        let tmpValue = value ?? (0.0, 0.0)
        unsafe {
            FfiOHOSAceFrameworkLineSetStart(tmpValue[0], tmpValue[1])
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func endPoint(value: ?(Float64, Float64)): This {
        let tmpValue = value ?? (0.0, 0.0)
        unsafe {
            FfiOHOSAceFrameworkLineSetEnd(tmpValue[0], tmpValue[1])
        }
        this
    }

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
