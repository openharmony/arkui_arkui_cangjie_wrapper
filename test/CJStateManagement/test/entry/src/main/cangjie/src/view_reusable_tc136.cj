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
 * TC_136: @Reusable Component with @Builder
 * Test Scenario: @Reusable component uses @Builder function
 * Expected Result: Builder function works correctly, component is reusable
 */

@Reusable
@Component
class ReusableWithBuilderTC136 {
    @Prop var title: String
    @Prop var componentId: String

    @Builder
    func reusableBuilder(): Unit {
        Column() {
            Text("${this.title}")
                .fontSize(16)
                .id("builder_text_${this.componentId}")
        }
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }

    func build(): Unit {
        // this.reusableBuilder()
        Column() {
            Text("${this.title}")
                .fontSize(16)
                .id("builder_text_${this.componentId}")
        }
    }
}

@Entry
@Component
class ViewReusableTC136 {
    @State var title1: String = "Reusable Component 1"
    @State var title2: String = "Reusable Component 2"

    func build(): Unit {
        Column() {
            Text("TC_136: @Reusable Component with @Builder")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Column() {
                ReusableWithBuilderTC136(title: this.title1, componentId: "1")
            }
            .id("reusable_component1")
            .margin(top: 10)

            Column() {
                ReusableWithBuilderTC136(title: this.title2, componentId: "2")
            }
            .id("reusable_component2")
            .margin(top: 10)

            Button("Update Title 1")
                .id("update_title1_button")
                .onClick({ e => this.title1 = "Updated Component 1" })

            Button("Update Title 2")
                .id("update_title2_button")
                .onClick({ e => this.title2 = "Updated Component 2" })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

