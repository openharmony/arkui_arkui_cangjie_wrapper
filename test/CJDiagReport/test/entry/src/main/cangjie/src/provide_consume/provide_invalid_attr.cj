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
 * 测试场景：@Provide - key 属性必须为字符串字面量
 * 预期错误：MacroErrorCode.InvalidAttributeType
 * 初学易错：@Provide[123] 使用数字作为 key，应为 @Provide["name"] 或 @Provide
 */
package ohos_app_cangjie_entry.provide_consume

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ProvideInvalidAttrView {
    @Provide[123] var sharedCount: Int64 = 0

    func build(): Unit {
        Column() {
            Text("共享数据页面")
            Text("父组件向子组件提供数据")
        }
    }
}
