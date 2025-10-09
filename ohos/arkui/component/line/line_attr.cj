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
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Line Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface LineAttribute <: CommonShapeMethod<LineAttribute> {
    /**
     * Coordinate of the start point of the line (relative coordinate).
     *
     * @param { ?(Float64, Float64) } value
     * @returns { LineAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func startPoint(value: ?(Float64, Float64)): LineAttribute

    /**
     * Line end coordinates (relative coordinates).
     *
     * @param { ?(Float64, Float64) } value
     * @returns { LineAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func endPoint(value: ?(Float64, Float64)): LineAttribute
}
