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

// Initialize LocalStorage for TC_081 (independent instance to avoid conflicts)
let ls081 = LocalStorage()
let _ = ls081.setOrCreate<Int64>("propInt", 50)
let _ = ls081.setOrCreate<String>("propString", "Test")
let _ = ls081.setOrCreate<Bool>("propBool", false)

/**
 * TC_081: @LocalStorageProp Variable Definition
 * Test Scenario: Define @LocalStorageProp variable bound to LocalStorage
 * Expected Result: Variable correctly initialized and can read values from local storage
 */
@Entry[ls081]
@Component
class ViewLocalStorageTC081 {
    @LocalStorageProp["propInt"] let myInt: Int64 = 50
    @LocalStorageProp["propString"] let myString: String = "Test"
    @LocalStorageProp["propBool"] let myBool: Bool = false

    func build(): Unit {
        Column() {
            Text("TC_081: @LocalStorageProp Variable Definition")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Int64: ${this.myInt}")
                .fontSize(16)
                .margin(top: 5)
                .id("int_text")

            Text("String: ${this.myString}")
                .fontSize(16)
                .margin(top: 5)
                .id("string_text")

            Text("Bool: ${this.myBool}")
                .fontSize(16)
                .margin(top: 5)
                .id("bool_text")

            Button("Update LocalStorage Int64")
                .id("update_storage_int_button")
                .onClick({ e => ls081.set<Int64>("propInt", 100) })

            Button("Update LocalStorage String")
                .id("update_storage_string_button")
                .onClick({ e => ls081.set<String>("propString", "Updated") })

            Button("Update LocalStorage Bool")
                .id("update_storage_bool_button")
                .onClick({ e => ls081.set<Bool>("propBool", true) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }

    protected override func aboutToDisappear() {
        ls081.aboutToBeDeleted()
        return
    }
}

