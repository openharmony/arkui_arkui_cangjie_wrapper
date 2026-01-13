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

/*
 * Note: This page is designed for branch coverage to ensure the application runs normally,
 * without concern for specific test results.
 */
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*


let _ = PersistentStorage.persistProp<Int64>("p_int64_value", 100)
let _ = PersistentStorage.persistProp<String>("p_string_value", "0")
let _ = PersistentStorage.persistProp<Float64>("p_float64_value", 1.0)
let _ = PersistentStorage.persistProp<Bool>("p_bool_value", false)

let _ = PersistentStorage.persistProps<String>([("p_str1", "Alex"), ("p_str2", "Aphrodite")])
let _ = PersistentStorage.persistProps<Int64>([("p_int64_v1", 2), ("p_int64_v2", 3)])
let _ = PersistentStorage.persistProps<Bool>([("p_bool_v1", false), ("p_bool_v2", true)])
let _ = PersistentStorage.persistProps<Float64>([("p_float64_v1", 2.0), ("p_float64_v2", 3.0)])

let keys_set = PersistentStorage.keys()

@Entry
@Component
class ViewCovPersistentStorage {
    @StorageLink["p_int64_value"] var p_int64_value: Int64 = 0
    @StorageLink["p_string_value"] var p_string_value: String = ""
    @StorageLink["p_float64_value"] var p_float64_value: Float64 = 0.0
    @StorageLink["p_bool_value"] var p_bool_value: Bool = false
    func build() {
        Column {
            Text("p_int64_value: ${p_int64_value}").onAppear({
                => p_int64_value = 10
            }).id("p_int64_value")

            Text("p_string_value: ${p_string_value}").onAppear({
                => p_string_value = "test"
            }).id("p_string_value")

            Text("p_float64_value: ${p_float64_value}").onAppear({
                => p_float64_value = 10.0
            }).id("p_float64_value")

            Text("p_bool_value: ${p_bool_value}").onAppear({
                => p_bool_value = true
            }).id("p_bool_value")
        }
    }
}