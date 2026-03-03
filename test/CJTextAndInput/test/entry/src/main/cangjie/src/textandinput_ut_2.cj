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

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.business_exception.*
import ohos.device_info.*

@Test
class TextAndInputUT2 {
    prop driver: Driver {
        get(){
            OpenHarmonyTestRunner.driver
        }
    }
    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500)

        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("TextAndInputIndex2"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextContentControllerBase() {
        scrollTo("ViewTextContentControllerBase")

        //SearchController
        let button_0 = driver.findComponent(On().id("GetSearch"))
        button_0?.click()

        //TextInputController
        let button_1 = driver.findComponent(On().id("GetTextInput"))
        button_1?.click()

        //TextAreaController
        let button_2 = driver.findComponent(On().id("GetTextArea"))
        button_2?.click()
    }

    // TextArea
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSize() {
        scrollTo("ViewTextArea")
        let inspector = getInspectorByKey("component_2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let size = attrs.get("size").getOrThrow().toString()
        @Expect(size, "{\"width\":\"100.00vp\",\"height\":\"50.00vp\"}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextAlign() {
        scrollTo("ViewTextArea")
        Hilog.error(1, "Cangjie-Test", "==========")
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.error(1, "Cangjie-Test", attrs.toString())
        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.error(1, "Cangjie-Test", textAlign)
        @Expect(textAlign, "\"TextAlign.Center\"")

        let textArea = driver.waitForComponent(On().id("component_1"),500)
        textArea?.inputText("1")
        // 输入法弹窗同意点
        agreeXiaoYi(driver)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextArea() {
        scrollTo("ViewTextArea")
        let inspector = getInspectorByKey("component_3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let border = attrs.get("size").getOrThrow().toString()
        let device_name = DeviceInfo.marketName
        Hilog.info(1, "Cangjie-Test", "The current device is ${device_name}, border: ${border}")
        if (device_name == "HUAWEI Mate 70 Pro") {
            @Expect(border, "{\"width\":\"376.28vp\",\"height\":\"88.28vp\"}")
        } else {
            @Expect(border, "{\"width\":\"387.69vp\",\"height\":\"88.46vp\"}")
        }

        let text2 = attrs.get("text").getOrThrow().toString()
        @Expect(text2.contains("border"))

        let fontColor1 = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fontColor1.contains("#FFFFFFFF"))

        let inspector5 = getInspectorByKey("component_5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let fontColor = attrs5.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FF8A2BE2\"")

        let inspector6 = getInspectorByKey("component_6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        let fontSize = attrs6.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"60.00fp\"")

        let inspector7 = getInspectorByKey("component_7")
        let jsonObject7 = JsonValue.fromStr(inspector7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()
        let fontWeight = attrs7.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight, "\"900\"")

        let inspector8 = getInspectorByKey("component_8")
        let jsonObject8 = JsonValue.fromStr(inspector8).asObject()
        let attrs8 = jsonObject8.get("$attrs").getOrThrow().asObject()
        let fontStyle = attrs8.get("fontStyle").getOrThrow().toString()
        @Expect(fontStyle, "\"FontStyle.Italic\"")

        let inspector9 = getInspectorByKey("component_9")
        let jsonObject9 = JsonValue.fromStr(inspector9).asObject()
        let attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()
        let placeholderColor = attrs9.get("placeholderColor").getOrThrow().toString()
        @Expect(placeholderColor, "\"#FF8A2BE2\"")
        let placeholderFont = attrs9.get("placeholderFont").getOrThrow().toString().replace("\\", "")
        @Expect(attrs9.get("placeholderFont").getOrThrow().toString().replace("\\", "").contains('{"style":"FontStyle.Italic","size":"60.00vp","weight":"900","fontFamily":"Georgia"}'))

        let inspector11 = getInspectorByKey("component_11")
        let jsonObject11 = JsonValue.fromStr(inspector11).asObject()
        let attrs11 = jsonObject11.get("$attrs").getOrThrow().asObject()
        let caretcolor = attrs11.get("caretColor").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text caretColor:\t ${caretcolor}")
        @Expect(caretcolor, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextAreaDefault() {
        scrollTo("ViewTextArea")
        let inspector = getInspectorByKey("component_default")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineSpacing = attrs.get("lineSpacing").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text lineSpacing:\t ${lineSpacing}")
        @Expect(lineSpacing, "\"0.00vp\"")
        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text decoration:\t ${decoration}")
        @Expect(decoration.contains("{\\\"type\\\":\\\"TextDecorationType.None\\\",\\\"color\\\":\\\"#FF000000\\\",\\\"style\\\":\\\"TextDecorationStyle.SOLID\\\"}"))
        let wordBreak = attrs.get("wordBreak").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text wordBreak:\t ${wordBreak}")
        @Expect(wordBreak, "\"break-word\"")
        let heightAdaptivePolicy = attrs.get("heightAdaptivePolicy").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text heightAdaptivePolicy:\t ${heightAdaptivePolicy}")
        @Expect(heightAdaptivePolicy, "\"TextHeightAdaptivePolicy.MAX_LINES_FIRST\"")
        let textIndent = attrs.get("textIndent").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text textIndent:\t ${textIndent}")
        @Expect(textIndent, "\"0.00vp\"")
        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text textOverflow:\t ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Clip\"")
        let enablePreviewText = attrs.get("enablePreviewText").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text enablePreviewText:\t ${enablePreviewText}")
        @Expect(enablePreviewText, "true")
        let style = attrs.get("style").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text style:\t ${style}")
        @Expect(style, "\"TextContentStyle.DEFAULT\"")
        let barState = attrs.get("barState").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text barState:\t ${barState}")
        @Expect(barState, "\"BarState.AUTO\"")
        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text maxLines:\t ${maxLines}")
        @Expect(maxLines, "\"INF\"")
        let `type` = attrs.get("type").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text `type`:\t ${`type`}")
        @Expect(`type`, "\"TextAreaType.NORMAL\"")
        let copyOption = attrs.get("copyOption").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "text copyOption:\t ${copyOption}")
        @Expect(copyOption, "\"CopyOptions.Local\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextclock() {
        scrollTo("ViewTextClock")
        let inspector = getInspectorByKey("Text_clock1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let format = attrs.get("format").getOrThrow().toString()
        @Expect(format, "\"aa hh:mm:ss\"")
        let margin = attrs.get("margin").getOrThrow().toString()
        @Expect(margin, "\"20.00vp\"")
        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"30.00fp\"")
        let timeZoneOffset = attrs.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset, "\"-8.000000\"")
        let shadow = attrs.get("shadow").getOrThrow().toString()
        @Expect(shadow, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector2 = getInspectorByKey("Text_clock2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let format2 = attrs2.get("format").getOrThrow().toString()
        @Expect(format2, "\"aa hh:mm:ss\"")
        let fontColor2 = attrs2.get("fontColor").getOrThrow().toString()
        @Expect(fontColor2, "\"#FFFFFFFF\"")
        let shadow2 = attrs2.get("shadow").getOrThrow().toString()
        @Expect(shadow2, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector3 = getInspectorByKey("Text_clock3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let format3 = attrs3.get("format").getOrThrow().toString()
        @Expect(format3, "\"aa hh:mm:ss\"")
        let timeZoneOffset3 = attrs3.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset3, "\"12.000000\"")
        let shadow3 = attrs3.get("shadow").getOrThrow().toString()
        @Expect(shadow3, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let start = driver.findComponent(On().id("start"))
        start?.click()

        let stop = driver.waitForComponent(On().id("stop"),1000)
        stop?.click()
        driver.delayMs(1000)

        let inspector4 = getInspectorByKey("Text_clock4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        let format4 = attrs4.get("format").getOrThrow().toString()
        @Expect(format4, "\"HH:mm:ss\"")
        let fontSize4 = attrs4.get("fontSize").getOrThrow().toString()
        @Expect(fontSize4, "\"20.00fp\"")
        let timeZoneOffset4 = attrs4.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset4, "\"1.000000\"")
        let shadow4 = attrs4.get("shadow").getOrThrow().toString()
        @Expect(shadow4, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector5 = getInspectorByKey("Text_clock5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let format5 = attrs5.get("format").getOrThrow().toString()
        @Expect(format5, "\"aa hh:mm:ss\"")
        let fontSize5 = attrs5.get("fontSize").getOrThrow().toString()
        @Expect(fontSize5, "\"21.00fp\"")
        let timeZoneOffset5 = attrs5.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset5, "\"1.000000\"")
        let shadow5 = attrs5.get("shadow").getOrThrow().toString()
        @Expect(shadow5, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector6 = getInspectorByKey("Text_clock6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        let format6 = attrs6.get("format").getOrThrow().toString()
        @Expect(format6, "\"HH:mm\"")
        let fontSize6 = attrs6.get("fontSize").getOrThrow().toString()
        @Expect(fontSize6, "\"25.00fp\"")
        let timeZoneOffset6 = attrs6.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset6, "\"-1.000000\"")
        let shadow6 = attrs6.get("shadow").getOrThrow().toString()
        @Expect(shadow6, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector7 = getInspectorByKey("Text_clock7")
        let jsonObject7 = JsonValue.fromStr(inspector7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()
        let fontColor7 = attrs7.get("fontColor").getOrThrow().toString()
        @Expect(fontColor7, "\"#FFFF0000\"")

        let inspector8 = getInspectorByKey("Text_clock8")
        let jsonObject8 = JsonValue.fromStr(inspector8).asObject()
        let attrs8 = jsonObject8.get("$attrs").getOrThrow().asObject()
        let fontColor8 = attrs8.get("fontColor").getOrThrow().toString()
        @Expect(fontColor8, "\"#FF000000\"")

        let inspector9 = getInspectorByKey("Text_clock9")
        let jsonObject9 = JsonValue.fromStr(inspector9).asObject()
        let attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()
        let fontColor9 = attrs9.get("fontColor").getOrThrow().toString()
        @Expect(fontColor9, "\"#FF000000\"")

        let inspector12 = getInspectorByKey("Text_clock12")
        let jsonObject12 = JsonValue.fromStr(inspector12).asObject()
        let attrs12 = jsonObject12.get("$attrs").getOrThrow().asObject()
        let fontWeight12 = attrs12.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight12, "\"FontWeight.Normal\"")

        let inspector14 = getInspectorByKey("Text_clock14")
        let jsonObject14 = JsonValue.fromStr(inspector14).asObject()
        let attrs14 = jsonObject14.get("$attrs").getOrThrow().asObject()
        let fontWeight14 = attrs14.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight14, "\"FontWeight.Bold\"")

        let inspector16 = getInspectorByKey("Text_clock16")
        let jsonObject16 = JsonValue.fromStr(inspector16).asObject()
        let attrs16 = jsonObject16.get("$attrs").getOrThrow().asObject()
        let fontWeight16 = attrs16.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight16, "\"FontWeight.Bolder\"")

        let inspector18 = getInspectorByKey("Text_clock18")
        let jsonObject18 = JsonValue.fromStr(inspector18).asObject()
        let attrs18 = jsonObject18.get("$attrs").getOrThrow().asObject()
        let fontWeight18 = attrs18.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight18, "\"FontWeight.Lighter\"")

        let inspector20 = getInspectorByKey("Text_clock20")
        let jsonObject20 = JsonValue.fromStr(inspector20).asObject()
        let attrs20 = jsonObject20.get("$attrs").getOrThrow().asObject()
        let fontWeight20 = attrs20.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight20, "\"FontWeight.Medium\"")

        let inspector22 = getInspectorByKey("Text_clock22")
        let jsonObject22 = JsonValue.fromStr(inspector22).asObject()
        let attrs22 = jsonObject22.get("$attrs").getOrThrow().asObject()
        let fontWeight22 = attrs22.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight22, "\"FontWeight.Regular\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponent1() {
        scrollTo("ViewTextInput")
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "textinput:\t ${attrs.getFields()}")

        let textinputComp = driver.waitForComponent(On().id("component_1"),500)
        textinputComp?.inputText("1")

        let textinput = driver.waitForComponent(On().id("stopEditing"),500)
        textinput?.click()
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        let text4 = driver.findComponent(On().id("Text3_showSubmitState")).getOrThrow()
        let device_name = DeviceInfo.marketName
        Hilog.info(1, "Cangjie-Test", "The current device is ${device_name}, text4: ${text4.getText()}")
        if (device_name == "HUAWEI Mate 70 Pro") {
            @Expect(text4.getText(), "Text3_showSubmitState")
        } else {
            @Expect(text4.getText(), "stopEditing Success")
        }

        let pColor = attrs.get("placeholderColor").getOrThrow().toString()
        @Expect(pColor, "\"#FF808080\"")
        let w = attrs.get("width").getOrThrow().toString()
        @Expect(w, "\"95.00%\"")
        let h = attrs.get("height").getOrThrow().toString()
        @Expect(h, "\"40.00vp\"")
        let m = attrs.get("margin").getOrThrow().toString()
        @Expect(m, "\"20.00vp\"")
        let fSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fSize, "\"14.00fp\"")
        let fColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fColor, "\"#FF000000\"")

        let testSetTextSelection = driver.findComponent(On().id("TextInput_setTextSelection"))
        testSetTextSelection?.inputText("testSetTextSelection")
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        let text3 = driver.findComponent(On().id("Text3_showSubmitState")).getOrThrow()
        Hilog.info(1, "Cangjie-Test", "The current device is ${device_name}, text3: ${text3.getText()}")
        if (device_name == "HUAWEI Mate 70 Pro") {
            @Expect(text3.getText(), "Text3_showSubmitState")
        } else {
            @Expect(text3.getText(), "setTextSelection Success")
        }
        driver.pressBack()
        driver.delayMs(500)
//        driver.pressBack()
        scrollTo("ViewTextInput")

        Hilog.info(1,"Cangjie-Test", "YZHLOG before getInspectorByKey", "")
        let inspector2 = getInspectorByKey("component_2")
        Hilog.info(1,"Cangjie-Test", "YZHLOG after getInspectorByKey", "")
        Hilog.info(1,"Cangjie-Test", "YZHLOG after getInspectorByKey key is: ${inspector2}", "")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        Hilog.info(1,"Cangjie-Test", "YZHLOG after JsonValue.fromStr", "")
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let maxLength = attrs2.get("maxLength").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "maxLength:\t ${maxLength}")
        @Expect(maxLength, "\"9\"")

    }
}
