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
 * 测试场景：ForEach 的 keyGeneratorFunc 仅返回插值字符串（非 UI 组件）
 * 预期：宏诊断通过，不报 MacroErrorCode.InvalidNodeType（key 生成器不参与 UI 子树校验）
 */
package ohos_app_cangjie_entry.foreach

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

@Entry
@Component
class ForeachKeygeneratorTemplateOnlyView {
    let testArray: Array<String> = ["a", "b"]

    func build(): Unit {
        Column() {
            ForEach(
                this.testArray,
                itemGeneratorFunc: { item: String, idx: Int64 =>
                    Text(item)
                },
                keyGeneratorFunc: { item: String, idx: Int64 =>
                    "${idx}"
                }
            )
        }
    }
}
