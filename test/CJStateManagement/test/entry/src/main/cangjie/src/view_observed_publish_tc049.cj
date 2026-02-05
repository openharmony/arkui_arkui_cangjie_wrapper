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
 * TC_049: @Observed Class as @State Type
 * Test Scenario: Use @Observed class instance as @State variable type
 * Expected Result: State variable correctly initialized, UI can display object properties
 */
@Observed
class ObservedStateModelTC049 {
    @Publish var title: String = ""
    @Publish var count: Int64 = 0
    @Publish var enabled: Bool = false
}

@Entry
@Component
class ViewObservedPublishTC049 {
    @State var myStateModel: ObservedStateModelTC049 = ObservedStateModelTC049(
        title: "Initial Title",
        count: 0,
        enabled: true
    )
    
    func build(): Unit {
        Column() {
            Text("TC_049: @Observed Class as @State Type")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Title: ${this.myStateModel.title}")
                .fontSize(16)
                .margin(top: 5)
                .id("title_text")
            
            Text("Count: ${this.myStateModel.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("count_text")
            
            Text("Enabled: ${this.myStateModel.enabled}")
                .fontSize(16)
                .margin(top: 5)
                .id("enabled_text")
            
            Button("Update Title")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_title_button")
                .onClick({ e =>
                    this.myStateModel.title = "Updated Title"
                })
            
            Button("Increment Count")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_button")
                .onClick({ e =>
                    this.myStateModel.count = this.myStateModel.count + 1
                })
            
            Button("Toggle Enabled")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("toggle_button")
                .onClick({ e =>
                    this.myStateModel.enabled = !this.myStateModel.enabled
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

