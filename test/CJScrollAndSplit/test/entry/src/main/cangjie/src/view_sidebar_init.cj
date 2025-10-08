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
import ohos.arkui.component.*
import ohos.hilog.Hilog
import ohos.arkui.state_management.*
import ohos.window.{Configuration,Rect as rect,AvoidArea,WindowType}
import ohos.app.ability.ui_ability.*

func getContext1(): UIAbilityContext {
        match(globalAbilityContext) {
            case Some(context) => context
            case _ => throw Exception("can not get globalAbilityContext.")
    }
}

@Entry
@Component
class ViewSideBarInit {
    var text_source: AppResource = @r(app.string.module_desc)
    var text_media: AppResource = @r(app.media.startIcon)
    var len_px: AppResource = @r(app.string.len_px)
    var len_fp: AppResource = @r(app.string.len_fp)
    var len_percent: AppResource = @r(app.string.len_percent)
    var len_llp: AppResource = @r(app.string.len_llp)
    var len_lpx: AppResource = @r(app.string.len_lpx)
    var text_pluralresource: AppResource = @r(app.plural.eat_apple, 10, 10)
    let dividerProp = DividerStyle(strokeWidth: 2.vp, startMargin: 3.vp, endMargin: 5.vp)
    let dividerProp2 = DividerStyle(strokeWidth: 2.vp)
    let ctrlButton1: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: "", hidden: "", switching: ""))
    let ctrlButton2: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: "", hidden: "", switching: @r(app.media.startIcon)))
    let ctrlButton3: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: @r(app.media.startIcon), hidden: "", switching: ""))
    let ctrlButton4: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: "", hidden: @r(app.media.startIcon), switching: ""))
    let ctrlButton5: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: "", hidden: @r(app.media.startIcon), switching: @r(app.media.startIcon)))
    let ctrlButton6: ButtonStyle = ButtonStyle(left: 2.0, top: 10.0, width: 30.0, height: 20.0,
        icons: ButtonIconOptions(shown: @r(app.media.startIcon), hidden: @r(app.media.startIcon), switching: ""))
    let ctrlButton7: ButtonStyle = ButtonStyle()
    var init_Rect: rect = rect(left: 1, top: 1, width: 1, height: 1)
    var avoidArea: AvoidArea=AvoidArea(visible: true, leftRect: init_Rect, topRect: init_Rect, rightRect: init_Rect, bottomRect: init_Rect)

    func build() {
        Column(){
        SideBarContainer(sideBarType: SideBarContainerType.Embed) {
            Column() {
                Text("Init01")
            }
        }
        .id("SideBarInit_1")
        .divider(this.dividerProp)
        .size(width: 20.percent, height: 15.percent)
        .controlButton(this.ctrlButton1)
        .showSideBar(true)
        .autoHide(true)
        .minSideBarWidth(50.vp)
        .maxSideBarWidth(100.vp)
        .minContentWidth(150.vp)

        SideBarContainer(sideBarType: SideBarContainerType.Embed) {
            Column() {
                Text("Index02")
            }
        }
        .id("SideBarInit_2")
        .divider(this.dividerProp)
        .size(width: 20.percent, height: 15.percent)
        .controlButton(this.ctrlButton2)
        .showSideBar(true)
        .autoHide(true)
        .minSideBarWidth(50.vp)
        .maxSideBarWidth(100.vp)
        .minContentWidth(150.vp)

        SideBarContainer(sideBarType: SideBarContainerType.Embed) {
            Column() {
                Text("Index03")
            }
        }
        .id("SideBarInit_3")
        .divider(this.dividerProp)
        .size(width: 20.percent, height: 15.percent)
        .controlButton(this.ctrlButton3)
        .showSideBar(true)
        .autoHide(true)
        .minSideBarWidth(50.vp)
        .maxSideBarWidth(100.vp)
        .minContentWidth(150.vp)

        SideBarContainer(sideBarType: SideBarContainerType.Embed) {
            Column() {
                Text("Index04")
            }
        }
        .id("SideBarInit_4")
        .divider(this.dividerProp)
        .size(width: 20.percent, height: 15.percent)
        .controlButton(this.ctrlButton4)
        .showSideBar(true)
        .autoHide(true)
        .minSideBarWidth(50.vp)
        .maxSideBarWidth(100.vp)
        .minContentWidth(150.vp)

        SideBarContainer(sideBarType: SideBarContainerType.Overlay) {
            Column() {
                Text("Index05")
            }
        }
        .id("SideBarInit_5")
        .divider(this.dividerProp)
        .size(width: 20.percent, height: 15.percent)
        .controlButton(this.ctrlButton5)
        .showSideBar(true)
        .autoHide(true)
        .minSideBarWidth(50.vp)
        .maxSideBarWidth(100.vp)
        .minContentWidth(150.vp)

        SideBarContainer(sideBarType: SideBarContainerType.Auto) {
            Column() {
                Text("Index06")
            }
        }
        .id("SideBarInit_6")
        .divider(this.dividerProp)
        .size(width: 20.percent, height: 15.percent)
        .controlButton(this.ctrlButton6)
        .showSideBar(true)
        .autoHide(true)
        .minSideBarWidth(50.vp)
        .maxSideBarWidth(100.vp)
        .minContentWidth(150.vp)

         Button("test").onClick({e =>
//                var text1 = getResourceString(text_source)
//                var text2 = getResourcePluralString(text_pluralresource)
//                var text3 = getResourceLength(text_source)
//                var text4 = getResourceColor(text_source)
//                var text5 = getResourceMedia(text_media)
//                var text6 = getResourceLength(len_px)
//                var text7 = getResourceLength(len_fp)
//                var text8 = getResourceLength(len_percent)
//                var text9 = getResourceLength(len_llp)
//                var text10 = getResourceLength(len_lpx)
//                Hilog.info(1,"text_source", "getResourceString: " + text1)
//                Hilog.info(1,"text_pluralresource", "getResourcePluralString: " + text2)
//                Hilog.info(1,"text_source", "getResourceLength: " + text3.value.toString())
//                Hilog.info(1,"text_source", "getResourceColor: " + text4.toUInt32().toString())
//                Hilog.info(1,"text_media", "getResourceMedia: " + text5)
                ViewStackProcessor.ImplicitPopBeforeContinue()
                PersistentStorage.deleteProp("ikun")
                PersistentStorage.keys()
         }).id("AppResource")

    }

}}