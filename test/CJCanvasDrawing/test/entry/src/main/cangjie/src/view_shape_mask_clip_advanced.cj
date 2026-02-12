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
class ViewShapeMaskClipAdvanced {
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
                
                // ========== 五、PathShape 测试 ==========
                Text("五、PathShape 测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("5.1 maskShape 使用 PathShape").fontSize(16)
                Text("简单路径").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(PathShape(commands: "M 10 10 L 90 10 L 90 90 L 10 90 Z"))
                    .id("path_mask_simple")
                
                Text("Shape 组件路径遮罩").fontSize(14)
                Shape() {
                    Rect().width(200).height(200)
                }
                .width(200).height(200).fill(Color.Blue)
                .maskShape(PathShape(commands: "M 0 0 L 100 0 L 100 100 Z").fill(Color.Red))
                .id("path_mask_shape")
                
                Text("5.2 clipShape 使用 PathShape").fontSize(16)
                Text("简单路径").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(PathShape(commands: "M 10 10 L 90 10 L 90 90 L 10 90 Z"))
                    .id("path_clip_simple")
                
                Text("Shape 组件路径裁剪").fontSize(14)
                Shape() {
                    Rect().width(200).height(200)
                }
                .width(200).height(200).fill(Color.Blue)
                .clipShape(PathShape(commands: "M 0 0 L 100 0 L 100 100 Z"))
                .id("path_clip_shape")
                
                Text("5.3 SVG 路径命令测试").fontSize(16)
                Text("MoveTo (M)、LineTo (L)、CurveTo (C)、ClosePath (Z) 命令").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(PathShape(commands: "M 10 10 L 90 10 C 20 20, 30 30, 40 40 L 90 90 Z"))
                    .id("path_commands")
                
                Text("复杂路径组合").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(PathShape(commands: "M 0 0 L 100 0 L 100 100 L 0 100 Z"))
                    .id("path_complex")
                
                Text("5.4 PathShape 属性配置影响").fontSize(16)
                Text("width/height/size 对遮罩/裁剪区域的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(PathShape(width: 100, height: 50, commands: "M 10 10 L 90 10 L 90 90 L 10 90 Z"))
                    .id("path_attr_size")
                
                Text("fill 对遮罩/裁剪的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(PathShape(commands: "M 10 10 L 90 10 L 90 90 L 10 90 Z").fill(Color.Blue))
                    .id("path_attr_fill")
                
                Divider().margin(top: 10, bottom: 10)
                
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
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 七、BaseShape 属性对接口的影响测试 ==========
                Text("七、BaseShape 属性对接口的影响测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("7.1 fill() 方法的影响").fontSize(16)
                Text("maskShape/clipShape 使用 fill(Color.Red)").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape(width: 200, height: 200).fill(Color.Red))
                    .id("fill_color")
                
                Text("maskShape/clipShape 使用 fill(Color(0xFF0000)) - 十六进制颜色").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 200, height: 200).fill(Color(0xFF0000)))
                    .id("fill_hex")
                
                Text("7.2 width/height/size() 的影响").fontSize(16)
                Text("width/height 对遮罩/裁剪区域的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape().width(100).height(50))
                    .id("size_width_height")
                
                Text("size 对遮罩/裁剪区域的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape().size(width: 100, height: 50))
                    .id("size_size")
                
                Text("空值参数处理（size 部分参数为空）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape().size(width: 100, height: Option<Length>.None))
                    .id("size_partial_none")
                
                Text("7.3 offset() 的影响").fontSize(16)
                Text("offset 对遮罩/裁剪位置的影响").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape(width: 100, height: 100).offset(x: 10, y: 20))
                    .id("offset_positive")
                
                Text("负偏移处理").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 100, height: 100).offset(x: -10, y: -20))
                    .id("offset_negative")
                
                Text("7.4 属性组合的影响").fontSize(16)
                Text("fill + size 组合").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape().fill(Color.Red).size(width: 100, height: 50))
                    .id("combo_fill_size")
                
                Text("size + offset 组合").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape().size(width: 200, height: 100).offset(x: 5, y: 10))
                    .id("combo_size_offset")
                
                Text("完整属性组合").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .maskShape(CircleShape().fill(Color.Green).size(width: 200, height: 100).offset(x: 5, y: 10))
                    .id("combo_full")
                
                Divider().margin(top: 10, bottom: 10)
                
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
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 九、异常场景测试 ==========
                Text("九、异常场景测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("9.1 maskShape 参数异常").fontSize(16)
                Text("maskShape(None) - 空值处理（编译错误，无法演示）").fontSize(14)
                Text("maskShape(未初始化的 Shape) - 运行时错误（无法演示）").fontSize(14)
                
                Text("9.2 clipShape 参数异常").fontSize(16)
                Text("clipShape(None) - 允许（取消裁剪）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 200, height: 200))
                    .clipShape(Option<BaseShape>.None)
                    .id("exception_clip_none")
                
                Text("9.3 Shape 属性异常").fontSize(16)
                Text("无效颜色值处理（无法演示，需运行时验证）").fontSize(14)
                Text("负尺寸处理（无法演示，需运行时验证）").fontSize(14)
                Text("无效路径命令处理（无法演示，需运行时验证）").fontSize(14)
                
                Text("9.4 组件状态异常").fontSize(16)
                Text("已销毁组件调用 maskShape/clipShape - 错误处理（无法演示）").fontSize(14)
                Text("动态修改参数 - 状态同步（需运行时验证）").fontSize(14)
                
                Text("测试完成").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 20, bottom: 20)
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

