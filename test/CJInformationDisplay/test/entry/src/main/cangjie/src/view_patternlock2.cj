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

/**
 * Created on 2024/6/27
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.font.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewPatternLock2 {
    var passwords: Array<Int32> = []
    @State
    var lastDot: Int64 = 0

    @State
    var message: String = "please input password!"
    var patternLockController: PatternLockController = PatternLockController()

    func build() {
        Column() {
            Text(this.message).textAlign(TextAlign.Center).margin(20).fontSize(20).id("text0")
            Text("${this.message}").textAlign(TextAlign.Center).margin(20).fontSize(20).id("text1")
            PatternLock(controller: this.patternLockController)
                .sideLength(200.vp)
                .pathStrokeWidth(18.vp)
                .activeColor(Color(0xB0C4DE))
                .selectedColor(Color(0x228B22))
                .regularColor(Color(0x228A52))
                .pathColor(Color(0x90EE90))
                .backgroundColor(0xF5F5F5)
                .autoReset(true)
                .circleRadius(16.vp)
                .onPatternComplete(
                    {
                        input: Array<Int32> =>
                        // 输入的密码长度小于5时，提示重新输入
                        if (input.size < 5) {
                            this.message = "The password length needs to be greater than 5, please enter again."
                            return
                        }
                        // 判断密码长度是否大于0
                        if (this.passwords.size > 0) {
                            // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
                            if (this.passwords.toString() == input.toString()) {
                                this.passwords = input
                                this.message = "Set password successfully: " + this.passwords.toString()
                            } else {
                                this.message = "Inconsistent passwords, please enter again."
                            }
                        } else {
                            // 提示第二次输入密码
                            this.passwords = input
                            this.message = "Please enter again."
                        }
                    }
                )
                .id("patternLock")
            Button("Reset PatternLock").margin(30).onClick(
                {
                    evt =>
                    // 重置密码锁
                    this.patternLockController.reset()
                    this.passwords = []
                    this.message = 'Please input password'
                }
            ).id("reset_pattern")
            PatternLock()
        }.width(100.percent).height(100.percent)
    }
}
