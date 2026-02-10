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
 * TC_126: State Variable Initial Value is Empty Object
 * Test Scenario: @State @Observed object initialized as empty object
 * Expected Result: Empty object is handled correctly, UI updates after setting properties
 */

@Entry
@Component
class ViewBoundaryTC126 {
    @State var emptyObject: Option<CustomModel> = Option<CustomModel>.None

    func build(): Unit {
        Column() {
            Text("TC_126: State Variable Initial Value is Empty Object")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            // todo
            // if (this.emptyObject.isNone()) {
            //     Text("Object is null")
            //         .fontSize(16)
            //         .fontColor(0xFF0000)
            //         .id("object_null_display")
            // } else {
            //     let obj = this.emptyObject.getOrThrow()
            //     Column() {
            //         Text("Object Name: ${obj.name}")
            //             .fontSize(16)
            //             .id("object_name_display")
                    
            //         Text("Object Value: ${obj.value}")
            //             .fontSize(16)
            //             .id("object_value_display")
            //     }
            // }
            Button("Create Object")
                .id("create_object_button")
                .onClick({ e => 
                    this.emptyObject = Some(CustomModel(name: "New Object", value: 1, count: 1))
                })

            Button("Set Properties")
                .id("set_properties_button")
                .onClick({ e => 
                    match (this.emptyObject) {
                        case Some(obj) => 
                            obj.name = "Updated Name"
                            obj.value = 100
                        case None => ()
                    }
                })

            Button("Set to null")
                .id("set_null_button")
                .onClick({ e => this.emptyObject = Option<CustomModel>.None })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

