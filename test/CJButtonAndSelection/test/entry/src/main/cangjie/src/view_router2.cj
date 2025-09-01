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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.router.*

@Entry
@Component
class View_Router2 {
    @State
    var message: String = "xxx"
    func build() {
        Column() {
            Text("Page View_Router2").fontSize(40.fp).id("my_text2")

            Button("page2_jumpBack1").onClick {
                e => Router.back()
            }.id("page2_jumpBack1")

            // 覆盖率提升 back  带参url
            Button("page2_jumpBack2").onClick {
                e => Router.back(url: "View_Router1")
            }.id("page2_jumpBack2")

            // 覆盖率提升 back JsonObject
            Button("page2_jumpBack3").onClick {
                e => Router.back(url: "View_Router1", params: "")
            }.id("page2_jumpBack3")
            Button("to_page1_by_pushurl")
                .onClick {
                    e => Router.push(url: "View_Router1", params: "from page2")
                }
                .id("to_page1_by_pushurl")

            Text(message).id("router2_get_message")
        }
    }
}
