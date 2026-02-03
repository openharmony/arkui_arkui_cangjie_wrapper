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
 * TC_048: @Observed Class Definition
 * Test Scenario: Define @Observed class with @Publish variables
 * Expected Result: Class definition is correct, can be instantiated
 */
@Observed
class ObservedModelTC048 {
    @Publish var name: String = "Initial"
    @Publish var value: Int64 = 0
    @Publish var active: Bool = false
}

@Entry
@Component
class ViewObservedPublishTC048 {
    @State var myModel: ObservedModelTC048 = ObservedModelTC048(name: "Test", value: 10, active: true)
    
    func build(): Unit {
        Column() {
            Text("TC_048: @Observed Class Definition")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Model name: ${this.myModel.name}")
                .fontSize(16)
                .margin(top: 5)
                .id("model_name_text")
            
            Text("Model value: ${this.myModel.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("model_value_text")
            
            Text("Model active: ${this.myModel.active}")
                .fontSize(16)
                .margin(top: 5)
                .id("model_active_text")
            
            Button("Update Model")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_model_button")
                .onClick({ e =>
                    this.myModel.name = "Updated"
                    this.myModel.value = 100
                    this.myModel.active = !this.myModel.active
                })
            
            Button("Create New Instance")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("new_instance_button")
                .onClick({ e =>
                    this.myModel = ObservedModelTC048(name: "New", value: 200, active: false)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

