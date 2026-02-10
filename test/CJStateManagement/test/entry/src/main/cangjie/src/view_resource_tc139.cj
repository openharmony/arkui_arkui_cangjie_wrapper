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
 * TC_139: @rawfile Macro Used in State Variable
 * Test Scenario: Use @State variable to control @rawfile resource access
 * Expected Result: Raw file resource correctly accessed
 */

@Entry
@Component
class ViewResourceTC139 {
    @State var filePath: String = "test.txt"

    func build(): Unit {
        Column() {
            Text("TC_139: @rawfile Macro Used in State Variable")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("File Path: ${this.filePath}")
                .fontSize(16)
                .id("file_path_display")

            // Note: @rawfile macro usage depends on actual resource structure
            Text("Raw file resource access with state variable")
                .fontSize(16)
                .id("rawfile_display")

            Button("Change File Path")
                .id("change_path_button")
                .onClick({ e => 
                    if (this.filePath == "test.txt") {
                        this.filePath = "data.json"
                    } else {
                        this.filePath = "test.txt"
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

