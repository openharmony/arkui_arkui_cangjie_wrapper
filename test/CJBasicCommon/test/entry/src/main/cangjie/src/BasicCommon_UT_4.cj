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
class BasicCommon_UT_4 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "1", "Cangjie-Test", "ScrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar.scrollSearch(On().id(view)).click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "1", "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500)
        Hilog.info(1, "1", "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("Index_UT4")).click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // size
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Size() {
        ScrollTo("View_Size")

        var inspector = getInspectorByKey("testSize")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let width1 = attrs.get("width").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-App", "######### ${width1}")
        @Expect(width1 , "\"40.00vp\"")

        let height1 = attrs.get("height").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-App", "######### ${height1}")
        @Expect(height1 , "\"60.00vp\"")

        let margin1 = attrs.get("margin").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-App", "######### ${margin1}")
        @Expect(margin1 , "\"2.00vp\"")

        let padding1 = attrs.get("padding").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-App", "######### ${padding1}")
        @Expect(padding1 , "\"10.00vp\"")
    }

    // Transition
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_transition() {
        ScrollTo("View_Transition")

        let button = driver.findComponent(On().id("my_button"))
        button.click()
        button.click()
        let button2 = driver.waitForComponent(On().id("my_button2"), 1000)
        let text = button2.getText()
        @Expect(text, "abc")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_viewBase() {
        ScrollTo("View_ViewBase")
        let width_int = driver.findComponent(On().id("width_int"))

        let inspector = getInspectorByKey("width_int")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, '"100.00vp"')

        let button4 = driver.findComponent(On().id("button4"))
        button4.click()
    }

    // Visibility
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_visibility() {
        ScrollTo("View_Visibility")

        var inspector = getInspectorByKey("my_visibility")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let visibility_t = attrs.get("visibility").getOrThrow().toString()
        @Expect(visibility_t, "\"Visibility.Hidden\"")
    }

    func getContentFromText(textId: String): String {
        var inspector = getInspectorByKey(textId)
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        attrs.get("content").getOrThrow().toString()
    }

    func clickButton(buttonId: String) {
        let button = driver.waitForComponent(On().id(buttonId), 500)
        button.click()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_window_enhance() {
        ScrollTo("View_Window_Enhance")
        var prop1: String = getContentFromText("message")
        @Expect(prop1,  '"#00FFFFFF,#FF000000, #00FFFFFF,#FF000000,false,false"')
        clickButton("setWindowSystemBarProperties")
        var prop2: String = getContentFromText("message")
        @Expect(prop2, '"#FFFF00FF,#FF0000FF, #FF00FF00,#FFFF0000,true,true"')
        clickButton("GetWindowLimits")
        @Expect(getContentFromText("message"), "\"6240,780,1040,1\"")
        clickButton("GetWindowLimits")
        clickButton("setDefaultDensityDisable")
        clickButton("setSpecificSystemBarEnabled")
        clickButton("recover")
        clickButton("showWindow")
        clickButton("moveWindowTo")
        clickButton("setWindowLayoutFullScreen")
        clickButton("isWindowSupportWideGamut")
        clickButton("isWindowShowing")
        clickButton("setWindowBackgroundColor")
        clickButton("setWindowBrightness")
        clickButton("setWindowFocusable")
        clickButton("setWindowKeepScreenOn")
        clickButton("setWindowTouchable")
        clickButton("getWindowAvoidArea")
        clickButton("getWindowProperties")
        clickButton("setAspectRatio")
        clickButton("resetAspectRatio")
        clickButton("setWindowColorSpace")
        clickButton("test checkRet")
        clickButton("getWindowColorSpace")
        clickButton("snapshot")
        clickButton("setWindowSystemBarEnable")
        clickButton("CFwindow")
        clickButton("setWindowPrivacyMode")
        clickButton("setPreferredOrientation")
        clickButton("shiftAppWindowFocus")
        clickButton("structtest")
        clickButton("WindowTypeEnum")
        clickButton("WindowEventTypeEnum")
        clickButton("WindowStageEventTypeEnum")
        clickButton("WindowStatusTypeEnum")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_window_listener() {
        ScrollTo("View_Window_Listener")
        clickButton("onScreenShot")
        clickButton("onWindowEvent")
        clickButton("onWindowVisibilityChange")
        clickButton("onWindowStageEvent")
        clickButton("onWindowStageEvent1")
        clickButton("onWindowSizeChange")
        clickButton("onDialogTargetTouch")
        clickButton("onNoInteractionDetected")
        clickButton("onWindowRectChange")
        clickButton("onTouchOutside")
        clickButton("onWindowStatusChange")
        clickButton("onKeyboardHeight")
        clickButton("onKeyboardHeight0")
        clickButton("onKeyboardHeight0_error")
        clickButton("onTBRectChange")
        clickButton("onWinAvoidArea")
        clickButton("offScreenShot")
        clickButton("offWindowEvent")
        clickButton("offWindowVisibilityChange")
        clickButton("offWindowStageEvent")
        clickButton("offWindowSizeChange")
        clickButton("offDialogTargetTouch")
        clickButton("offNoInteractionDetected")
        clickButton("offWindowRectChange")
        clickButton("offTouchOutside")
        clickButton("offWindowStatusChange")
        clickButton("offKeyboardHeight")
        clickButton("offTBRectChange")
        clickButton("offWinAvoidArea")
        clickButton("onScreenShot")
        clickButton("onScreenShot")
        clickButton("offWindowStageEvent1")
        clickButton("offStageEvent")
        clickButton("offAllScrrenShot")
        clickButton("OldOnKeyboardHei")
        clickButton("OldOffKeyboardHei")
        clickButton("CreateSubWindow")
        clickButton("onSubWindowClose")
        clickButton("offSubWindowClose")
    }

    // zorder
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_zorder1() {
        ScrollTo("View_ZOrder")

        let inspector = getInspectorByKey("Text2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let zIndex = attrs.get("zIndex").getOrThrow().toString()
        @Expect(zIndex, "2")

        let inspector2 = getInspectorByKey("Text1")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let zIndex2 = attrs2.get("zIndex").getOrThrow().toString()
        @Expect(zIndex2, "1")

        let inspector3 = getInspectorByKey("Text0")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let zIndex3 = attrs3.get("zIndex").getOrThrow().toString()
        @Expect(zIndex3, "0")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Popup_003() {
        ScrollTo("View_Popup")

        Hilog.info(1, "1", "Cangjie-App", "Test_Popup_003 start")
        let inspector = getInspectorByKey("button3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "1", "Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        driver.findComponent(On().id("button3")).click()

        driver.delayMs(1000)
        let otherInspector_07 = getInspectorByKey("Test_Text_09")
        let otherJsonObject_07 = JsonValue.fromStr(otherInspector_07).asObject()
        let otherContent_07 = otherJsonObject_07.get("$attrs").getOrThrow().asObject()
        let finalContent_07 = otherContent_07.get("content")
        let optionContent_07 = finalContent_07.getOrThrow()
        let maxContent_07 = optionContent_07.toString()
        @Expect(maxContent_07, "\"Popup Show\"")

        driver.findComponent(On().text("confirm")).click()

        driver.delayMs(1000)
        let otherInspector_08 = getInspectorByKey("Test_Text_07")
        let otherJsonObject_08 = JsonValue.fromStr(otherInspector_08).asObject()
        let otherContent_08 = otherJsonObject_08.get("$attrs").getOrThrow().asObject()
        let finalContent_08 = otherContent_08.get("content")
        let optionContent_08 = finalContent_08.getOrThrow()
        let maxContent_08 = optionContent_08.toString()
        @Expect(maxContent_08, "\"first button clicked\"")

        driver.findComponent(On().id("button3")).click()
        driver.delayMs(1000)

        driver.findComponent(On().text("cancel")).click()
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

        driver.findComponent(On().id("button3")).click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.findComponent(On().text("cancel")).click()
        driver.delayMs(200)
        let otherInspector_11 = getInspectorByKey("Test_Text_10")
        let otherJsonObject_11 = JsonValue.fromStr(otherInspector_11).asObject()
        let otherContent_11 = otherJsonObject_11.get("$attrs").getOrThrow().asObject()
        let finalContent_11 = otherContent_11.get("content")
        let optionContent_11 = finalContent_11.getOrThrow()
        let maxContent_11 = optionContent_11.toString()
        @Expect(maxContent_11, "\"dismissReason: PRESS_BACK\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Popup_004() {
        ScrollTo("View_Popup")

        Hilog.info(1, "1", "Cangjie-App", "Test_Popup_004 start")
        let inspector = getInspectorByKey("button4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "1", "Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        driver.findComponent(On().id("button4")).click()
        driver.findComponent(On().id("button4")).click()

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
    func test_enum() {
        ScrollTo("View_Enum")

        Hilog.info(1, "1", "Cangjie-App", "test_enum start")
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
}
