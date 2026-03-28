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
 * 测试场景：@r 资源引用格式须为 app.type.name 或 sys.type.name
 * 预期错误：MacroErrorCode.ResourceFormatError
 * 初学易错：误用数字、变量或错误分隔格式，应使用 app.media.xxx 或 sys.xxx.xxx
 */
package ohos_app_cangjie_entry.resource

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class RFormatErrorView {
    func build(): Unit {
        Column() {
            Text($r(123))
        }
    }
}
