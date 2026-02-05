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
let _ = AppStorage.setOrCreate<String>("storageText", "Initial")

/**
 * TC_072: @StorageLink Variable Used in Component
 * Test Scenario: Use @StorageLink variable in build() method
 * Expected Result: Variable value correctly displayed, UI auto-updates after modification
 */
@Entry
@Component
class ViewStorageTC072 {
    @StorageLink["storageText"] var text: String = "Initial"

    func build(): Unit {
        Column() {
            Text("TC_072: @StorageLink Variable Used in Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Text: ${this.text}")
                .fontSize(16)
                .margin(top: 5)
                .id("text_display")

            TextInput(text: this.text)
                .id("text_input")
                .onChange({ value => this.text = value })

            Button("Set to 'Hello World'")
                .id("set_hello_button")
                .onClick({ e => this.text = "Hello World" })

            Button("Set to 'Cangjie'")
                .id("set_cangjie_button")
                .onClick({ e => this.text = "Cangjie" })

            Button("Append '!'")
                .id("append_button")
                .onClick({ e => this.text = this.text + "!" })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

