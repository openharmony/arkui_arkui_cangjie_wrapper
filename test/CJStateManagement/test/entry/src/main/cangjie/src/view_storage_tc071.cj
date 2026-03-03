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

// Initialize AppStorage value
let _ = AppStorage.setOrCreate<Int64>("sharedValue", 0)

/**
 * TC_071: @StorageLink Cross-component Sharing
 * Test Scenario: Multiple components use same key @StorageLink
 * Expected Result: All components' states sync
 */
@Component
class StorageLinkComponent1 {
    @StorageLink["sharedValue"] var value: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Component 1")
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .id("comp1_title")

            Text("Value: ${this.value}")
                .fontSize(14)
                .margin(top: 5)
                .id("comp1_value_text")

            Button("Set to 10")
                .id("comp1_button")
                .onClick({ e => this.value = 10 })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Component
class StorageLinkComponent2 {
    @StorageLink["sharedValue"] var value: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Component 2")
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .id("comp2_title")

            Text("Value: ${this.value}")
                .fontSize(14)
                .margin(top: 5)
                .id("comp2_value_text")

            Button("Set to 20")
                .id("comp2_button")
                .onClick({ e => this.value = 20 })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xF0E8F8)
    }
}

@Entry
@Component
class ViewStorageTC071 {
    @StorageLink["sharedValue"] var value: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_071: @StorageLink Cross-component Sharing")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Main Component Value: ${this.value}")
                .fontSize(16)
                .margin(top: 5)
                .id("main_value_text")

            Button("Set to 5")
                .id("main_button")
                .onClick({ e => this.value = 5 })

            Column() {
                StorageLinkComponent1()
            }
            .id("component1")
            .margin(top: 10)

            Column() {
                StorageLinkComponent2()
            }
            .id("component2")
            .margin(top: 10)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

