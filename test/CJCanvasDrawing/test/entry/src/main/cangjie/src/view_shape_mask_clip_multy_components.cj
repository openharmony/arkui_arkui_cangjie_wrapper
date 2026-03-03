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
class ViewShapeMaskClipMultyComponents {
    func build() {
        Scroll() {
            Column() {
                // ========== 八、不同组件上的接口使用测试 ==========
                Text("八、不同组件上的接口使用测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("8.1 Image 组件").fontSize(16)
                Image(@r(app.media.startIcon))
                    .maskShape(CircleShape(width: 140, height: 140))
                    .width(500).height(140)
                    .id("component_image_mask")
                
                Image(@r(app.media.startIcon))
                    .clipShape(CircleShape(width: 280, height: 280))
                    .width(500).height(280)
                    .id("component_image_clip")
                
                Image(@r(app.media.startIcon))
                    .maskShape(RectShape(width: 200, height: 100).fill(Color.Red))
                    .clipShape(CircleShape(width: 200, height: 200))
                    .width(200).height(200)
                    .id("component_image_combo")
                
                Text("8.2 Shape 组件").fontSize(16)
                Text("Shape().maskShape(...)").fontSize(14)
                Shape() {
                    Rect().width(200).height(100)
                }
                .maskShape(RectShape(width: 200, height: 100).fill(Color.Red))
                .fill(Color.Blue)
                .width(200).height(100)
                .id("component_shape_mask")
                
                Text("Shape { Rect() }.clipShape(...)").fontSize(14)
                Shape() {
                    Rect().width(200).height(200)
                }
                .clipShape(CircleShape(width: 280, height: 280))
                .fill(Color.Blue)
                .width(200).height(200)
                .id("component_shape_clip")
                
                Shape() {
                    Rect().width(200).height(200)
                }
                .maskShape(PathShape(commands: "M 0 0 L 100 0 L 100 100 Z"))
                .clipShape(EllipseShape(width: 200, height: 100))
                .fill(Color.Blue)
                .width(200).height(200)
                .id("component_shape_combo")
                
                Text("8.3 Text 组件").fontSize(16)
                Text("Test")
                    .fontSize(20).width(100).height(100)
                    .clipShape(CircleShape())
                    .id("component_text_circle")
                
                Text("Test")
                    .fontSize(20).width(100).height(100)
                    .clipShape(RectShape(width: 50, height: 50).radius(10))
                    .id("component_text_rect")
                
                Text("Test")
                    .fontSize(20).width(100).height(100)
                    .clipShape(CircleShape(width: 50, height: 50))
                    .clipShape(Option<BaseShape>.None)
                    .id("component_text_cancel")
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

