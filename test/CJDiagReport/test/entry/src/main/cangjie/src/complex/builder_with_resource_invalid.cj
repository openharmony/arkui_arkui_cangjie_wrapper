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
 * 复杂场景：@Builder 内使用资源宏，资源格式错误
 * 测试场景：Builder 函数体引用 @r(123)，触发 ResourceFormatError
 * 预期错误：MacroErrorCode.ResourceFormatError
 * 验证：Builder 展开时，其内部资源宏的校验会执行
 */
package ohos_app_cangjie_entry.complex

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class BuilderWithResourceInvalidView {
    @Builder
    func iconBuilder(): Unit {
        Image(@r(123))
    }

    func build(): Unit {
        Column() {
            this.iconBuilder()
        }
    }
}
