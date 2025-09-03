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

/**
 * Created on 2024/7/8
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.MouseButton as MouseButtonUI

@Entry
@Component
class View_Circle {
    func build() {
        Column(space: 10) {
            // 绘制一个直径为150、线条为红色虚线的圆环（宽高设置不一致时以短边为直径）
            Circle().onClick(
                {
                    event =>
                    let inspector = getInspectorByKey("circleComponent1")
                    Hilog.info(1,"1","1",getInspectorTree().toString())
                    let jsonObject = JsonValue.fromStr(inspector).asObject()
                    let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
                    Hilog.info(1,"1","1","attrs is: " + attrs.toString())
                }
            ).width(150).height(200).fillOpacity(0.0).strokeWidth(20).stroke(Color.Red).strokeDashArray([1, 2]).id("circleComponent1")
            Circle(width: 1.0, height: 1.0)
            Circle(width: 1, height: 1).size(width: 1.vp, height: 1.vp)

            Button() {
                Text("SendTouchEvent to the 'button2'").fontSize(25).fontWeight(FontWeight.Bold)
            }.margin(top: 20).onClick(
                {
                    e =>
                    Hilog.info(1,"1","1","SendTouchEvent is clicked")
                    var touchPoint = TouchObject(
                        TouchType.Down,
                        1,
                        2.0,
                        2.0,
                        2.0,
                        2.0
                    )
                    sendTouchEvent(touchPoint) // 发送触摸事件
                    touchPoint.touchType = TouchType.Up
                    sendTouchEvent(touchPoint) // 发送触摸事件
                    touchPoint.touchType = TouchType.Move
                    sendTouchEvent(touchPoint) // 发送触摸事件
                    touchPoint.touchType = TouchType.Cancel
                    sendTouchEvent(touchPoint) // 发送触摸事件
                    touchPoint.touchType = TouchType.Unknown
                    sendTouchEvent(touchPoint) // 发送触摸事件
                    sendEventByKey("button1", 10, "") // 向id为"button1"的组件发送点击事件
                    var keyEvent = KeyEvent(
                        "tab",
                        KeyType.Down,
                        2049,
                        KeySource.Keyboard,
                        0,
                        0,
                        0
                    )
                    sendKeyEvent(keyEvent) // 发送按键事件
                    keyEvent.keySource = KeySource.Unknown
                    keyEvent.keyType = KeyType.Unknown
                    sendKeyEvent(keyEvent)
                    keyEvent.keyType = KeyType.Up
                    sendKeyEvent(keyEvent)
                    keyEvent.stopPropagation()

                    var mouseEvent = MouseEvent(
                        1,
                        2.0,
                        2.0,
                        2.0,
                        2.0,
                        MouseButtonUI.Left,
                        MouseAction.Press
                    )
                    sendMouseEvent(mouseEvent) // 发送鼠标事件
                    mouseEvent.button = MouseButtonUI.None
                    mouseEvent.action = MouseAction.None
                    sendMouseEvent(mouseEvent) // 发送鼠标事件
                    mouseEvent.button = MouseButtonUI.Right
                    mouseEvent.action = MouseAction.Release
                    sendMouseEvent(mouseEvent) // 发送鼠标事件
                    mouseEvent.button = MouseButtonUI.Middle
                    mouseEvent.action = MouseAction.Move
                    sendMouseEvent(mouseEvent) // 发送鼠标事件
                    mouseEvent.button = MouseButtonUI.Back
                    mouseEvent.action = MouseAction.Hover
                    sendMouseEvent(mouseEvent) // 发送鼠标事件
                    mouseEvent.button = MouseButtonUI.Forward
                    sendMouseEvent(mouseEvent) // 发送鼠标事件
                }
            ).id("sendTouchEvent")
        }.width(100.percent)
    }
}
