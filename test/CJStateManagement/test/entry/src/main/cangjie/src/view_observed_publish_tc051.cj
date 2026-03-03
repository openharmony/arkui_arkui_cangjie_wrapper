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
 * TC_051: @Observed Class as @Link Type
 * Test Scenario: Use @Observed class instance as @Link variable type
 * Expected Result: Two-way binding of object between parent and child components
 */
@Observed
class ObservedLinkModelTC051 {
    @Publish var title: String = ""
    @Publish var value: Int64 = 0
}

@Component
class ObservedLinkChildTC051 {
    @Link var linkedModel: ObservedLinkModelTC051
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Title: ${this.linkedModel.title}")
                .fontSize(16)
                .margin(top: 5)
                .id("title_text")
            
            Text("Value: ${this.linkedModel.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("value_text")
            
            Button("Modify in Child")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("modify_child_button")
                .onClick({ e =>
                    this.linkedModel.title = "Modified in Child"
                    this.linkedModel.value = this.linkedModel.value + 5
                })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewObservedPublishTC051 {
    @State var parentModel: ObservedLinkModelTC051 = ObservedLinkModelTC051(title: "Initial", value: 50)
    
    func build(): Unit {
        Column() {
            Text("TC_051: @Observed Class as @Link Type")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 5)
                .id("parent_title")
            
            Text("Title: ${this.parentModel.title}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_title_text")
            
            Text("Value: ${this.parentModel.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_value_text")
            
            Button("Modify in Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("modify_parent_button")
                .onClick({ e =>
                    this.parentModel.title = "Modified in Parent"
                    this.parentModel.value = this.parentModel.value * 2
                })
            
            Column() {
                ObservedLinkChildTC051(linkedModel: this.parentModel)
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

