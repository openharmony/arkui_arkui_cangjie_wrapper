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
 * 测试场景：@Builder 根节点不能为自定义组件
 * 预期错误：MacroErrorCode.RootMustBeContainer
 * 错误消息：custom component or builder cannot be root
 */
package ohos_app_cangjie_entry.builder

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
class SubComp {
    func build(): Unit {
        Text("Sub")
    }
}

@Entry
@Component
class BuilderRootCustomView {
    @Builder
    func myBuilder(): Unit {
        SubComp()
    }

    func build(): Unit {
        Column() {
            this.myBuilder()
        }
    }
}
