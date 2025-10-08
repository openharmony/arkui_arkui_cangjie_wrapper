/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

@Entry
@Component
class ViewPersistentStorage {
    let p0 = PersistentStorage.persistProp<Int64>("count", 100)

    let p5 = PersistentStorage.persistProp("Name", "Adonis")
    let p9 = PersistentStorage.persistProp("Name", "Adonis")
    let p1 = PersistentStorage.persistProp("Age", 24)
    let p10 = PersistentStorage.persistProp("Ages", [24, 24])
    let p2 = PersistentStorage.persistProp("Height", 180.0)
    let p3 = PersistentStorage.persistProp("Male", true)
    let p4 = PersistentStorage.persistProps([("Name1", "Alex"), ("Name2", "Aphrodite")])

    let p6 = PersistentStorage.persistProps([("Name5", 2), ("Name6", 3)])

    let p7 = PersistentStorage.persistProps([("Name7", false), ("Name8", true)])

    let p8 = PersistentStorage.persistProps([("Name3", 2.0), ("Name4", 3.0)])

    @StorageLink["Name"]
    var name: String = ""
    @StorageLink["Age"]
    var age: Int64 = 0
    @StorageLink["Height"]
    var height: Float64 = 0.0
    @StorageLink["Male"]
    var male: Bool = true
    @StorageLink["Name1"]
    var name1: String = ""
    @StorageLink["Name2"]
    var name2: String = ""

    @StorageLink["count"]
    var count: Int64 = 0
    func build() {
        Column(space: 10) {
            Text("${count}").id("p_text").width(count.vp)

            Button("+").onClick ({
                e => count += 10
            }).id("plusBtn")

            Text("Name ${name}")
            Text("Age ${age}")
            Text("Heght ${height}")
            Text("Male ${male}")
            Text("Name1 ${name1} Name2 ${name2}")
            Button("change age").onClick ({
                e =>
                age += 1
                PersistentStorage.keys()
            }).id("PersistentStorage_keys")

            Button("clear age").onClick ({
                e => PersistentStorage.deleteProp("Age")
            }).id("PersistentStorage_deleteProp")

        }
    }
}
