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
 
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import std.time.MonoTime

@Entry
@Component
class ViewGeometryTransition {
    @State var isShow: Bool = false
    var lastTime: MonoTime = MonoTime.now()
    func build() {
            Column() {
                Button("pushValid")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewGeometryTransitionValid")})
                    .margin(top: 20)
                    .id("pushValidButton")
                Button("pushInvalid")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewGeometryTransitionInvalid")})
                    .margin(top: 20)
                    .id("pushInvalidButton")
                Button("pushIdNotEq")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewGeometryTransitionIdNotEq")})
                    .margin(top: 20)
                    .id("pushIdNotEqButton")
                Button("pushNoCall")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewGeometryTransitionNoCall")})
                    .margin(top: 20)
                    .id("pushNoCallButton")
                Button("pushNoSet")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewGeometryTransitionNoSet")})
                    .margin(top: 20)
                    .id("pushNoSetButton")
                Button("pushOptionNone")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewGeometryTransitionOptionNone")})
                    .margin(top: 20)
                    .id("pushOptionNoneButton")
            }.margin(top: 120)
    }
}
