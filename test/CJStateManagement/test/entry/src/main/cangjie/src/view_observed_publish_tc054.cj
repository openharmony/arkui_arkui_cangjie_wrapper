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
 * TC_054: @Publish Variable Modification Triggers UI Update
 * Test Scenario: Modify @Publish variables of @Observed class instance
 * Expected Result: Components using this object automatically update UI
 */
@Observed
class PublishUpdateModelTC054 {
    @Publish var counter: Int64 = 0
    @Publish var message: String = "Initial Message"
    @Publish var status: Bool = false
}

@Entry
@Component
class ViewObservedPublishTC054 {
    @State var myModel: PublishUpdateModelTC054 = PublishUpdateModelTC054(
        counter: 0,
        message: "Ready",
        status: false
    )
    @State var updateCount: Int64 = 0
    
    func build(): Unit {
        Column() {
            Text("TC_054: @Publish Variable Modification Triggers UI Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Counter: ${this.myModel.counter}")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("counter_text")
            
            Text("Message: ${this.myModel.message}")
                .fontSize(16)
                .margin(top: 5)
                .id("message_text")
            
            Text("Status: ${this.myModel.status}")
                .fontSize(16)
                .margin(top: 5)
                .id("status_text")
            
            Text("Update count: ${this.updateCount}")
                .fontSize(14)
                .fontColor(0x666666)
                .margin(top: 5)
                .id("update_count_text")
            
            Button("Increment Counter")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_button")
                .onClick({ e =>
                    this.myModel.counter = this.myModel.counter + 1
                    this.updateCount = this.updateCount + 1
                })
            
            Button("Change Message")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("change_message_button")
                .onClick({ e =>
                    this.myModel.message = "Message ${this.myModel.counter}"
                    this.updateCount = this.updateCount + 1
                })
            
            Button("Toggle Status")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_status_button")
                .onClick({ e =>
                    this.myModel.status = !this.myModel.status
                    this.updateCount = this.updateCount + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

