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
import std.collection.*

/**
 * TC_055: Multiple @Publish Variables Used Simultaneously
 * Test Scenario: Define multiple @Publish variables in @Observed class
 * Expected Result: All @Publish variables work correctly
 */
@Observed
class MultiplePublishModelTC055 {
    @Publish var name: String = "Default"
    @Publish var age: Int64 = 0
    @Publish var score: Float64 = 0.0
    @Publish var active: Bool = false
    @Publish var tags: ObservedArrayList<String> = ObservedArrayList<String>([])
}

@Entry
@Component
class ViewObservedPublishTC055 {
    @State var myModel: MultiplePublishModelTC055 = MultiplePublishModelTC055(
        name: "User1",
        age: 25,
        score: 85.5,
        active: true,
        tags: ObservedArrayList<String>(["tag1", "tag2"])
    )
    
    func build(): Unit {
        Column() {
            Text("TC_055: Multiple @Publish Variables Used Simultaneously")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Name: ${this.myModel.name}")
                .fontSize(16)
                .margin(top: 5)
                .id("name_text")
            
            Text("Age: ${this.myModel.age}")
                .fontSize(16)
                .margin(top: 5)
                .id("age_text")
            
            Text("Score: ${this.myModel.score}")
                .fontSize(16)
                .margin(top: 5)
                .id("score_text")
            
            Text("Active: ${this.myModel.active}")
                .fontSize(16)
                .margin(top: 5)
                .id("active_text")
            
            Text("Tags (${this.myModel.tags.size}):")
                .fontSize(16)
                .margin(top: 5)
                .id("tags_label")
            
            ForEach(
                this.myModel.tags,
                itemGeneratorFunc: { tag: String, index: Int64 =>
                    Text("  - ${tag}")
                        .fontSize(14)
                        .padding(2)
                        .id("tag_${index}")
                }
            )
            
            Button("Update All Fields")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_all_button")
                .onClick({ e =>
                    this.myModel.name = "Updated User"
                    this.myModel.age = this.myModel.age + 1
                    this.myModel.score = this.myModel.score + 1.5
                    this.myModel.active = !this.myModel.active
                    this.myModel.tags.append("tag${this.myModel.tags.size + 1}")
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

