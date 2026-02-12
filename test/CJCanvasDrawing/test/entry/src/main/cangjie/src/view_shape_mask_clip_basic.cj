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
                
                // ========== 二、CircleShape 测试 ==========
                Text("二、CircleShape 测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("2.1 maskShape 使用 CircleShape").fontSize(16)
                Text("默认圆形遮罩").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(140).height(140)
                    .maskShape(CircleShape())
                    .id("circle_mask_default")
                
                Text("指定尺寸").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape(width: 100, height: 100))
                    .id("circle_mask_size")
                
                Text("带填充色").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(140).height(140)
                    .maskShape(CircleShape(width: 140, height: 140).fill(Color.Red))
                    .id("circle_mask_fill")
                
                Text("2.2 clipShape 使用 CircleShape").fontSize(16)
                Text("Image 组件圆形裁剪").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(280).height(280)
                    .clipShape(CircleShape(width: 280, height: 280))
                    .id("circle_clip_image")
                
                Text("Text 组件圆形裁剪").fontSize(14)
                Text("Test")
                    .fontSize(20).width(100).height(100)
                    .clipShape(CircleShape(width: 50, height: 50))
                    .id("circle_clip_text")
                
                Text("Shape 组件圆形裁剪").fontSize(14)
                Shape() {
                    Rect().width(100).height(100)
                }
                .width(100).height(100).fill(Color.Blue)
                .clipShape(CircleShape(width: 100, height: 100))
                .id("circle_clip_shape")
                
                Text("取消裁剪").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 200, height: 200))
                    .clipShape(Option<BaseShape>.None)
                    .id("circle_clip_cancel")
                
                Text("2.3 CircleShape 属性配置影响").fontSize(16)
                Text("width/height/size 对遮罩/裁剪区域的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape().width(100).height(50))
                    .id("circle_attr_size")
                
                Text("offset 对遮罩/裁剪位置的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 100, height: 100).offset(x: 10, y: 20))
                    .id("circle_attr_offset")
                
                Text("fill 对遮罩/裁剪的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape(width: 200, height: 200).fill(Color.Green))
                    .id("circle_attr_fill")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 三、RectShape 测试 ==========
                Text("三、RectShape 测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("3.1 maskShape 使用 RectShape").fontSize(16)
                Text("指定尺寸").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(500).height(140)
                    .maskShape(RectShape(width: 200, height: 100))
                    .id("rect_mask_size")
                
                Text("使用十六进制颜色").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(500).height(140)
                    .maskShape(RectShape(width: 200, height: 100).fill(0xff0000))
                    .id("rect_mask_hex")
                
                Text("3.2 clipShape 使用 RectShape").fontSize(16)
                Text("指定尺寸").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .clipShape(RectShape(width: 200, height: 100))
                    .id("rect_clip_size")
                
                Text("圆角裁剪").fontSize(14)
                Shape() {
                    Rect().width(200).height(100)
                }
                .width(200).height(100).fill(Color.Blue)
                .clipShape(RectShape(width: 200, height: 100).radius(10))
                .id("rect_clip_radius")
                
                Text("3.3 RectShape 圆角遮罩/裁剪测试").fontSize(16)
                Text("统一圆角").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(RectShape(width: 200, height: 100).radius(10))
                    .id("rect_radius_unified")
                
                Text("分别设置圆角").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(RectShape(width: 200, height: 100).radiusWidth(8).radiusHeight(8))
                    .id("rect_radius_separate")
                
                Text("圆角+填充色").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(RectShape(width: 200, height: 100).radius(3).fill(Color.Red))
                    .id("rect_radius_fill")
                
                Text("3.4 RectShape 属性配置影响").fontSize(16)
                Text("width/height/size 对遮罩/裁剪区域的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(300).height(150)
                    .maskShape(RectShape().width(200).height(100))
                    .id("rect_attr_size")
                
                Text("radius 对圆角的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .clipShape(RectShape(width: 200, height: 100).radius(10))
                    .id("rect_attr_radius")
                
                Text("fill 对遮罩/裁剪的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(100)
                    .maskShape(RectShape(width: 200, height: 100).fill(Color.Blue))
                    .id("rect_attr_fill")
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

