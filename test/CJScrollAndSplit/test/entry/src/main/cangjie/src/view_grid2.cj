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
class View_Grid2 {
    @State
    var scroller: Scroller = Scroller()

    @State
    var numbers: ArrayList<String> = ArrayList<String>()

    @State
    var text: String = "drag"

    @State
    var index0 = "1"
    @State
    var index5 = "6"

    @State
    var text2: String = "Hello"

    protected override func aboutToAppear() {
        for (i in 1..9) {
            this.numbers.add("${i}")
        }
    }

    func changeIndex(index1: Int64, index2: Int64) { //交换数组位置
        var temp = this.numbers[index1];
        //        this.numbers.add(this.numbers.get(index2).getOrThrow(), at: index1)
        //        this.numbers.add(temp, at: index2)
        this.numbers[index1] = this.numbers[index2]
        this.numbers[index2] = temp
        Hilog.info(1, "info", "onItemDrop changeIndex, this.numbers: ${this.numbers}")

        this.index0 = this.numbers[0]
        this.index5 = this.numbers[5]
        Hilog.info(1, "info", "onItemDrop changeIndex, index0: ${this.index0}, index5: ${this.index5}")
    }

    public func build() {
        Scroll() {
            Column(space: 20) {
                Grid(scroller: this.scroller) {
                    ForEach(
                        this.numbers,
                        itemGeneratorFunc: {
                            day: String, idx: Int64 => GridItem() {
                                Text(day)
                                    .fontSize(16)
                                    .backgroundColor(0xF9CF93)
                                    .width(80)
                                    .height(80)
                                    .textAlign(TextAlign.Center)
                            }
                        }
                    )
                }
                    .columnsTemplate("1fr 1fr 1fr")
                    .columnsGap(10)
                    .rowsGap(10)
                    .width(90.percent)
                    .backgroundColor(0xFAEEE0)
                    .height(300)
            }
        }
    }
}
