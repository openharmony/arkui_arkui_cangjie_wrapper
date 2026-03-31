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
 * 复杂场景：同一组件内 @State、@StorageLink、@Provide 混合且各有违规
 * 测试场景：@State 缺初值、@StorageLink 用 let、@Provide 空 key
 * 预期错误：MissingInitializer / StorageLinkLetNotAllowed / InvalidAttributeType（首个报出）
 * 验证：多状态宏混用且各自违反不同规则时，校验链能正确工作
 */
package ohos_app_cangjie_entry.complex

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class StateStorageProvideMixedView {
    @State var count: Int64
    @StorageLink[""] let storageVal: Int64 = 0
    @Provide["shared"] var sharedData: String = ""

    func build(): Unit {
        Column() {}
    }
}
