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
 * 测试场景：@Watch 与 @State 装饰器顺序（@Watch @State 或 @State @Watch）
 * 预期：两种顺序均应支持，若仅支持一种则另一顺序报错
 * 开发范式：装饰器书写顺序习惯差异
 */
package ohos_app_cangjie_entry.state

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class WatchDecoratorOrderView {
    @Watch["onChange"] @State var count: Int64 = 0

    func onChange(): Unit {
    }

    func build(): Unit {
        Column() {}
    }
}
