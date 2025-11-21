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

public import ohos.base.*
public import ohos.arkui.component.*
public import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Observed
class Name {
    @Publish var title: String = "English"
}

@Entry
@Component
class ViewButton {
    @Watch[onChanged]
    @State
    var name: Name = Name(title: "myBook")
    func onChanged() {}
    @State
    var isOn: Bool = false
    @State
    var effect = "??????"
    func build() {
        Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start,
            justifyContent: FlexAlign.SpaceBetween) {
            Flex(alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween) {
            Button()
            Button("Ok").shape(ButtonType.Normal).stateEffect(true).borderRadius(8).fontSize(12).fontColor(0xffffff).
                backgroundColor(0x317aff).width(90).id("Testbutton").padding(top: 0, right: 0, bottom: 0, left: 1).
                fontWeight(FontWeight.W300)

            Button(){}.shape(ButtonType.Capsule).shape(ButtonType.Circle)
            Button(@r(app.string.DEFAULT_FONT))
                }

            Flex(direction: FlexDirection.Row, alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap) {
                Button(
                    ButtonOptions(
                        shape: ButtonType.Circle,
                        stateEffect: false,
                        buttonStyle: ButtonStyleMode.Normal,
                        controlSize: ControlSize.Small,
                        role: ButtonRole.Normal
                    )).borderRadius(8).backgroundColor(0x317aff).width(90).id("button1")
                Button(
                    "Ok",
                    ButtonOptions(
                        shape: ButtonType.RoundedRectangle,
                        stateEffect: true,
                        buttonStyle: ButtonStyleMode.Textual,
                        controlSize: ControlSize.Small,
                        role: ButtonRole.Error
                    )).borderRadius(8).backgroundColor(0x317aff).width(90).id("button2")
                Button(
                    @r(app.string.button_label),
                    ButtonOptions(
                        shape: ButtonType.Circle,
                        stateEffect: false,
                        buttonStyle: ButtonStyleMode.Normal,
                        controlSize: ControlSize.Small,
                        role: ButtonRole.Error
                    )).borderRadius(8).backgroundColor(0x317aff).width(90).id("button3")
                Button(
                    ButtonOptions(
                        shape: ButtonType.Capsule,
                        stateEffect: true,
                        buttonStyle: ButtonStyleMode.Normal,
                        controlSize: ControlSize.Normal,
                        role: ButtonRole.Error
                    )){
                    Row() {
                        LoadingProgress().width(20).height(20).color(Color.White)
                        Text("loading").fontSize(12).fontColor(0xffffff).margin(left: 5, right: 12)
                    }.alignItems(VerticalAlign.Center).width(90).height(40).id("Row")
                }.borderRadius(8).backgroundColor(0x317aff).width(90).id("button4")
            }

            Text('font').fontSize(9).fontColor(0xCCCCCC)
            Flex(direction: FlexDirection.Row, alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap) {
                Button("Ok").fontSize(15).fontWeight(FontWeight.Bolder).fontStyle(FontStyle.Italic).fontColor(Color.Red)
                    .backgroundColor(0x317aff).id("button5")
                Button("Ok").fontSize(20.0).fontFamily("sans-serif").backgroundColor(0x317aff).fontColor(0x7F34AD)
                    .id("button6").margin(left: 20)
                Button("Ok").fontSize(25.vp).fontFamily(@r(app.string.fontFamily)).fontColor(@r(app.color.green))
                    .backgroundColor(0x317aff).id("button7").margin(left: 20)
                Button("Ok").fontSize(@r(app.string.maxfontSize)).shape(ButtonType.Circle).stateEffect(false)
//                    .role(ButtonRole.ERROR)
//                    .controlSize(ControlSize.SMALL)
                    .buttonStyle(ButtonStyleMode.Emphasized)
                    .id("button8").margin(left: 20)
            }

            Text('onClick').fontSize(9).fontColor(0xCCCCCC)
            Flex(direction: FlexDirection.Row, alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap) {
                Button("Ok").shape(ButtonType.Circle).backgroundColor(0x317aff).id("button9")
                .onClick ({ evt =>
                    this.effect = "!!!!!!"
                })
                Text(this.effect).fontSize(20).fontColor(Color.Black).backgroundColor(Color.Gray).id('Text').margin(left: 20)
            }

            Text('labelStyle').fontSize(9).fontColor(0xCCCCCC)
            Flex(direction: FlexDirection.Row, alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap)  {
                Button("overflowTextOverlengthTextOverflow.Clip").backgroundColor(0x317aff).fontSize(40).id("button10")
//                .labelStyle(overflow: TextOverflow.Clip,
//                    maxLines: 1,
//                    minFontSize: 20.0.fp,
//                    maxFontSize: 20.0.fp,
//                    heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
//                    font: Fonts(
//                        size: 20.0.fp,
//                        weight: FontWeight.Bolder,
//                        family: 'cursive',
//                        style: FontStyle.Italic
//                    )
//                )
                Button("overflowTextOverlengthTextOverflow.Clip").backgroundColor(0x317aff).fontSize(40).id("button11")
//                .labelStyle(overflow: TextOverflow.Clip,
//                    maxLines: 1,
//                    minFontSize: @r(app.string.minfontSize),
//                    maxFontSize: @r(app.string.maxfontSize),
//                    heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
//                    font: Fonts(
//                        size: 20.0.fp,
//                        weight: FontWeight.Bolder,
//                        family: 'cursive',
//                        style: FontStyle.Italic
//                    )
//                )
                Button("overflowTextOverlengthTextOverflow.Clip").backgroundColor(0x317aff).fontSize(40).id("button12")
//                .labelStyle(overflow: TextOverflow.Clip,
//                    maxLines: 1,
//                    minFontSize: @r(app.string.minfontSize),
//                    maxFontSize: 20.0.fp,
//                    heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
//                    font: Fonts(
//                        size: 20.0.fp,
//                        weight: FontWeight.Bolder,
//                        family: 'cursive',
//                        style: FontStyle.Italic
//                    )
//                )
                Button("overflowTextOverlengthTextOverflow.Clip").backgroundColor(0x317aff).fontSize(40).id("button13")
//                .labelStyle(overflow: TextOverflow.Clip,
//                    maxLines: 1,
//                    minFontSize: 20.0.fp,
//                    maxFontSize: @r(app.string.maxfontSize),
//                    heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
//                    font: Fonts(
//                        size: 20.0.fp,
//                        weight: FontWeight.Bolder,
//                        family: 'cursive',
//                        style: FontStyle.Italic
//                    )
//                )
            }
        }.height(700).padding(left: 35, right: 35, top: 35)
    }
}
