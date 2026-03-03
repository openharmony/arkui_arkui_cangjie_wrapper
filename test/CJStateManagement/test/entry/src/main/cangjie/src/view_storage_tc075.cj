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
let _ = AppStorage.setOrCreate<String>("propMessage", "Hello")

/**
 * TC_075: @StorageProp Variable Used in Component
 * Test Scenario: Use @StorageProp variable in build() method
 * Expected Result: Variable value correctly displayed, UI auto-updates when storage changes
 */
@Entry
@Component
class ViewStorageTC075 {
    @StorageProp["propMessage"] let message: String = "Hello"

    func build(): Unit {
        Column() {
            Text("TC_075: @StorageProp Variable Used in Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Message: ${this.message}")
                .fontSize(16)
                .margin(top: 5)
                .id("message_display")

            if (this.message.contains("Hello")) {
                Text("Greeting detected!")
                    .fontSize(14)
                    .fontColor(Color.Blue)
                    .margin(top: 5)
                    .id("greeting_text")
            }

            Button("Set to 'World' in AppStorage")
                .id("set_world_button")
                .onClick({ e => AppStorage.set<String>("propMessage", "World") })

            Button("Set to 'Cangjie' in AppStorage")
                .id("set_cangjie_button")
                .onClick({ e => AppStorage.set<String>("propMessage", "Cangjie") })

            Button("Set to 'Hello World' in AppStorage")
                .id("set_hello_world_button")
                .onClick({ e => AppStorage.set<String>("propMessage", "Hello World") })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

