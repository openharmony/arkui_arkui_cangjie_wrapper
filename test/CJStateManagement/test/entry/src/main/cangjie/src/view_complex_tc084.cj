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
 * TC_084: @State Nested Object (Two Levels)
 * Test Scenario: @State object contains another object property
 * Expected Result: Nested object is correctly initialized, can access nested properties
 */

@Observed
class Level2Object {
    @Publish var detail: String = ""
    @Publish var number: Int64 = 0
}

@Observed
class Level1Object {
    @Publish var name: String = ""
    @Publish var level2: Level2Object = Level2Object()
}

@Entry
@Component
class ViewComplexTC084 {
    @State var nestedObject: Level1Object = Level1Object(
        name: "Level1",
        level2: Level2Object(detail: "Level2 Detail", number: 42)
    )

    func build(): Unit {
        Column() {
            Text("TC_084: @State Nested Object (Two Levels)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Level1 Name: ${this.nestedObject.name}")
                .id("level1_name_text")
            
            Text("Level2 Detail: ${this.nestedObject.level2.detail}")
                .id("level2_detail_text")
            
            Text("Level2 Number: ${this.nestedObject.level2.number}")
                .id("level2_number_text")

            Button("Update Level1 Name")
                .id("update_level1_button")
                .onClick({ e => this.nestedObject.name = "Updated Level1" })

            Button("Update Level2 Detail")
                .id("update_level2_detail_button")
                .onClick({ e => this.nestedObject.level2.detail = "Updated Detail" })

            Button("Update Level2 Number")
                .id("update_level2_number_button")
                .onClick({ e => this.nestedObject.level2.number = this.nestedObject.level2.number + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

