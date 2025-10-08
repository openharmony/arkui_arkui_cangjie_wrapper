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
import ohos.arkui.ui_context.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewFont {

    protected override func aboutToAppear() {
        getUIContext().getFont().registerFont(
            familyName: "Deyihei",
            familySrc: "/resources/rawfile/HarmonyOS_Sans_Condensed.ttf"
        )

        getUIContext().getFont().registerFont(
            familyName: @r(app.string.Font_name),
            familySrc: @rawfile("HarmonyOS_Sans_Condensed.ttf")
        )

        getUIContext().getFont().registerFont(
            familyName: @r(app.string.Font_name),
            familySrc: @r(app.string.DEFAULT_FONT)
        )
    }

    func build() {
        Row {
            Column {
                Text("HelloWorld").fontFamily("Deyihei")
                Text("HelloWorld")

                Button("HelloWorld1").onClick ({
                    evt =>
                    let list = getUIContext().getFont().getSystemFontList()
                    Hilog.info(1, "Cangjie-App", "${list.size}")
                }).id("getSystemFontList")

                Button("HelloWorld2").onClick ({
                    evt =>
                    let info = getUIContext().getFont().getFontByName("HarmonyOS Sans")
                    match (info) {
                        case Some(v) =>
                            Hilog.info(1, "Cangjie-App", "${v.path}")
                            Hilog.info(1, "Cangjie-App", "${v.postScriptName}")
                            Hilog.info(1, "Cangjie-App", "${v.fullName}")
                            Hilog.info(1, "Cangjie-App", "${v.family}")
                            Hilog.info(1, "Cangjie-App", "${v.subfamily}")
                            Hilog.info(1, "Cangjie-App", "${v.weight}")
                            Hilog.info(1, "Cangjie-App", "${v.width}")
                            Hilog.info(1, "Cangjie-App", "${v.italic}")
                            Hilog.info(1, "Cangjie-App", "${v.monoSpace}")
                            Hilog.info(1, "Cangjie-App", "${v.symbolic}")
                        case None => Hilog.info(1, "Cangjie-App", "None")
                    }
                }).id("getFontByName")
            }.width(100.percent)
        }.height(100.percent)
    }
}
