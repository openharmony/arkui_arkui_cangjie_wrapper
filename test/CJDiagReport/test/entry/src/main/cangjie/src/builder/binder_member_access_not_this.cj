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
 * 测试场景：@Binder 的 MemberAccess 的 base 应为 this
 * 预期：规格约束，MemberAccess 的 base 非 this 时可能报错
 * 说明：当前仓颉侧 @Binder 仅用于 Refresh(refreshing: Bindable<Bool>)
 */
package ohos_app_cangjie_entry.builder

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

class DataHolder {
    var flag: Bool = false
}

@Entry
@Component
class BinderMemberAccessNotThisView {
    var holder: DataHolder = DataHolder()

    func build(): Unit {
        Column() {
            Refresh(RefreshOptions(refreshing: @Binder(holder.flag))) {}
        }
    }
}
