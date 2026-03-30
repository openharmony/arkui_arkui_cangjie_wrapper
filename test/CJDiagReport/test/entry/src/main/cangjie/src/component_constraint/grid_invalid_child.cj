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
 * 测试场景：Grid 只能包含 GridItem
 * 预期错误：MacroErrorCode.InvalidParentChild
 * 初学易错：直接在 Grid 内写 Column/Row，应用 GridItem 包裹每个网格项
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class GridInvalidChildView {
    func build(): Unit {
        Grid() {
            Column() {}
        }
    }
}
