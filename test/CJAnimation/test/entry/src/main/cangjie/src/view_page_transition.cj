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
import ohos.resource.*

@Entry
@Component
class ViewPageTransition {
    @State var text: String = "HomePage"
    @StorageLink["validExit"] var validExit: String = ""

    func build() {
        Column() {
            Text(this.text)
            .id("homePageText")
            Text(this.validExit)
            .id("validExit")
            Image(@r(app.media.background))
                .width(50.percent)
                .height(50.percent)
            Column() {
                Button("pushValid")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionValid")})
                    .id("pushValidButton")
                Button("pushInvalid")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionInvalid")})
                    .id("pushInvalidButton")
                Button("pushBoundary")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionBoundary")})
                    .id("pushBoundaryButton")
                Button("pushNoCall")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionNoCall")})
                    .id("pushNoCallButton")
                Button("pushOptionNone")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionOptionNone")})
                    .id("pushOptionNoneButton")
                Button("pushNoSet")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionNoSet")})
                    .id("pushNoSetButton")
//                Button("back")
//                    .onClick({ e => getUIContext().getRouter().back()})
//                    .id("homePageBackButton")
            }
        }
        .width(100.percent)
        .height(100.percent)
    }

    protected func pageTransition(): Unit {
        Hilog.info(1, "ViewPageTransition", "HomePage pageTransition.")
        PageTransitionEnter(duration: 1200, curve: Curve.Linear, routeType: RouteType.Push, delay: 1000)
            .onEnter({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Push) {
                    Hilog.info(1, "PageTransitionTest", "HomePage PageTransitionEnter Push.")
                    this.text = "HomePage PageTransitionEnter Push"
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Left)
        PageTransitionEnter(duration: 1200, curve: Curve.Linear, routeType: RouteType.Pop, delay: 1000)
            .onEnter({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Pop) {
                    Hilog.info(1, "PageTransitionTest", "HomePage PageTransitionEnter Pop.")
                    this.text = "HomePage PageTransitionEnter Pop"
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Right)
        PageTransitionExit(duration: 1200, curve: Curve.Ease, routeType: RouteType.Push, delay: 1000)
            .onExit({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Push) {
                    Hilog.info(1, "PageTransitionTest", "HomePage PageTransitionExit Push.")
                    this.text = "HomePage PageTransitionExit Push"
                    AppStorage.set<String>("homePageExit", "HomePage PageTransitionExit Push")
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Top)
        PageTransitionExit(duration: 1200, curve: Curve.Ease, routeType: RouteType.Pop, delay: 1000)
            .onExit({ty: RouteType, progress: Float64 =>
                if (ty == RouteType.Pop) {
                    Hilog.info(1, "PageTransitionTest", "HomePage PageTransitionExit Pop.")
                    this.text = "HomePage PageTransitionExit Pop"
                    AppStorage.set<String>("homePageExit", "HomePage PageTransitionExit Pop")
                }
            })
            .translate(x: 50, y: 50, z: 50)
            .scale(x: 0.5, y: 0.5, z: 0.5, centerX: 50.percent, centerY: 50.percent)
            .opacity(0.0)
            .slide(SlideEffect.Bottom)
    }
}