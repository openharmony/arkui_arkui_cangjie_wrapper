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
 * 复杂场景：build 内多层嵌套 + 组件层级约束
 * 测试场景：Column -> List -> Column（List 子须为 ListItem/ListItemGroup）
 * 预期错误：MacroErrorCode.InvalidParentChild
 * 验证：嵌套结构中，List 直接子节点为 Column 时能正确识别非法子组件
 */
package ohos_app_cangjie_entry.complex

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class BuildNestedConstraintCascadeView {
    func build(): Unit {
        Column() {
            List() {
                Column() {
                    Text("错误：List 子须为 ListItem")
                }
            }
        }
    }
}
