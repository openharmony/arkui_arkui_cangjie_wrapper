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
import std.math.*

@Entry
@Component
class TabsExample9 {
    @State
    var currentIndex: Int32 = 0
    @State
    var animationDuration: Float32 = 300.0
    @State
    var indicatorLeftMargin: Float64 = 0.0
    @State
    var indicatorWidth: Float64 = 0.0
    var tabsWidth: Float64 = 0.0
    var textInfos: Array<Array<Float64>> = Array(Int64(4), repeat: Array<Float64>())
    var isStartAnimateTo: Bool = false

    @State
    var startIndex: Int32 = 0;
    @State
    var startTargetIndex: Int32 = 0;
    @State
    var startEvent: String = "";
    @State
    var endIndex: Int32 = 0;
    @State
    var endEvent: String = "";
    @State
    var gestureIndex: Int32 = 0;
    @State
    var gestureEvent: String = "";

    @Builder
    func tabBuilder(index: Int32, name: String) {
        Column() {
            Text(name)
                .fontSize(16)
                .fontColor(if (this.currentIndex == index) {
                    0x007DFF
                } else {
                    0x182431
                })
                .fontWeight(if (this.currentIndex == index) {
                    FontWeight.W500
                } else {
                    FontWeight.W400
                })
                .id(index.toString())
                .onAreaChange({
                    oldValue: Area, newValue: Area =>
                //                this.textInfos[Int64(index)] = [newValue.globalPosition.x, newValue.width]
                })
        }.width(100.percent)
    }

    func build() {
        Column() {
            Tabs(barPosition: BarPosition.Start) {
                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
                }.tabBar({=> bind(this.tabBuilder, this)(0, 'green')})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
                }.tabBar({=> bind(this.tabBuilder, this)(1, 'blue')})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xFFBF00)
                }.tabBar({=> bind(this.tabBuilder, this)(2, 'yellow')})

                TabContent() {
                    Column().width(100.percent).height(100.percent).backgroundColor(0xE67C92)
                }.tabBar({=> bind(this.tabBuilder, this)(3, 'pink')})
            }
                .onAreaChange(
                    {
                        oldValue: Area, newValue: Area =>
                        this.tabsWidth = newValue.width.value
                        if (!this.isStartAnimateTo) {
                            this.setIndicatorAttr(this.textInfos[Int64(this.currentIndex)][0],
                                this.textInfos[Int64(this.currentIndex)][1])
                        }
                    }
                )
                .id("TabsExample9")
                .barWidth(100.percent)
                .barHeight(56)
                .width(100.percent)
                .height(296)
                .backgroundColor(0xF1F3F5)
                .animationDuration(this.animationDuration)
                .onChange({
                    index: Int32 => this.currentIndex = index // 监听索引index的变化，实现页签内容的切换。
                })

            Column()
                .height(2)
                .width(this.indicatorWidth)
                .margin(left: this.indicatorLeftMargin, top: 48.0)
                .backgroundColor(0x007DFF)

            Column() {
                Text("${this.startIndex}").id("startIndex")
                Text("${this.startTargetIndex}").id("startTargetIndex")
                Text(this.startEvent).id("startEvent")

                Text("${this.endIndex}").id("endIndex")
                Text(this.endEvent).id("endEvent")

                Text("${this.gestureIndex}").id("gestureIndex")
                Text(this.gestureEvent).id("gestureEvent")
            }.margin(top: 300)
        }.width(100.percent)
    }

    func getCurrentIndex(swipeRatio: Float64, nextIndex: Int32, index: Int32): Int32 {
        if (swipeRatio > 0.5) {
            return nextIndex
        }
        return index
    }

    func startAnimateTo(duration: Int32, leftMargin: Float64, width: Float64) {
        this.isStartAnimateTo = true
        animateTo(
            AnimateParam(
                duration: duration, // 动画时长
                curve: Curve.Linear, // 动画曲线
                iterations: 1, // 播放次数
                playMode: PlayMode.Normal, // 动画模式
                onFinish: {=> this.isStartAnimateTo = false}
            ),
            {=> this.setIndicatorAttr(leftMargin, width)}
        )
    }

    func setIndicatorAttr(leftMargin: Float64, width: Float64) {
        this.indicatorWidth = width
        this.indicatorLeftMargin = leftMargin
    }
}
