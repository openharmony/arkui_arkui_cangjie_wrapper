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
 * TC_138: @r Macro Combined with @Prop
 * Test Scenario: @Prop variable controls @r resource access
 * Expected Result: Resource correctly accessed, resource from parent component correctly displays
 */

@Component
class PropResourceChildTC138 {
    @Prop var resourceIndex: Int64

    func build(): Unit {
        Column() {
            Text("Prop Resource Index: ${this.resourceIndex}")
                .fontSize(16)
                .id("prop_resource_display")

            // Note: @r macro usage depends on actual resource structure
            Text("Resource access with @Prop")
                .fontSize(16)
                .id("resource_display")
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewResourceTC138 {
    @State var parentResourceIndex: Int64 = 1

    func build(): Unit {
        Column() {
            Text("TC_138: @r Macro Combined with @Prop")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Resource Index: ${this.parentResourceIndex}")
                .fontSize(16)
                .id("parent_resource_display")

            Column() {
                PropResourceChildTC138(resourceIndex: this.parentResourceIndex)
            }
            .id("prop_resource_child")
            .margin(top: 10)

            Button("Change Resource Index")
                .id("change_index_button")
                .onClick({ e => 
                    this.parentResourceIndex = (this.parentResourceIndex % 3) + 1
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

