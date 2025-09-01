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
import ohos.arkui.shape.EllipseShape
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Blank {
    var shape: EllipseShape = EllipseShape()
    var shape2: EllipseShape = EllipseShape(width: 2.0, height: 2.0)
    var ellipse: Ellipse = Ellipse(width: 2.0, height: 2.0)
    var ellipse2: Ellipse = Ellipse(width: 2, height: 2)

    var control: Bool = FocusControl.requestFocus("test")
    func build() {
        Column() {
            Text("Front")
            Blank(min: 100.vp).color(0xFF99FFFF).id("test_blank")
            Blank(min: 100)
                .color(Color.Gray)
                .onClick(
                    {
                        event: ClickEvent =>
                        var x = event.x
                        var y = event.y
                    }
                )
                .onMouse(
                    {
                        event: MouseEvent =>
                        var x = event.x
                        var y = event.y
                    }
                )
                .onTouch({
                    event: TouchEvent => event.stopPropagation()
                })
                .id("blank")
            Blank(min: 100.0)
                .color(@r(app.color.start_window_background))
                .height(@r(app.string.font_size))
                .padding(1.0)
                .margin(1.0)
                .scale(x: 1.0)
                .rotate(x: 1.0)
                .translate(x: 1.0)
            Blank(min: 10)
                .size(width: 10.0, height: 10.0)
                .markAnchor(x: 1.0, y: 1.0)
                .offset(x: 1.0, y: 1.0)
                .scale(x: 1.0, y: 1.0, z: 1.0)
                .rotate(x: 1.0, y: 1.0, z: 1.0)
                .translate(x: 1.0, y: 1.0, z: 1.0)
            Blank(min: 100)
                .size(width: @r(app.string.font_size), height: @r(app.string.font_size))
                .padding(top: @r(app.string.font_size), right: @r(app.string.font_size),
                    bottom: @r(app.string.font_size), left: @r(app.string.font_size))
                .margin(top: @r(app.string.font_size), right: @r(app.string.font_size), bottom: @r(app.string.font_size),
                    left: @r(app.string.font_size))
                .position(x: @r(app.string.font_size), y: @r(app.string.font_size))
                .markAnchor(x: @r(app.string.font_size), y: @r(app.string.font_size))
                .offset(x: @r(app.string.font_size), y: @r(app.string.font_size))
                .scale(x: 1.0, y: 1.0, z: 1.0, centerX: @r(app.string.font_size), centerY: @r(app.string.font_size))
                .rotate(x: 1.0, y: 1.0, z: 1.0, angle: 1.0, centerX: @r(app.string.font_size),
                    centerY: @r(app.string.font_size))
                .translate(x: @r(app.string.font_size), y: @r(app.string.font_size), z: @r(app.string.font_size))
            Blank(min: 100).expandSafeArea(types: [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD])
            Text("End")
        }.width(100.percent)
    }
}
