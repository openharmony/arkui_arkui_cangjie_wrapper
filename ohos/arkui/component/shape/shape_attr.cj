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

package ohos.arkui.component.shape

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines Shape Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ShapeAttribute <: CommonShapeMethod<ShapeAttribute> {
    /**
    * Viewport of shape
    *
    * @param { ?Length } x
    * @param { ?Length } y
    * @param { ?Length } width
    * @param { ?Length } height
    * @returns { ShapeAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func viewPort(
        x!: ?Length,
        y!: ?Length,
        width!: ?Length,
        height!: ?Length
    ): ShapeAttribute

    /**
    * Called when shape mesh.
    *
    * @param { ?Array<Float64> } value
    * @param { ?UInt32 } column
    * @param { ?UInt32 } row
    * @returns { ShapeAttribute }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func mesh(array: ?Array<Float64>, column: ?UInt32, row: ?UInt32): ShapeAttribute
}
