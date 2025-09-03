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

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class View_PatternLock {
    @State
    var passwords: Array<Int32> = []
    @State
    var message: String = 'please input password!'
    let patternLockController = PatternLockController()
    @State
    var selectIdx: Int64 = 10

    func build() {
        Column() {
            Text(this
                .passwords
                .toString())
                .id("Text1")
                .textAlign(TextAlign.Center)
                .margin(20)
                .fontSize(20)

            Text(this
                .selectIdx
                .toString())
                .id("Text2")
                .textAlign(TextAlign.Center)
                .margin(20)
                .fontSize(20)

            PatternLock(controller: this.patternLockController)
                .id("PatternLock1")
                .sideLength(200.vp)
                .circleRadius(9.vp)
                .pathStrokeWidth(18.vp)
                .activeColor(Color(0xB0C4DE))
                .selectedColor(Color(0x228B22))
                .pathColor(Color(0x90EE90))
                .backgroundColor(Color(0xF5F5F5))
                .autoReset(true)
                .onPatternComplete(
                    {
                        input: Array<Int32> =>
                        //输入的密码长度小于1时，提示重新输入
                        if (input.size < 1) {
                            this.message = 'The password length needs to be greater than 1, please enter again.'
                            return
                        }
                        // 判断密码长度是否大于0
                        if (this
                            .passwords
                            .size > 0) {
                            // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
                            if (this
                                .passwords
                                .toString() == input.toString()) {
                                this.passwords = input
                                this.message = 'Set password successfully: ' + this
                                    .passwords
                                    .toString()
                            } else {
                                this.message = 'Inconsistent passwords, please enter again.'
                            }
                        } else {
                            // 提示第二次输入密码
                            this.passwords = input
                            this.message = "Please enter again."
                        }
                    }
                )

            PatternLock()
                .id("PatternLock2")
                .autoReset(false)
                .regularColor(Color.Red)

            PatternLock()

            Button("Reset")
                .margin(30)
                .onClick(
                    {
                        evt =>
                        this
                            .patternLockController
                            .reset()
                        this.passwords = []
                        this.message = 'Please input password'
                    }
                )
                .id("reset")
        }
            .width(100.percent)
            .height(100.percent)
    }
}
