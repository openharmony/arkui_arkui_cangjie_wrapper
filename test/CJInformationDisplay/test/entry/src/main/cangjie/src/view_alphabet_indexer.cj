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
 * Created on 2024/6/19
 */
package ohos_app_cangjie_entry


import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component

class ViewAlphabetIndexer {
    @State
    var arrayA: ObservedArrayList<String> = ObservedArrayList<String>(["An", "Ai"])
    @State
    var arrayB: ObservedArrayList<String> = ObservedArrayList<String>(["Bai", "Bao", "Bi"])
    @State
    var arrayC: ObservedArrayList<String> = ObservedArrayList<String>(["Chu", "Cai", "Chen"])
    @State
    var value: ObservedArrayList<String> = ObservedArrayList<String>(["#", "A", "B", "C", "D"])
    @State
    var idx: UInt32 = 0
    @State
    var message: String = ""
    func build() {
        Column() {
            Row() {
                List() {
                    ForEach(
                        this.arrayA,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 => ListItem() {
                                Text(item).fontSize(30).textAlign(TextAlign.Center).width(80.percent).height(5.percent)
                            }
                        }
                    )
                    ForEach(
                        this.arrayB,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 => ListItem() {
                                Text(item).fontSize(30).textAlign(TextAlign.Center).width(80.percent).height(5.percent)
                            }
                        }
                    )
                    ForEach(
                        this.arrayC,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 => ListItem() {
                                Text(item).fontSize(30).textAlign(TextAlign.Center).width(80.percent).height(5.percent)
                            }
                        }
                    )
                }.width(40.percent)

                AlphabetIndexer(arrayValue: value.get().toArray(), selected: idx)
                    .id("my_alphabet_indexer")
                    .selectedColor(0xFFFFFF)
                    .color(@r(app.color.blue_23C452))
                    .popupColor(0xFFFAF0)
                    .selectedBackgroundColor(0xCCCCCC)
                    .popupBackground(0xD2B48C)
                    .usingPopup(true)
                    .selectedFont(weight: FontWeight.Bolder)
                    .font()
                    .popupFont(weight: FontWeight.Bolder)
                    .itemSize(28)
                    .alignStyle(IndexerAlign.Right)
                    .alignStyle(IndexerAlign.Left)
                    .onSelect({
                        idx: Int64 => Hilog.info(1,"1","${idx} selected")
                    })
                    .onRequestPopupData(
                        {
                            idx: Int64 =>
                            message = ""
                            if (value[Int64(idx)] == "A") {
                                for (str in arrayA.get().toArray()) {
                                    message += str + " "
                                }
                                return arrayA.get().toArray()
                            } else if (value[Int64(idx)] == "B") {
                                for (str in arrayB.get().toArray()) {
                                    message += str + " "
                                }
                                return arrayB.get().toArray()
                            } else if (value[Int64(idx)] == "C") {
                                for (str in arrayC.get().toArray()) {
                                    message += str + " "
                                }
                                return arrayC.get().toArray()
                            } else {
                                let nullArr: Array<String> = []
                                return nullArr
                            }
                        }
                    )
                    .onPopupSelect({
                        idx: Int64 => Hilog.info(1,"1","onPopupSelect ${idx}")
                    })

                AlphabetIndexer(arrayValue: value.get().toArray(), selected: 5)
                    .id("my_alphabet_indexer_1")
                    .selectedColor(0xFFFFFF)
                    .color(@r(app.color.blue_23C452))
                    .popupColor(0xFFFAF0)
                    .selectedBackgroundColor(0xCCCCCC)
                    .popupBackground(0xD2B48C)
                    .usingPopup(true)
                    .selectedFont(weight: FontWeight.Bolder)
                    .font()
                    .popupFont(weight: FontWeight.Bolder)
                    .itemSize(28)
                    .alignStyle(IndexerAlign.Right)
                    .alignStyle(IndexerAlign.Left)
                    .onSelect({
                        idx: Int64 => Hilog.info(1,"1","${idx} selected")
                    })
                    .onRequestPopupData(
                        {
                            idx: Int64 =>
                            message = ""
                            if (value[Int64(idx)] == "A") {
                                for (str in arrayA.get().toArray()) {
                                    message += str + " "
                                }
                                return arrayA.get().toArray()
                            } else if (value[Int64(idx)] == "B") {
                                for (str in arrayB.get().toArray()) {
                                    message += str + " "
                                }
                                return arrayB.get().toArray()
                            } else if (value[Int64(idx)] == "C") {
                                for (str in arrayC.get().toArray()) {
                                    message += str + " "
                                }
                                return arrayC.get().toArray()
                            } else {
                                let nullArr: Array<String> = []
                                return nullArr
                            }
                        }
                    )
                    .onPopupSelect({
                        idx: Int64 => Hilog.info(1,"1","${idx} selected")
                    })

            }

            Row() {
                Button("clickA").onClick({e => idx = 1}).id("buttonA").width(30.percent).height(40)
                Button("clickB").onClick({e => idx = 2}).id("buttonB").width(30.percent).height(40)
                Button("clickC").onClick({e => idx = 3}).id("buttonC").width(30.percent).height(40)
            }

            Text(message).width(80.percent).height(20).borderColor(0x055555).borderWidth(1).id("text")

            Row() {
                AlphabetIndexer(arrayValue: value.get().toArray(), selected: idx)
                    .color(0xff182431)
                    .selectedBackgroundColor(@r(app.color.blue_23C452))
                    .popupColor(@r(app.color.blue_23C452))
                    .selectedFont(family: @r(app.string.DEFAULT_FONT))
                    .popupFont(family: @r(app.string.DEFAULT_FONT))
                    .font(family: @r(app.string.DEFAULT_FONT))
                    .itemSize(18.0)
                    .selected(1)
                    .popupPosition(y: 48)
                    .selectedColor(@r(app.color.blue_23C452))

                AlphabetIndexer(arrayValue: value.get().toArray(), selected: idx)
                    .color(0xff182431)
                    .selectedBackgroundColor(@r(app.color.blue_23C452))
                    .popupColor(@r(app.color.blue_23C452))
                    .selectedFont(size: @r(app.string.font_size))
                    .popupFont(size: @r(app.string.font_size))
                    .font(size: @r(app.string.font_size))
                    .popupPosition(x: 60.0)
                    .popupBackground(@r(app.color.blue_23C452))

                AlphabetIndexer(arrayValue: value.get().toArray(), selected: idx)
                    .color(0xff182431)
                    .selectedBackgroundColor(@r(app.color.blue_23C452))
                    .popupColor(@r(app.color.blue_23C452))
                    .selectedFont(size: @r(app.string.font_size), family: @r(app.string.DEFAULT_FONT))
                    .popupFont(size: @r(app.string.font_size), family: @r(app.string.DEFAULT_FONT))
                    .font(size: @r(app.string.font_size), family: @r(app.string.DEFAULT_FONT))
            }
        }.width(100.percent).height(100.percent)
    }
}
