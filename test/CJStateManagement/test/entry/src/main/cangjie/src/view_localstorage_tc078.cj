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

// Initialize LocalStorage for TC_078 (independent instance to avoid conflicts)
let ls078 = LocalStorage()
let _ = ls078.setOrCreate<Int64>("localInt", 100)
let _ = ls078.setOrCreate<String>("localString", "Hello")
let _ = ls078.setOrCreate<Bool>("localBool", true)

/**
 * TC_078: @LocalStorageLink Variable Definition
 * Test Scenario: Define @LocalStorageLink variable bound to LocalStorage
 * Expected Result: Variable correctly initialized and can read values from local storage
 */
@Entry[ls078]
@Component
class ViewLocalStorageTC078 {
    @LocalStorageLink["localInt"] var myInt: Int64 = 100
    @LocalStorageLink["localString"] var myString: String = "Hello"
    @LocalStorageLink["localBool"] var myBool: Bool = true

    func build(): Unit {
        Column() {
            Text("TC_078: @LocalStorageLink Variable Definition")
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

            Button("Update Int64")
                .id("update_int_button")
                .onClick({ e => this.myInt = 200 })

            Button("Update String")
                .id("update_string_button")
                .onClick({ e => this.myString = "World" })

            Button("Update Bool")
                .id("update_bool_button")
                .onClick({ e => this.myBool = !this.myBool })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }

    protected override func aboutToDisappear() {
        ls078.aboutToBeDeleted()
        return
    }
}

