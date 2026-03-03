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

// Initialize AppStorage values
let _ = AppStorage.setOrCreate<Int64>("propInt", 50)
let _ = AppStorage.setOrCreate<String>("propString", "Test")
let _ = AppStorage.setOrCreate<Bool>("propBool", false)

/**
 * TC_073: @StorageProp Variable Definition (Primitive Types)
 * Test Scenario: Define @StorageProp variable bound to AppStorage
 * Expected Result: Variable correctly initialized and can read values from storage
 */
@Entry
@Component
class ViewStorageTC073 {
    @StorageProp["propInt"] let myInt: Int64 = 50
    @StorageProp["propString"] let myString: String = "Test"
    @StorageProp["propBool"] let myBool: Bool = false

    func build(): Unit {
        Column() {
            Text("TC_073: @StorageProp Variable Definition (Primitive Types)")
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

            Button("Update AppStorage Int64")
                .id("update_storage_int_button")
                .onClick({ e => AppStorage.set<Int64>("propInt", 100) })

            Button("Update AppStorage String")
                .id("update_storage_string_button")
                .onClick({ e => AppStorage.set<String>("propString", "Updated") })

            Button("Update AppStorage Bool")
                .id("update_storage_bool_button")
                .onClick({ e => AppStorage.set<Bool>("propBool", true) })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

