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
import std.collection.*

/**
 * TC_091: @State Map Type (Object Values)
 * Test Scenario: @State Map<String, @Observed类> and other object Maps
 * Expected Result: @Publish variable modifications in Map objects trigger UI updates
 */

@Entry
@Component
class ViewComplexTC091 {
    @State var objectMap: HashMap<String, CustomModel> = HashMap<String, CustomModel>()

    protected override func aboutToAppear() {
        this.objectMap.add("key1", CustomModel(name: "Model1", value: 10, count: 1))
        this.objectMap.add("key2", CustomModel(name: "Model2", value: 20, count: 2))
        this.objectMap.add("key3", CustomModel(name: "Model3", value: 30, count: 3))
        ()
    }

    func build(): Unit {
        Column() {
            Text("TC_091: @State Map Type (Object Values)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Map Size: ${this.objectMap.size}")
                .id("map_size_text")
        

            Button("Add to Map")
                .id("add_map_button")
                .onClick({ e => 
                    let newKey = "key${this.objectMap.size + 1}"
                    let newValue = Int64(this.objectMap.size + 1)
                    this.objectMap.add(newKey, CustomModel(name: "Model${newValue}", value: newValue * 10, count: newValue))
                })

            Button("Update key1 Name")
                .id("update_key1_name_button")
                .onClick({ e => 
                    let modelOpt = this.objectMap.get("key1")
                    match (modelOpt) {
                        case Some(model) => model.name = "Updated Model1"
                        case None => ()
                    }
                })

            Button("Update key1 Value")
                .id("update_key1_value_button")
                .onClick({ e => 
                    let modelOpt = this.objectMap.get("key1")
                    match (modelOpt) {
                        case Some(model) => model.value = 100
                        case None => ()
                    }
                })

        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

