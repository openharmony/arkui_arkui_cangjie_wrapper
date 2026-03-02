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

internal import ohos.arkui.component.*
internal import ohos.arkui.component.loadNativeView

internal import ohos.base.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*

let a = AppStorage.setOrCreate<String>("noSetExit", "")
let b = AppStorage.setOrCreate<String>("noSetEnter", "")
let c = AppStorage.setOrCreate<String>("boundaryExit", "")
let d = AppStorage.setOrCreate<String>("boundaryEnter", "")
let e = AppStorage.setOrCreate<String>("homePageExit", "")
let f = AppStorage.setOrCreate<String>("invalidExit", "")
let g = AppStorage.setOrCreate<String>("invalidEnter", "")

let h = AppStorage.setOrCreate<Int64>("geometryTransitionDuration", 0)

@Entry
@Component
class MyView {
    func build() {
        Scroll() {
            Column {
                ForEach(
                    UT_views,
                    itemGeneratorFunc: {
                        viewName: String, _: Int64 => Button(viewName)
                            .fontSize(16)
                            .width(100.percent)
                            .height(50)
                            .id(viewName)
                            .borderRadius(10)
                            .onClick ({
                                e => getUIContext().getRouter().pushUrl(url: viewName)
                            })
                    }
                )
            }.width(100.percent).margin(top: 5)
        }.id("scroller")
    }
}