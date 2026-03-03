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
 * TC_065: @BuilderParam Used in build() Method
 * Test Scenario: Call @BuilderParam variable in build() method
 * Expected Result: Builder function executes correctly and UI renders properly
 */
@Component
class BuilderParamChildTC065 {
    @BuilderParam var contentBuilder: () -> Unit
    
    func build(): Unit {
        Column() {
            Text("Child Component Header")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_header")
                .margin(top: 10, bottom: 10)
            
            this.contentBuilder()
            
            Text("Child Component Footer")
                .fontSize(14)
                .fontColor(Color.Gray)
                .id("child_footer")
                .margin(top: 10)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBuilderTC065 {
    @Builder
    func dynamicContent(): Unit {
        Column() {
            Text("Dynamic Content Section")
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .id("dynamic_title")
                .margin(top: 5)
            
            Text("This content is provided by parent Builder")
                .fontSize(14)
                .id("dynamic_text")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_065: @BuilderParam Used in build() Method")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                BuilderParamChildTC065(contentBuilder: this.dynamicContent)
            }
            .id("child_component_container")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

