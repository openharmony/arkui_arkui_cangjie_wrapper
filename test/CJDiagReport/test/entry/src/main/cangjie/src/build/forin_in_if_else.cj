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
 * 测试场景：ForIn 禁止出现在 If 的 else 分支内（与 if 分支一致）
 * 预期错误：MacroErrorCode.ForInNotAllowedInIf
 * 路径：diag_parser.parseIfExprBody → UISyntaxChecker.checkIfExpr4UI → IfExprForInChecker
 */
package ohos_app_cangjie_entry.build

import std.collection.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ForInInIfElseView {
    @State var useList: Bool = false
    @State var items: ArrayList<String> = ArrayList<String>(["a", "b"])

    func build(): Unit {
        Column() {
            if (this.useList) {
                Text("list mode")
            } else {
                for (item in this.items) {
                    Text(item)
                }
            }
        }
    }
}
