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
 * TC_119: @Prop + @BuilderParam Combination
 * Test Scenario: @BuilderParam receives Builder that uses @Prop variable
 * Expected Result: @Prop changes trigger Builder automatic rebuild
 */

@Component
class BuilderParamChildTC119 {
    @Prop var propValue: Int64
    @BuilderParam var customBuilder: () -> Unit

    func build(): Unit {
        Column() {
            Text("Prop: ${this.propValue}")
                .fontSize(16)
                .id("prop_display")
            
            this.customBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewMultiTC119 {
    @State var parentValue: Int64 = 0

    @Builder
    func parentBuilder(): Unit {
        Text("Builder Value: ${this.parentValue}")
            .fontSize(16)
            .id("builder_text")
    }

    func build(): Unit {
        Column() {
            Text("TC_119: @Prop + @BuilderParam Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Value: ${this.parentValue}")
                .fontSize(16)
                .id("parent_value_display")

            Column() {
                BuilderParamChildTC119(propValue: this.parentValue, customBuilder: this.parentBuilder)
            }
            .id("builder_param_child")
            .margin(top: 10)

            Button("Update Parent")
                .id("update_parent_button")
                .onClick({ e => this.parentValue = this.parentValue + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

