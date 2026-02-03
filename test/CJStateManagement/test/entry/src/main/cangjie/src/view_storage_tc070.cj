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
let _ = AppStorage.setOrCreate<Int64>("sharedCount", 0)

/**
 * TC_070: @StorageLink Two-way Binding Verification
 * Test Scenario: Modify @StorageLink variable and verify storage syncs
 * Expected Result: Variable modification syncs to storage, other components auto-update
 */
@Component
class StorageLinkChildTC070 {
    @StorageLink["sharedCount"] var count: Int64 = 0

    func build(): Unit {
        Column() {
            Text("Child Component")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 5)
                .id("child_title")

            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("child_count_text")

            Button("Increment in Child")
                .id("child_increment_button")
                .onClick({ e => this.count = this.count + 1 })
        }
        .width(100.percent)
        .padding(10)
        .backgroundColor(0xE8F4F8)
    }
}

@Entry
@Component
class ViewStorageTC070 {
    @StorageLink["sharedCount"] var count: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_070: @StorageLink Two-way Binding Verification")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Parent Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("parent_count_text")

            Button("Increment in Parent")
                .id("parent_increment_button")
                .onClick({ e => this.count = this.count + 1 })

            Button("Decrement in Parent")
                .id("parent_decrement_button")
                .onClick({ e => this.count = this.count - 1 })

            Column() {
                StorageLinkChildTC070()
            }
            .id("child_component")
            .margin(top: 20)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

