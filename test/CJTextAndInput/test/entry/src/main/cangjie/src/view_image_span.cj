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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.*
import std.collection.*
import ohos.multimedia.image.*

@Entry
@Component
class View_ImageSpan {
    @State
    var s_width: Float64 = 0.0
    let color = Array<UInt8>(96, repeat: 0)
    let opts = InitializationOptions(Size(4, 6), editable: true, pixelFormat: Rgba8888)
    let pixelMap = createPixelMap(color, opts)
    let ColorFilterMatrix = ColorFilter(
        [0.239, 0.0, 0.0, 0.0, 0.0,
        0.0, 0.616, 0.0, 0.0, 0.0,
        0.0,0.0, 0.706, 0.0, 0.0,
        0.0, 0.0,0.0, 1.0, 0.0]);

    func build() {
        Column() {
            // 基础场景用例：默认属性设置
            Text() {
                ImageSpan(@r(app.media.app_icon))
                    .width(100.vp)
                    .height(100.vp)
                    .id("imagespan_test_1")
            }

            Text() {
                ImageSpan(pixelMap)
                    .width(100.vp)
                    .height(100.vp)
                    .id("imagespan_test_2")
            }

            // 基础场景用例：合法属性设置
            Text() {
                ImageSpan(@r(app.media.app_icon))
                    .id("imagespan_test_3")
                    .width(100.vp)
                    .height(100.vp)
                    .colorFilter(ColorFilterMatrix)
                    .objectFit(ImageFit.Fill)
                    .verticalAlign(ImageSpanAlignment.Top)
                    .verticalAlign(ImageSpanAlignment.Center)
                    .onComplete({imobj: ImageLoadResult => s_width = imobj.width})
            }

            Text() {
                ImageSpan(pixelMap)
                    .width(100.vp)
                    .height(100.vp)
                    .id("imagespan_test_4")
                    .colorFilter(ColorFilterMatrix)
                    .objectFit(ImageFit.Fill)
                    .verticalAlign(ImageSpanAlignment.Center)
                    .onComplete({imobj:ImageLoadResult =>this.s_width = imobj.width})
            }

            Text("${this.s_width}").id("imagespan_width1")

            Text() {
                ImageSpan(AppResource("app","media",1))
                    .width(100.vp)
                    .height(100.vp)
                    .id("imagespan_test_5")
                    .onError({imobj: ImageError =>this.s_width = imobj.componentWidth})
            }

            Text("${this.s_width}").id("imagespan_width2")

            Text() {
                ImageSpan("string")
                    .objectFit(ImageFit.ScaleDown)
                    .objectFit(ImageFit.Fill)
                    .objectFit(ImageFit.Contain)
                    .objectFit(ImageFit.Cover)
                    .objectFit(ImageFit.Auto)
                    .objectFit(ImageFit.None)
            }.id("11111")

        }.width(100.percent).alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center)
    }

}
