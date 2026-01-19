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
import std.time.*

@Test
class TitleMenuDialogUT1 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }
    private func scrollTo(view: String) {
        driver.delayMs(500)
        logger("scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                logger(e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        logger("started")
        scrollBar.scrollSearch(On().id("TitleMenuDialogIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testActionSheet() {
        scrollTo("ViewActionSheet")
        var button = driver.findComponent(On().id("action_sheet_button_empty")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button1")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button2")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button3")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button4")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button5")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button6")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button7")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button8")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button9")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button10")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button11")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button12")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button13")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button14")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button15")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button16")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button17")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button18")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("action_sheet_button19")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)

        button = driver.findComponent(On().id("action_sheet_button_sheetinfo_none")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)

        button = driver.findComponent(On().id("action_sheet_button_options_none")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)

        button = driver.findComponent(On().id("action_sheet_button_confirm_none")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)

        button = driver.findComponent(On().id("action_sheet_button_confirm_enabled")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)

        button = driver.findComponent(On().id("action_sheet_button_offset_none")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
    }


    private func formatCurrentDate(): String {
        return DateTime.now().format("yyyy-M-d")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMenu() {
        scrollTo("ViewMenu")
        let inspector = getInspectorByKey("menuComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(0, "0", "CangjieTest", attrs.toString())

        let font = attrs.get("font").getOrThrow().toString()
        Hilog.info(0, "0", "CangjieTest", font)
        @Expect(font.contains("1.00vp"))
        @Expect(font.contains("400"))
        @Expect(font.contains("FontStyle.Normal"))

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FFFF7F50\"")

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width,"\"140.00vp\"")

        let subMenuExpandingMode1 = attrs.get("subMenuExpandingMode").getOrThrow()
        @Expect(subMenuExpandingMode1.toString(), "\"SubMenuExpandingMode.SIDE\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMenuBindMenuComponent() {
        scrollTo("ViewMenuBindMenu")
        driver.findComponent(On().id("Test_Button_04")).getOrThrow().click()
        driver.findComponent(On().id("Test_Button_03")).getOrThrow().click()
        driver.delayMs(1000)

        let Inspector = getInspectorByKey("Test_Text_02")
        let jsonObject = JsonValue.fromStr(Inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let text3 = attrs.get("content").getOrThrow().toString()
        //@Expect(text3, "\"onAppear show up\"")

        let Inspector2 = getInspectorByKey("Test_Text_03")
        let jsonObject2 = JsonValue.fromStr(Inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let text4 = attrs2.get("content").getOrThrow().toString()
        //@Expect(text4, "\"onDisappear show up\"")

        let Inspector3 = getInspectorByKey("Test_Text_04")
        let jsonObject3 = JsonValue.fromStr(Inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let text5 = attrs3.get("content").getOrThrow().toString()
        //@Expect(text5, "\"aboutToAppear show up\"")

        let Inspector4 = getInspectorByKey("Test_Text_05")
        let jsonObject4 = JsonValue.fromStr(Inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        let text6 = attrs4.get("content").getOrThrow().toString()
        //@Expect(text6, "\"aboutToDisappear show up\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMenucontrolComponent() {
        scrollTo("ViewMenucontrol")

        driver.findComponent(On().id("Test_Button")).getOrThrow().click()
        let text = driver.findComponent(On().text("菜单1")).getOrThrow()
        let gettext = text.getText()
        @Expect(gettext,"菜单1")
        let text_01 = driver.findComponent(On().text("菜单2")).getOrThrow()
        let gettext_01 = text_01.getText()
        @Expect(gettext_01,"菜单2")

        driver.findComponent(On().text("菜单1")).getOrThrow().click()
        let text1 = driver.waitForComponent(On().id("Test_Text"), 500).getOrThrow().getText()
        @Expect(text1,"Text")

        driver.findComponent(On().id("Test_Button_01")).getOrThrow().click()
        let text2 = driver.waitForComponent(On().text("Builder"), 500).getOrThrow()
        let gettext2 = text2.getText()
        @Expect(gettext2,"Builder")
        driver.findComponent(On().text("Builder")).getOrThrow().click()
        driver.delayMs(1000)
        Hilog.info(0, "0", "CangjieTest", "end ViewMenucontrol")
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMenuitem() {
        Hilog.info(0, "0", "CangjieTest", "run ViewMenuItem")
        scrollTo("ViewMenuItem")

        let inspector = getInspectorByKey("menuitemComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(0, "0", "CangjieTest", attrs.toString())

        let contentFont = attrs.get("contentFont").getOrThrow().toString()
        @Expect(contentFont.contains("10.00vp"))
        @Expect(contentFont.contains("400"))
        @Expect(contentFont.contains("FontStyle.Normal"))
        @Expect(contentFont.contains("HarmonyOS Sans"))

        let labelFont = attrs.get("labelFont").getOrThrow().toString()
        @Expect(labelFont.contains("10.00vp"))
        @Expect(labelFont.contains("400"))
        @Expect(labelFont.contains("FontStyle.Normal"))
        @Expect(labelFont.contains("HarmonyOS Sans"))
    }
}
