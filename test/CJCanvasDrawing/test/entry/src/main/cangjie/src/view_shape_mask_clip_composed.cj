/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ohos.arkui.shape.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.__GenerateResource__

/**
 * Shape 模块 maskShape 和 clipShape 接口高级测试
 * 包含：EllipseShape 测试、PathShape 测试、组合使用测试、属性影响测试、不同组件测试
 */
@Entry
@Component
class ViewShapeMaskClipComposed {
    func build() {
        Scroll() {
            Column() {
                // ========== 六、maskShape 和 clipShape 组合使用测试 ==========
                Text("六、maskShape 和 clipShape 组合使用测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("6.1 组合调用顺序").fontSize(16)
                Text("先 clipShape 后 maskShape").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 200, height: 200))
                    .maskShape(RectShape(width: 200, height: 100).radius(10))
                    .id("combo_clip_mask")
                
                Text("先 maskShape 后 clipShape").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(RectShape(width: 200, height: 100).fill(Color.Red))
                    .clipShape(CircleShape(width: 200, height: 200))
                    .id("combo_mask_clip")
                
                Text("6.2 多次调用").fontSize(16)
                Text("多次调用 clipShape（覆盖）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 200, height: 200))
                    .clipShape(RectShape(width: 200, height: 100).radius(10))
                    .id("multi_clip")
                
                Text("多次调用 maskShape（覆盖）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape(width: 200, height: 200))
                    .maskShape(RectShape(width: 200, height: 100).fill(Color.Red))
                    .id("multi_mask")
                
                Text("6.3 链式调用组合").fontSize(16)
                Text("Image().clipShape(...).maskShape(...).width(...).height(...)").fontSize(14)
                Image(@r(app.media.startIcon))
                    .clipShape(CircleShape(width: 100, height: 100))
                    .maskShape(RectShape(width: 200, height: 100).radius(10))
                    .width(500).height(140)
                    .id("chain_image")
                
                Text("Shape().maskShape(...).clipShape(...).fill(...)").fontSize(14)
                Shape() {
                    Rect().width(200).height(100)
                }
                .maskShape(RectShape(width: 100, height: 50).fill(Color.Red))
                .clipShape(CircleShape(width: 50, height: 50))
                .fill(Color.Blue)
                .width(200).height(100)
                .id("chain_shape")
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

