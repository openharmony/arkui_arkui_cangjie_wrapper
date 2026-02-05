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
 * TC_050: @Observed Class as @Prop Type
 * Test Scenario: Use @Observed class instance as @Prop variable type
 * Expected Result: Object is correctly passed between parent and child components
 */
@Observed
class ObservedPropModelTC050 {
    @Publish var name: String = ""
    @Publish var score: Int64 = 0
}

@Component
class ObservedPropChildTC050 {
    @Prop var propModel: ObservedPropModelTC050
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Name: ${this.propModel.name}")
                .fontSize(16)
                .margin(top: 5)
                .id("name_text")
            
            Text("Score: ${this.propModel.score}")
                .fontSize(16)
                .margin(top: 5)
                .id("score_text")
            
            Text("Note: @Prop is one-way, child cannot modify")
                .fontSize(12)
                .fontColor(0x666666)
                .margin(top: 10)
                .id("note_text")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewObservedPublishTC050 {
    @State var parentModel: ObservedPropModelTC050 = ObservedPropModelTC050(name: "Player1", score: 100)
    
    func build(): Unit {
        Column() {
            Text("TC_050: @Observed Class as @Prop Type")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Name: ${this.parentModel.name}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_name_text")
            
            Text("Score: ${this.parentModel.score}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_score_text")
            
            Button("Update Name")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_name_button")
                .onClick({ e =>
                    this.parentModel.name = "Updated Player"
                })
            
            Button("Update Score")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_score_button")
                .onClick({ e =>
                    this.parentModel.score = this.parentModel.score + 10
                })
            
            Column() {
                ObservedPropChildTC050(propModel: this.parentModel)
            }
            .id("child_component")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

