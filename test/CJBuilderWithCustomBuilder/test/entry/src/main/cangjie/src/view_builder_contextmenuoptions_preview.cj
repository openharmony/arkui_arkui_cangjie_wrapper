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
 * TC_B015: ContextMenuOptions Constructor preview Parameter Binding
 * Test Scenario: Use ContextMenuOptions in @Builder function, pass preview parameter (index 4)
 * Expected Result: preview parameter (index 4) is correctly bound
 */
@Entry
@Component
class ViewBuilderContextMenuOptionsPreview {
    @Builder
    func previewBuilder(): Unit {
        Text("Preview Content")
            .fontSize(16)
            .id("preview_text")
            .padding(10)
            .backgroundColor(0xD0E8F0)
    }
    
    @Builder
    func contextMenuBuilder(): Unit {
        Column() {
            Text("Long press to show context menu")
                .fontSize(16)
                .id("hint_text")
                .padding(10)
        }
        .id("content_column")
        .width(100.percent)
        .height(200)
        .bindContextMenu(
            builder: { => },
            responseType: ResponseType.LongPress,
            options: ContextMenuOptions(preview: Option.Some({ => this.previewBuilder }))
        )
    }
    
    func build(): Unit {
        Column() {
            Text("TC_B015: ContextMenuOptions Constructor preview Parameter Binding")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")
            
            Text("Note: Long press to show context menu with preview")
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin(top: 5)
                .id("note_text")
            
            this.contextMenuBuilder()
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

