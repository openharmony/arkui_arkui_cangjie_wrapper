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
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

import ohos.multimedia.image.PixelMap

public interface CommonShapeMethod<T> <: CommonMethod<T> {
    func fill(value: ?ResourceColor): T

    func fillOpacity(value: ?Float64): T

    func fillOpacity(value: ?AppResource): T

    func stroke(value: ?ResourceColor): T

    func strokeDashArray(value: ?Array<Length>): T

    func strokeDashOffset(value: ?Length): T

    func strokeLineCap(value: ?LineCapStyle): T

    func strokeLineJoin(value: ?LineJoinStyle): T

    func strokeMiterLimit(miterLimit: ?Float64): T

    func strokeOpacity(value: ?Float64): T

    func strokeOpacity(value: ?AppResource): T

    func strokeWidth(value: ?Length): T

    func antiAlias(value: ?Bool): T
}
