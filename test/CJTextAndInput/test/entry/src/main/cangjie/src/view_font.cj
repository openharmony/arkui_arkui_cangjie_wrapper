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
import ohos.i18n.*
import ohos.resource_manager.*
import ohos.arkui.ui_context.*

@Entry
@Component
class ViewFont {
    @State
    var message: String = "message"
    @State
    var message1: String = "message1"
    @State
    var message2: String = "message2"
    @State
    var message3: String = "message3"
    @State
    var message4: String = "message4"
    @State
    var message5: String = "message5"
    @State
    var check: String = "message"
    @State
    var check2: String = "message2"
    @State
    var check3: String = "message3"
    @State
    var check5: String = "message5"

    protected func aboutToAppear() {
        getUIContext().getFont().registerFont(
            familyName: "Amiri",
            familySrc: "/resources/rawfile/Amiri-Regular.ttf"
        )
        getUIContext().getFont().registerFont(
            familyName: @r(app.string.SmileySans_label),
            familySrc: @rawfile("HarmonyOS_Sans_Condensed.ttf")
        )
    }

    func build() {
        Row {
            Column {
                Text("1: ${message}").id("message")
                Text("2: ${check}").id("check")
                Text("3: ${message1}").id("message1")
                Text("4: ${message2}").id("message2")
                Text("5: ${check2}").id("check2")
                Text("6: ${message3}").id("message3")
                Text("7: ${check3}").id("check3")
                Text("8: ${message4}").id("message4")
                Text("9: ${message5}").id("message5")
                Text("10: ${check5}").id("check5")
                // registerFont(str, str)
                Button("registerFont1").onClick({ event =>
                    this.message = "Amiri"
                }).fontSize(40).height(80).fontFamily("Amiri").id("registerFont1")
                // registerFont(CJResourse, CJResourse)
                Button("registerFont2").onClick({ event =>
                    this.message = "SmileySans"
                }).fontSize(40).height(80).fontFamily("SmileySans").id("registerFont2")
                // getFontByName
                Button("getFontByName1").onClick({ event =>
                    var fontInfo =  getUIContext().getFont().getFontByName("HarmonyOS Sans Italic")
                    try {
                        let r1: FontInfo = fontInfo.getOrThrow()
                        this.check = r1.path
                        this.message = "path: " + r1.path + ",postScriptName: " + r1.postScriptName + ",fullName: " +
                        r1.fullName + ",family: " + r1.family + ",subfamily: " + r1.subfamily + ",weight: " +
                        r1.weight.toString() + ",width:" + r1.width.toString() + ",italic: " + r1.italic.toString() +
                        ",monoSpace: " + r1.monoSpace.toString() + ",symbolic:" + r1.symbolic.toString()
                    } catch (e: NoneValueException) {
                        this.message = "no value"
                        this.check = "no value"
                    }
                }).id("getFontByName-sysFontName")
                Button("getFontByName2").onClick({ event =>
                    var fontInfo =  getUIContext().getFont().getFontByName("Amiri")
                    try {
                        let r1: FontInfo = fontInfo.getOrThrow()
                        this.check = r1.path
                        this.message = "path: " + r1.path + ",postScriptName: " + r1.postScriptName + ",fullName: " +
                        r1.fullName + ",family: " + r1.family + ",subfamily: " + r1.subfamily + ",weight: " +
                        r1.weight.toString() + ",width:" + r1.width.toString() + ",italic: " + r1.italic.toString() +
                        ",monoSpace: " + r1.monoSpace.toString() + ",symbolic:" + r1.symbolic.toString()
                    } catch (e: NoneValueException) {
                        this.message = "no value"
                        this.check = "no value"
                    }
                }).id("getFontByName-noSysFontName")
                // getUIFontConfig

                Button("getFont").onClick({ e =>
                    let font1 = getUIContext().getFont()
                }).id("getFont")

            }.width(100.percent)
        }.height(100.percent)
    }
}