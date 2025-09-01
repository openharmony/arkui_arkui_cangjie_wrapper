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

import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import ohos.base.*

@Entry
@Component
class View_Progress {
    let ringStyle = RingStyleOptions(strokeWidth: 20.vp, shadow: false, status: ProgressStatus.Progressing,
        enableSmoothEffect: true, enableScanEffect: false)
    let ringStyle2 = RingStyleOptions(strokeWidth: 20.vp, shadow: false, status: ProgressStatus.Loading,
        enableSmoothEffect: true, enableScanEffect: false)

    let value_config: Float32 = 30.0
    let total_config: Float32 = 90.0

    let colorStop0 = ColorStop(Color.Green, 0.5.vp)
    let colorStop1 = ColorStop(Color.Blue, 1.0.vp)

    let appResource = AppResource("app", "media", 1)
    let font1 = Fonts(size: 16.vp, weight: FontWeight.Normal, family: "Deyihei", style: FontStyle.Normal)
    let font2 = Fonts(size: 16.vp, weight: FontWeight.Normal, family: appResource, style: FontStyle.Normal)

    func build() {
        Scroll() {
            Column(space: 20) {
                Text("ScaleRing Progress").fontSize(20).fontColor(0xCCCCCC).width(90.percent)
                Row(space: 40) {
                    Progress(value: 10.0, progressType: ProgressType.ScaleRing).width(100).id("progress5")
                    Progress(value: 20.0, total: 150.0, progressType: ProgressType.ScaleRing)
                        .color(Color.Gray)
                        .value(50.0)
                        .width(100)
                        .id("progress6")
                }

                Text("Ring Progress").fontSize(20).fontColor(0xCCCCCC).width(90.percent)
                Row(space: 40) {
                    Progress(value: 10.0, progressType: ProgressType.Ring)
                        .width(100)
                        .id("progress9")
                        .backgroundColor(Color.Gray)
                    Progress(value: 20.0, total: 150.0, progressType: ProgressType.Ring)
                        .color(Color.Gray)
                        .value(50.0)
                        .width(100)
                        .id("progress10")
                        .style(ringStyle)
                }
                Row(space: 40) {
                    Progress(value: 50.0, total: 150.0, progressType: ProgressType.Ring)
                        .color(Color.Gray)
                        .value(100.0)
                        .width(100)
                        .id("progress10_1")
                        .style(ringStyle2)
                }

                Row(space: 40) {
                    Progress(value: 30.0, progressType: ProgressType.Capsule)
                        .width(100)
                        .height(50)
                        .id("progress13")
                        .color(Color.Green)
                        .style(strokeWidth: 10.vp, scaleCount: 120, scaleWidth: 2.vp)
                }
            }
        }.height(100.percent).width(100.percent)
    }
}
