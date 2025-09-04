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
        Hilog.info(1,"1","Cangjie-Test", "ScrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1,"1","Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.info(1,"1","Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("Index_UT4")).getOrThrow().click()
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
        Hilog.info(1,"1","Cangjie-App", "######### ${width1}")
        @Expect(width1 , "\"40.00vp\"")

        let height1 = attrs.get("height").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "######### ${height1}")
        @Expect(height1 , "\"60.00vp\"")

        let margin1 = attrs.get("margin").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "######### ${margin1}")
        @Expect(margin1 , "\"2.00vp\"")

        let padding1 = attrs.get("padding").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "######### ${padding1}")
        @Expect(padding1 , "\"10.00vp\"")
    }

    // Transition
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_transition() {
        ScrollTo("View_Transition")

        let button = driver.findComponent(On().id("my_button")).getOrThrow()
        button.click()
        button.click()
        let button2 = driver.waitForComponent(On().id("my_button2"),1000).getOrThrow()
        let text = button2.getText()
        @Expect(text, "abc")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_viewBase() {
        ScrollTo("View_ViewBase")
        let button4 = driver.findComponent(On().id("button4")).getOrThrow()
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
        Hilog.info(1,"Cangjie-App","click ${buttonId}")
        let button = driver.waitForComponent(On().id(buttonId),500).getOrThrow()
        button.click()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_window_listener() {
        ScrollTo("View_Window_Listener")
//        var message = "on_onScreenShot_success"
//        try {
//            clickButton("onScreenShot")
//        } catch (e: Exception) {
//            Hilog.info(1,"1","test_hitrace: ${e.toString()}")
//            message = e.toString()
//        }
//        try {
//            clickButton("offScreenShot")
//        } catch (e: Exception) {
//            Hilog.info(1,"1","test_hitrace: ${e.toString()}")
//            message = e.toString()
//        }
//        try {
//            clickButton("offAllScrrenShot")
//        } catch (e: Exception) {
//            Hilog.info(1,"1","test_hitrace: ${e.toString()}")
//            message = e.toString()
//        }
//        @Expect(message.contains("Invalid param"))
        clickButton("onKeyboardHeight")
        clickButton("offKeyboardHeight")
        clickButton("onKeyboardHeight0")
        clickButton("onKeyboardHeight0_error")
        clickButton("OldOnKeyboardHei")
        clickButton("OldOffKeyboardHei")
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
    func test_window_enhance() {
        ScrollTo("View_Window_Enhance")
        var prop1: String = getContentFromText("message")
        @Expect(prop1, '""')
        clickButton("setWindowSystemBarProperties")
        var prop2: String = getContentFromText("message")
        @Expect(prop2, '""')
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
        clickButton("onOff")
        clickButton("setWindowPrivacyMode")
        clickButton("setPreferredOrientation")
        clickButton("shiftAppWindowFocus")
        clickButton("structtest")
        clickButton("WindowTypeEnum")
        clickButton("WindowEventTypeEnum")
        clickButton("WindowStageEventTypeEnum")
        clickButton("WindowStatusTypeEnum")
    }
}
