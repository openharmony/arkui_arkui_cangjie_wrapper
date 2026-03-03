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
class ViewShapeMaskClipEllipseShape {
    func build() {
        Scroll() {
            Column() {
                // ========== 四、EllipseShape 测试 ==========
                Text("四、EllipseShape 测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("4.1 maskShape 使用 EllipseShape").fontSize(16)
                Text("指定尺寸").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(EllipseShape(width: 200, height: 100))
                    .id("ellipse_mask_size")
                
                Text("圆形遮罩").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(EllipseShape(width: 100, height: 100))
                    .id("ellipse_mask_circle")
                
                Text("4.2 clipShape 使用 EllipseShape").fontSize(16)
                Text("指定尺寸").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .clipShape(EllipseShape(width: 200, height: 100))
                    .id("ellipse_clip_size")
                
                Text("Shape 组件椭圆裁剪").fontSize(14)
                Shape() {
                    Ellipse().width(200).height(100)
                }
                .width(200).height(100).fill(Color.Green)
                .clipShape(EllipseShape(width: 100, height: 50))
                .id("ellipse_clip_shape")
                
                Text("4.3 EllipseShape 属性配置影响").fontSize(16)
                Text("width/height/size 对遮罩/裁剪区域的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(EllipseShape().width(200).height(100))
                    .id("ellipse_attr_size")
                
                Text("fill 对遮罩/裁剪的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .clipShape(EllipseShape(width: 200, height: 100).fill(Color.Green))
                    .id("ellipse_attr_fill")
                
                Divider().margin(top: 10, bottom: 10)
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

