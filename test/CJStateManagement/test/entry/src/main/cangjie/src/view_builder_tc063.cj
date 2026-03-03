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
 * TC_063: @BuilderParam Variable Definition
 * Test Scenario: Define @BuilderParam variable to receive Builder function
 * Expected Result: Variable is correctly defined and can receive Builder function
 */
@Component
class BuilderParamChildTC063 {
    @Builder
    func defaultBuilder(): Unit {
        Text("Default Builder")
            .fontSize(16)
            .id("default_builder_text")
    }
    
    @BuilderParam var customBuilder: () -> Unit
    
    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")
            
            this.customBuilder()
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBuilderTC063 {
    @Builder
    func parentBuilder(): Unit {
        Text("Parent Builder Content")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("parent_builder_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_063: @BuilderParam Variable Definition")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Column() {
                BuilderParamChildTC063(customBuilder: this.parentBuilder)
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

