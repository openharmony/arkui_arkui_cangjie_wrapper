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

@Entry
@Component
class ViewPageTransitionValid {
    @State var text: String = "Valid"
    @StorageLink["homePageExit"] var homePageExit: String = ""

    func build() {
        Column() {
            Text(this.text)
                .id("validText")
            Text(this.homePageExit)
                .id("homePageExit")
            Image(@r(app.media.background))
                .width(50.percent)
                .height(50.percent)
            Row() {
                Button("pushUrl")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionOptionNone")})
                    .id("validPushButton")
                Button("back")
                    .onClick({ e => getUIContext().getRouter().back()})
                    .id("validBackButton")
            }
        }
        .width(100.percent)
        .height(100.percent)
    }

    protected func pageTransition(): Unit {
        PageTransitionEnter(duration: 1200, curve: Curve.Linear, routeType: RouteType.Push, delay: 1000)
            .onEnter({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Push) {
                    this.text = "Valid PageTransitionEnter Push"
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Bottom)
            
            
        PageTransitionEnter(duration: 1200, curve: Curve.Linear, routeType: RouteType.Pop, delay: 1000)
            .onEnter({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Pop) {
                    this.text = "Valid PageTransitionEnter Pop"
                }
            })
            .translate(x: -50, y: -50, z: -50)
            .scale(x: -0.5, y: -0.5, z: -0.5, centerX: (-50).percent, centerY: (-50).percent)
            .opacity(0.0)
            .slide(SlideEffect.Top)
        
        PageTransitionExit(duration: 1200, curve: Curve.Ease, routeType: RouteType.Push, delay: 1000)
            .onExit({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Push) {
                    this.text = "Valid PageTransitionExit Push"
                    AppStorage.set<String>("validExit", "Valid PageTransitionExit Push")
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Right)

        PageTransitionExit(duration: 1200, curve: Curve.Ease, routeType: RouteType.Pop, delay: 1000)
            .onExit({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Pop) {
                    this.text = "Valid PageTransitionExit Pop"
                    AppStorage.set<String>("validExit", "Valid PageTransitionExit Pop")
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Left)
    }
}