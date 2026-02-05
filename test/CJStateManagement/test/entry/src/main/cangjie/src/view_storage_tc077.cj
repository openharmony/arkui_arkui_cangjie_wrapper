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
let _ = AppStorage.setOrCreate<Int64>("storageValue", 0)

/**
 * TC_077: @StorageLink Combined with @State
 * Test Scenario: Component uses both @StorageLink and @State
 * Expected Result: Both state variables work correctly without interference
 */
@Entry
@Component
class ViewStorageTC077 {
    @StorageLink["storageValue"] var storageValue: Int64 = 0
    @State var localValue: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_077: @StorageLink Combined with @State")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Storage Value: ${this.storageValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("storage_value_text")

            Text("Local Value: ${this.localValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("local_value_text")

            Button("Increment Storage Value")
                .id("increment_storage_button_TC077")
                .onClick({ e => this.storageValue = this.storageValue + 1 })

            Button("Increment Local Value")
                .id("increment_local_button")
                .onClick({ e => this.localValue = this.localValue + 1 })

            Button("Reset Both")
                .id("reset_button")
                .onClick({ e =>
                    this.storageValue = 0
                    this.localValue = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

