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
 * 复杂场景：@BuilderParam 接收有错误的 @Builder
 * 测试场景：@Builder 多根节点，作为 @BuilderParam 默认值传入
 * 预期错误：MacroErrorCode.TooManyRootNodes
 * 验证：BuilderParam 展开时，其默认值 Builder 的校验会执行
 */
package ohos_app_cangjie_entry.complex

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class BuilderParamReceivesInvalidBuilderView {
    @Builder
    func badBuilder(): Unit {
        Text("A")
        Text("B")
    }

    @BuilderParam var bp: () -> Unit = this.badBuilder

    func build(): Unit {
        Column() {
            this.bp()
        }
    }
}
