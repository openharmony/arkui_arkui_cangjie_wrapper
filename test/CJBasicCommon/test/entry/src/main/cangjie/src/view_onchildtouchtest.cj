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
import ohos.prompt_action.*

@Entry
@Component
class View_OnChildTouchTest {
    @State
    var value: Int32 = 1
    @State
    var text: String = "Button"
    let numbers: ObservedArrayList<Int64> = ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])

    func build() {
        Column {
            List(space: 20, initialIndex: 0) {
                ForEach(this.numbers,
                    itemGeneratorFunc: {
                        item: Int64, _: Int64 => ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Center)
                                .borderRadius(10)
                                .backgroundColor(0xFFFFFF)
                        }.backgroundColor(Color.White).borderRadius(24).padding(12)
                    })
            }
                .scrollBar(BarState.Off)
                .width(90.percent)
                .onScrollIndex(
                    {
                        first: Int32, last: Int32, a: Int32 => Hilog.info(1, "1", "Cangjie-App",
                            "first: " + first.toString() + " last: " + last.toString())
                    })
                .onScrollFrameBegin(
                    {
                        first: Float64, last: ScrollState =>
                        Hilog.info(1, "1", "Cangjie-App", "OnChildTouchTest onScrollFrameBegin")
                        this.text = "onScrollFrameBegin"
                        return onScrollFrameBeginHandleResult(offsetRemain: first)
                    }
                )
                .width(100.percent)
                .height(65.percent)
                .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .onClick(
                    {
                        evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                    }
                )
        }.width(100.percent).height(100.percent)
    }
}
