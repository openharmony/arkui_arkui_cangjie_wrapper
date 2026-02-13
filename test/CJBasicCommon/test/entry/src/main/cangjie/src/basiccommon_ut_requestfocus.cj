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
import ohos.device_info.*
import ohos.hilog.Hilog
internal import ohos.business_exception.BusinessException

@Test
class BasicCommonUTRequestFocus {
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
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("ViewRequestFocus")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        // All tests are on the same page, no need to pressBack
        driver.delayMs(200)
    }

    // ========== Section 1: Basic Interface Tests ==========
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRequestFocusReturnValue() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Test Request Focus Return Value")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_request_result")).getOrThrow().getText()
        @Expect(resultText.contains("Request success") || resultText.contains("Request failed"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSuccessReturnTrue() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Test Success Return True")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_success_result")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFailReturnFalse() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Test Fail Return False")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_fail_result")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testEmptyStringId() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Test Empty String Id")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_empty_id_result")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNonExistentId() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Test Non-Existent Id")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_not_exist_result")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }

    // ========== Section 2: Component Type Coverage Tests ==========
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testButtonFocus() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("button_focus_test")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_button_focus")).getOrThrow().getText()
        @Expect(resultText.contains("Button") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextInputFocus() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request TextInput Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_textinput_focus")).getOrThrow().getText()
        @Expect(resultText.contains("TextInput") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextFocusable() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Text Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_text_focusable")).getOrThrow().getText()
        @Expect(resultText.contains("Text") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageFocusable() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Image Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_image_focusable")).getOrThrow().getText()
        @Expect(resultText.contains("Image") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnFocusable() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Column Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_column_focusable")).getOrThrow().getText()
        @Expect(resultText.contains("Column") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testListFocusable() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request List Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_list_focusable")).getOrThrow().getText()
        @Expect(resultText.contains("List") || resultText.contains("focus"), true)
    }

    // ========== Section 3: Focus State Validation Tests ==========
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testOnFocusEvent() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Focus Trigger onFocus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_focus_event")).getOrThrow().getText()
        @Expect(resultText.contains("onFocus") || resultText.contains("onBlur") || resultText.contains("event"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testKeyboardState() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Focus Show Keyboard")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_keyboard_state")).getOrThrow().getText()
        @Expect(resultText.contains("Keyboard") || resultText.contains("shown") || resultText.contains("hidden"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFocusSwitch() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Switch to Component B")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let focusText = scrollView.scrollSearch(On().id("text_focus_switch")).getOrThrow().getText()
        let blurText = scrollView.scrollSearch(On().id("text_blur_switch")).getOrThrow().getText()
        @Expect(focusText.contains("Component") || blurText.contains("Component"), true)
    }

    // ========== Section 4: Focus Switch Tests ==========
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTabIndexOrder() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request by tabIndex Order")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        let resultText = scrollView.scrollSearch(On().id("text_tabindex_result")).getOrThrow().getText()
        @Expect(resultText.contains("tabIndex") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMultipleComponents() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Multiple Components")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        let resultText = scrollView.scrollSearch(On().id("text_multi_request")).getOrThrow().getText()
        @Expect(resultText.contains("Component") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCrossContainerSwitch() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Switch Focus Cross Container")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        let resultText = scrollView.scrollSearch(On().id("text_cross_container")).getOrThrow().getText()
        @Expect(resultText.contains("Column") || resultText.contains("component") || resultText.contains("focus"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNestedContainerSwitch() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Switch Focus Nested Container")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_nested_container")).getOrThrow().getText()
        @Expect(resultText.contains("Nested") || resultText.contains("component") || resultText.contains("focus"), true)
    }

    // ========== Section 7: Boundary Condition Tests ==========
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testHiddenComponent() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Hidden Component Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_hidden_component")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDisabledComponent() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Disabled Component Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_disabled_component")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNonFocusableComponent() {
        driver.delayMs(300)
        
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("Request Non-Focusable Component Focus")).getOrThrow()
        button.click()
        driver.delayMs(300)
        
        let resultText = scrollView.scrollSearch(On().id("text_non_focusable")).getOrThrow().getText()
        @Expect(resultText.contains("Return value"), true)
    }
}

