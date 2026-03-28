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
 * 测试场景：@Publish - 修饰目标非变量声明（误修饰函数）
 * 预期错误：MacroErrorCode.ExpectVarDecl
 * 规则：@Publish 必须在 @Observed 类内，且必须修饰变量
 */
package ohos_app_cangjie_entry.publish_observed

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Observed
class PublishNotVarDeclModel {
    @Publish
    func getValue(): Int64 {
        0
    }
}
