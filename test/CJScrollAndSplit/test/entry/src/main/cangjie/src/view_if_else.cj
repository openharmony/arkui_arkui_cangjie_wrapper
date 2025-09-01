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

@Entry
@Component
class View_Ifelse {
    @State
    var flag: Bool = true
    @State
    var status: Int64 = 0
    func build() {
        Column(space: 20) {
            Button("change the flag").onClick({
                evt => this.flag = !this.flag
            }).id("my_button1")

            if (this.flag) {
                Text("the flag is true").fontSize(40.fp).id("my_text1")
            } else {
                Text("the flag is false").fontSize(40.fp).id("my_text2")
            }

            Button("change the status").onClick({
                evt => this.status++
            }).id("my_button2")

            if (this.status == 0) {
                Text("the status is 0").fontSize(40.fp).id("my_text3")
            } else if (this.status == 1) {
                Text("the status is 1").fontSize(40.fp).id("my_text4")
            } else if (this.status == 2) {
                Text("the status is 2").fontSize(40.fp).id("my_text5")
            } else {
                Text("error").id("my_text6")
            }
        }
    }
}
