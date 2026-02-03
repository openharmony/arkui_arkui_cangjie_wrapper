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
let _ = AppStorage.setOrCreate<Int64>("propCount", 0)

/**
 * TC_074: @StorageProp One-way Binding Verification
 * Test Scenario: Modify AppStorage and verify @StorageProp variable auto-updates
 * Expected Result: Storage modification auto-updates variable, UI auto-refreshes
 */
@Entry
@Component
class ViewStorageTC074 {
    @StorageProp["propCount"] let count: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_074: @StorageProp One-way Binding Verification")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("count_textView_StorageTC074")

            Button("Increment in AppStorage")
                .id("increment_storage_button074")
                .onClick({ e =>
                    let current = AppStorage.get<Int64>("propCount").getOrThrow()
                    AppStorage.set<Int64>("propCount", current + 1)
                })

            Button("Decrement in AppStorage")
                .id("decrement_storage_button074")
                .onClick({ e =>
                    let current = AppStorage.get<Int64>("propCount").getOrThrow()
                    AppStorage.set<Int64>("propCount", current - 1)
                })

            Button("Set to 100 in AppStorage")
                .id("set_storage_button_TC074")
                .onClick({ e => AppStorage.set<Int64>("propCount", 100) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

