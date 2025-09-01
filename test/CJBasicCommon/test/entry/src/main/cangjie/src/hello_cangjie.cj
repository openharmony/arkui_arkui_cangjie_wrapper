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
import ohos.measure.*
import ohos.font.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Component
class PageRecycle {
    public func build() {
        Button(ButtonOptions()) {
            
        }
    }
}

@Entry
@Component
class Hello_Cangjie {
    @State
    var message: String = "Hello Cangjie"

    var expectedFrameRateRange: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 1, max: 1, expected: 1)

    var length1: Length = 2.0.percent
    var length2: Length = 2.0.lpx

    var animateParam: AnimateParam = AnimateParam()
    var viewStackProcessor: ViewStackProcessor = ViewStackProcessor()
    func build() {
        Row {
            Column {
                Button(message)
                    .onClick {
                        e =>
                        LegalCallCheck.check(this)
                        try {
                            this.resetRecycleCustomNode()
                        } catch (e: Exception) {
                            Hilog.info(1, "1", "Cangjie-Test", "test_openView: ${e.toString()}")
                            message = e.toString()
                        }
                        Hilog.info(1, "1", "Cangjie-App", "Hello Cangjie")
                    }
                    .fontSize(40)
                    .height(80)
                    .id("helloCangjie")
                Button("Recycle Manager")
                    .onClick {
                        e =>
                        var recycleM = RecycleManager()
                        recycleM.pushRecycleNode("recycle1", PageRecycle(this))
                        recycleM.pushRecycleNode("recycle2", PageRecycle(this))
                        recycleM.popRecycleNode("recycle1")
                        recycleM.popRecycleNode("recycle1")
                        recycleM.updateNodeId(1, 2)
                        recycleM.updateNodeId(1, 1)
                        recycleM.updateNodeId(2, 1)
                        recycleM.updateNodeId(2, 2)
                        recycleM.proxyNodeId(3)
                        recycleM.proxyNodeId(1)
                        recycleM.updateNodeId(5, 6)
                        recycleM.proxyNodeId(6)
                        recycleM.purgeAllCachedRecycleNode()
                        Hilog.info(1, "1", "Cangjie-App", "Hello Cangjie")
                    }
                    .id("RecycleManager")
                Button("ReuseParams")
                    .onClick {
                        e =>
                        var reuseParams = ReuseParams()
                        var reuseParams1 = ReuseParams([])
                        var reuseParams2 = ReuseParams([("test1", true)])
                        reuseParams.size
                        reuseParams.add("test2", "test2")
                        reuseParams.contains("test2")
                        reuseParams.get("test2")
                        reuseParams2.getValue<Bool>("test1")
                        reuseParams2.getValue<Bool>("test3")

                        Hilog.info(1, "1", "Cangjie-App", "Hello Cangjie")
                    }
                    .id("ReuseParams")
            }.width(100.percent)
        }.height(100.percent)
    }
}
