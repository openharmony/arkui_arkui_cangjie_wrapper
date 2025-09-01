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
class View_Swiper {
    let DISPLAY_COUNT: Int32 = 2
    let MIN_SCALE: Float64 = 0.75

    var controller: SwiperController = SwiperController()
    var controller2: SwiperController = SwiperController()
    @State
    var message: Int32 = 0
    var dotIndicator: Indicator = Indicator.dot().left(5.vp).right(5.vp).bottom(5.vp).start(5.vp).end(5.vp)

    @State
    var opacityList: Array<Float64> = Array<Float64>(6, repeat: 1.0)
    @State
    var scaleList: Array<Float64> = Array<Float64>(6, repeat: 1.0)
    @State
    var translateList: Array<Float64> = Array<Float64>(6, repeat: 0.0)
    @State
    var zIndexList: Array<Float64> = Array<Float64>(6, repeat: 0.0)

    @State
    var backgroundColors: Array<Color> = [Color.Green, Color.Blue, Color.Gray, Color.Red, Color.Green, Color.Blue]

    func build() {
        Scroll() {
            Column(space: 9) {
                // 测试displayArrow ArrowStyle设置导航点箭头样式场景
                // 测试nextMargin生效场景, loop循环下ignoreBlank参数不生效
                // 测试prevMargin生效场景, loop循环下ignoreBlank参数不生效
                Swiper(controller: controller2) {
                    Text("Swiper  One2").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two2").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                    Text("Swiper  Three2").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                }.autoPlay(true).displayCount(1).indicator(true).height(150.vp).id("swiper_case1")

                // 测试nextMargin生效场景，loop循环下ignoreBlank参数生效
                // 测试prevMargin生效场景，loop循环下ignoreBlank参数生效
                Swiper(controller: controller2) {
                    Text("Swiper  One2").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two2").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                    Text("Swiper  Three2").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                }
                    .autoPlay(true)
                    .id("swiper_case2")
                    .displayCount(2)
                    .indicator(
                        DotIndicator()
                            .itemWidth(15)
                            .itemHeight(15)
                            .selectedItemWidth(15)
                            .selectedItemHeight(15)
                            .color(Color.Gray)
                            .selectedColor(Color.Blue)
                            .mask(true)
                            .maxDisplayCount(7))
                    .height(150.vp)
                    .loop(false)

                // 测试displayArrow 传参Bool是否显示导航点箭头样式
                // 测试displayCount设置Swiper视窗内元素显示个数为2个
                // 测试nextMargin生效场景, loop循环下ignoreBlank参数不生效
                Swiper(controller: controller2) {
                    Text("Swiper  One2").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two2").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                    Text("Swiper  Three2").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                }
                    .autoPlay(true)
                    .id("swiper_case3")
                    .indicator(
                        Indicator
                            .digit()
                            .left(5.vp)
                            .top(200)
                            .fontColor(Color.Gray)
                            .selectedFontColor(Color.Gray)
                            .digitFont(FontOptions(size: 20.vp, weight: FontWeight.Bold))
                            .selectedDigitFont(FontOptions(size: 20.vp, weight: FontWeight.Bold)))
                    .displayCount(2, swipeByGroup: true)

                // 验证 displayCount传参SwiperAutoFill
                // 测试nextMargin不生效场景, loop循环下ignoreBlank参数不生效
                Swiper(controller: controller2) {
                    Text("Swiper  One2").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two2").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                    Text("Swiper  Three2").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                }.autoPlay(true).id("swiper_case4")

                // 验证 displayCount传参SwiperAutoFill
                Swiper(controller: controller2) {
                    Text("Swiper  One2").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two2").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                    Text("Swiper  Three2").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                    Text("Swiper  Four2").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                }.autoPlay(true).id("swiper_case5")

                Swiper(controller: controller) {
                    Text("Swiper  One").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                    Text("Swiper  Three").size(width: 100.percent, height: 200.px).backgroundColor(0xff0000)
                }
                    .vertical(true)
                    .width(100.percent)
                    .onChange({
                        index => message = index
                    })
                    .id("my_swipper")
                    .displayMode(SwiperDisplayMode.Stretch)
                    .effectMode(EdgeEffect.Fade)
                    .effectMode(EdgeEffect.Spring)

                Row() {
                    Button("Last Page").onClick({
                        evt => controller.showPrevious()
                    }).id("buttonPrevious")
                    Button("${message}").onClick({
                        evt => controller.showNext()
                    }).id("buttonNext")
                    Button("finishAnimation").onClick({
                        evt => controller.finishAnimation()
                    }).id("finishAnimation")
                }
                Row() {
                    Button("finishAnimation2")
                        .onClick(
                            {
                                evt => controller.finishAnimation(
                                    {
                                        => Hilog.info(1, "info", "[my_swipper][finishAnimation2] finish success")
                                    })
                            })
                        .id("finishAnimation2")
                    Button("changeIndex").onClick({
                        evt =>
                    }).id("changeIndex")
                    Button("changeIndex2").onClick({
                        evt =>
                    }).id("changeIndex2")
                }

                Swiper() {
                    Text("Swiper  One").size(width: 100.percent, height: 200.px).backgroundColor(0x668866)
                    Text("Swiper  Two").size(width: 100.percent, height: 200.px).backgroundColor(0x00ff00)
                }
                    .vertical(true)
                    .width(100.percent)
                    .onChange({
                        index => message = index
                    })
                    .id("my_swipper2")
                    .autoPlay(false)
                    .duration(10)
                    .index(1)
                    .interval(2)
                    .loop(true)
                    .indicator(true)
                    .itemSpace(5)
                    .itemSpace(5.0)
                    .itemSpace(5.vp)
                    .disableSwipe(true)
                    .cachedCount(1)
                    .displayCount(1)
                    .enabled(true)
                    .height(10.percent)
                    .onClick({event =>})
                    .effectMode(EdgeEffect.Spring)
                    .displayMode(SwiperDisplayMode.AutoLinear)
                    .curve(Curve.ExtremeDeceleration)
                    .curve(Curve.Linear)
                    .itemSpace(@r(app.string.swiper_itemSpace))

                Swiper() {
                    ForEach(
                        this.backgroundColors,
                        itemGeneratorFunc: {
                            backgroundColor: Color, index: Int64 => Text(index.toString())
                                .width(100.percent)
                                .height(100.percent)
                                .fontSize(50)
                                .textAlign(TextAlign.Center)
                                .backgroundColor(backgroundColor)
                                .opacity(this.opacityList[index])
                                .scale(x: Float32(this.scaleList[index]), y: Float32(this.scaleList[index]))
                                .translate(x: this.translateList[index])
                                .zIndex(Int32(this.zIndexList[index]))
                        }
                    )
                }.height(300).indicator(false).displayCount(this.DISPLAY_COUNT, swipeByGroup: true).width(100.percent)

                Swiper() {}.size(width: 1.vp, height: 1.vp)
            }
        }
    }
}
