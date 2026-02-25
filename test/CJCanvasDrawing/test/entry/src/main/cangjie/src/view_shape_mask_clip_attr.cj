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
class ViewShapeMaskClipAttr {
    func build() {
        Scroll() {
            Column() {
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
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

