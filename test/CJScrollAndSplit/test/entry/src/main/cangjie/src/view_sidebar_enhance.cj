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
internal import kit.LocalizationKit.AppResource
internal import ohos.router.Router
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.base.*

@Entry
@Component
class View_SideBar_Enhance {
    let dividerProp = DividerStyle(strokeWidth: 2.vp, startMargin: 3.vp, endMargin: 5.vp)
    let ctrlButton: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: @r(app.media.startIcon), hidden: "", switching: @r(app.media.startIcon)))
    func build() {
        SideBarContainer(sideBarType: SideBarContainerType.Embed) {
            Column() {
                Text("Index01")
                Text("Index02")
            }
            Column() {
                Text('SideBarContainer content').fontSize(25)
            }
        }
            .id("SideBarEnhance")
            .divider(this.dividerProp)
            .size(width: 80.percent, height: 90.percent)
            .controlButton(this.ctrlButton)
            .showSideBar(true)
            .autoHide(true)
            .minSideBarWidth(100.vp)
            .maxSideBarWidth(350.vp)
            .minContentWidth(400.vp)
    }
}
