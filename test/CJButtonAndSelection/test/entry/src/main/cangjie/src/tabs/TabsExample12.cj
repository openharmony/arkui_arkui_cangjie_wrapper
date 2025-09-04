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

package ohos_app_cangjie_entry.tabs

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import kit.LocalizationKit.*

class MyDataSource <: IDataSource<String> {
    public MyDataSource(let list: ArrayList<String>) {}

    public func totalCount(): Int64 {
        return this.list.size
    }

    public func getData(index: Int64): String {
        return this.list[index]
    }

    public func registerDataChangeListener(listener: DataChangeListener): Unit {
    }

    public func unregisterDataChangeListener(listener: DataChangeListener): Unit {
    }
}

@Entry
@Component
class TabsExample12 {
    @State
    var fontColor: Color = Color(0x182431)
    @State
    var selectedFontColor: Color = Color(0x007DFF)
    @State
    var currentIndex: Int32 = 0
    var list: ArrayList<String> = ArrayList<String>()
    var tabsController: TabsController = TabsController()
    var swiperController: SwiperController = SwiperController()
    var swiperData: MyDataSource = MyDataSource(ArrayList<String>())

    protected override func aboutToAppear() {
        for (i in 0..9) {
            this.list.add("${i}");
        }
        this.swiperData = MyDataSource(this.list)
    }

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
                .fontColor(if (this.currentIndex == index) {
                    this.selectedFontColor
                } else {
                    this.fontColor
                })
                .fontSize(16)
                .fontWeight(if (this.currentIndex == index) {
                    FontWeight.W500
                } else {
                    FontWeight.W400
                })
                .lineHeight(22)
                .margin(top: 17, bottom: 7)

            Divider().strokeWidth(2).color(0x007DFF).opacity(if (this.currentIndex == index) {
                1.0
            } else {
                0.0
            })
        }.width(20.percent)
    }

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.Start, controller: this.tabsController) {
                ForEach(this.list,
                    itemGeneratorFunc: {
                        item: String, index: Int64 => TabContent() {}.tabBar(
                            {=> bind(this.tabBuilder, this)(Int32(index), '页签 ${this.list[index]}')})
                    })
            }.id("TabsExample12").barMode(BarMode.Scrollable).backgroundColor(0xF1F3F5).height(56).width(100.percent)

            Swiper(controller: this.swiperController) {
            /*
                LazyForEach(this.swiperData, itemGeneratorFunc: {item: String, idx: Int64 =>
                    Text(item)
                    .onAppear({=>
                      Hilog.info(1,"1",'onAppear ' + item)
                    })
                    .onDisAppear({=>
                      Hilog.info(1,"1",'onDisAppear ' + item)
                    })
                    .width(100.percent)
                    .height(100.percent)
                    .backgroundColor(0xAFEEEE)
                    .textAlign(TextAlign.Center)
                    .fontSize(30)
                })*/
            }.loop(false).onChange(
                {
                    index: Int32 =>
                    this.currentIndex = index
                    this.tabsController.changeIndex(index)
                }
            )
        }
    }
}