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
 * TC_068: @BuilderParam Combined with @Prop
 * Test Scenario: @BuilderParam and @Prop used simultaneously
 * Expected Result: Both mechanisms work correctly without interference
 */
@Component
class BuilderParamPropChildTC068 {
    @Prop var propValue: String
    @BuilderParam var contentBuilder: () -> Unit
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            Text("Prop Value: ${this.propValue}")
                .fontSize(16)
                .id("prop_text")
                .margin(top: 5, bottom: 10)
            
            this.contentBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBuilderTC068 {
    @State var parentValue: String = "Initial Value"
    
    @Builder
    func parentBuilder(): Unit {
        Column() {
            Text("Builder Content")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("builder_title")
            
            Text("Parent Value: ${this.parentValue}")
                .fontSize(14)
                .id("parent_value_text")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_068: @BuilderParam Combined with @Prop")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                BuilderParamPropChildTC068(
                    propValue: this.parentValue,
                    contentBuilder: this.parentBuilder
                )
            }
            .id("child_component_container")
            .margin(top: 20)
            
            Button("Update Parent Value")
                .fontSize(14)
                .height(40)
                .margin(top: 10)
                .id("update_button")
                .onClick({ e =>
                    this.parentValue = "Updated Value"
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

