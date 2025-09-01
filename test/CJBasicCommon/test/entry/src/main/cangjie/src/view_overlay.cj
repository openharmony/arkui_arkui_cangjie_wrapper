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
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class View_Overlay {
    func build() {
        Column(space: 10) {
            Column() {
                Text("floating layer").fontSize(12).fontColor(0xCCCCCC).maxLines(1)
                Column() {
                    Image(@r(app.media.startIcon))
                        .width(240)
                        .height(240)
                        .overlay(
                            value: "Winter is a beautiful season, especially when it snows.",
                            align: Alignment.Bottom,
                            offset: OverlayOffset(x: 0.0, y: -15.0)
                        )
                        .id("image")
                }.border(color: Color.Black, width: 2.px)
            }.width(100.percent)
        }
    }
}
