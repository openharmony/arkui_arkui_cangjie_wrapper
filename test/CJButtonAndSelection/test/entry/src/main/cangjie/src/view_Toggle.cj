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
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class View_Toggle {
    @State
    var isOn: Bool = false
    func build() {
        Column() {
            Toggle(ToggleType.Switch, isOn: isOn)
                .selectedColor(0xed6f21)
                .switchPointColor(0xe5ffffff)
                //                .switchStyle(pointRadius: 15.0, unselectedColor: Color.Black, pointColor: Color.Gray, trackBorderRadius: 5.0)
                .backgroundColor(Color.Green)
                .borderRadius(5.vp)
                .onChange({
                    isOn: Bool => this.isOn = isOn
                })
                .id("my_switchtype_toggle")

            Text("current state is ${this.isOn}").fontSize(16).fontColor(0x182431).margin(16).id("my_state")

            Toggle(ToggleType.Switch, isOn: isOn).id("my_switchtype2_toggle")

            Toggle(ToggleType.Checkbox, isOn: isOn)
                .width(10.vp)
                .height(10.vp)
                .size(width: 30.vp, height: 30.vp)
                .backgroundColor(Color.Blue)
                .borderRadius(5.vp)
                .id("my_checkboxtype_toggle")

            Toggle(ToggleType.Checkbox, isOn: isOn)
                .width(10.vp)
                .height(10.vp)
                .backgroundColor(Color.Gray)
                .size(width: 30.vp, height: 30.vp)
                .borderRadius(5.vp)
                .id("my_checkboxtype2_toggle")

            Toggle(ToggleType.Button, isOn) {
                Text("ButtonType")
            }
                .padding(top: 1.vp, right: 1.vp, bottom: 1.vp, left: 1.vp)
                .backgroundColor(Color.Green)
                .borderRadius(5.vp)
                .id("my_buttontype_toggle")
                .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
        //                .responseRegionArray(
        //                [Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent),
        //                    Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)])
        }.width(100.percent).padding(24)
    }
}