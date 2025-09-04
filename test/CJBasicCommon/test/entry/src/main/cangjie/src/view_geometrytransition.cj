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

@Entry
@Component
class View_GeometryTransition {
    @State var isShow: Bool = false
    @State var text="文本02"
    func build() {
        Stack(alignContent: Alignment.Center) {
            if (this.isShow) {
                Text(this.text).id("text2")
                Image(@r(app.media.app_icon))
                    .autoResize(false)
                    .clip(true)
                    .width(300)
                    .height(400)
                    .id("Test_Image_02")
                    .offset(x: 0, y: 100)
                    .geometryTransition("picture")
                    .transition(TransitionEffect.OPACITY)
            } else {
                Column() {
                    Column() {
                        Text(this.text).id("text1")
                        Image(@r(app.media.app_icon))
                            .width(100.percent).height(100.percent)
                    }.width(100.percent).height(100.percent)
                }
                .width(80)
                .height(80)
                .borderRadius(20)
                .clip(true)
                .geometryTransition("picture")
                .transition(TransitionEffect.OPACITY)
                .id("Test_Image_01")
            }
        }
        .onClick({
                event =>
                getUIContext().animateTo(AnimateParam(duration:1000,curve:Curve.EaseInOut), ({=>this.isShow = !this.isShow
                        this.text="文本01"}))

            })
    }
}