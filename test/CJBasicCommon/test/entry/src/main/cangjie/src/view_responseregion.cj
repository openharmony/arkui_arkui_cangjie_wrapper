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
class View_ResponseRegion {
    @State
    var text: String = ""
    func build() {
        Column() {
            Text("x:0,y:0,width:50.percent,height:100.percent")
            // 热区宽度为按钮的一半，点击右侧无响应
            Button("button1")
                .responseRegion(Rectangle(x: 0.vp, y: 0.vp, width: 50.percent, height: 100.percent))
                .onClick({
                    e => text = "button1 clicked"
                })
                .id("responseRegion1")

            // 热区宽度为按钮的一半，且右移一个按钮宽度，点击button2右侧左边，点击事件生效
            Text("x:100.percent,y:0,width:50.percent,height:100.percent")
            Button("button2")
                .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
                .onClick({
                    e => text = "button2 clicked"
                })
                .id("responseRegion2")

            // 热区大小为整个按钮，且下移一个按钮高度，点击button3下方按钮大小区域，点击事件生效
            Text("x:0,y:100.percent,width:100.percent,height:100.percent")
            Button("button3")
                .responseRegion(Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent))
                .onClick({
                    e => text = "button3 clicked"
                })
                .id("responseRegion3")
        }.width(100.percent).margin(top: 5)
    }
}
