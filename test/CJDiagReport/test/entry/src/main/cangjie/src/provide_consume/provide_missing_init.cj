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
 * 测试场景：@Provide - 缺少初始值
 * 预期错误：MacroErrorCode.MissingInitializer
 * 错误消息：[ArkUI]: @Provide should have an initial value
 */
package ohos_app_cangjie_entry.provide_consume

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ProvideMissingInitView {
    @Provide var sharedData: String

    func build(): Unit {
        Column() {}
    }
}
