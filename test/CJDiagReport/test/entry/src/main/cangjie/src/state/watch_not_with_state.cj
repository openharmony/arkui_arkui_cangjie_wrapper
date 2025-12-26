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
 * 测试场景：@Watch 必须配合状态装饰器（@State 等）使用
 * 预期错误：MacroErrorCode.WatchMustDecorateStateVar
 * 规则：@Watch 修饰的变量须同时有 @State/@Prop/@Link 等状态装饰器
 */
package ohos_app_cangjie_entry.state

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class WatchNotWithStateView {
    @Watch["onChange"] var plainVar: Int64 = 0

    func onChange(): Unit {
    }

    func build(): Unit {
        Column() {}
    }
}
