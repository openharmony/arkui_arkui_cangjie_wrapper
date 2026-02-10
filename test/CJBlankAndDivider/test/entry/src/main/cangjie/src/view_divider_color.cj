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
class ViewDividerColor {
    func build() {
        Column() {
            // 有效等价用例
            Divider().color(0XFFFF0000).id("testDividerColorNormalValue1")
            Divider().color(0XFF0000).id("testDividerColorNormalValue2")
            Divider().color(Color(0XFFFF0000)).id("testDividerColorNormalValue3")
            Divider().color(Color(0XFF0000)).id("testDividerColorNormalValue4")
            Divider().color(@r(app.color.my_color)).id("testDividerColorNormalValue5")
            
            // 无效等价用例
            Divider().color(0XFFFFFFF0000).id("testDividerColorExceptionValue1")
            Divider().color(0XFF00).id("testDividerColorExceptionValue2")
            Divider().color(Color(0X000F)).id("testDividerColorExceptionValue3")
            
            // 边界值用例
            Divider().color(0XFFFFFFFF).id("testDividerColorBoundaryValue1")
            Divider().color(0X000000).id("testDividerColorBoundaryValue2")
            
            // 特殊值用例
            Divider().id("testDividerColorNoCall")
            Divider().color(Option<ResourceColor>.None).id("testDividerColorOptionNone")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
