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
 * TC_117: @State + @Prop + @Watch Combination
 * Test Scenario: Component uses @State, @Prop, @Watch simultaneously
 * Expected Result: State passing and watching both work correctly
 */

@Component
class PropChildTC117 {
    @Prop var propValue: Int64

    func build(): Unit {
        Column() {
            Text("Prop Value: ${this.propValue}")
                .fontSize(16)
                .id("prop_display")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewMultiTC117 {
    @Watch[onStateChanged] @State var stateValue: Int64 = 0
    @State var watchCount: Int64 = 0

    func onStateChanged(): Unit {
        this.watchCount = this.watchCount + 1
    }

    func build(): Unit {
        Column() {
            Text("TC_117: @State + @Prop + @Watch Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("State Value: ${this.stateValue}")
                .fontSize(16)
                .id("state_value_display")

            Text("Watch Count: ${this.watchCount}")
                .fontSize(16)
                .id("watch_count_display")

            Column() {
                PropChildTC117(propValue: this.stateValue)
            }
            .id("prop_child")
            .margin(top: 10)

            Button("Update State")
                .id("update_state_button")
                .onClick({ e => 
                    this.stateValue = this.stateValue + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

