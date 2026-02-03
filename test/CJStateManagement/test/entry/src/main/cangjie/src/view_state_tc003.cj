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
 * TC_003: @State Variable Initialization (Custom Type)
 * Test Scenario: Declare @State variable with @Observed class instance
 * Expected Result: Custom type is correctly initialized, UI can correctly display object properties
 */

@Entry
@Component
class ViewStateTC003 {
    @State var myObject: CustomModel = CustomModel(name: "Initial Value", value: 0, count: 1)

    func build(): Unit {
        Column() {
            Text("TC_003: @State Variable Initialization (Custom Type)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("CustomModel Name: ${this.myObject.name}, Value: ${this.myObject.value}, Count: ${this.myObject.count}")
                .id("custom_model_text")
            Button("Update CustomModel Name")
                .id("change_custom_model_name_button")
                .onClick({ e => this.myObject.name = "Updated Value" })
            Button("Update CustomModel Value")
                .id("change_custom_model_value_button")
                .onClick({ e => this.myObject.value = this.myObject.value + 10 })
            Button("Update CustomModel Count")
                .id("change_custom_model_count_button")
                .onClick({ e => this.myObject.count = this.myObject.count + 1 })
            Button("Replace CustomModel Object")
                .id("replace_custom_model_object_button")
                .onClick({ e => this.myObject = CustomModel(name: "New Object", value: 0, count: 100) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

