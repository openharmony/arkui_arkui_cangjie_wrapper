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
 * 测试场景：@State - Option<Scroller> 等 Option<Controller> 不推荐触发告警
 * 预期错误：Warning UnrecommendedStateType
 * 规则：Option<T> 当 T 在 UNRECOMMENDED_STATE_TYPE_NAMES 时也触发告警
 */
package ohos_app_cangjie_entry.state

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class StateUnrecommendedOptionControllerView {
    @State var scrollOpt: Option<Scroller> = Option<Scroller>.None

    func build(): Unit {
        Column() {}
    }
}
