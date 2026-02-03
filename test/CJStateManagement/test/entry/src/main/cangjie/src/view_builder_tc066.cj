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
 * TC_066: @BuilderParam Combined with State Variables
 * Test Scenario: Builder received by @BuilderParam uses state variables
 * Expected Result: State variables are correctly accessed, Builder rebuilds when state changes
 */
@Component
class BuilderParamChildTC066 {
    @BuilderParam var stateBuilder: () -> Unit
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            this.stateBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBuilderTC066 {
    @State var counter: Int64 = 0
    @State var title: String = "Initial Title"
    
    @Builder
    func stateAwareBuilder(): Unit {
        Column() {
            Text("State-Aware Builder")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("builder_title")
            
            Text("Counter: ${this.counter}")
                .fontSize(16)
                .id("counter_text")
                .margin(top: 5)
            
            Text("Title: ${this.title}")
                .fontSize(16)
                .id("title_text")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_066: @BuilderParam Combined with State Variables")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                BuilderParamChildTC066(stateBuilder: this.stateAwareBuilder)
            }
            .id("child_component_container")
            .margin(top: 20)
            
            Button("Increment Counter")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("increment_button")
                .onClick({ e =>
                    this.counter = this.counter + 1
                })
            
            Button("Update Title")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_title_button")
                .onClick({ e =>
                    this.title = "Updated Title ${this.counter}"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

