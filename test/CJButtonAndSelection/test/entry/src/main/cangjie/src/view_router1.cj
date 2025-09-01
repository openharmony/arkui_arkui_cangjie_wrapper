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
import ohos.hilog.Hilog
import std.collection.ArrayList

@Entry
@Component
class View_Router1 {
    @State
    var message: String = "xxx"
    var routerrr: Router = Router()

    func build() {
        Flex(wrap: FlexWrap.Wrap) {
            Text("Page View_Router1").fontSize(40.fp).id("my_text1")
            Button("jump1_to_page2").onClick {
                e => Router.push(url: "View_Router2")
            }.id("jump1_to_page2")

            // 覆盖率提升 JsonObject
            Button("jump2_to_page2").onClick {
                e => Router.push(url: "View_Router2", params: "")
            }.id("jump2_to_page2")

            // 覆盖率提升 getParamsObject
            Button("getParamsObject").onClick {
                e => Router.getParams()
            }.id("getParamsObject")
            Button("to_page2_by_pushurl")
                .onClick {
                    e => Router.push(url: "View_Router2", params: "from page1 by pushurl")
                }
                .id("to_page2_by_pushurl")
            Button("to_page2_by_pushurl_single")
                .onClick {
                    e => Router.push(url: "View_Router2", params: "from page1 by pushurl single")
                }
                .id("to_page2_by_pushurl_single")

            Button("to_page2_by_replace")
                .onClick {
                    e => Router.back(url: "View_Router2", params: "from page1 by replace")
                }
                .id("to_page2_by_replace")

            Button("get_params")
                .onClick {
                    e =>
                    var str: Option<String> = Router.getParams()
                    match (str) {
                        case Some(v) => this.message = v
                        case None => this.message = "None"
                    }
                }
                .id("get_params")

            Button("back_page2")
                .onClick {
                    e => Router.back(url: "View_Router2", params: "page1 back to page2")
                }
                .id("back_page2")
            Button("back_to_4").onClick {
                e => Router.back(index: 4, params: "page1 back to 4")
            }.id("back_to_4")

            Button("err_pushurl")
                .onClick {
                    e => Router.push(url: "err_pushurl", params: "from page1 by pushurl")
                }
                .id("err_pushurl")
            Button("err_pushurl_single")
                .onClick {
                    e => Router.push(url: "err_pushurl_single", params: "from page1 by pushurl single")
                }
                .id("err_pushurl_single")

            Text(message).id("router1_get_message")
        }
    }
}
