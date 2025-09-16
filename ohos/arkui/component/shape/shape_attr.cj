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
import ohos.base.*
import ohos.resource.*

sealed interface ShapeAttribute <: CommonShapeMethod<ShapeAttribute> {
    func viewPort(
        x!: ?Length,
        y!: ?Length,
        width!: ?Length,
        height!: ?Length
    ): ShapeAttribute


    func mesh(array: ?Array<Float64>, column: ?UInt32, row: ?UInt32): ShapeAttribute
}
