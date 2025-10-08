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

extend KeyType {
    public func getString() {
        match (this) {
            case Unknown => "Unknown"
            case Down => "Down"
            case Up => "Up"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

extend TouchType {
    public func getString() {
        match (this) {
            case Down => "Down"
            case Up => "Up"
            case Move => "Move"
            case Cancel => "Cancel"
            case Unknown => "Unknown"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Entry
@Component
class ViewTextInput {
    @State var text: String = ""
    @State var text2: String = ""
    @State var text3: String = "Text3_showSubmitState"
    var controller: TextInputController = TextInputController()

    func build() {
        Column() {
            TextInput(text: this.text, placeholder: "input your word...", controller: this.controller)
            .placeholderColor(Color.Gray)
            .placeholderFont(size: 14, weight: FontWeight.W100)
            .caretColor(Color.Blue)
            .width(95.percent)
            .height(40)
            .margin(20)
            .fontSize(14)
            .fontColor(Color.Black)
            .inputFilter(
                "[a-z]"
                // error: {
                //     info: String => Hilog.info(1, "Cangjie-Test", "inputFilter error")
                // }
            ).onChange({
                value: String => this.text = value
            }).id("component_1")

            Button("Set caretPosition 1").margin(15)
            Button("Get CaretOffset").margin(15)

            TextInput(placeholder: "input your password...", text: @r(app.string.text), controller: this.controller)
            .borderWidth(16.vp)
            .borderColor(Color.Red)
            .borderRadius(
                topLeft: 5.vp,
                topRight: 5.vp,
                bottomLeft: 5.vp,
                bottomRight: 5.vp
            ).borderStyle(BorderStyle.Dashed)
            .fontSize(16.vp)
            .onSubmit({ val =>
                this.controller.stopEditing()
                this.text3 = "stopEditing Success"
            })
            .id("stopEditing")

            TextInput(placeholder: @r(app.string.placeholder), text: this.text, controller: this.controller)
            .fontSize(16.0)
            .fontColor(0xFFFFFF)
            .fontFamily(@r(app.string.EntryAbility_label))

            TextInput(placeholder: @r(app.string.placeholder), text: @r(app.string.text), controller: this.controller)
            .id("TextInput_setTextSelection")
            .fontColor(@r(app.color.start_window_background))
            .fontFamily("label")
            .onSubmit({ val =>
                this.controller.setTextSelection(0, 5);
                this.text3 = "setTextSelection Success"
                Hilog.info(1, "1", "Cangjie-Test", "TextInput onSubmit");
            })

            Text(this.text3).id("Text3_showSubmitState")

            // 密码输入框
            TextInput(placeholder: "input your password...")
            .width(95.percent)
            .height(40)
            .margin(20)
            .maxLength(9)
            .id("component_2")

            // 邮箱地址自动填充类型
            TextInput(placeholder: "input your email...")
            .border(width: 10.vp, color: Color.Red, radius: 10.vp, style: BorderStyle.Dashed)
            .fontSize(@r(app.string.size_desc))
            .width(95.percent)
            .height(40)
            .margin(20)
            .maxLength(9)
            .id("component_3")
            .enterKeyType(EnterKeyType.Previous)
            .enterKeyType(EnterKeyType.NewLine)
            .enterKeyType(EnterKeyType.Go)
            .enterKeyType(EnterKeyType.Search)
            .enterKeyType(EnterKeyType.Send)
            .enterKeyType(EnterKeyType.Next)
            .enterKeyType(EnterKeyType.Done)

            TextInput(placeholder: "input your password...").size(width: 1.vp, height: 1.vp)
            .padding(top: 1.vp, right: 1.vp, bottom: 1.vp, left: 1.vp)
            .margin(top: 1.vp, right: 1.vp, bottom: 1.vp, left: 1.vp)
            .padding(1.vp).backgroundColor(Color.Red)
            .borderWidth(EdgeWidths(left: 20.px, right: 30.px, top: 40.px, bottom: 10.px))

            // 内联风格输入框
            TextInput(text: "inline style").width(95.percent).height(50).margin(20).borderRadius(0).id("component_4").onKeyEvent(
                {
                    event =>
                    this.text2 = """
                    keyType: ${event.keyType.getString()}
                    keyCode: ${event.keyCode.toString()}
                    keyText: ${event.keyText}
                    deviceId: ${event.deviceId.toString()}
                    metaKey: ${event.metaKey.toString()}
                    timestamp: ${event.timestamp.toString()}
//                """
                    Hilog.info(1, "Cangjie-Test", this.text)
                    event.stopPropagation()
            }).onTouch({ event =>
                    this.text2 = """
                    TouchType: ${event.eventType.getString()}
                    timestamp: ${event.timestamp}
                    Distance between point and element:
                    x: ${event.touches[0].x} y: ${event.touches[0].y}
                    Component localPos:(${event.target.getOrThrow().area.position.x.getOrThrow().value}, ${event.target.getOrThrow().area.position.y.getOrThrow().value})
                    width: ${event.target.getOrThrow().area.width.value} height: ${event.target.getOrThrow().area.height.value}
                """
                    Hilog.info(1, "Cangjie-Test", this.text)
                    event.stopPropagation()
            })
            .onChange({
                val => Hilog.info(1, "Cangjie-Test", "TextInput onChange:" + val)
            })
            .onPaste({
                val => Hilog.info(1, "Cangjie-Test", "TextInput onPaste:" + val)
            })
            .onCut({
                val => Hilog.info(1, "Cangjie-Test", "TextInput onCut:" + val)
            })
            .onCopy({
                val => Hilog.info(1, "Cangjie-Test", "TextInput onCopy:" + val)
            })
            .onEditChange({
                val => Hilog.info(1, "Cangjie-Test", "TextInput onEditChange:" + val.toString())
            })
            .onSubmit({ val => Hilog.info(1, "Cangjie-Test", "TextInput onSubmit")})
            .onSubmit({ val =>
                this.controller.stopEditing()
                this.text3 = "stopEditing Success"
                Hilog.info(1, "Cangjie-Test", "TextInput onSubmit")
            }).id("textinput")

            TextInput(placeholder: "borderRadiusTest").borderRadius()

        }.width(100.percent)
    }
}
