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

/**
 * Created on 2024/7/17
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class ViewContextMenu {
    @Builder
    func menuBuilder() {
        Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center) {
            Button("Test ContextMenu1")
            Divider().strokeWidth(2).margin(5).color(0x2788D9)
            Button("Test ContextMenu2")
            Divider().strokeWidth(2).margin(5).color(0x2788D9)
            Button("Test ContextMenu3")
        }.width(200).height(160)
    }

    func build() {
        Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center) {
            Column() {
                Text("Test ContextMenu")
                    .fontSize(20)
                    .width(100.percent)
                    .height(500)
                    .backgroundColor(0xAFEEEE)
                    .textAlign(TextAlign.Center)
            }
                .bindContextMenu(builder: this.menuBuilder, responseType: ResponseType.LongPress)
                .onDragStart({
                    evt =>
                //                        ContextMenu.close()
                })
                .id("context_menu")
        }.width(100.percent).height(100.percent).id("my_menu")
    }
}
