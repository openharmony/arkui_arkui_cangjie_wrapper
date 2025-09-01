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

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource

@Entry
@Component
class View_ImageEffect2 {
    public func build() {
        Scroll() {
            Column() {
                // 图像反转比例
                Text('invert-float64')
                Row() {
                    Image(@r(app.media.media1)).width(90)
                    Image(@r(app.media.media1)).width(90).invert(0.2)
                    Image(@r(app.media.media1)).width(90).invert(1.0).id("test_invert2")
                }

                Text("invert").margin(5)
                Stack() {
                    Column()
                    Stack() {
                        Image(@r(app.media.background))
                        Column() {
                            Column()
                                .width(100.percent)
                                .height(30.vp)
                                .invert(
                                    low: 0.0,
                                    high: 1.0,
                                    threshold: 0.5,
                                    thresholdRange: 0.2
                                )
                            Column()
                                .width(100.percent)
                                .height(30.vp)
                                .invert(
                                    low: 0.2,
                                    high: 0.5,
                                    threshold: 0.3,
                                    thresholdRange: 0.2
                                )
                                .id("test_invert")
                        }
                    }.width(100.vp).height(100.vp)
                }

                //                1. image： 设置src，也有效果
                //                2. 离屏效果可以参考示例 1/2，呈现效果不一致

                Text("systemBarEffect")
                Stack() {
                    Image("").width(100).height(100).backgroundColor(Color.Blue)
                    Column().width(80).height(10).borderRadius(5).margin(bottom: 20).id("test_systemBarEffect")
                }
                Text("****************")
                Stack() {
                    Image("").width(100).height(100).backgroundColor(Color.Blue)
                    Column().width(80).height(10).borderRadius(5).margin(bottom: 20)
                }

                Column() {
                    Column() {
                        
                    }
                        .width(200)
                        .height(30)
                        .margin(top: 5)
                        .backgroundColor(0xFFE4C4)
                        .shadow(radius: 120.0, color: Color.Green, offsetX: 0.0, offsetY: 0.0)

                    Column() {
                        
                    }
                        .width(200)
                        .height(30)
                        .margin(top: 5)
                        .backgroundColor(0xFFE4C4)
                        .shadow(radius: 120.0, color: Color.Red, offsetX: 0.0, offsetY: 0.0)
                        .backgroundColor(Color.White)
                }.borderWidth(1).width(300).height(100)

                Text("freeze")
                Column() {
                    Text("freeze: true").width(100).height(40).backgroundColor(Color.Blue)
                }.opacity(0.5).id("test_freeze")
                Column() {
                    Text("freeze: false").width(100).height(40).backgroundColor(Color.Blue)
                }.opacity(0.5)

                //                1. 方向：direction可以设置模糊方向
                //                2. value：视觉效果是模糊程度的变化，数值越大，越模糊；
                //                3. text：对于其他组件也有效果；
                Text("linearGradientBlur")
                Image(@r(app.media.startIcon)).width(120).height(120)
                Text("****************")
                Image(@r(app.media.startIcon)).width(120).height(120).id("test_linearGradientBlur")
                Text("****************")
                Image(@r(app.media.startIcon)).width(120).height(120)
                Text("****************")
                Image(@r(app.media.startIcon)).width(120).height(120)
                Text("****************")
                Text("text component of linearGradientBlur").width(120).height(120).borderWidth(1.vp)
                Text("****************")
                Image(@r(app.media.startIcon)).width(120).height(120)
                Text("****************")
                Image(@r(app.media.startIcon)).width(120).height(120)
                Text("****************")
                Image(@r(app.media.startIcon)).width(120).height(120)
            }.width(380).borderWidth(1).backgroundColor(Color.Gray)
        }
    }
}
