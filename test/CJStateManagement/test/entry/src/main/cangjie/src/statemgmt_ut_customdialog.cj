/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * Unit tests for @CustomDialog test cases (TC_145-TC_147)
 */
@Test
class StateManagementUTCustomDialog {
    prop driver: Driver {
        get() {
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
        driver.delayMs(500)
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500)
        Hilog.error(1, "Cangjie-Test", "StateManagementUTCustomDialog started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexCustomDialog"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_145: @CustomDialog Component Definition
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC145() {
        scrollTo("ViewCustomDialogTC145")
        driver.delayMs(500)
        
        // Test show dialog
        let showDialogButton = driver.findComponent(On().id("show_dialog_button")).getOrThrow()
        showDialogButton.click()
        driver.delayMs(500)
        
        // Verify dialog is displayed
        let dialogTitle = driver.findComponent(On().id("dialog_title")).getOrThrow()
        let dialogTitleValue = dialogTitle.getText()
        @Expect(dialogTitleValue.contains("Custom Dialog"), true)
        
        // Close dialog
        let closeButton = driver.findComponent(On().id("close_button")).getOrThrow()
        closeButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_146: @CustomDialog Combined with State Variables
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC146() {
        scrollTo("ViewCustomDialogTC146")
        driver.delayMs(500)
        
        // Test show dialog
        let showDialogButton = driver.findComponent(On().id("show_dialog_button")).getOrThrow()
        showDialogButton.click()
        driver.delayMs(500)
        
        // Verify initial dialog values
        let dialogValueDisplay = driver.findComponent(On().id("dialog_value_display")).getOrThrow()
        let dialogValue = dialogValueDisplay.getText()
        @Expect(dialogValue.contains("0"), true)
        
        // Test increment in dialog
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let dialogValueAfter = dialogValueDisplay.getText()
        @Expect(dialogValueAfter.contains("1"), true)
        
        // Close dialog
        let closeButton = driver.findComponent(On().id("close_button")).getOrThrow()
        closeButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_147: @CustomDialog Combined with @Builder
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC147() {
        scrollTo("ViewCustomDialogTC147")
        driver.delayMs(500)
        
        // Test show dialog
        let showDialogButton = driver.findComponent(On().id("show_dialog_button")).getOrThrow()
        showDialogButton.click()
        driver.delayMs(500)
        
        // Verify builder value is displayed
        let builderValueDisplay = driver.findComponent(On().id("builder_value_display")).getOrThrow()
        let builderValue = builderValueDisplay.getText()
        @Expect(builderValue.contains("0"), true)
        
        // Test increment builder value
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let builderValueAfter = builderValueDisplay.getText()
        @Expect(builderValueAfter.contains("1"), true)
        
        // Close dialog
        let closeButton = driver.findComponent(On().id("close_button")).getOrThrow()
        closeButton.click()
        driver.delayMs(300)
    }
}

