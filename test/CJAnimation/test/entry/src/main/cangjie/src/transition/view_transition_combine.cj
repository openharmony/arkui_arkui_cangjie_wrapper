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
package ohos_app_cangjie_entry.transition

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import std.time.MonoTime
import ohos.resource.*

@Entry
@Component
class ViewTransitionCombine {
    @State var flag = false
    @State var duration: Int64 = 0
    var lastTime: MonoTime = MonoTime.now()
    @State var transitionIn: Bool = false

    func build() {
        Column() {
            Button("Click")
                .onClick({ 
                    evt => 
                        this.flag = !this.flag
                        lastTime = MonoTime.now()
                })
                .width(800.px)
                .height(400.px)
                .margin(left: 200.px, top: 100.px)
                .id("clickButton")
            
            if (this.flag) {
                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .combine(
                                TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))
                            )
                            .animation(AnimateParam(duration: 5000, curve: Curve.Ease))
                    )
                    .id("combineButton")
                Button("Callback")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .combine(
                                TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))
                            )
                            .animation(AnimateParam(duration: 5000, curve: Curve.Ease)),
                        {tr: Bool
                            =>
                            this.duration = (MonoTime.now() - this.lastTime).toMilliseconds()
                            this.transitionIn = tr
                        }
                    )
                    .id("combineCallbackButton")
            }
            Text("${duration}").id("durationText")
            Text("${transitionIn}").id("transitionInText")
        }
    }
}