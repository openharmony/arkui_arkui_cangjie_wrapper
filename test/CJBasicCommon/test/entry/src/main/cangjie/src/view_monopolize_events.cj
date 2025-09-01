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

import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import ohos.arkui.component.*
import ohos.base.Color
import ohos.base.LengthProp

@Entry
@Component
class View_MonopolizeEvents {
    @State
    var message: String = 'set monopolizeEvents false'
    @State
    var messageOut: String = ' '
    @State
    var messageInner: String = ' '
    @State
    var monopolize: Bool = false

    func build() {
        Column() {
            Text(this.message).id("monopolizeEvents-message")
            Text(this.messageOut).id("monopolizeEvents-messageOut")
            Text(this.messageInner).id("monopolizeEvents-messageInner")
            Button('clean').onClick {
                e =>
                this.messageOut = ""
                this.messageInner = ""
            }.id("monopolizeEvents-clean")
            Button('change monopolizeEvents')
                // 通过button的点击事件来切换内层column的独占控制属性
                .onClick {
                    e =>
                    this.monopolize = !this.monopolize
                    if (!this.monopolize) {
                        this.message = "set monopolizeEvents false"
                    } else {
                        this.message = "set monopolizeEvents true"
                    }
                }
                .id("monopolizeEvents-change")
            Column {}
                .width(100.percent)
                .height(40.percent)
                .backgroundColor(Color.Blue)
                .onClick {
                    _event => this.messageInner = "inner column touch down"
                }
                .id("monopolizeEvents-column")
        }.onClick {
            _event => this.messageOut = "inner column touch down"
        }
    }
}
