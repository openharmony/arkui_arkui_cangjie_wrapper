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

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
import ohos.web.webview.*
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

@Entry
@Component
class View_Badge {
    @State
    var badge1Text: String = "numberBadge"
    func build() {
        Column() {
            Text(this.badge1Text).width(80.percent)
            Row(space:10) {
                Badge(
                    count: 1,
                    style: BadgeStyle(color: Color(0x00FFFF), fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                        fontWeight: FontWeight.Bolder, borderColor: Color.Black, borderWidth: 2.vp),
                    position: BadgePosition.Left,
                    maxCount: 89
                ) {
                    Button("message1").id("btn1").width(100).height(50).backgroundColor(0x317aff)
                }.id("my_badge1").width(100).height(50)
            }.margin(10)

            Text("stringBadge")
            Row(space:30) {
                Badge(
                    value: "new",
                    style: BadgeStyle(color: Color(0xFFFFFF), fontSize: 9, badgeSize: 20, badgeColor: Color.Blue,
                        fontWeight: FontWeight.Bolder, borderColor: Color.Black, borderWidth: 2.vp)
                ) {
                    Text("message2")
                        .width(80)
                        .height(50)
                        .fontSize(16)
                        .lineHeight(37)
                        .borderRadius(10)
                        .textAlign(TextAlign.Center)
                        .backgroundColor(0xF3F4ED)
                }.id("my_badge2").width(80).height(50)
            }
            Row(space:30) {
                Badge(
                    count: 32,
                    style: BadgeStyle(color: @r(app.color.start_window_background), fontSize: 10, badgeSize: 11,
                        badgeColor: Color.Red, fontWeight: FontWeight.Bolder,
                        borderColor: @r(app.color.start_window_background), borderWidth: 1.vp),
                    position: BadgePosition.RightTop,
                    maxCount: 99
                ) {
                    Text("message3").textAlign(TextAlign.Center)
                }.id("my_badge3").width(80).height(50)
            }

            Row(space:30) {
                Badge(
                    count: 42,
                    style: BadgeStyle(color: @r(app.color.start_window_background), fontSize: 12, badgeSize: 13,
                        badgeColor: @r(app.color.start_window_background), fontWeight: FontWeight.Lighter,
                        borderColor: @r(app.color.blue_23C452), borderWidth: 2.vp),
                    position: BadgePosition.RightTop,
                    maxCount: 99
                ) {
                    Text("message4").textAlign(TextAlign.Center)
                }.id("my_badge4").width(80).height(50)
            }

            Row(space:30) {
                Badge(
                    count: 52,
                    style: BadgeStyle(color: Color.Red, fontSize: 14, badgeSize: 15,
                        badgeColor: @r(app.color.start_window_background), fontWeight: FontWeight.Lighter,
                        borderColor: @r(app.color.blue_23C452)),
                    position: BadgePosition.Right,
                    maxCount: 99
                ) {
                    Text("message5").textAlign(TextAlign.Center)
                }.id("my_badge5").width(80).height(50)
            }
        }
    }
}