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
 * 测试场景：@Binder 须在 @Component 内使用
 * 预期错误：MacroErrorCode.MustBeInComponent
 * 初学易错：在普通类方法中使用 @Binder；当前仓颉侧合法用法为 Refresh(RefreshOptions(refreshing: @Binder(...)))，且须在 @Component 内
 */
package ohos_app_cangjie_entry.builder

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

class BinderNotInComponentModel {
    var value: Bool = false

    func render(): Unit {
        Column() {
            Refresh(RefreshOptions(refreshing: @Binder(this.value))) {}
        }
    }
}

@Entry
@Component
class BinderNotInComponentView {
    func build(): Unit {
        Column() {}
    }
}
