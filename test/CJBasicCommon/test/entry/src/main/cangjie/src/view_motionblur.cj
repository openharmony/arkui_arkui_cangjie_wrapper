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
import std.collection.*
import ohos.i18n.*
import ohos.resource_manager.*

@Entry
@Component
class ViewMotionBlur {
    @State var widthSize: Int64 = 400
    @State var heightSize: Int64 = 320
    @State var flag: Bool = true
    @State var radius: Float64 = 0.0
    @State var x: Float64 = 0.0
    @State var y: Float64 = 0.0

    func build() {
        Column() {
            Column() {
              Image(@r(app.media.startIcon))
                .width(this.widthSize)
                .height(this.heightSize)
                .onClick({ event: ClickEvent =>
                    this.radius = 5.0
                    this.x = 0.5
                    this.y = 0.5
                    if (this.flag) {
                      this.widthSize = 100
                      this.heightSize = 80
                    } else {
                      this.widthSize = 400
                      this.heightSize = 320
                    }
                    this.flag = !this.flag
                })
                .animationStart(AnimateParam(
                    duration: 2000,
                    curve: Curve.Rhythm,
                    onFinish: { => this.radius = 0.0}
                ))
                .id("motionBlur")
            }
        }.width(100.percent).margin(top: 5)
    }
}