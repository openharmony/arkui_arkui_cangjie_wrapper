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

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Button
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.{DividerStyle, SideBarContainer, ButtonStyle, ButtonIconOptions, SideBarPosition,
    SideBarContainerType}
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.i18n.*
import ohos.resource_manager.*
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.base.*

@Entry
@Component
class ViewSideBar {
    let dividerProp = DividerStyle(strokeWidth: 1.vp, color: Color.Blue, startMargin: 4.vp, endMargin: 4.vp)
    let ctrlButton: ButtonStyle = ButtonStyle(left: 17.0, top: 49.0, width: 33.0, height: 31.0,
        icons: ButtonIconOptions(shown: @r(app.media.startIcon), hidden: @r(app.media.startIcon), switching: @r(app.media.startIcon)))
    @State
    var showSideBarTxt: String = "showSideBar:"
    func build() {
        SideBarContainer(sideBarType: SideBarContainerType.Overlay) {
            Column() {
                Text("Index01")
                Text("Index02")
            }
            Column() {
                Text('SideBarContainer content text1').fontSize(25)
                Text(showSideBarTxt)
                    .id("showSideBarTxt")
                    .fontSize(25)
            }
        }
            .id("SideBar")
            .showSideBar(false)
            .divider(dividerProp)
            .autoHide(false)
            .sideBarWidth(150.vp)
            .minSideBarWidth(50.vp)
            .maxSideBarWidth(300.vp)
            .minContentWidth(1.vp)
            .sideBarPosition(SideBarPosition.Start)
            .sideBarPosition(SideBarPosition.End)
            .controlButton(ctrlButton)
            .showControlButton(false)
            .onChange({
                value: Bool => showSideBarTxt += "${value};"
            })
            .width(90.percent)
            .height(85.percent)
    }
}
