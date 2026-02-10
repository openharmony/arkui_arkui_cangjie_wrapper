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
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewBlankColor {
    func build() {
        Column() {
            // 有效等价用例
            Blank().color(0XFFFF0000).id("testBlankColorNormalValue1")
            Blank().color(0XFF0000).id("testBlankColorNormalValue2")
            Blank().color(Color(0XFFFF0000)).id("testBlankColorNormalValue3")
            Blank().color(Color(0XFF0000)).id("testBlankColorNormalValue4")
            Blank().color(@r(app.color.my_color)).id("testBlankColorNormalValue5")
            
            // 无效等价用例
            Blank().color(0XFFFFFFF0000).id("testBlankColorExceptionValue1")
            Blank().color(0XFF00).id("testBlankColorExceptionValue2")
            // Color 构造函数只接受 UInt32 类型，0XFFFF0000000 超过范围，跳过此用例
            Blank().color(Color(0X000F)).id("testBlankColorExceptionValue3")
            
            // 边界值用例
            Blank().color(0XFFFFFFFF).id("testBlankColorBoundaryValue1")
            Blank().color(0X000000).id("testBlankColorBoundaryValue2")
            
            // 特殊值用例
            Blank().id("testBlankColorNoCall")
            Blank().color(Option<ResourceColor>.None).id("testBlankColorOptionNone")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
