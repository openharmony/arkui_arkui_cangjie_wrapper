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
 * 测试场景：单子容器（Scroll）尾随块内为 If，且 if 分支中出现多于一个直接子组件，触发 checkMonadicIfBody 的 DIAG.error
 * 预期错误：宏展开报错（The component Scroll can only have a single child component）
 * 路径：generateBaseComp → TrailingClosureExpr → checkMonadicContainer → checkMonadicIfBody
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class MonadicScrollIfBranchTwoChildrenView {
    @State var show: Bool = true

    func build(): Unit {
        Scroll() {
            if (this.show) {
                Text("a")
                Text("b")
            }
        }
    }
}
