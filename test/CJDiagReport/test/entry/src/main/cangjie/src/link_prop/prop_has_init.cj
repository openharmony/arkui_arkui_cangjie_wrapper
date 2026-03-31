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
 * 测试场景：@Prop - 不应有初始值（由父组件传入）
 * 预期错误：MacroErrorCode.UnexpectedInitializer
 * 规则：@Prop 只能出现在非 @Entry 的 @Component 中，且不能有初始值
 */
package ohos_app_cangjie_entry.link_prop

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class PropHasInitParentView {
    @State var title: String = "标题"

    func build(): Unit {
        Column() {
            PropHasInitChild(title: this.title)
        }
    }
}

@Component
class PropHasInitChild {
    @Prop var title: String = ""

    func build(): Unit {
        Text(this.title)
    }
}
