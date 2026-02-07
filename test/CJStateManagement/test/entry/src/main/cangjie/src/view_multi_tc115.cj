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
 * TC_115: @State + @Prop + @Link Combination
 * Test Scenario: Component uses @State, @Prop, @Link simultaneously
 * Expected Result: All macros work correctly without interference
 */

@Component
class ChildComponentTC115 {
    @Prop var propValue: Int64
    @Link var linkValue: Int64

    func build(): Unit {
        Column() {
            Text("Prop: ${this.propValue}, Link: ${this.linkValue}")
                .fontSize(16)
                .id("child_display")
            
            Button("Update Link")
                .id("update_link_button")
                .onClick({ e => this.linkValue = this.linkValue + 10 })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewMultiTC115 {
    @State var stateValue: Int64 = 0
    @State var linkValue: Int64 = 100

    func build(): Unit {
        Column() {
            Text("TC_115: @State + @Prop + @Link Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("State Value: ${this.stateValue}")
                .fontSize(16)
                .id("state_value_display")

            Text("Link Value: ${this.linkValue}")
                .fontSize(16)
                .id("link_value_display")

            Column() {
                ChildComponentTC115(propValue: this.stateValue, linkValue: this.linkValue)
            }
            .id("child_component")
            .margin(top: 10)

            Button("Update State")
                .id("update_state_button")
                .onClick({ e => this.stateValue = this.stateValue + 1 })

            Button("Update Link")
                .id("update_link_button")
                .onClick({ e => this.linkValue = this.linkValue + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

