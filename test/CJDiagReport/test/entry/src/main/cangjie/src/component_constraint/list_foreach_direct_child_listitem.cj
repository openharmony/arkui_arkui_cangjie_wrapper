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
 * 测试场景：List 的直接子为 ForEach，item 内生成 ListItem（validateComponentConstraints 对非单子父下的 ForEach  return None，不套用 AllowedChildren）
 * 预期错误：无（正向对照）；与 list_invalid_child.cj（List 内直接 Column）对照
 * 路径：diag_builtin_component_err_manage.validateComponentConstraints
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class ListForeachDirectChildListitemView {
    @State var dataList: ObservedArrayList<String> = ObservedArrayList<String>(["a"])

    func build(): Unit {
        List() {
            ForEach(
                this.dataList,
                itemGeneratorFunc: { item: String, index: Int64 =>
                    ListItem() {
                        Text(item)
                    }
                }
            )
        }
    }
}
