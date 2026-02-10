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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/**
 * TC_122: @State + @Observed + @Publish + @Watch Combination
 * Test Scenario: Component uses @State to store @Observed object, object has @Publish variable, @Watch listens
 * Expected Result: All mechanisms work correctly, state synchronization and watching are normal
 */

@Entry
@Component
class ViewMultiTC122 {
    @Watch[onObjectChanged] @State var observedObject: CustomModel = CustomModel(name: "Initial", value: 0, count: 0)
    @State var watchCount: Int64 = 0

    func onObjectChanged(): Unit {
        this.watchCount = this.watchCount + 1
    }

    func build(): Unit {
        Column() {
            Text("TC_122: @State + @Observed + @Publish + @Watch Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Object Name: ${this.observedObject.name}")
                .fontSize(16)
                .id("object_name_display")

            Text("Object Value: ${this.observedObject.value}")
                .fontSize(16)
                .id("object_value_display")

            Text("Watch Count: ${this.watchCount}")
                .fontSize(16)
                .id("watch_count_display")

            Button("Update Object Name")
                .id("update_name_button")
                .onClick({ e => 
                    this.observedObject.name = "Updated Name"
                })

            Button("Update Object Value")
                .id("update_value_button")
                .onClick({ e => 
                    this.observedObject.value = this.observedObject.value + 10
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

