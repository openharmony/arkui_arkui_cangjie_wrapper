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
 * TC_133: @Reusable Component Definition
 * Test Scenario: Define @Reusable @Component component
 * Expected Result: Component correctly defined and can be reused
 */
@Reusable
@Component
class ReusableChildTC133 {
    @Prop var title: String
    @Prop var count: Int64

    func build(): Unit {
        Column() {
            Text("${this.title}: ${this.count}")
                .fontSize(16)
                .id("reusable_text")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewReusableTC133 {
    @State var count1: Int64 = 0
    @State var count2: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_133: @Reusable Component Definition")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Column() {
                ReusableChildTC133(title: "Component 1", count: this.count1)
            }
            .id("reusable_component1")
            .margin(top: 10)

            Column() {
                ReusableChildTC133(title: "Component 2", count: this.count2)
            }
            .id("reusable_component2")
            .margin(top: 10)

            Button("Increment Count 1")
                .id("increment_count1_button")
                .onClick({ e => this.count1 = this.count1 + 1 })

            Button("Increment Count 2")
                .id("increment_count2_button")
                .onClick({ e => this.count2 = this.count2 + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

