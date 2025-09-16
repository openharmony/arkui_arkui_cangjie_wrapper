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
import ohos.router.*
import ohos.ui_test.*

@Test
class BasicCommonUT41 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("BasicCommonIndex4")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    func getContentFromText(textId: String): String {
        var inspector = getInspectorByKey(textId)
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        attrs.get("content").getOrThrow().toString()
    }

    func clickButton(buttonId: String) {
        Hilog.info(1,"Cangjie-App","click ${buttonId}")
        let button = driver.waitForComponent(On().id(buttonId),500).getOrThrow()
        button.click()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testUiContext() {
        scrollTo("ViewUiContext")

        let size = driver.findComponent(On().id("click")).getOrThrow()
        size.click()

        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testEnum() {
        scrollTo("ViewEnum")

        Hilog.info(1, "Cangjie-App", "test_enum start")
        clickButton("keyTypeBtn1")
        clickButton("keyTypeBtn2")

        var keyType1: String = getContentFromText("keyType1")
        @Expect(keyType1, "\"Down\"")
        var keyType2: String = getContentFromText("keyType2")
        @Expect(keyType2, "\"Up\"")

        clickButton("richEditor1")

        clickButton("resourceType")
        clickButton("sliderChangeMode")
        clickButton("navigationType")
        clickButton("refreshStatus")
        clickButton("richEditorDeleteDirection")
        clickButton("spanType")

        var enumClickCount_: String = getContentFromText("enumClickCount")
        @Expect(enumClickCount_, "\"6\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testEnum2() {
        scrollTo("ViewEnum2")

        clickButton("panDirection1")
        clickButton("sourceTool1")
        // stX,stY,edX,edY,spd
        driver.drag(1170,1100,1170,1211,speed: 1000)
        driver.delayMs(200)
        clickButton("menuPreviewMode")
        clickButton("panDirection")
        clickButton("sourceTool")
        clickButton("scrollSource")
        clickButton("week")
        clickButton("titleHeight")
        clickButton("foldStatus")
        clickButton("layoutSafeAreaType")
        clickButton("richEditorResponseType")
        var enumClickCount_: String = getContentFromText("enumClickCount")
        @Expect(enumClickCount_, "\"9\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testPopup003() {
        scrollTo("ViewPopup")

        Hilog.info(1, "Cangjie-App", "Test_Popup_003 start")
        let inspector = getInspectorByKey("button3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        driver.findComponent(On().id("button3")).getOrThrow().click()

        driver.delayMs(1000)
        let otherInspector_07 = getInspectorByKey("Test_Text_09")
        let otherJsonObject_07 = JsonValue.fromStr(otherInspector_07).asObject()
        let otherContent_07 = otherJsonObject_07.get("$attrs").getOrThrow().asObject()
        let finalContent_07 = otherContent_07.get("content")
        let optionContent_07 = finalContent_07.getOrThrow()
        let maxContent_07 = optionContent_07.toString()
        @Expect(maxContent_07, "\"Popup Show\"")

        driver.findComponent(On().text("confirm")).getOrThrow().click()

        driver.delayMs(1000)
        let otherInspector_08 = getInspectorByKey("Test_Text_07")
        let otherJsonObject_08 = JsonValue.fromStr(otherInspector_08).asObject()
        let otherContent_08 = otherJsonObject_08.get("$attrs").getOrThrow().asObject()
        let finalContent_08 = otherContent_08.get("content")
        let optionContent_08 = finalContent_08.getOrThrow()
        let maxContent_08 = optionContent_08.toString()
        @Expect(maxContent_08, "\"first button clicked\"")

        driver.findComponent(On().id("button3")).getOrThrow().click()
        driver.delayMs(1000)

        driver.findComponent(On().text("cancel")).getOrThrow().click()
        driver.delayMs(1000)
        let otherInspector_09 = getInspectorByKey("Test_Text_08")
        let otherJsonObject_09 = JsonValue.fromStr(otherInspector_09).asObject()
        let otherContent_09 = otherJsonObject_09.get("$attrs").getOrThrow().asObject()
        let finalContent_09 = otherContent_09.get("content")
        let optionContent_09 = finalContent_09.getOrThrow()
        let maxContent_09 = optionContent_09.toString()
        @Expect(maxContent_09, "\"second button clicked\"")

        driver.delayMs(1000)
        let otherInspector_10 = getInspectorByKey("Test_Text_09")
        let otherJsonObject_10 = JsonValue.fromStr(otherInspector_10).asObject()
        let otherContent_10 = otherJsonObject_10.get("$attrs").getOrThrow().asObject()
        let finalContent_10 = otherContent_10.get("content")
        let optionContent_10 = finalContent_10.getOrThrow()
        let maxContent_10 = optionContent_10.toString()
        @Expect(maxContent_10, "\"Popup Wait\"")

        driver.findComponent(On().id("button3")).getOrThrow().click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.findComponent(On().text("cancel")).getOrThrow().click()
        driver.delayMs(200)
        let otherInspector_11 = getInspectorByKey("Test_Text_10")
        let otherJsonObject_11 = JsonValue.fromStr(otherInspector_11).asObject()
        let otherContent_11 = otherJsonObject_11.get("$attrs").getOrThrow().asObject()
        let finalContent_11 = otherContent_11.get("content")
        let optionContent_11 = finalContent_11.getOrThrow()
        let maxContent_11 = optionContent_11.toString()
        @Expect(maxContent_11, "\"dismissReason: PRESS_BACK\"")
        driver.pressBack()
        driver.delayMs(1000)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testPopup004() {
        scrollTo("ViewPopup")

        Hilog.info(1, "Cangjie-App", "Test_Popup_004 start")
        let inspector = getInspectorByKey("button4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        driver.findComponent(On().id("button4")).getOrThrow().click()
        driver.findComponent(On().id("button4")).getOrThrow().click()

        driver.delayMs(500)
        let otherInspector_11 = getInspectorByKey("Test_Text_11")
        let otherJsonObject_11 = JsonValue.fromStr(otherInspector_11).asObject()
        let otherContent_11 = otherJsonObject_11.get("$attrs").getOrThrow().asObject()
        let finalContent_11 = otherContent_11.get("content")
        let optionContent_11 = finalContent_11.getOrThrow()
        let maxContent_11 = optionContent_11.toString()
        @Expect(maxContent_11, "\"CustomPopup Show\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testWindowEnhance2() {
        scrollTo("ViewWindowEnhance")
        var prop1: String = getContentFromText("message")
        @Expect(prop1, '""')
        clickButton("setWindowSystemBarProperties")
        var prop2: String = getContentFromText("message")
        @Expect(prop2, '""')
        clickButton("destroyWindow")
    }
}
