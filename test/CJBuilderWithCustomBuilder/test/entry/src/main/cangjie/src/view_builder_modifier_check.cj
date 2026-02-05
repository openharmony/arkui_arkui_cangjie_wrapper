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
 * TC_B007: @Builder Function Modifier Check
 * Test Scenario: Define @Builder functions with different modifiers (public, private, internal)
 * Expected Result: Modifiers are correctly preserved in the generated functions
 */
@Entry
@Component
class ViewBuilderModifierCheck {
    @Builder
    public func publicBuilder(): Unit {
        Text("Public Builder")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("public_builder_text")
            .margin(top: 5)
    }
    
    @Builder
    private func privateBuilder(): Unit {
        Text("Private Builder")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("private_builder_text")
            .margin(top: 5)
    }
    
    @Builder
    internal func internalBuilder(): Unit {
        Text("Internal Builder")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .id("internal_builder_text")
            .margin(top: 5)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B007: @Builder Function Modifier Check")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Testing different modifiers:")
                .fontSize(16)
                .margin(top: 5)
                .id("description_text")
            
            this.publicBuilder()
            this.privateBuilder()
            this.internalBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

