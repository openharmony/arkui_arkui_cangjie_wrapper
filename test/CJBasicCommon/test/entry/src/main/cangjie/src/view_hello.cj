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
import ohos.curves.*
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
class ViewHello {
    @State
    var message: String = "Hello Cangjie"

    var expectedFrameRateRange: ExpectedFrameRateRange = ExpectedFrameRateRange(min: 1, max: 1, expected: 1)

    var length1: Length = 2.0.percent
    var length2: Length = 2.0.lpx

    var animateParam: AnimateParam = AnimateParam()
    var viewStackProcessor: ViewStackProcessor = ViewStackProcessor()

    let textController: TextController = TextController()
    let curves: Curves = Curves()

    @Builder
    func builder(text: String) {
        Column {
            Text(text)
        }.width(300.px)
    }

    func build() {
        Row {
            Column {
                Text("textController", controller: this.textController)
                    .onClick ({
                        e => this
                            .textController
                            .closeSelectionMenu()
                    })
                    .fontSize(40)
                    .id("textController")

                Button(message)
                    .onClick ({
                        e =>
                        LegalCallCheck.check(this)
                        try {
                            this.resetRecycleCustomNode()
                        } catch (e: Exception) {
                            Hilog.info(1, "Cangjie-Test", "test_openView: ${e.toString()}")
                            message = e.toString()
                        }
                        Hilog.info(1, "Cangjie-App", "Hello Cangjie")
                    })
                    .fontSize(40)
                    .height(80)
                    .id("helloCangjie")
                Button("Recycle Manager")
                    .onClick ({
                        e =>
                        Hilog.info(1, "Cangjie-App", "Hello Cangjie")
                    })
                    .id("RecycleManager")
                Button("ReuseParams")
                    .onClick ({
                        e =>
                        var reuseParams = ReuseParams([])
                        var reuseParams1 = ReuseParams([])
                        var reuseParams2 = ReuseParams([("test1", true)])
                        reuseParams.get<String>("test2")

                        Hilog.info(1, "Cangjie-App", "Hello Cangjie")
                    })
                    .id("ReuseParams")

                Button("BindPopup-Custom")
                    .bindPopup(
                        false,
                        CustomPopupOptions(enableArrow: true, showInSubWindow: false,
                            builder: {=> bind(builder, this)("CustomPopupOptions")})
                    )
                    .id("BindPopup-Custom")

                Image(@r(app.media.app_icon))
                    .onError({a =>})
                    .width(30)
                    .height(30)
            }.width(100.percent)
        }.height(100.percent)
    }
}
