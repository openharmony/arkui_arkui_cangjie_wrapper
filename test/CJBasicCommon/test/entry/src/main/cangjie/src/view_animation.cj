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

@Entry
@Component
class ViewAnimation {
    @State
    var widthSize: Length = 250.vp
    @State
    var heightSize: Length = 100.vp
    @State
    var rotateAngle: Float32 = 90.0
    @State
    var text = ""
    @State
    var flag: Bool = true
    let animateOpt = AnimateParam(
        duration: 1200,
        curve: Curve.EaseOut,
        delay: 500,
        iterations: 3,
        playMode: PlayMode.Normal,
        onFinish: {
            => Hilog.info(1, "Cangjie-App", "onfinish")
        },
        expectedFrameRateRange: ExpectedFrameRateRange(
            min: 20,
            max: 120,
            expected: 90
        )
    )
    func build() {
        Column(space: 5) {
            Text(this.text).id("text")
            Button("change size").animationStart(animateOpt).onClick ({
                e =>
                if (flag) {
                    this.widthSize = 150.vp
                    this.heightSize = 60.vp
                } else {
                    this.widthSize = 250.vp
                    this.heightSize = 100.vp
                }
                this.flag = !this.flag
                this.text = "Animation"
            }).margin(30).width(this.widthSize).height(this.heightSize).animationEnd().id("my_button")
        }.width(100.percent).padding(top: 5)
    }
}
