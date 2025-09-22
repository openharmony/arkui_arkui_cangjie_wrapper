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
class TextAndInputIndex1 {
    func build() {
        Scroll() {
            Flex(wrap: FlexWrap.Wrap) {
                ForEach(
                    UT1,
                    itemGeneratorFunc: { viewName: String, _: Int64 =>
                        Button(viewName)
                        .fontSize(12)
                        .width(47.percent)
                        .height(30)
                        .id(viewName)
                        .borderRadius(4).margin(2)
                        .onClick { e=> getUIContext().getRouter().pushUrl(url: viewName) }
                    }
                )
            }.width(100.percent).margin(top: 5)
        }.id("scroller")
    }
}
