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
 * 测试场景：item 为元组类型时，keyGenerator 使用插值与 `+`（曾为 BinaryExpr 易误报 InvalidNodeType）
 * 预期：不报 InvalidNodeType（元组字段访问以 toString 避免依赖下标语法）
 */
package ohos_app_cangjie_entry.foreach

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class ForeachKeygeneratorTupleItemView {
    let pairArray: Array<(Int64, String)> = [(0, "a"), (1, "b")]

    func build(): Unit {
        Column() {
            ForEach(
                this.pairArray,
                itemGeneratorFunc: { item: (Int64, String), idx: Int64 =>
                    Text(item.toString())
                },
                keyGeneratorFunc: { item: (Int64, String), idx: Int64 =>
                    "${idx}_" + item.toString()
                }
            )
        }
    }
}
