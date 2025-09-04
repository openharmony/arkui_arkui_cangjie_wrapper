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
import ohos.resource_manager.*
import ohos.arkui.component.CopyOptions as MyCopyOptions
import std.collection.*

@Entry
@Component
class View_Text {
    @State
    var message: String = "Hello"
    let controller: TextController = TextController()
//    var editMessage: Array<String> = getResourceStringArray(@r(app.strarray.editMessage))
    @State var color: Color = Color.Black
    @Builder func LongPressTextCustomMenu() {
        Column() {
            Button('LongPress')
        }
    }

    @Builder func RightClickTextCustomMenu() {
        Column() {
            Button('RightClick')
        }
    }

    @Builder func SelectTextCustomMenu() {
        Column() {
            Button('Select')
        }
    }

    func build() {
        Scroll() {
            Column {
                Text(message).fontFamily(@r(app.string.fontFamily)).height(@r(app.string.height)).width(100.vp).id("textComponent1")
                Text(message).fontSize(20).fontColor(0XFFFF0000).fontStyle(FontStyle.Italic).fontWeight(FontWeight.W900).id(
                    "textComponent2")

                Text(message).textAlign(TextAlign.End).baselineOffset(10.vp).id("textComponent3").minFontSize(
                    @r(app.string.font_size)).lineHeight(@r(app.string.line_height))

                Text(message).decoration(decorationType: TextDecorationType.None, color: Color.Red).id("textComponent4")

                Text(
                    "This is the text with the height adaptive policy set.This is the text with the height adaptive policy set."
                ).minFontSize(10.fp).maxFontSize(30.fp).maxLines(1).id("textComponent5").baselineOffset(
                    @r(app.string.baselineOffset)).fontColor(@r(app.color.blue_23C452))

                Text(
                    "This is the text with the height adaptive policy set.This is the text with the height adaptive policy set"
                ).fontSize(24.vp).maxLines(1).textOverflow(TextOverflow.Ellipsis).id("textComponent6")

                Text("Hello").textCase(TextCase.UpperCase).id("textComponent7").maxFontSize(@r(app.string.font_size))

                Text("Hello").foregroundColor(@r(app.integer.blue)).id("textComponent8").fontSize(@r(app.string.font_size)).
                    textOverflow(TextOverflow.None).textCase(TextCase.LowerCase) // Color.Blue

                Text("Hello")
                    .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))

                Text('This is the text content with given settings. This is the text content with given settings')
                    .baselineOffset(10)
                    .decoration(decorationType: TextDecorationType.Underline, color: Color.Red, decorationStyle: TextDecorationStyle.Dotted)
                    .fontColor(Color.Red)
                    .fontFamily("HarmonyOS Sans")
                    .fontSize(10.fp)
                    .fontStyle(FontStyle.Italic)
                    .fontWeight(FontWeight.Bolder)
                    .lineHeight(40)
                    .lineSpacing(20)
                    .maxLines(1)
                    .textAlign(TextAlign.Center)
                    .textCase(TextCase.LowerCase)
                    .textOverflow(TextOverflow.None)
                    .id("TextGivenSetting")

                Text('This is the text content with given font settings.')
                    .decoration(decorationType: TextDecorationType.LineThrough, color: Color.Red, decorationStyle: TextDecorationStyle.Dashed)
                    .textCase(TextCase.UpperCase)
                    .id("TextGivenFont")

                Text(@r(app.string.module_desc))
                    .fontSize(@r(app.string.font_size))
                    .maxFontSize(@r(app.string.font_size))
                    .minFontSize(@r(app.string.font_size))
                    .fontFamily(@r(app.string.fontFamily))
                    .lineHeight(@r(app.string.line_height))
                    .baselineOffset(@r(app.string.baselineOffset))
                    .fontColor(@r(app.color.blue_23C452))
                    .id("TextResource")

                Text('电话号码：+86 12345678900' + '\n' + '链接：www.baidu.com' + '\n' + '邮箱：abc@cangjie.com' + '\n' +'地址：北京市东长安街6号' + '\n' + '时间：2024年10月30日')
                    .id("TextDetectConfig1")

                Text('电话号码：+86 12345678900' + '\n' + '链接：www.baidu.com' + '\n' + '邮箱：abc@cangjie.com' + '\n' +'地址：北京市东长安街6号' + '\n' + '时间：2024年10月30日')
                    .id("TextDetectConfig2")

                Text('电话号码：+86 12345678900' + '\n' + '链接：www.baidu.com' + '\n' + '邮箱：abc@cangjie.com' + '\n' +'地址：北京市东长安街6号' + '\n' + '时间：2024年10月30日')
                    .id("TextDetectConfig3")

                Text('邮箱：abc@cangjie.com')
                    .id("TextDetectConfig4")

                Text('This is the text content with default settings.').id("TextDefault1")

                Text('This is onCopy text content')
                    .id("onCopy")

                Text('This is onTextSelectionChange text content')
                    .id("onTextSelectionChange")

                Text('This is closeSelectionMenu text content', controller: controller)
                    .id("closeSelectionMenu")

//                Text(editMessage[0])
//                    .copyOption(MyCopyOptions.LocalDevice)
//                    .editMenuOptions(onCreateMenu, onMenuItemClick)
//                    .fontColor(this.color)
//                    .id('TextEditMenuOptions')

                Text('This is the text content with percent baselineOffset.')
                    .baselineOffset(10.percent)
                    .decoration(decorationType: TextDecorationType.Overline, color: Color.Red, decorationStyle: TextDecorationStyle.Double)
                    .id("TextBoundaryValue1")

                Text('This is the text content over one line line line line line line line line line line line line line line line line line line line line line line line line line with EllipsisMode.START.')
                    .maxLines(2) //
                    .textOverflow(TextOverflow.Ellipsis)
                    .decoration(decorationType: TextDecorationType.Underline, color: Color.Red, decorationStyle: TextDecorationStyle.Wavy)
                    .id("TextBoundaryValue2")

                Text('This is the text content over one line line line line line line line line line line line line line line line line line line line line line line line line line with EllipsisMode.CENTER.')
                    .maxLines(2)
                    .textOverflow(TextOverflow.Ellipsis)
                    .id("TextBoundaryValue3")

                Text('This is the text content with percent fontSize.')
                    .fontSize(10.percent)
                    .id("TextBoundaryValue4")

                Text('This is the text content with -3 letterSpacing.')
                    .decoration(decorationType: TextDecorationType.None, color: Color.Red).id("TextBoundaryValue5")

                Text('This is the text content with -10 lineHeight.')
                    .lineHeight(-10)
                    .fontSize(20)
                    .id("TextBoundaryValue6")

                Text('This is the text content with -10 lineSpacing.').lineSpacing(-10).id("TextBoundaryValue7")

                Text('This is the text content with selection [3,2].')
                    .id("TextBoundaryValue10")

                Text("textOverflow line line line line line line line line line line line line line line line line line.")
                    .textOverflow(TextOverflow.Ellipsis)
                    .maxLines(1)
                    .id("TextCombine1")

                Text('This is the text with the height adaptive policy set. This is the text with the height adaptive policy set.')
                    .minFontSize(10).maxFontSize(30).maxLines(2)
                    .id("TextCombine2")

                Text('This is the text with the height adaptive policy set. This is the text with the height adaptive policy set.')
                    .minFontSize(10).maxFontSize(30).maxLines(2)
                    .id("TextCombine3")

                Text('This is the text with the height adaptive policy set. This is the text with the height adaptive policy set.')
                    .minFontSize(10).maxFontSize(30).maxLines(1)
                    .id("TextCombine4")

                Text('This is the text with BALANCEDLineBreakStrategyAndWordBreakAll.')
                    .id("TextCombine5")

                Text("This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. ")
                    .minFontSize(10).maxFontSize(30).maxLines(1)
                    .fontSize(50)
                    .id("TextCombine6")

                Text("This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. ")
                    .minFontSize(-10).maxFontSize(30).maxLines(1)
                    .id("TextCombine7")

                Text('This is the text content with selection and CopyOptions.None.')
                    .id("TextCombine8")

                Text("wordBreak line line line line line line line line linelinelinelineline")
                    .textOverflow(TextOverflow.Ellipsis).maxLines(1)
                    .id("TextCombine10")
                Text("wordBreaklinelinelinelinelinelinelinelinelinelinelinelineline")
                    .textOverflow(TextOverflow.Ellipsis).maxLines(1)
                    .id("TextCombine11")
                Text("wordBreak line line line line line line line line linelinelinelineline")
                    .textOverflow(TextOverflow.Ellipsis).maxLines(1)
                    .id("TextCombine12")

                Text('This is the text content with selection and textSelectable.UNSELECTABLE.')
                    .id("TextCombine13")

                Text('This is the text content with selection.')
                    .id("TextCombine14")

                Text('This is the text content with TextAlign JUSTIFY and WordBreak BreakWord')
                    .id("TextCombine15")
            }
        }.height(100.percent).width(100.percent)
    }
}
