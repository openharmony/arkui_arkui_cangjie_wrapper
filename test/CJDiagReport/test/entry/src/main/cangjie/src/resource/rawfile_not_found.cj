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
 * 测试场景：@rawfile 使用合法字符串字面量，但 rawfile 目录下不存在该文件
 * 预期错误：MacroErrorCode.RawfileNotFound
 * 环境：仅当 rawfileRes（环境变量 rawfileRes）非空且 rawfileExists 为 false 或抛异常时上报
 * 初学易错：路径写对文件名但文件未放入 rawfile 目录，或构建未注入 rawfile 根路径
 */
package ohos_app_cangjie_entry.resource

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class RawfileNotFoundView {
    func build(): Unit {
        Column() {
            Image(@rawfile("cj_diag_macro_rawfile_not_found_0a1b2c3d.bin"))
        }
    }
}
