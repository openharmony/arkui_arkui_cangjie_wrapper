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
 * TC_056: @Observed Class Nesting
 * Test Scenario: @Observed class contains another @Observed class instance
 * Expected Result: Nested objects work correctly, modifications trigger updates
 */
@Observed
class NestedChildModelTC056 {
    @Publish var childName: String = ""
    @Publish var childValue: Int64 = 0
}

@Observed
class NestedParentModelTC056 {
    @Publish var parentName: String = ""
    @Publish var parentValue: Int64 = 0
    @Publish var child: NestedChildModelTC056
}

@Entry
@Component
class ViewObservedPublishTC056 {
    @State var myModel: NestedParentModelTC056 = NestedParentModelTC056(
        parentName: "Parent",
        parentValue: 100,
        child: NestedChildModelTC056(childName: "Child", childValue: 50)
    )
    
    func build(): Unit {
        Column() {
            Text("TC_056: @Observed Class Nesting")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Parent Name: ${this.myModel.parentName}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_name_text")
            
            Text("Parent Value: ${this.myModel.parentValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_value_text")
            
            Text("Child Name: ${this.myModel.child.childName}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_name_text")
            
            Text("Child Value: ${this.myModel.child.childValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_value_text")
            
            Button("Update Parent")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_parent_button")
                .onClick({ e =>
                    this.myModel.parentName = "Updated Parent"
                    this.myModel.parentValue = this.myModel.parentValue + 10
                })
            
            Button("Update Child")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_child_button")
                .onClick({ e =>
                    this.myModel.child.childName = "Updated Child"
                    this.myModel.child.childValue = this.myModel.child.childValue + 5
                })
            
            Button("Replace Child")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("replace_child_button")
                .onClick({ e =>
                    this.myModel.child = NestedChildModelTC056(childName: "New Child", childValue: 200)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

