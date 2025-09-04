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
class View_Path {
    @State
    var commands: String = ""

    func build() {
        Column {
            Path(commands: "").width(600.vp).height(50.vp).stroke(Color.Black).strokeWidth(5).id("path_1")
            Path(width: 600.vp, height: 20.vp).stroke(Color.Black).strokeWidth(2).id("path_2")
            Path(width: 600.0, height: 30.0).stroke(Color.Black).strokeWidth(3).id("path_3")
            Path(width: 600, height: 40).stroke(Color.Black).strokeWidth(4).id("path_4")

            Path(commands: "M0 0 L600 0").width(600.vp).height(10.vp).stroke(Color.Black).strokeWidth(1).id("path_5")
            Path(width: 600.vp, height: 20.vp, commands: "M0 0 L600 0").stroke(Color.Black).strokeWidth(2).id("path_6")
            Path(width: 600.0, height: 30.0, commands: "M0 0 L600 0").stroke(Color.Black).strokeWidth(3).id("path_7")
            Path(width: 600, height: 40, commands: "M0 0 L600 0").stroke(Color.Black).strokeWidth(4).id("path_8")

            Path(width: 600.vp, height: 20.vp).commands("M0 0 L600 0").stroke(Color.Black).strokeWidth(2).id("path_9")
        }
    }
}
