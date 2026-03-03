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
class ViewDividerInit {
    func build() {
        Column() {
            // 有效等价用例
            Divider().id("testDividerInitMainThread")
            
            // 特殊值用例
            // Divider 无参数，不调用接口的情况无法直接表示
            // 使用注释说明：不调用接口时，框架会使用默认值创建 Divider
            // 这里使用 Blank 组件占位，实际测试中应该验证 Divider 的默认行为
            Blank().id("testDividerInitNoCall")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
