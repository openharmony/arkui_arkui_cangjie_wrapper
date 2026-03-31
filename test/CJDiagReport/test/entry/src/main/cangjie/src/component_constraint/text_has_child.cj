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
 * 测试场景：Text 作为 leaf 时不能有子组件；或 Text 子组件须为 Span/ImageSpan/SymbolSpan/ContainerSpan
 * 预期错误：MacroErrorCode.NoChildAllowed 或 InvalidParentChild
 * 初学易错：在 Text 尾随闭包内写 Text 等非法子组件，应使用 Span 或仅 content 参数
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class TextHasChildView {
    func build(): Unit {
        Text("Hello") {
            Text("World")
        }
    }
}
