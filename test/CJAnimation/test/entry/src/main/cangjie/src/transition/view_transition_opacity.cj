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
class ViewTransitionOpacity {
    @State var flag = false
    @State var duration1: Int64 = 0
    var lastTime1: MonoTime = MonoTime.now()
    @State var transitionIn1: Bool = false
    @State var duration2: Int64 = 0
    var lastTime2: MonoTime = MonoTime.now()
    @State var transitionIn2: Bool = false

    func build() {
        Column() {
            Button("Click")
                .onClick({ 
                    evt => 
                        this.flag = !this.flag
                        lastTime1 = MonoTime.now()
                        lastTime2 = MonoTime.now()
                })
                .width(800.px)
                .height(400.px)
                .margin(left: 200.px, top: 100.px)
                .id("clickButton")
            
            if (this.flag) {
                Button("abcOPACITY")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 5000, curve: Curve.Ease))
                    )
                    .id("opacityButton1")
                Button("abcopacity")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(
                        TransitionEffect
                            .opacity(0.5)
                            .animation(AnimateParam(duration: 5000, curve: Curve.Ease))
                    )
                    .id("opacityButton2")
                Button("OPACITYCallback")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 5000, curve: Curve.Ease)),
                        {tr: Bool
                            =>
                            this.duration1 = (MonoTime.now() - this.lastTime1).toMilliseconds()
                            this.transitionIn1 = tr
                        }
                    )
                    .id("opacityCallbackButton1")
                Button("opacityCallback")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(
                        TransitionEffect
                            .opacity(0.5)
                            .animation(AnimateParam(duration: 5000, curve: Curve.Ease)),
                        {tr: Bool
                            =>
                            this.duration2 = (MonoTime.now() - this.lastTime2).toMilliseconds()
                            this.transitionIn2 = tr
                        }
                    )
                    .id("opacityCallbackButton2")
            }
            Text("${duration1}").id("durationText1")
            Text("${transitionIn1}").id("transitionInText1")
            Text("${duration2}").id("durationText2")
            Text("${transitionIn2}").id("transitionInText2")
        }
    }
}