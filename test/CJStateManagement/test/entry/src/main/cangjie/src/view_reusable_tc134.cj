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
 * TC_134: @Reusable Component Defined Before @Entry
 * Test Scenario: Verify @Reusable component must be defined before @Entry
 * Expected Result: Component definition order is correct, compilation passes
 */

@Reusable
@Component
class ReusableBeforeEntryTC134 {
    @Prop var title: String
    @Prop var value: Int64

    func build(): Unit {
        Column() {
            Text("${this.title}: ${this.value}")
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
class ViewReusableTC134 {
    @State var count: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_134: @Reusable Component Defined Before @Entry")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Column() {
                ReusableBeforeEntryTC134(title: "Reusable Component", value: this.count)
            }
            .id("reusable_component")
            .margin(top: 10)

            Button("Increment")
                .id("increment_button")
                .onClick({ e => this.count = this.count + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

