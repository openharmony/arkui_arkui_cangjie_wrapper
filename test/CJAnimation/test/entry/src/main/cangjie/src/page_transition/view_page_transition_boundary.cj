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
class ViewPageTransitionBoundary {

    func build() {
        Column() {
            Text("Boundary")
                .id("boundaryText")
            Image(@r(app.media.background))
                .width(50.percent)
                .height(50.percent)
            Row() {
                Button("pushUrl")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewPageTransitionOptionNone")})
                    .id("boundaryPushButton")
                Button("back")
                    .onClick({ e => getUIContext().getRouter().back()})
                    .id("boundaryBackButton")
            }
        }
        .width(100.percent)
        .height(100.percent)
    }

    protected func pageTransition(): Unit {
        PageTransitionEnter(duration: 0, curve: Curve.Linear, routeType: RouteType.Push, delay: 0)
            .onEnter({
                ty: RouteType, progress: Float64 =>
                    AppStorage.set<String>("boundaryEnter", "Push BoundaryEnter")
            })
            .slide(SlideEffect.Top)
            .opacity(0.0)
            .translate(x: 0, y: 0, z: 0)
            .scale(x: 0.0, y: 0.0, z: 0.0, centerX: 0.percent, centerY: 0.percent)
        PageTransitionEnter(duration: 1200, curve: Curve.Linear, routeType: RouteType.Pop, delay: 0)
            .onEnter({
                ty: RouteType, progress: Float64 =>
                    AppStorage.set<String>("boundaryEnter", "Pop BoundaryEnter")
            })
            .slide(SlideEffect.Left)
            .opacity(0.0)
            .translate(x: Int64.Max, y: Int64.Max, z: Int64.Max)
            .scale(x: Float32.Max, y: Float32.Max, z: Float32.Max, centerX: Int64.Max, centerY: Int64.Max)
        PageTransitionExit(duration: 1200, curve: Curve.Ease, routeType: RouteType.Push, delay: 0)
            .onExit({
                ty: RouteType, progress: Float64 =>
                    AppStorage.set<String>("boundaryExit", "Push BoundaryExit")
            })
            .slide(SlideEffect.Left)
            .opacity(0.0)
            .translate(x: Int64.Min, y: Int64.Min, z: Int64.Min)
            .scale(x: Float32.Min, y: Float32.Min, z: Float32.Min, centerX: Int64.Min, centerY: Int64.Min)
        PageTransitionExit(duration: 0, curve: Curve.Ease, routeType: RouteType.Pop, delay: 0)
            .onExit({
                ty: RouteType, progress: Float64 =>
                    AppStorage.set<String>("boundaryExit", "Pop BoundaryExit")
            })
            .opacity(1.0)
            .scale(x: 1.0, y: 1.0, z: 1.0, centerX: 50.percent, centerY: 50.percent)
            .slide(SlideEffect.Right)
    }
}