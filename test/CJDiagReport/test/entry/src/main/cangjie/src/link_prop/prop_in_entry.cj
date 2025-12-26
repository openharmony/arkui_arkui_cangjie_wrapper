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
 * 测试场景：@Prop 禁止在 @Entry 装饰的组件内使用
 * 预期错误：MacroErrorCode.NotAllowedInEntry
 * 错误消息：is not allowed in @Entry decorated component
 */
package ohos_app_cangjie_entry.link_prop

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class PropInEntryView {
    @Prop var title: String

    func build(): Unit {
        Column() {
            Text(this.title)
        }
    }
}
