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
 * Shape 模块 maskShape 和 clipShape 接口基础测试
 * 包含：接口基础测试、CircleShape 测试、RectShape 测试
 */
@Entry
@Component
class ViewShapeMaskClipBasic {
    func build() {
        Scroll() {
            Column() {
                // ========== 一、接口基础测试 ==========
                Text("一、接口基础测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("1.1 maskShape 接口定义验证").fontSize(16)
                Text("maskShape(value: BaseShape) - 参数类型验证（非可选）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(RectShape(width: 200, height: 100).fill(Color.Red))
                    .id("mask_shape_basic")
                
                Text("1.2 clipShape 接口定义验证").fontSize(16)
                Text("clipShape(value: ?BaseShape) - 参数类型验证（可选）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .clipShape(CircleShape(width: 200, height: 100))
                    .id("clip_shape_basic")
                
                Text("clipShape(None) - 取消裁剪").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .clipShape(CircleShape(width: 200, height: 100))
                    .clipShape(Option<BaseShape>.None)
                    .id("clip_shape_none")
                
                Text("1.3 支持接口的组件").fontSize(16)
                Text("Image().maskShape(...) / clipShape(...)").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(150).height(100)
                    .maskShape(CircleShape(width: 150, height: 100))
                    .id("image_mask")
                
                Text("Shape().maskShape(...) / clipShape(...)").fontSize(14)
                Shape() {
                    Rect().width(150).height(100)
                }
                .width(150).height(100).fill(Color.Blue)
                .maskShape(RectShape(width: 150, height: 100).fill(Color.Red))
                .id("shape_mask")
                
                Text("Text().clipShape(...)").fontSize(14)
                Text("Test Text")
                    .fontSize(16)
                    .clipShape(CircleShape(width: 100, height: 50))
                    .id("text_clip")
                
                Divider().margin(top: 10, bottom: 10)
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

