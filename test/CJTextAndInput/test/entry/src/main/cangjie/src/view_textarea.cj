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
import std.collection.*

@Entry
@Component
class View_TextArea {
    @State
    var placeholder: String = "please input your name"
    @State
    var name: String = "AAAAA"
    var controller: TextAreaController = TextAreaController()
    var scroller: Scroller = Scroller()
    @State
    var totalOffsetX: Float32 = 0.0
    @State
    var totalOffsetY: Float32 = 0.0
    @State
    var selectionStart: Int32 = 0
    @State
    var selectionEnd: Int32 = 0
    @State
    var did_deleteOffset: Float64 = 0.0
    @State
    var did_direction: Int32 = 0
    @State
    var did_deleteValue: String = ""
    @State
    var will_deleteOffset: Float64 = 0.0
    @State
    var will_direction: Int32 = 0
    @State
    var will_deleteValue: String = ""
    @State
    var did_insertOffset: Float64 = 0.0
    @State
    var did_insertValue: String = ""
    @State
    var will_insertOffset: Float64 = 0.0
    @State
    var will_insertValue: String = ""

    func build() {
        Scroll(this.scroller) {
            Column(space: 10.px) {
                Button("caretposition  3").onClick({
                    evt => controller.caretPosition(3)
                })
                TextArea(placeholder: this.placeholder, text: this.name, controller: controller)
                    .textAlign(TextAlign.Center)
                    .id("component_1")

                TextArea(text: "size")
                    .size(width: 100.vp, height: 50.vp)
                    .borderRadius(100.vp)
                    .borderWidth(50.vp)
                    .borderColor(Color.Red)
                    .borderStyle(BorderStyle.Dashed)
                    .fontSize(60.vp)
                    .fontColor(Color.Red)
                    .borderRadius(topLeft: 5.vp, topRight: 5.vp, bottomLeft: 5.vp, bottomRight: 5.vp)
                    .id("component_2")

                TextArea(text: "border")
                    .border(width: 1.vp, radius: 5.vp, style: BorderStyle.Dashed)
                    .fontSize(60.0)
                    .fontColor(@r(app.color.start_window_background))
                    .id("component_3")

                TextArea(text: "padding")
                    .padding(40.vp)
                    .fontSize(@r(app.string.size_desc))
                    .maxLength(60)
                    .fontFamily("label")
                    .id("component_4")

                TextArea(text: "font color")
                    .fontColor(0x8A2BE2)
                    .fontFamily(@r(app.string.EntryAbility_label))
                    .id("component_5")

                TextArea(text: "font size 60").fontSize(60).id("component_6")

                TextArea(text: "font weight 900").fontWeight(FontWeight.W900).id("component_7")

                TextArea(text: "font style Italic").fontStyle(FontStyle.Italic).id("component_8").borderRadius()

                TextArea(placeholder: "placeholder font")
                    .placeholderColor(0x8A2BE2)
                    .placeholderFont(size: 60.0, weight: FontWeight.W900, family: "Georgia", style: FontStyle.Italic)
                    .id("component_9")

                TextArea(placeholder: "textAlign")
                    .textAlign(TextAlign.Start)
                    .id("component_10")
                    .margin(1.vp)
                    .backgroundColor(Color.Red)

                TextArea(placeholder: "caretColor")
                    .caretColor(0Xff0000)
                    .id("component_11")
                    //.height(1.vp)
                    .padding(top: 1.vp, right: 1.vp, bottom: 1.vp, left: 1.vp)
                    .margin(top: 1.vp, right: 1.vp, bottom: 1.vp, left: 1.vp)

                TextArea(
                    text: "barState set on,设置为on表示滚动条始终显示，默认状态为auto，表示只有当内容发生滚动时才会显示滚动条." +
                    "barState set on,设置为on表示滚动条始终显示，默认状态为auto，表示只有当内容发生滚动时才会显示滚动条." +
                    "barState set on,设置为on表示滚动条始终显示，默认状态为auto，表示只有当内容发生滚动时才会显示滚动条." +
                    "barState set on,设置为on表示滚动条始终显示，默认状态为auto，表示只有当内容发生滚动时才会显示滚动条."
                )
                    .width((300))
                    .id("component_26")
                Text("拖动滚动条会触发onContentScroll事件，偏移值如下：")
                Text("totalOffsetX:" + this.totalOffsetX.toString())
                Text("totalOffsetY:" + this.totalOffsetY.toString())

                TextArea().id("component_default")
                .borderWidth(EdgeWidths(left: 20.px, right: 30.px, top: 40.px, bottom: 10.px))

                TextArea(placeholder: "inputfilter only a").inputFilter(value: "a",
                    error: {val => Hilog.info(1, "1", "Cangjie-Test", "TextArea OnError:" + val)})

                TextArea(placeholder: "TextArea callback")
                    .onChange({
                        val => Hilog.info(1, "1", "Cangjie-Test", "TextArea onChange:" + val)
                    })
                    .onPaste({
                        val => Hilog.info(1, "1", "Cangjie-Test", "TextArea onPaste:" + val)
                    })
                    .onCut({
                        val => Hilog.info(1, "1", "Cangjie-Test", "TextArea onCut:" + val)
                    })
                    .onCopy({
                        val => Hilog.info(1, "1", "Cangjie-Test", "TextArea onCopy:" + val)
                    })
                    .onSubmit({
                        val => Hilog.info(1, "1", "Cangjie-Test", "TextArea onSubmit")
                    })
                    .onEditChange({
                    val => Hilog.info(1, "1", "Cangjie-Test", "TextArea onEditChange:" + val.toString())
                    })

                TextArea(placeholder:@r(app.string.placeholder),text:@r(app.string.text),controller:this.controller)
                    .id("component_39")
                    .enterKeyType(EnterKeyType.Search)

                TextArea(placeholder:@r(app.string.placeholder),text:"placeholder!: AppResource, text!: String = ")
                    .id("component_40")

                TextArea(placeholder:"placeholder!: String =  text!: AppResource",text: @r(app.string.text))
                    .id("component_41")
            }.width(100.percent)
        }
    }
}
