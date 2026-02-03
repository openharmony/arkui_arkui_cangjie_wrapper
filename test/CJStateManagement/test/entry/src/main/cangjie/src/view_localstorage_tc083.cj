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

// Initialize LocalStorage for TC_083 (independent instance to avoid conflicts)
let ls083 = LocalStorage()
let _ = ls083.setOrCreate<Int64>("localValue", 0)

/**
 * TC_083: @LocalStorageLink Combined with @State
 * Test Scenario: Component uses both @LocalStorageLink and @State
 * Expected Result: Both state variables work correctly
 */
@Entry[ls083]
@Component
class ViewLocalStorageTC083 {
    @LocalStorageLink["localValue"] var localValue: Int64 = 0
    @State var stateValue: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_083: @LocalStorageLink Combined with @State")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("LocalStorage Value: ${this.localValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("local_value_text")

            Text("State Value: ${this.stateValue}")
                .fontSize(16)
                .margin(top: 5)
                .id("state_value_text")

            Button("Increment LocalStorage Value")
                .id("increment_local_button")
                .onClick({ e => this.localValue = this.localValue + 1 })

            Button("Increment State Value")
                .id("increment_state_button")
                .onClick({ e => this.stateValue = this.stateValue + 1 })

            Button("Reset Both")
                .id("reset_button")
                .onClick({ e =>
                    this.localValue = 0
                    this.stateValue = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }

    protected override func aboutToDisappear() {
        ls083.aboutToBeDeleted()
        return
    }
}

