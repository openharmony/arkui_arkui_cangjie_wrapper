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
class ViewShapeMaskClipPathShape {
    func build() {
        Scroll() {
            Column() {         
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
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

