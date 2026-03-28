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
 * 测试场景：ForIn 禁止出现在嵌套 If 的内层分支中
 * 预期错误：MacroErrorCode.ForInNotAllowedInIf
 * 初学易错：仅外层 if 不用 for-in，内层仍不能写 for-in，须改为 ForEach
 */
package ohos_app_cangjie_entry.build

import std.collection.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ForInNestedIfView {
    @State var outer: Bool = true
    @State var inner: Bool = true
    @State var items: ArrayList<String> = ArrayList<String>(["x"])

    func build(): Unit {
        Column() {
            if (this.outer) {
                if (this.inner) {
                    for (s in this.items) {
                        Text(s)
                    }
                } else {
                    Text("inner false")
                }
            } else {
                Text("outer false")
            }
        }
    }
}
