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

let tabs_views = [
    "TabsExample1",
    "TabsExample2",
    "TabsExample3",
    "TabsExample4",
    "TabsExample5",
    "TabsExample6",
    "TabsExample7",
    "TabsExample8",
    "TabsExample9",
    "TabsExample10",
    "TabsExample11",
    "TabsExample12",
    "TabsExample13",
    "TabsExample14"
]

@Entry
@Component
class ViewTab {
    func build() {
        Column() {
            ForEach(
                tabs_views,
                itemGeneratorFunc: {
                    viewName: String, _: Int64 => Button(viewName)
                        .fontSize(10)
                        .width(90.percent)
                        .height(38)
                        .margin(1)
                        .id("Button${viewName}")
                        .borderRadius(10)
                        .onClick ({
                            e => getUIContext().getRouter().pushUrl(url: viewName)
                        })
                }
            )
        }.width(100.percent).height(100.percent).margin(top: 5)
    }
}