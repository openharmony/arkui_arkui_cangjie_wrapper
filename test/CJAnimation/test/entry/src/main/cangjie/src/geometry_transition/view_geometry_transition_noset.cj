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
package ohos_app_cangjie_entry.geometry_transition

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import std.time.MonoTime
import ohos.resource.*

@Entry
@Component
class ViewGeometryTransitionNoSet {
    @State var isShow: Bool = false
    var lastTime: MonoTime = MonoTime.now()

    func build() {
        Stack(alignContent: Alignment.Center) {
            if (this.isShow) {
                Column() {
                    Image(@r(app.media.startIcon))
                        .autoResize(false)
                        .clip(true)
                        .width(350)
                        .height(500)
                        .offset(x: 10, y: 10)
                        .geometryTransition("picture")
                        .margin(top: 10)
                        .id("image1")
                }
            } else {
                Column() {
                    Column() {
                        Image(@r(app.media.background))
                            .width(100.percent)
                            .height(100.percent)
                    }
                        .width(100.percent)
                        .height(100.percent)
                }
                    .width(80)
                    .height(80)
                    .offset(x: 10, y: 10)
                    .borderRadius(20)
                    .clip(true)
                    .geometryTransition("picture")
                    .id("column1")
            }
        }.onClick({
            event => 
                this.lastTime = MonoTime.now()
                getUIContext()
                    .animateTo(
                        AnimateParam(
                            duration: 5000,
                            onFinish: { => AppStorage.set<Int64>("geometryTransitionDuration", (MonoTime.now()-this.lastTime).toMilliseconds())}
                        ),
                        {
                            =>
                                this.isShow = !this.isShow
                        }
                    )
        })
        .id("stackId")
    }
}