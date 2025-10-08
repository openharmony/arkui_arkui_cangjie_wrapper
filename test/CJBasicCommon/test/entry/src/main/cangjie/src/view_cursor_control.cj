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

import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import ohos.arkui.component.*
import ohos.base.LengthProp

@Entry
@Component
class ViewCursorControl {
    @State var enable: Bool = false
    func build() {
        Column() {
            Row {
                Button("CursorControl")
                .onClick ({e =>})
                .fontSize(40)
                .height(80)
                .onClick ({ e =>
                    this.enable = !this.enable
                }).id("CursorControl-change")
            }
            Row {
                Button("CursorControl2")
                .fontSize(40)
                .height(80)
                .onClick ({ e =>
                }).id("CursorControl-change2")
            }
            Row {
                Button("CursorControl3")
                .fontSize(40)
                .height(80)
                .onClick ({ e =>
                }).id("CursorControl-change3")
            }
        }.height(100.percent).margin(left: 20,right: 20)
    }
}