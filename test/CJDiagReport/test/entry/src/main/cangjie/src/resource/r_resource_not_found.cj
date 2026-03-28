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
 * 测试场景：@r 引用格式合法，但模块资源索引中不存在对应 name
 * 预期错误：MacroErrorCode.ResourceNotFound
 * 环境：宏内仅在 bundleName 非空且解析不到 id 时上报（见 cj_resource_define.cj getResEnv / getAppResId）
 * 初学易错：拼写与 element 中 name 不一致，或尚未在 resources 中声明
 */
package ohos_app_cangjie_entry.resource

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class RResourceNotFoundView {
    func build(): Unit {
        Column() {
            Text(@r(app.string.cj_diag_macro_resource_not_found_0a1b2c3d))
        }
    }
}
