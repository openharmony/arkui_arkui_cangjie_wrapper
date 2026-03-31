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

/*
 * 测试场景：TabContent 必须在 Tabs 内
 * 预期错误：MacroErrorCode.InvalidParentChild（InvalidParentForChild）
 * 初学易错：单独使用 TabContent，应放在 Tabs() { TabContent() {} ... } 内
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class TabContentNotInTabsView {
    func build(): Unit {
        Column() {
            TabContent() {
                Text("Tab 1")
            }
        }
    }
}
