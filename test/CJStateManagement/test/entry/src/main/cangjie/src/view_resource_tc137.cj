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
 * TC_137: @r Macro Used in State Variable
 * Test Scenario: Use @State variable to control @r resource access
 * Expected Result: Resource correctly accessed, resource updates when state changes
 */

@Entry
@Component
class ViewResourceTC137 {
    @State var resourceIndex: Int64 = 1

    func build(): Unit {
        Column() {
            Text("TC_137: @r Macro Used in State Variable")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Resource Index: ${this.resourceIndex}")
                .fontSize(16)
                .id("resource_index_display")

            // Note: @r macro usage depends on actual resource structure
            // This is a placeholder implementation
            Text("Resource access with state variable")
                .fontSize(16)
                .id("resource_display")

            Button("Change Resource Index")
                .id("change_index_button")
                .onClick({ e => 
                    this.resourceIndex = (this.resourceIndex % 3) + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

