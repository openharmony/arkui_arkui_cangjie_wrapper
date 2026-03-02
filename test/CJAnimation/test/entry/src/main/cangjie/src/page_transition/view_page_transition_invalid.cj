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
package ohos_app_cangjie_entry.page_transition

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*
import ohos.hilog.Hilog

@Entry
@Component
class ViewPageTransitionInvalid {
    @State var scale1: Float32 = 1.0
    @State var opacity1: Float64 = 1.0

    func build() {
        Column() {
            Text("Invalid")
                .id("invalidText")
            Image(@r(app.media.background))
                .width(50.percent)
                .height(50.percent)
            Row() {
                Button("back")
                    .onClick({ e => getUIContext().getRouter().back()})
                    .id("invalidBackButton")
            }
        }
        .width(100.percent)
        .height(100.percent)
        .scale(x: scale1, y: 1.0)
        .opacity(opacity1)
    }

    protected func pageTransition(): Unit {
        PageTransitionEnter(duration: -1, curve: Curve.Linear, routeType: RouteType.Push, delay: -1)
            .onEnter({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Push) {
                    AppStorage.set<String>("invalidEnter", "Invalid PageTransitionEnter Push")
                }
            })
            .opacity(-0.1)
        PageTransitionExit(duration: -1, curve: Curve.Linear, routeType: RouteType.None, delay: -1)
            .onExit({ty: RouteType, progress: Float64 =>
                    AppStorage.set<String>("invalidExit", "Invalid PageTransitionEnter None")
            })
            .opacity(1.5)
    }
}