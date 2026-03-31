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
 * 测试场景：@Builder 函数体只能包含 UI 组件表达式
 * 预期错误：MacroErrorCode.InvalidNodeType
 * 错误消息：only UI component syntax can be written in build method
 */
package ohos_app_cangjie_entry.builder

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class BuilderInvalidNodeView {
    @Builder
    func myBuilder(): Unit {
        let x: Int64 = 1
        Text("${x}")
    }

    func build(): Unit {
        Column() {
            this.myBuilder()
        }
    }
}
