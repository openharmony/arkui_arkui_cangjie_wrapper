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
 * TC_121: @State + @LocalStorageLink Combination
 * Test Scenario: Component uses @State and @LocalStorageLink simultaneously
 * Expected Result: Both state variables work correctly without interference
 */

let ls121 = LocalStorage()

@Entry[ls121]
@Component
class ViewMultiTC121 {
    @State var localState: Int64 = 0
    @LocalStorageLink["localValue"] var localValue: Int64 = 0

    func build(): Unit {
        Column() {
            Text("TC_121: @State + @LocalStorageLink Combination")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Local State: ${this.localState}")
                .fontSize(16)
                .id("local_state_display")

            Text("LocalStorage Value: ${this.localValue}")
                .fontSize(16)
                .id("localstorage_value_display")

            Button("Update Local State")
                .id("update_local_button")
                .onClick({ e => this.localState = this.localState + 1 })

            Button("Update LocalStorage Value")
                .id("update_localstorage_button")
                .onClick({ e => this.localValue = this.localValue + 10 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }

    protected override func aboutToAppear(): Unit {
        let _ = ls121.setOrCreate<Int64>("localValue", 200)
        ()
    }
}

