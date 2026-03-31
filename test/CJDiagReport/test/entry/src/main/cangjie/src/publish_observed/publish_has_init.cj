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
 * 测试场景：@Publish 不应有初始值（由 Observed 类初始化）
 * 预期错误：MacroErrorCode.UnexpectedInitializer 或规格约束
 * 开发范式：误以为 @Publish 需手动初始化
 */
package ohos_app_cangjie_entry.publish_observed

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Observed
class PublishHasInitModel {
    @Publish var value: Int64 = 0
}

@Entry
@Component
class PublishHasInitView {
    func build(): Unit {
        Column() {}
    }
}
