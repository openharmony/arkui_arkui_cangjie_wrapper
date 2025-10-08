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

@Entry
@Component
class ViewLine {
    func build() {
        Column(space: 10) {
            // 线条绘制的起止点坐标均是相对于Line组件本身绘制区域的坐标
            Line().width(200).height(150).startPoint((0.0, 0.0)).endPoint((50.0, 100.0)).stroke(0x000000).backgroundColor(
                0xF5F5F5).id("line_1")
            Line(width: 1, height: 1).width(200).height(150).startPoint((50.0, 50.0)).endPoint((150.0, 150.0)).strokeWidth(5).stroke(0xE4080A).
                strokeOpacity(0.5).backgroundColor(0xF5F5F5).id("line_2")
            // strokeDashOffset用于定义关联虚线strokeDashArray数组渲染时的偏移
            Line(width: 1.0, height: 1.0).width(200).height(150).startPoint((0.0, 0.0)).endPoint((100.0, 100.0)).stroke(0x000000).strokeWidth(3).
                strokeDashArray([10, 3]).strokeDashOffset(5).backgroundColor(0xF5F5F5).id("line_3")
            // 当坐标点设置的值超出Line组件的宽高范围时，线条会画出组件绘制区域
            Line().width(50).height(50).startPoint((0.0, 0.0)).endPoint((100.0, 100.0)).stroke(0x000000).strokeWidth(3).
                strokeDashArray([10, 3]).backgroundColor(0xF5F5F5).id("line_4")
        }
    }
}
