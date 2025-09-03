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
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.base.launch
import std.sync.*
import std.collection.*

@Entry
@Component
class View_Concurrency {
    @State var text: String = "begin"
    @State var text_2: String = "hascontainer"
    func build() {
        Column(space: 30) {
            Button(text).onClick { evt =>
                changeText({ p: String =>
                    // 使用launch表达式在主线程中更新状态变量
                    launch {
                        text = p
                    }
                })
            }.id("test_button_launch")
            Button(text_2).onClick{ evt =>
                onClickButtonHasContainer({ p: String =>
                    launch {
                        text_2 = p
                    }
                })
            }.id("test_button_hasContainer")
            Button("button_progressStyle").onClick { e =>

            }.id("test_button_progressStyle")
        }.width(100.percent)
    }

    private func changeText(callback: (String) -> Unit): Unit {
        spawn {
            callback("blink_0")
        }
    }
    private func onClickButtonHasContainer(callback: (String) -> Unit): Unit {
        callback("容器不存在！")
    }
}
