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

// Initialize LocalStorage for TC_082 (independent instance to avoid conflicts)
let ls082 = LocalStorage()
let _ = ls082.setOrCreate<Int64>("propCount", 0)

/**
 * TC_082: @LocalStorageProp One-way Binding Verification
 * Test Scenario: Modify LocalStorage and verify @LocalStorageProp variable auto-updates
 * Expected Result: Storage modification auto-updates variable, UI auto-refreshes
 */
@Entry[ls082]
@Component
class ViewLocalStorageTC082 {
    @LocalStorageProp["propCount"] let count: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_082: @LocalStorageProp One-way Binding Verification")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Count: ${this.count}")
                .fontSize(16)
                .margin(top: 5)
                .id("count_text")

            Button("Increment in LocalStorage")
                .id("increment_storage_button")
                .onClick({ e =>
                    let current = ls082.get<Int64>("propCount").getOrThrow()
                    ls082.set<Int64>("propCount", current + 1)
                })

            Button("Decrement in LocalStorage")
                .id("decrement_storage_button")
                .onClick({ e =>
                    let current = ls082.get<Int64>("propCount").getOrThrow()
                    ls082.set<Int64>("propCount", current - 1)
                })

            Button("Set to 100 in LocalStorage")
                .id("set_storage_button")
                .onClick({ e => ls082.set<Int64>("propCount", 100) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }

    protected override func aboutToDisappear() {
        ls082.aboutToBeDeleted()
        return
    }
}

