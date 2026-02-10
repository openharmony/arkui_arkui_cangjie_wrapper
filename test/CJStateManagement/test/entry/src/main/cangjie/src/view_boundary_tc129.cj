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
 * TC_129: @Provide/@Consume Type Compatibility
 * Test Scenario: Test @Provide/@Consume type compatibility
 * Expected Result: Type compatible works correctly, incompatible reports error
 */

@Component
class ConsumeChildTC129 {
    @Consume var consumedValue: Int64

    func build(): Unit {
        Column() {
            Text("Consumed Value: ${this.consumedValue}")
                .fontSize(16)
                .id("consume_display")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewBoundaryTC129 {
    @Provide var providedValue: Int64 = 30

    func build(): Unit {
        Column() {
            Text("TC_129: @Provide/@Consume Type Compatibility")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Provided Value: ${this.providedValue}")
                .fontSize(16)
                .id("provide_display")

            Column() {
                ConsumeChildTC129()
            }
            .id("consume_child")
            .margin(top: 10)

            Button("Update Provided Value")
                .id("update_provide_button")
                .onClick({ e => this.providedValue = this.providedValue + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

