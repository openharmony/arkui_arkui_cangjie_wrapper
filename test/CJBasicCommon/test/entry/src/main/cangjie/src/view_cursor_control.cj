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
//
//import ohos.arkui.state_macro_manage.*
//import ohos.arkui.state_management.*
//import ohos.arkui.component.*
//import ohos.base.LengthProp
//
//@Entry
//@Component
//class View_CursorControl {
//    @State var enable: Bool = false
//    func build() {
//        Column() {
//            Row {
//                Button("CursorControl")
//                .onClick { e => }
//                .fontSize(40)
//                .height(80)
//                .onClick { e =>
//                    this.enable = !this.enable
//                    if (this.enable){
//                        CursorControl.setCursor(PointerStyle.WEST)
//                    } else {
//                        CursorControl.restoreDefault()
//                    }
//                }.id("CursorControl-change")
//            }
//            Row {
//                Button("CursorControl2")
//                .fontSize(40)
//                .height(80)
//                .onClick { e =>
//                    CursorControl.restoreDefault()
//                }.id("CursorControl-change2")
//            }
//            Row {
//                Button("CursorControl3")
//                .fontSize(40)
//                .height(80)
//                .onClick { e =>
//                    let defalut0 = CursorControl.setCursor(PointerStyle.DEFAULT)
//                    let defalut1 = CursorControl.setCursor(PointerStyle.EAST)
//                    let defalut2 = CursorControl.setCursor(PointerStyle.WEST)
//                    let defalut3 = CursorControl.setCursor(PointerStyle.SOUTH)
//                    let defalut4 = CursorControl.setCursor(PointerStyle.NORTH)
//                    let defalut5 = CursorControl.setCursor(PointerStyle.WEST_EAST)
//                    let defalut6 = CursorControl.setCursor(PointerStyle.NORTH_SOUTH)
//                    let defalut7 = CursorControl.setCursor(PointerStyle.NORTH_EAST)
//                    let defalut8 = CursorControl.setCursor(PointerStyle.NORTH_WEST)
//                    let defalut9 = CursorControl.setCursor(PointerStyle.SOUTH_EAST)
//                    let defalut10 = CursorControl.setCursor(PointerStyle.SOUTH_WEST)
//                    let defalut11 = CursorControl.setCursor(PointerStyle.NORTH_EAST_SOUTH_WEST)
//                    let defalut12 = CursorControl.setCursor(PointerStyle.NORTH_WEST_SOUTH_EAST)
//                    let defalut13 = CursorControl.setCursor(PointerStyle.CROSS)
//                    let defalut14 = CursorControl.setCursor(PointerStyle.CURSOR_COPY)
//                    let defalut15 = CursorControl.setCursor(PointerStyle.CURSOR_FORBID)
//                    let defalut16 = CursorControl.setCursor(PointerStyle.COLOR_SUCKER)
//                    let defalut17 = CursorControl.setCursor(PointerStyle.HAND_GRABBING)
//                    let defalut18 = CursorControl.setCursor(PointerStyle.HAND_OPEN)
//                    let defalut19 = CursorControl.setCursor(PointerStyle.HAND_POINTING)
//
//                    let defalut20 = CursorControl.setCursor(PointerStyle.HELP)
//                    let defalut21 = CursorControl.setCursor(PointerStyle.MOVE)
//                    let defalut22 = CursorControl.setCursor(PointerStyle.RESIZE_LEFT_RIGHT)
//                    let defalut23 = CursorControl.setCursor(PointerStyle.RESIZE_UP_DOWN)
//                    let defalut24 = CursorControl.setCursor(PointerStyle.SCREENSHOT_CHOOSE)
//                    let defalut25 = CursorControl.setCursor(PointerStyle.SCREENSHOT_CURSOR)
//                    let defalut26 = CursorControl.setCursor(PointerStyle.TEXT_CURSOR)
//                    let defalut27 = CursorControl.setCursor(PointerStyle.ZOOM_IN)
//                    let defalut28 = CursorControl.setCursor(PointerStyle.ZOOM_OUT)
//                    let defalut29 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_EAST)
//                    let defalut30 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_WEST)
//                    let defalut31 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_SOUTH)
//                    let defalut32 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_NORTH)
//                    let defalut33 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_NORTH_SOUTH)
//                    let defalut34 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_NORTH_EAST)
//                    let defalut35 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_NORTH_WEST)
//                    let defalut36 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_SOUTH_EAST)
//                    let defalut37 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_SOUTH_WEST)
//                    let defalut38 = CursorControl.setCursor(PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST)
//                    let defalut39 = CursorControl.setCursor(PointerStyle.HORIZONTAL_TEXT_CURSOR)
//
//                    let defalut40 = CursorControl.setCursor(PointerStyle.CURSOR_CROSS)
//                    let defalut41 = CursorControl.setCursor(PointerStyle.CURSOR_CIRCLE)
//                    let defalut42 = CursorControl.setCursor(PointerStyle.LOADING)
//                    let defalut43 = CursorControl.setCursor(PointerStyle.RUNNING)
//                }.id("CursorControl-change3")
//            }
//        }.height(100.percent).margin(left: 20,right: 20)
//    }
//}
