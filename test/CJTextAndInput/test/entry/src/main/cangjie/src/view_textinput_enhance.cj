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
class View_TextInput_Enhance {
    var controller: TextInputController = TextInputController()
    @State
    var inLineText: String = """
    This is the inline text\n
    value\n
    """
    @State
    var longText: String = """
    This is a long text\n
    test scroll.\n
    value1\nvalue2\nvalue3\nvalue4\nvalue5\nvalue6\nvalue7\nvalue8\nvalue9\nvalue10\nvalue11\nvalue12\n
    """
    @State
    var lastCaretPosition: Int32 = 0
    @State
    var lastCaretPositionEnd: Int32 = 0
    @State
    var offsetX: Float32 = 0.0
    @State
    var offsetY: Float32 = 0.0

    @State
    var textError = ""
    @State
    var passwordState: Bool = false
    @State
    var insertVal: String = ""
    @State
    var insertOffset: Float64 = 0.0
    @State
    var deleteValue: String = ""
    @State
    var deleteOffset: Float64 = 0.0
    @State
    var deleteDirection: Int32 = 0
    @State
    var onSubmitText: String = ""
    @State
    var onDidInsertMsg: String = "支持插入回调文本"
    @State
    var onDidDeleteMsg: String = "支持删除回调文本"

    func build() {
        Column() {
            TextInput(text: this.onSubmitText)
                .onChange({
                    value: String => this.onSubmitText = value
                })
                .onSubmit(
                    {
                        enterKey: EnterKeyType => if (this.onSubmitText == "test") {
                            this.textError = ""
                        } else {
                            this.textError = '用户名输入错误'
                            this.onSubmitText = ""
                        }
                    })
            TextInput(text: "Normal")
                .id("TextInputNormal")
                .textAlign(TextAlign.Center)
                .enableKeyboardOnFocus(false) // no data
                .selectionMenuHidden(true) // no data
                //                .caretPosition(3)
                .maxLength(10)
                .showUnderline(true)

            TextInput(text: 'underline style')
                .id("TextInputUnit")
                .showUnderline(true)
                .width(380)
                .height(60)
                .maxLength(20)

            TextInput(text: this.inLineText)
                .id("TextInputInlineText")
                .style(TextInputStyle.Inline)
                .maxLines(2)
                .fontWeight(FontWeight.W500)
                .fontStyle(FontStyle.Normal)

            Button('SetTextSelection')
                .id("ButtonSetTextSelection")
                .margin(15)
                .onClick({
                    event => this.controller.setTextSelection(1, 5)
                })
            Text("Selection ${this.lastCaretPosition}-${this.lastCaretPositionEnd}").id("TextSelection")

            Button('StopEditing').id("ButtonStopEditing").margin(15).onClick({
                event => this.controller.stopEditing()
            })

            TextInput(text: this.onDidInsertMsg)
                .onSubmit(
                    {
                        enterKey: EnterKeyType => Hilog.info(1, "1", "Cangjie-Test",
                            "TextInput_Enhance: TextInput onSubmit")
                    })
                .id("onSubmit")

            TextInput(text: this.onDidDeleteMsg)
                .onSubmit(
                    {
                        enterKey: EnterKeyType =>
                        Hilog.info(1, "1", "Cangjie-Test", "TextInput_Enhance onSubmitWithEvent")
                        if (this.onSubmitText == "test") {
                            this.textError = ""
                        } else {
                            this.textError = '用户名输入错误'
                            this.onSubmitText = ""
                        }
                    }
                )
                .id("onSubmitWithEvent")
            Text(
                "insertValue: ${this.insertVal}.  insertOffset: ${this.insertOffset}; deleteValue:${this.deleteValue}. delOffset:${this.deleteOffset}. Direction:${this.deleteDirection}")

            TextInput().id("TextInputDefault").style(TextInputStyle.Default)
        }.width(100.percent)
    }
}
