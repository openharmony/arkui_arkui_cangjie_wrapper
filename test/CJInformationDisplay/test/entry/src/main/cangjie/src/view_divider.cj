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
class View_Divider {
    func build() {
        Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween) {
            Text("bravery")
            Divider()
            .vertical(false)
            .strokeWidth(50)
            .color(0x2788D9)
            .lineCap(LineCapStyle.Round)
            .id("my_divider")
            Text("effort")


            Divider()
            .color(@r(app.color.start_window_background))
            .strokeWidth(5.0)
            .strokeWidth(@r(app.string.font_size))
            .lineCap(LineCapStyle.Round)
        }
        .width(100.percent)
        .height(350)
        .padding(left: 35, right: 35, top: 35)
    }
}
