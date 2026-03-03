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
 * TC_085: @State Nested Object (Multiple Levels)
 * Test Scenario: @State object contains multi-level nested objects
 * Expected Result: Multi-level nested objects work correctly, modifications trigger updates
 */

@Observed
class Level3Object {
    @Publish var data: String = ""
    @Publish var count: Int64 = 0
}

@Observed
class Level2ObjectTC085 {
    @Publish var detail: String = ""
    @Publish var level3: Level3Object = Level3Object()
}

@Observed
class Level1ObjectTC085 {
    @Publish var name: String = ""
    @Publish var level2: Level2ObjectTC085 = Level2ObjectTC085()
}

@Entry
@Component
class ViewComplexTC085 {
    @State var multiLevelObject: Level1ObjectTC085 = Level1ObjectTC085(
        name: "Root",
        level2: Level2ObjectTC085(
            detail: "Level2",
            level3: Level3Object(data: "Level3 Data", count: 1)
        )
    )

    func build(): Unit {
        Column() {
            Text("TC_085: @State Nested Object (Multiple Levels)")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Level1: ${this.multiLevelObject.name}")
                .id("level1_text")
            
            Text("Level2: ${this.multiLevelObject.level2.detail}")
                .id("level2_text")
            
            Text("Level3 Data: ${this.multiLevelObject.level2.level3.data}")
                .id("level3_data_text")
            
            Text("Level3 Count: ${this.multiLevelObject.level2.level3.count}")
                .id("level3_count_text")

            Button("Update Level1")
                .id("update_level1_button")
                .onClick({ e => this.multiLevelObject.name = "Updated Root" })

            Button("Update Level2")
                .id("update_level2_button")
                .onClick({ e => this.multiLevelObject.level2.detail = "Updated Level2" })

            Button("Update Level3 Data")
                .id("update_level3_data_button")
                .onClick({ e => this.multiLevelObject.level2.level3.data = "Updated Level3" })

            Button("Update Level3 Count")
                .id("update_level3_count_button")
                .onClick({ e => this.multiLevelObject.level2.level3.count = this.multiLevelObject.level2.level3.count + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

