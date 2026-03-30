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
 * 测试场景：keyGeneratorFunc 体为字符串插值与标识符相加（BinaryExpr），非 UI
 * 预期：不报 InvalidNodeType（key 生成器跳过 parseBuiltInComponent 的 UI 规则）
 */
package ohos_app_cangjie_entry.foreach

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class ForeachKeygeneratorBinaryExprView {
    let testArray: Array<String> = ["a", "b"]

    func build(): Unit {
        Column() {
            ForEach(
                this.testArray,
                itemGeneratorFunc: { item: String, idx: Int64 =>
                    Text(item)
                },
                keyGeneratorFunc: { item: String, idx: Int64 =>
                    "${idx}_" + item
                }
            )
        }
    }
}
