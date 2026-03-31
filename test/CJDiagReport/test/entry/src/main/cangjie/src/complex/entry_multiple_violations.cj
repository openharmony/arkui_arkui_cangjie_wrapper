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
 * 复杂场景：@Entry 组件内多规则同时违反
 * 测试场景：同一组件内 @Link 禁入 Entry、@State 缺初始值、build 多根节点
 * 预期错误：NotAllowedInEntry / MissingInitializer / TooManyRootNodes（校验顺序决定首个报出）
 * 验证：多错误叠加时，框架能正确报告至少一个，且定位准确
 */
package ohos_app_cangjie_entry.complex

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryMultipleViolationsView {
    @Link var linkData: String
    @State var stateNoInit: Int64

    func build(): Unit {
        Column() {}
        Row() {}
    }
}
