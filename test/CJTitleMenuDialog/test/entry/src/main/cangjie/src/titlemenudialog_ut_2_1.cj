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

@Test
class TitleMenuDialogUT21 {
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
        scrollBar.scrollSearch(On().id("TitleMenuDialogIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMenuItemGroup() {
        scrollTo("ViewMenuItemGroup")
        let button = driver.findComponent(On().id("button")).getOrThrow()
        button.click()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPrompt() {
        scrollTo("ViewPrompt")

        let showToast = driver.findComponent(On().id("showToast")).getOrThrow()
        showToast.click()

        let showDialog = driver.findComponent(On().id("showDialog")).getOrThrow()
        showDialog.click()
        driver.delayMs(500)
        let buttons1: Array<Component> = driver.findComponents(On().onType("Button")).getOrThrow()
        Hilog.info(0, "0", "CangjieTest", "buttons1 size: ${buttons1.size}")
        Hilog.info(0, "0", "CangjieTest", "buttons1 size: ${buttons1[0].getDescription()}")
        buttons1[0].click()
        driver.delayMs(500)
        let text1 = driver.findComponent(On().id("showDialog")).getOrThrow().getText()
        @Expect(text1, "Show dialog! index: 0")

        let showActionMenu = driver.findComponent(On().id("showActionMenu")).getOrThrow()
        showActionMenu.click()
        driver.delayMs(500)
        let showButton: Array<Component> = driver.findComponents(On().onType("Button")).getOrThrow()
        Hilog.info(0, "0", "CangjieTest", "showButton size: ${showButton.size}")
        Hilog.info(0, "0", "CangjieTest", "showButton size: ${showButton[0].getDescription()}")
        showButton[0].click()
        driver.delayMs(500)
        let text2 = driver.findComponent(On().id("showActionMenu")).getOrThrow().getText()
        @Expect(text2, "Show action menu! index: 0")

        let openDialog = driver.findComponent(On().id("openDialog")).getOrThrow()
        openDialog.click()
        driver.delayMs(500)
        let closeButton: Array<Component> = driver.findComponents(On().onType("Button")).getOrThrow()
        let isButton = closeButton[0].getText()
        @Expect(isButton, "CloseDialog")
        closeButton[0].click()
        driver.delayMs(500)

        // 覆盖率提升 TopShowMode TopMost
        let showToast2 = driver.findComponent(On().id("showToast_2")).getOrThrow()
        showToast2.click()
        driver.delayMs(500)

        // 覆盖率提升ButtonInfo (text: String, color: UInt32)
        let showDialog2 = driver.findComponent(On().id("showDialog_2")).getOrThrow()
        showDialog2.click()
        driver.delayMs(500)
        let buttons3: Array<Component> = driver.findComponents(On().onType("Button")).getOrThrow()
        buttons3[0].click()
        let text3 = driver.waitForComponent(On().id("showDialog_2"), 500).getOrThrow().getText()
        @Expect(text3, "Show dialog2! index: 0")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPrompt2() {
        scrollTo("ViewPrompt")

        let showActionMenu2 = driver.findComponent(On().id("showActionMenu2")).getOrThrow()
        showActionMenu2.click()
        driver.delayMs(500)
        let showButton2: Array<Component> = driver.findComponents(On().onType("Button")).getOrThrow()
        Hilog.info(0, "0", "CangjieTest", "showButton2 size: ${showButton2.size}")
        Hilog.info(0, "0", "CangjieTest", "showButton2 size: ${showButton2[0].getDescription()}")
        showButton2[0].click()
        let text1 = driver.waitForComponent(On().id("showActionMenu2"), 500).getOrThrow().getText()
        @Expect(text1, "Show ActionMenu 2")

        let openCustomDialogWithOption = driver.findComponent(On().id("openCustomDialogWithOption")).getOrThrow()
        openCustomDialogWithOption.click()

        let openCustomDialogWithOption1 = driver
            .waitForComponent(On().id("openCustomDialogWithOption1"), 500)
            .getOrThrow()
        openCustomDialogWithOption1.click()

        let openCustomDialogWithOption2 = driver
            .waitForComponent(On().id("openCustomDialogWithOption2"), 500)
            .getOrThrow()
        openCustomDialogWithOption2.click()

        let showToast3 = driver.waitForComponent(On().id("showToast3"), 500).getOrThrow()
        showToast3.click()

        let showDialog3 = driver.waitForComponent(On().id("showDialog3"), 500).getOrThrow()
        showDialog3.click()
        driver.delayMs(400)

        let showDialog4 = driver.findComponent(On().id("showDialog4")).getOrThrow()
        showDialog4.click()
        driver.delayMs(400)
        driver.pressBack()
        driver.delayMs(200)

        let showDialog5 = driver.findComponent(On().id("showDialog5")).getOrThrow()
        showDialog5.click()
        driver.delayMs(400)
        driver.pressBack()
        driver.delayMs(200)
    }

    // Global
    func clickButton(buttonId: String) {
        let button = driver.findComponent(On().id(buttonId)).getOrThrow()
        button.click()
    }
    func getContentFromText(textId: String): String {
        var inspector = getInspectorByKey(textId)
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        attrs.get("content").getOrThrow().toString()
    }
}
