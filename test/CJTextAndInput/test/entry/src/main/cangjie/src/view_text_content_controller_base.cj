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

@Entry
@Component
class ViewTextContentControllerBase {
    @State
    var message: String = "Hello Cangjie"

    @State
    var linesnum: Int32 = 0
    @State
    var text: String = ###"123
321
222"###//原始字符，别在前面加空格，不然UT会有偏差
    var controller: SearchController = SearchController()
    var controller1: TextInputController = TextInputController()
    var controller2: TextAreaController = TextAreaController()

    func build() {
        Row {
            Column {
                Search(value: this.text, placeholder: 'Search', controller: this.controller)
                    .placeholderColor(Color.Gray)
                    .placeholderFont(size: 14.vp, weight: W400)
                    .width(95.percent)
                    .height(40)
                    .margin(20)
                    .onChange {
                        value: String => this.text = value
                    }
                    .id("Search")
                TextInput(text: this.text, placeholder: 'TextInput', controller: this.controller1)
                    .placeholderColor(Color.Gray)
                    .placeholderFont(size: 14.vp, weight: W400)
                    .width(95.percent)
                    .height(40)
                    .margin(20)
                    .fontColor(Color.Black)
                    .onChange {
                        value: String => this.text = value
                    }
                    .id("TextInput")
                TextArea(text: this.text, placeholder: 'TextArea', controller: this.controller2)
                    .placeholderColor(Color.Gray)
                    .placeholderFont(size: 14.vp, weight: W400)
                    .width(95.percent)
                    .margin(20)
                    .fontColor(Color.Black)
                    .onChange {
                        value: String => this.text = value
                    }
                    .id("TextArea")
                Button('Get Search')
                    .margin(15)
                    .onClick { event => this.controller.caretPosition(11)//移动光标位置
                    }
                    .id("GetSearch")
                Button('Get TextInput')
                    .margin(5)
                    .onClick { event => this.controller1.caretPosition(11)//移动光标位置
                    }
                    .id("GetTextInput")
                Button('Get TextArea')
                    .margin(5)
                    .onClick { event => this.controller2.caretPosition(11)//移动光标位置
                    }
                    .id("GetTextArea")
            }.width(100.percent)
        }.height(100.percent)
    }
}