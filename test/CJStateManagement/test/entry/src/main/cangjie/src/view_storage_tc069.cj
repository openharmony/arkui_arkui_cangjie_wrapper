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
let _ = AppStorage.setOrCreate<Int64>("storageInt", 100)
let _ = AppStorage.setOrCreate<String>("storageString", "Hello")
let _ = AppStorage.setOrCreate<Bool>("storageBool", true)
let _ = AppStorage.setOrCreate<Float64>("storageFloat", 3.14)

/**
 * TC_069: @StorageLink Variable Definition (Primitive Types)
 * Test Scenario: Define @StorageLink variables bound to AppStorage
 * Expected Result: Variables correctly initialized and can read values from storage
 */
@Entry
@Component
class ViewStorageTC069 {
    @StorageLink["storageInt"] var myInt: Int64 = 100
    @StorageLink["storageString"] var myString: String = "Hello"
    @StorageLink["storageBool"] var myBool: Bool = true
    @StorageLink["storageFloat"] var myFloat: Float64 = 3.14

    func build(): Unit {
        Column() {
            Text("TC_069: @StorageLink Variable Definition (Primitive Types)")
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

            Text("Float64: ${this.myFloat}")
                .fontSize(16)
                .margin(top: 5)
                .id("float_text")

            Button("Update Int64")
                .id("update_int_button")
                .onClick({ e => this.myInt = 200 })

            Button("Update String")
                .id("update_string_button")
                .onClick({ e => this.myString = "World" })

            Button("Update Bool")
                .id("update_bool_button")
                .onClick({ e => this.myBool = !this.myBool })

            Button("Update Float64")
                .id("update_float_button")
                .onClick({ e => this.myFloat = 6.28 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

