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
import ohos.arkui.state_macro_manage.Entry

@Entry
@Component
class ViewPageTransition2 {
    @State
    var scale1: Float32 = 1.0
    @State
    var opacity1: Float64 = 1.0
    @State
    var text = ""
    func build() {
        Column() {
            Text(this.text).id("text2")
            Image(@r(app.media.app_icon)).width(75.percent).height(75.percent).id("Image2").scale(x: scale1, y: 1.0).
                opacity(this.opacity1).onClick({
                e => getUIContext().getRouter().pushUrl(url: "ViewPageTransition")
            })
        }
    }

    protected func pageTransition(): Unit {
        PageTransitionEnter(duration: 1200, curve: Curve.Linear).onEnter({
            ty: RouteType, progress: Float64 =>
            match (ty) {
                case RouteType.Push | RouteType.Pop =>
                    scale1 = Float32(progress)
                    opacity1 = progress
                case _ => ()
            }
            this.text = "页面转场2"
        })
        PageTransitionExit(routeType: RouteType.Pop, duration: 1200, curve: Curve.Ease).onExit({
            ty: RouteType, progress: Float64 => match (ty) {
                case RouteType.Push =>
                    this.scale1 = Float32(1.0 - progress)
                    this.opacity1 = 1.0 - progress
                case _ => ()
            }
        })
    }
}
