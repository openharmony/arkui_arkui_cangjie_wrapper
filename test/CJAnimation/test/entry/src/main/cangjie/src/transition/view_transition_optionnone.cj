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
class ViewTransitionOptionNone {
    @State var flag = false
    @State var duration: Int64 = 0
    var lastTime: MonoTime = MonoTime.now()

    func build() {
        Column() {
            Button("Click")
                .onClick({ 
                    evt => 
                        this.flag = !this.flag
                })
                .width(800.px)
                .height(400.px)
                .margin(left: 200.px, top: 100.px)
                .id("clickButton")
            
            if (this.flag) {
                Button("optionNone")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(Option.None)
                    .id("button1")
                Button("callbackOptionNone")
                    .width(800.px)
                    .height(400.px)
                    .margin(left: 200.px)
                    .transition(Option.None, Option.None)
                    .id("button2")
            }
        }
    }
}