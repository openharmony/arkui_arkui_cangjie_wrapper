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
class ViewCheckboxGroup {
    @State
    var text: String = "Select All"

    func build() {
        Column() {
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                CheckboxGroup(group: "checkboxGroup1")
                    .size(width: 50.vp, height: 50.vp)
                    .selectedColor(0xcc6f21)
                    //                .unselectedColor(Color.Green)
                    //                .mark(strokeColor: Color.Red, size: 40.0.vp, strokeWidth: 10.0.vp)
                    //                .checkboxShape(CheckBoxShape.RoundedSquare)
                    .selectAll(true)
                    .onChange {
                        val => text = "Clicked"
                    }
                    .padding(10.vp)
                    .id("checkboxGroupComponent")

                Text(text).fontSize(50).id("textComponent")
            }
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox1", group: "checkboxGroup1").size(width: 50.vp, height: 50.vp)

                Text("checkbox1").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox2", group: "checkboxGroup1").size(width: 50.vp, height: 50.vp)

                Text("checkbox2").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox3", group: "checkboxGroup1").size(width: 50.vp, height: 50.vp)

                Text("checkbox3").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                CheckboxGroup(group: "checkboxGroup2")
                    .size(width: 50.vp, height: 50.vp)
                    .selectedColor(@r(app.color.blue_23C452))
                    .selectAll(true)
                    .width(60.vp)
                    .height(60.vp)
                    .id("checkboxGroupComponent2")
                    .padding(top: 0.0, right: 0.0, bottom: 0.0, left: 1.0)

                Text("Select All").fontSize(50)
            }
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox4", group: "checkboxGroup2").size(width: 50.vp, height: 50.vp)

                Text("checkbox4").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox5", group: "checkboxGroup2").size(width: 50.vp, height: 50.vp)

                Text("checkbox5").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                CheckboxGroup(group: "checkboxGroup3")
                    .size(width: 50.vp, height: 50.vp)
                    .selectedColor(@r(app.color.blue_23C452))
                    .selectAll(true)
                    //                .mark(strokeColor: Color.RED, size: 30.percent, strokeWidth: 20.percent)
                    //                .checkboxShape(CheckBoxShape.Circle)
                    .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
                    //                .responseRegionArray(
                    //                [Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent),
                    //                    Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)])
                    .width(60.vp)
                    .height(60.vp)
                    .id("checkboxGroupComponent3")
                    .padding(top: 0.0, right: 0.0, bottom: 0.0, left: 1.0)

                Text("Select All 3").fontSize(50)
            }
        }
    }
}