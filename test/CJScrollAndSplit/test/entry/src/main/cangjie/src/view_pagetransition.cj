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
import ohos.arkui.state_management.SubscriberManager
import ohos.arkui.state_management.ObservedProperty
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewPageTransition {
    @State
    var scale2: Float32 = 1.0
    @State
    var opacity2: Float64 = 1.0
    @State
    var text = ""

    func build() {
        Column() {
            Text(this.text).id("text")
            Image(@r(app.media.app_icon)).width(75.percent).height(75.percent).id("Image1").scale(x: scale2, y: 1.0).
                opacity(this.opacity2).onClick({
                e => getUIContext().getRouter().pushUrl(url: "ViewPageTransition2")
            })
        }
    }

    protected func pageTransition(): Unit {
        PageTransitionEnter(duration: 500, curve: Curve.Linear).opacity(1.0).scale(x: 1.0, y: 1.0,
            z: 1.0, centerX: @r(app.string.size_desc), centerY: @r(app.string.size_desc)).translate(x: 0).slide(
            SlideEffect.Left).slide(SlideEffect.Right).slide(SlideEffect.Top).onEnter({
            ty: RouteType, progress: Float64 =>
            match (ty) {
                case RouteType.Push | RouteType.Pop =>
                    scale2 = Float32(progress)
                    opacity2 = progress
                case _ => ()
            }
            this.text = "页面转场1"
        })
        PageTransitionExit(routeType: RouteType.Push, duration: 500, curve: Curve.Ease).scale().
            translate(x: 0.vp).slide(SlideEffect.Bottom).onExit({
            ty: RouteType, progress: Float64 => match (ty) {
                case RouteType.Push =>
                    this.scale2 = Float32(1.0 - progress)
                    this.opacity2 = 1.0 - progress
                case _ => ()
            }
        })
    }
}
