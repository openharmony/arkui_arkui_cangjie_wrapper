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
 * Created on 2025/7/22
 */
package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.arkui.ui_context.*

@Entry
@Component
class ViewUiContext {
    func build() {
        Column(space: 10) {
            Button("test uicontext")
                .onClick ({
                    evt =>
                    Hilog.info(1, "1", "Cangjie-App", "Hello Cangjie")

                    try {
                        var contextMenuController = getUIContext().getContextMenuController()
                        contextMenuController.close()
                    } catch (e: Exception) {
                        Hilog.info(1, "Cangjie-Test", "initializeConsume: ${e.toString()}")
                    }
                    getUIContext().getMeasureUtils()
                    getUIContext().getMeasureUtils()
                    SizeOptions()

                    try {
                        let measureutils = getUIContext().getMeasureUtils()
                        let measureopotions = MeasureOptions(textContent:"cangjie")
                        let measuretext = measureutils.measureText(measureopotions)
                    } catch (e: Exception) {
                        Hilog.info(1, "Cangjie-Test", "MeasureOptions: ${e.toString()}")
                    }

                    var f2 = getUIContext().getMeasureUtils().measureText(MeasureOptions(textContent: "textContent"))
                    var sizeOptions  = getUIContext().getMeasureUtils().measureTextSize(MeasureOptions(textContent: "textContent"))

                    var vp2px  = getUIContext().vp2px(2.vp).getOrThrow()
                    var vp2px1  = getUIContext().vp2px(2.px)
                    Hilog.info(1, "Cangjie-Test", "getUIContext().vp2px: ${vp2px.value}")
                    var px2vp1  = getUIContext().px2vp(2.vp)
                    var fp2px1  = getUIContext().fp2px(2.px)
                    var px2fp1  = getUIContext().px2fp(2.fp)
                    var lpx2px1  = getUIContext().lpx2px(2.px)
                    var px2lpx1  = getUIContext().px2lpx(2.lpx)
                    var px2vp  = getUIContext().px2vp(2.px).getOrThrow()
                    var fp2px  = getUIContext().fp2px(2.fp).getOrThrow()
                    var px2fp  = getUIContext().px2fp(2.px).getOrThrow()
                    var lpx2px  = getUIContext().lpx2px(2.lpx).getOrThrow()
                    var px2lpx  = getUIContext().px2lpx(2.px).getOrThrow()
                    Hilog.info(1, "Cangjie-Test", "getUIContext().px2vp: ${px2vp.value}, fp2px: ${fp2px.value}, px2fp: ${px2fp.value}, lpx2px: ${lpx2px.value}")


                    try {
                        initializeConsume("")
                    } catch (e: Exception) {
                        Hilog.info(1, "Cangjie-Test", "initializeConsume: ${e.toString()}")
                    }
                    try {
                        initializeConsume("")
                        updateElement(2)
                    } catch (e: Exception) {
                        Hilog.info(1, "Cangjie-Test", "initializeConsume: ${e.toString()}")
                    }
                })
                .fontSize(40)
                .height(80)
                .id("click")
        }
    }
}
