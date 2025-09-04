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

package ohos.arkui.component.image

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.multimedia.image.PixelMap

sealed interface ImageAttribute <: CommonMethod<ImageAttribute> {

    func alt(src: ResourceStr): ImageAttribute

    func objectFit(value: ImageFit): ImageAttribute

    func objectRepeat(value: ImageRepeat): ImageAttribute

    func interpolation(value: ImageInterpolation): ImageAttribute

    func renderMode(value: ImageRenderMode): ImageAttribute

    func sourceSize(width: Length, height: Length): ImageAttribute

    func syncLoad(value: Bool): ImageAttribute

    func fillColor(value: ResourceColor): ImageAttribute

    func autoResize(value: Bool): ImageAttribute

    func matchTextDirection(value: Bool): ImageAttribute

    func fitOriginalSize(value: Bool): ImageAttribute

    func onComplete(callback: ImageCompleteCallback): ImageAttribute

    func onError(callback: ImageErrorCallback): ImageAttribute

    func onFinish(event: () -> Unit): ImageAttribute
}
