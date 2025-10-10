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

let _ = AppStorage.setOrCreate<Int64>("count", 100)
let msg = AppStorage.setOrCreate<String>("msg","111")
let propmsg = AppStorage.setOrCreate<String>("propmsg","999")

@Entry
@Component
class ViewAppstorage {
    @State var msgText: String = "111"
    @StorageLink["count"] var count: Int64 = 100
    let linkToMsg1 = AppStorage.link<String>("msg").getOrThrow()
    let linkToMsg2 = AppStorage.link<String>("msg").getOrThrow()
    let haveMsg = AppStorage.has("msg")
    let nohaveMsg = AppStorage.has("msg01")
    func build() {
        Column(space: 10) {
            Text("${count}")
                .id("parentText")
                .width(count.vp)
            // 修改会同步到其他组件中
            Button("+").onClick ({
                e => count += 10
            }).id("parentBtn")
            Son()

            Text(this.msgText)
                .id("msgText")

            Button("changeLinkTextButton").onClick ({ e
                =>
                    this.linkToMsg1.set("changed")
                    this.msgText = this.linkToMsg2.get()
            }).id("changeLinkTextButton")
            Button("hasButton").onClick ({ e
                =>
                    this.msgText = "${haveMsg}"
            }).id("hasButton")
            Button("nohasButton").onClick ({
                e =>
                    this.msgText = "${nohaveMsg}"
            }).id("nohasButton")
            Button("keysSizeButton").onClick ({ e
                =>
                    this.msgText = "AppStorage has ${AppStorage.size()} elements: ${AppStorage.keys().toArray()}"
            }).id("keysSizeButton")
            Button("clearButton").onClick ({ e
                =>
                    this.msgText = "${AppStorage.clear()}"
            }).id("clearButton")
            Button("getButton").onClick ({ e
                =>
                    this.msgText = AppStorage.get<String>("msg").getOrThrow()
            }).id("getButton")
            Button("setButton").onClick ({ e
                =>
                    this.msgText = "${AppStorage.set("msg","666")}"
            }).id("setButton")
        }
    }
}

@Component
class Son {
    @StorageLink["count"]
    var count: Int64 = 0
    func build() {
        Column(space: 10) {
            // 修改会同步到其他组件中
            Button("-").onClick ({
                e => count -= 10
            }).id("sonBtn")
        }
    }
}
