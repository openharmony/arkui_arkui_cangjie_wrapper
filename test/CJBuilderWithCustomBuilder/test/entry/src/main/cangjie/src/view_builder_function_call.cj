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
 * TC_B027: Function Call Parameter Binding (this.myBuilder("A", "B"))
 * Test Scenario: Pass Builder function call with parameters
 * Expected Result: Converted to LambdaExpr wrapped bind call
 */
@Entry
@Component
class ViewBuilderFunctionCall {
    @Builder
    func myBuilder(param1: String, param2: String): Unit {
        Column() {
            Text("Param1: ${param1}")
                .fontSize(16)
                .id("param1_text")
                .margin(top: 5)
            Text("Param2: ${param2}")
                .fontSize(16)
                .id("param2_text")
                .margin(top: 5)
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func componentBuilder(): Unit {
        Column() {
            Text("Main Content")
                .fontSize(18)
                .id("main_text")
                .padding(10)
        }
        .id("main_column")
        .width(100.percent)
        .height(200)
        .bindMenu(builder: this.myBuilder("A", "B"))
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B027: Function Call Parameter Binding (this.myBuilder(\"A\", \"B\"))")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            this.componentBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

