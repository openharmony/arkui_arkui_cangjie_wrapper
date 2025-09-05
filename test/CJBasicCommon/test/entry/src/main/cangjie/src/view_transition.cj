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
import ohos.router.*
import ohos.arkui.state_management.SubscriberManager
import ohos.arkui.state_management.ObservedProperty
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_macro_manage.Entry

@Entry
@Component
class ViewTransition {
    @State
    var flag = true
    @State
    var show = "show"
    @State
    var text = ""

    var animateParam: AnimateParam = AnimateParam()
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    Hilog.info(1, "Cangjie-App", "Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)
                .id("my_button")

            // 出现时做从x方向和y方向scale都为0变为默认的x方向和y方向scale都为1的动画，该动画时长为animateTo中指定的2000ms
            // 消失时无转场效果
            Button("abc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.scale(ScaleOptions()),
                            TransitionEffect.IDENTITY
                        )
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
                .id("my_button2")

            //rotate  + RotateOptions
            Button("abc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.rotate(RotateOptions(Float32(5.0))),
                            TransitionEffect.IDENTITY
                        )
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
                .id("my_button3")

            // translate + TranslateOptions
            Button("abc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.translate(TranslateOptions()),
                            TransitionEffect.IDENTITY
                        )
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
                .id("my_button4")

            // combine
            Button("abc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.rotate(RotateOptions(Float32(5.0))),
                            TransitionEffect.IDENTITY
                        )
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease))
                        .combine(TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))))
                .id("my_button5")

            // TransitionEdge  case TOP => 0 case BOTTOM => 1
            Button("abc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .move(TransitionEdge.Bottom)
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
                .id("my_button6")

            Button("abc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .move(TransitionEdge.Top)
                        .animation(animateParam)
                        .animation(
                            AnimateParam(
                                duration: 2000,
                                curve: Curve.Ease,
                                finishCallbackType: FinishCallbackType.Logically
                            )
                        )
                )
                .id("my_button6")

            Button("abcc")
                .width(800.px)
                .height(400.px)
                .transition(
                    TransitionEffect
                        .move(TransitionEdge.Bottom)
                        .animation(
                            AnimateParam()
                        )
                )
                .id("my_button8")
        }
    }
}
