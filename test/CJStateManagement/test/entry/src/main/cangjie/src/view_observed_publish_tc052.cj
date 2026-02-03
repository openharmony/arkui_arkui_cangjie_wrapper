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
 * TC_052: @Publish Variable Definition (Primitive Types)
 * Test Scenario: Define @Publish primitive type variables in @Observed class
 * Expected Result: Variables are correctly defined, can be accessed and modified
 */
@Observed
class PublishPrimitiveModelTC052 {
    @Publish var intValue: Int64 = 0
    @Publish var stringValue: String = "Initial"
    @Publish var boolValue: Bool = false
    @Publish var floatValue: Float64 = 0.0
}

@Entry
@Component
class ViewObservedPublishTC052 {
    @State var myModel: PublishPrimitiveModelTC052 = PublishPrimitiveModelTC052(
        intValue: 10,
        stringValue: "Hello",
        boolValue: true,
        floatValue: 3.14
    )
    
    func build(): Unit {
        Column() {
            Text("TC_052: @Publish Variable Definition (Primitive Types)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Int64: ${this.myModel.intValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("int_value_text")
            
            Text("String: ${this.myModel.stringValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("string_value_text")
            
            Text("Bool: ${this.myModel.boolValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("bool_value_text")
            
            Text("Float64: ${this.myModel.floatValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("float_value_text")
            
            Button("Update Int64")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_int_button")
                .onClick({ e =>
                    this.myModel.intValue = this.myModel.intValue + 1
                })
            
            Button("Update String")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_string_button")
                .onClick({ e =>
                    this.myModel.stringValue = "Updated String"
                })
            
            Button("Toggle Bool")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_bool_button")
                .onClick({ e =>
                    this.myModel.boolValue = !this.myModel.boolValue
                })
            
            Button("Update Float64")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_float_button")
                .onClick({ e =>
                    this.myModel.floatValue = this.myModel.floatValue + 0.1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

