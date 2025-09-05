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
 * Created on 2024/6/27
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.font.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewCustomView {
    @State
    var message: String = "Hello Cangjie"

    protected override func updateWithJson(json: String): Unit {
        Hilog.error(1,"Cangjie-Test","updateWithJson ${json}")
    }

    func build() {
        Row {
            Column {
                Button(message).onClick {
                    evt =>
                    Hilog.info(1, "Cangjie-App", "Hello Cangjie")
                    onStateUpdate("", ArrayList<Int64>())
                    notifyRead("")
                    try {
                        initializeConsume("")
                    } catch (e: Exception) {
                        Hilog.info(1, "Cangjie-Test", "initializeConsume: ${e.toString()}")
                    }
                    try {
                        removeChildGroupById("")
                        initializeConsume("")
                        updateElement(2)
                    } catch (e: Exception) {
                        Hilog.info(1, "Cangjie-Test", "initializeConsume: ${e.toString()}")
                    }
                }.fontSize(40).height(80).id("click")
            }.width(100.percent)
        }.height(100.percent)
    }
}
