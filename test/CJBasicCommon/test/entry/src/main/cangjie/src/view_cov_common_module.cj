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

/*
 * Note: This page is designed for branch coverage to ensure the application runs normally,
 * without concern for specific test results.
 */
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.multimedia.image.*
import std.collection.{ ArrayList }

let SysColorMode_ = Environment.envProp<ColorMode>("colorMode", ColorMode.Dark)
let SysLayoutDirectionRtl_ =
        Environment.envProp<LayoutDirection>("SysLayoutDirectionRtl", LayoutDirection.Rtl)
let SysLayoutDirectionAuto_ =
    Environment.envProp<LayoutDirection>("SysLayoutDirectionAuto", LayoutDirection.Auto)

@Entry
@Component
class ViewCovCommonModule {
    @StorageProp["colorMode"] let sysColorMode_: ColorMode = ColorMode.Dark
    @StorageProp["SysLayoutDirectionRtl"] let sysLayoutDirectionRtl_: LayoutDirection = LayoutDirection.Rtl
    @StorageProp["SysLayoutDirectionAuto"] let SysLayoutDirectionAuto_: LayoutDirection = LayoutDirection.Auto

    let transitionEdge: TransitionEdge = TransitionEdge.End
    func cov4ColorMode() {
        if (sysColorMode_ == ColorMode.Light) {
            1
        } else if(sysColorMode_ != ColorMode.Light) {
            2
        }
        let light = ColorMode.Light
        if (sysColorMode_ == ColorMode.Dark) {
            1
        } else if(sysColorMode_ != ColorMode.Dark) {
            2
        }
    }

    func cov4LayoutDirection() {
        if (sysLayoutDirectionRtl_ != LayoutDirection.Ltr && sysLayoutDirectionRtl_ != LayoutDirection.Auto) {
            1
        } else if(sysLayoutDirectionRtl_ == LayoutDirection.Rtl) {
            2
        }
        if (SysLayoutDirectionAuto_ != LayoutDirection.Ltr && sysLayoutDirectionRtl_ != LayoutDirection.Rtl) {
            1
        } else if(SysLayoutDirectionAuto_ == LayoutDirection.Auto) {
            2
        }
        let ltr = LayoutDirection.Ltr
        if (ltr != LayoutDirection.Auto && sysLayoutDirectionRtl_ != LayoutDirection.Rtl) {
            1
        } else if(ltr == LayoutDirection.Ltr) {
            2
        }
    }

    func cov4TransitionEdge() {
        match (transitionEdge) {
            case TransitionEdge.Top => 0
            case TransitionEdge.Bottom => 1
            case TransitionEdge.Start => 2
            case TransitionEdge.End => 3
            case _ => 4
        }
    }
    func build() {
        Column {
            // case1: For interactable view file.
            Text("Test DragItemInfo: cj branch coverage...").fontSize(30)
            .onAppear({ =>
                // DragItemInfo(Option<PixelMap>.None, Option<CustomBuilder>.None, Option<String>.None)
                // DragItemInfo(Option<PixelMap>.None, { => }, "")
            })
            // case2: For env file.
            Text("Test Env: cj branch coverage...").fontSize(30)
            .onAppear({ =>
                cov4ColorMode()
                cov4LayoutDirection()
            })

            // case 3: For component utils file.
            Button("Test ComponentUtils: getRectangleById").onAppear ({ =>
                let info = ComponentUtils.getRectangleById("ButtonClick")
            }).fontSize(40).height(80).id("getRectangleById")


            // case 4: For TranslateOptions file.
             Button("Test TransitionEffect")
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.translate(TranslateOptions()),
                            TransitionEffect.translate(TranslateOptions(x:1, y: 2, z: 3))
                        )
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
            // case 5
            Button("Test ScaleOptions")
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.scale(ScaleOptions()),
                            TransitionEffect.scale(ScaleOptions(x: 1.0, y: 2.0, z: 3.0, centerX: 100.percent))
                        ))

            Button("Test RotateOptions")
                .transition(
                    TransitionEffect
                        .asymmetric(
                            TransitionEffect.rotate(RotateOptions(Option<Float32>.None)),
                            TransitionEffect.rotate(RotateOptions(0.5, x: 1.0, y: 2.0, z: 3.0, centerX: 100.percent))
                        )
                        .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
            Text("Test Enum transitionEdge").onAppear({
                => cov4TransitionEdge()
            })

            ViewCovSubscriberManager()
        }
    }
}

class TestObserverCov <: Observer {
    public TestObserverCov() {}
    public func onStateUpdate(info: String, dependentElmtIds: ArrayList<Int64>): Unit {}
    public func onStateUpdate(info: String): Unit {}
    public func notifyRead(info: String): Unit {}
    public func id(): Int64 { 1 }
    public func aboutToBeDeleted(): Unit {}
}

@Component
class ViewCovSubscriberManager {
    func build() {
        Column(space: 10) {
            Button("ViewCovSubscriberManager").onAppear ({
                =>
                let p0 = TestObserverCov()
                SubscriberManager.getInstance().add(p0)
                SubscriberManager.getInstance().add(p0)
                SubscriberManager.getInstance().get(2)
            })
        }
    }
}