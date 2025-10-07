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

package ohos.arkui.component.view

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.math.*

@C
struct CJMultiShadowOptions {
    var radiusValue: Float64
    var offsetXValue: Float64
    var offsetYValue: Float64
    var radiusUnit: Int32
    var offsetXUnit: Int32
    var offsetYUnit: Int32
    init(
        radius!: Length = 20.vp,
        offsetX!: Length = 5.vp,
        offsetY!: Length = 5.vp
    ) {
        this.radiusValue = radius.value
        this.radiusUnit = radius.unitType.getValue()
        this.offsetXValue = offsetX.value
        this.offsetXUnit = offsetX.unitType.getValue()
        this.offsetYValue = offsetY.value
        this.offsetYUnit = offsetY.unitType.getValue()
    }
}
