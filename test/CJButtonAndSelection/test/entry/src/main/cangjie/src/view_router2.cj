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
import ohos.arkui.ui_context.*

@Entry
@Component
class ViewRouter2 {
    @State
    var message: String = "xxx"
    let routerstate : RouterState = RouterState(index:0,name:"",path:"",params:"")
    func build() {
        Column() {
            Text("Page ViewRouter2").fontSize(40.fp).id("my_text2")

            Button("page2_jumpBack1").onClick ({
                e => getUIContext().getRouter().back()
            }).id("page2_jumpBack1")

            // 覆盖率提升 back  带参url
            Button("page2_jumpBack2").onClick ({
                e => getUIContext().getRouter().back(url: "ViewRouter1")
            }).id("page2_jumpBack2")

            // 覆盖率提升 back JsonObject
            Button("page2_jumpBack3").onClick ({
                e => getUIContext().getRouter().back(url: "ViewRouter1", params: "")
            }).id("page2_jumpBack3")
            Button("to_page1_by_pushurl")
                .onClick ({
                    e => getUIContext().getRouter().pushUrl(url: "ViewRouter1", params: "from page2")
                })
                .id("to_page1_by_pushurl")

            Button("get_params").onClick ({
                e =>
                    var str :Option<String> = getUIContext().getRouter().getParams()
                    match(str) {
                        case Some(v) => this.message = v
                        case None => this.message = "None"
                    }
            }).id("get_params")

            Button("back show alert").onClick ({
                e =>
                    getUIContext().getRouter().back()
            }).id("back_show_alert")

            Text(message).id("router2_get_message")
        }
    }
}