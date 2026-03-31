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
 * 测试场景：单子容器（Scroll）以 child lambda 传入子树，子树内包含 ForEach
 * 预期错误：MacroErrorCode.InvalidParentChild（diag_parser：ForEachNotAllowedInMonadic）；legacy 为 validateComponentChildConstraints → ifForEach / DIAG.error
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class MonadicScrollForeachLambdaLastArgView {
    @State var dataList: ObservedArrayList<String> = ObservedArrayList<String>(["x"])

    func build(): Unit {
        Scroll(
            child: { =>
                ForEach(
                    this.dataList,
                    itemGeneratorFunc: { item: String, index: Int64 =>
                        Text(item)
                    }
                )
            }
        )
    }
}
