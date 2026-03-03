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
 * TC_B005: @Builder Function with Gauge description
 * Test Scenario: @Builder function used with Gauge description method
 * Expected Result: CustomBuilder parameter is correctly bound
 */
@Entry
@Component
class ViewBuilderGaugeDescriptionBasic {
    @Builder
    func descriptionBuilder(): Unit {
        Text("Gauge Description")
            .fontSize(14)
            .id("description_text")
            .padding(5)
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B005: @Builder Function with Gauge description")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Gauge(value: 50.0, min: 0.0, max: 100.0)
                .description(this.descriptionBuilder)
                .id("gauge")
                .width(200)
                .height(200)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
        .justifyContent(FlexAlign.Center)
    }
}
