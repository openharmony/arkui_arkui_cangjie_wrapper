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
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Select {
    @State
    var text: String = "TTTTT"
    @State
    var index: Int32 = 2
    @State
    var space: Int64 = 8

    @State
    var values1: Array<SelectOptions> = [
        SelectOptions(value: "aaa", icon: @r(app.media.app_icon)),
        SelectOptions(value: "bbb", icon: @r(app.media.app_icon)),
        SelectOptions(value: "ccc", icon: @r(app.media.app_icon)),
        SelectOptions(value: "ddd", icon: @r(app.media.app_icon)),
        SelectOptions(value: @r(app.string.selection_option), icon: @r(app.media.app_icon)),
        SelectOptions(value: @r(app.string.selection_option), icon: "text content")
    ]

    @State
    var arrow: ArrowPosition = ArrowPosition.End

    func build() {
        Column {
            Select(this.values1)
                .selected(1)
                .value(this.text)
                .font(size: 16.vp, weight: FontWeight.W500)
                .fontColor(0x182431)
                .selectedOptionFont()
                .space(this.space)
                .arrowPosition(this.arrow)
                .menuAlign(alignType: MenuAlignType.Start, offset: Offset(0, 0))
                .optionWidth(200)
                .optionHeight(300)
                .onSelect(
                    {
                        index: Int32, text: String =>
                        Hilog.info(1,"Cangjie-App", " ==================  Select ====================: ${index}")
                        Hilog.info(1,"Cangjie-App", " ==================  text ====================: ${text}")
                        this.index = index
                        this.text = text
                    }
                )
                .id("my_select")
                .optionWidth(OptionWidthMode.FitTrigger)
            Select(this.values1)
                .selected(1)
                .value(this.text)
                .font(size: 16.vp, weight: FontWeight.W500)
                .fontColor(@r(app.color.blue_color))
                .selectedOptionFont(size: 16.vp, weight: FontWeight.W400)
                .arrowPosition(ArrowPosition.Start)
                .menuAlign(alignType: MenuAlignType.Center, offset: Offset(0.5, 0.5))
                .optionWidth(200)
                .optionHeight(@r(app.string.option_height))
                .onSelect(
                    {
                        index: Int32, text: String =>
                        Hilog.info(1,"Cangjie-App", " ==================  Select ====================: ${index}")
                        Hilog.info(1,"Cangjie-App", " ==================  text ====================: ${text}")
                        this.index = index
                        this.text = text
                    }
                )
                .id("my_select")
                .font(size: 16.vp)
                .optionFont(size: 16.vp)
                .space(8.5)
                .optionWidth(OptionWidthMode.FitContent)
            Select(this.values1)
                .selected(1)
                .value(this.text)
                .font(size: 16.vp, weight: FontWeight.W500)
                .fontColor(0x182431)
                .selectedOptionFont(size: 16.vp, weight: FontWeight.W400)
                .arrowPosition(this.arrow)
                .menuAlign(
                    alignType: MenuAlignType.End,
                    offset: Offset(@r(app.integer.test_cjResource), @r(app.integer.test_cjResource))
                )
                .optionWidth(@r(app.string.option_height))
                .optionHeight(200.5)
                .onSelect(
                    {
                        index: Int32, text: String =>
                        Hilog.info(1,"Cangjie-App", " ==================  Select ====================: ${index}")
                        Hilog.info(1,"Cangjie-App", " ==================  text ====================: ${text}")
                        this.index = index
                        this.text = text
                    }
                )
                .id("my_select")
                .font()
                .optionFont()
                .space(@r(app.integer.test_cjResource))
                .optionWidth(0.5)
                .menuBackgroundBlurStyle(BlurStyle.Regular)
                .menuBackgroundBlurStyle(BlurStyle.Thick)
                .menuBackgroundBlurStyle(BlurStyle.BackgroundThin)
                .menuBackgroundBlurStyle(BlurStyle.BackgroundRegular)
                .menuBackgroundBlurStyle(BlurStyle.BackgroundThick)
                .menuBackgroundBlurStyle(BlurStyle.BackgroundUltraThick)
                .menuBackgroundBlurStyle(BlurStyle.None)
                .menuBackgroundBlurStyle(BlurStyle.ComponentUltraThin)
                .menuBackgroundBlurStyle(BlurStyle.ComponentThin)
                .menuBackgroundBlurStyle(BlurStyle.ComponentRegular)
                .menuBackgroundBlurStyle(BlurStyle.ComponentThick)
                .menuBackgroundBlurStyle(BlurStyle.ComponentUltraThick)
                .menuBackgroundBlurStyle(BlurStyle.Thin)

            Select(this.values1)
                .selected(1)
                .value(this.text)
                .id("my_select_03")
                .font(size: 16.vp, weight: FontWeight.W500)
                .fontColor(0x182431)
                .optionBgColor(@r(app.color.blue_color))
                .optionFontColor(@r(app.color.red_color))
                .menuBackgroundColor(0xFFFFFF) // 白
                .backgroundColor(0xFFFFFF) //
                .selectedOptionFont(size: 16.vp, weight: FontWeight.W500)
                .selectedOptionFontColor(0x000000)
                .selectedOptionBgColor(0xEEEEEE)
                .space(this.space)
                .arrowPosition(this.arrow)
                .menuAlign(alignType: MenuAlignType.Start, offset: Offset(0, 0))
                .optionWidth(200)
                .optionHeight(300)
                .onSelect(
                    {
                        index: Int32, text: String =>
                        Hilog.info(1,"Cangjie-App", " ==================  Select ====================: ${index}")
                        Hilog.info(1,"Cangjie-App", " ==================  text ====================: ${text}")
                        this.index = index
                        this.text = text
                    }
                )
                .optionWidth(OptionWidthMode.FitTrigger)

            Text("-------controlSize,divier,size,padding,direction属性设置测试-------").fontSize(20)

            Select(this.values1)
                .selected(1)
                .value(this.text)
                .id("my_select_04")
                .size(width: 200, height: 100)
                .padding(50.vp)
                //                .divider(
                //                    options: DividerOptions(strokeWidth: 5, startMargin: 15, endMargin: 1,
                //                    color: Color(0XFFD700)))
                .direction(Direction.Ltr)
            //                .controlSize(ControlSize.NORMAL)

            Select(this.values1)
                .selected(1)
                .value(this.text)
                .id("my_select_05")
                //                .controlSize(ControlSize.SMALL)
                .padding(top: 10.vp, right: 30.vp, bottom: 5.vp, left: 10.vp)
                //                .divider(options: Option.None)
                .direction(Direction.Rtl)

            Select(this.values1).selected(1).value(@r(app.string.button_label)).id("my_select_06").padding(50.vp)
        }.width(100.percent)
    }
}