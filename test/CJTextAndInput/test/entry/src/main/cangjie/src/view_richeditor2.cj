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

/**
 * Created on 2025/6/18
 */
package ohos_app_cangjie_entry
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Component
class ViewRichEditorTest1 {

    var controller1: RichEditorController = RichEditorController()
    var controller2: RichEditorController = RichEditorController()
    var controller3: RichEditorController = RichEditorController()
    var controller4: RichEditorController = RichEditorController()
    @State var message: String = "text"

   func build() {
        Column {
            Column {
                Text(this.message).id("RichEditor_Test1_Text")

                RichEditor(this.controller1)
                .id("RichEditor_Test1_RichEditor1")
                .width(100.percent)

                RichEditor(this.controller2)
                .id("RichEditor_Test1_RichEditor2")
                .width(100.percent)

                RichEditor(this.controller3)
                .id("RichEditor_Test1_RichEditor3")
                .onReady({
                     =>
                })
                .width(100.percent)

                RichEditor(this.controller4)
                .id("RichEditor_Test1_RichEditor4")
                .onReady({
                    =>
                    this.controller4.addTextSpan(value: "divide")
                })

                RichEditor(this.controller1)
                .id("RichEditor_Test1_RichEditor5")
                .width(100.percent)

                Button("controller3")
                .id("ViewRichEditorTest1Button1")
                .onClick({
                    e =>
                })

                Button("focus controller3")
                .id("ViewRichEditorTest1Button2")
                .onClick({
                    e =>
                    FocusControl.requestFocus("RichEditor_Test1_RichEditor3")
                })

                Button("focus controller4")
                .id("ViewRichEditorTest1Button3")
                .onClick({
                    e =>
                    FocusControl.requestFocus("RichEditor_Test1_RichEditor4")
                })


            }.width(100.percent)
            .height(100.percent)
        }
    }
}

@Component
class ViewRichEditorTest2 {

    var controller1: RichEditorController = RichEditorController()
    var controller2: RichEditorController = RichEditorController()
    var controller3: RichEditorController = RichEditorController()
    @State var message: String = "0"
    @State var message2: String = "0"
    @State var message3: String = "0"

    func build() {
        Column {
            RichEditor(this.controller1)
            .id("ViewRichEditorTest2RichEditor1")
            .onReady({
                =>
            })

            RichEditor(this.controller2)
            .id("ViewRichEditorTest2RichEditor2")
            .onReady({
                =>
            })

            RichEditor(this.controller3)
            .id("ViewRichEditorTest2RichEditor3")
            .onReady({
                =>
            })

            Text(this.message).id("ViewRichEditorTest2Text1")
            Text(this.message2).id("ViewRichEditorTest2Text2")
            Text(this.message3).id("ViewRichEditorTest2Text3")
        }
    }
}

@Component
class ViewRichEditorTest3 {

    var controller1: RichEditorController = RichEditorController()
    var controller2: RichEditorController = RichEditorController()
    let richEditorSelection: RichEditorSelection = RichEditorSelection((1, 1), ArrayList<RichEditorSpanResult>())

    @State var message1: String = "message1"
    @State var message2: String = "message2"

    func build() {
        Column {
            RichEditor(this.controller1)
            .id("editMenuOptions")
            .onReady({
                =>
            })

            RichEditor(this.controller2)
            .id("ViewRichEditorTest3RichEditor2")
            .onReady({
                =>
                this.controller2.addTextSpan(value: "ViewRichEditorTest3RichEditor2")
            })

            Text(this.message1).id("ViewRichEditorTest3Text1")
            .height(10.percent)
            .width(50.percent)
            Text(this.message2).id("ViewRichEditorTest3Text2")
            .height(10.percent)
            .width(50.percent)
        }
    }
}

@Entry
@Component
class ViewRichEditor2 {
    @State
    var componentId: Int32 = 0

    func build() {
        Column {
            Button("next component")
                .id("next_component")
                .onClick({ e =>
                })
                if (this.componentId == 0) {
                    ViewRichEditorTest1()
                } else if (this.componentId == 1) {
                    ViewRichEditorTest2()
                } else if (this.componentId == 2) {
                    ViewRichEditorTest3()
                }
        }
        .height(100.percent)
        .width(100.percent)
    }
}