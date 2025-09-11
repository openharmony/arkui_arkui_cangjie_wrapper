/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

package ohos_app_cangjie_entry

import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.base.*

@Entry
@Component
class ViewBorder{
    func build(){
        Column(){
            Text("Hello CangJie")
            .borderWidth(5)
            .borderColor(0xCCCCCC)
            .borderRadius(20)
            .id("my_border")

            Text("test_appear").onAppear({ => }).onDisAppear({ => })
        }
        Column(){
            Text("Hello CangJie")
            .borderWidth(5.vpß)
            .borderColor(0xCCCCCC)
            .borderRadius(20)
            .id("my_border")

            Text("test_appear").onAppear({ => }).onDisAppear({ => })
        }
    }
}