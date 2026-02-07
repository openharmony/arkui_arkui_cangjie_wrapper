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
 * TC_123: @Provide + @Consume + @Builder + @BuilderParam Combination
 * Test Scenario: Cross-component state sharing combined with Builder functions
 * Expected Result: State sharing and Builder both work correctly
 */

@Component
class BuilderParamChildTC123 {
    @Consume var sharedValue: Int64
    @BuilderParam var customBuilder: () -> Unit

    func build(): Unit {
        Column() {
            Text("Consumed: ${this.sharedValue}")
                .fontSize(16)
                .id("consume_display")
            
            this.customBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewMultiTC123 {
    @Provide var sharedValue: Int64 = 50
    @State var builderValue: Int64 = 0

    @Builder
    func parentBuilder(): Unit {
        Text("Builder Value: ${this.builderValue}")
            .fontSize(16)
            .id("builder_text")
    }

    func build(): Unit {
        Column() {
            Text("TC_123: @Provide + @Consume + @Builder + @BuilderParam Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Shared Value: ${this.sharedValue}")
                .fontSize(16)
                .id("shared_value_display")

            Text("Builder Value: ${this.builderValue}")
                .fontSize(16)
                .id("builder_value_display")

            Column() {
                BuilderParamChildTC123(customBuilder: this.parentBuilder)
            }
            .id("builder_param_child")
            .margin(top: 10)

            Button("Update Shared")
                .id("update_shared_button")
                .onClick({ e => this.sharedValue = this.sharedValue + 10 })

            Button("Update Builder")
                .id("update_builder_button")
                .onClick({ e => this.builderValue = this.builderValue + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

