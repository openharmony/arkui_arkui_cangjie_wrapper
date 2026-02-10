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
 * Unit tests for state variable usage in components (TC_093-TC_102)
 */
@Test
class StateManagementUTComponentUsage {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTComponentUsage started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexComponentUsage"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_093: @State Variable Used in Text Component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC093() {
        scrollTo("ViewComponentTC093")
        driver.delayMs(500)
        
        // Verify initial values
        let textValueDisplay = driver.findComponent(On().id("text_value_display")).getOrThrow()
        let textValue = textValueDisplay.getText()
        @Expect(textValue.contains("Initial Text"), true)
        
        let numberValueDisplay = driver.findComponent(On().id("number_value_display")).getOrThrow()
        let numberValue = numberValueDisplay.getText()
        @Expect(numberValue.contains("42"), true)
        
        // Test update text
        let updateTextButton = driver.findComponent(On().id("update_text_button")).getOrThrow()
        updateTextButton.click()
        driver.delayMs(300)
        
        let textValueAfter = textValueDisplay.getText()
        @Expect(textValueAfter.contains("Updated Text"), true)
        
        // Test update number
        let updateNumberButton = driver.findComponent(On().id("update_number_button")).getOrThrow()
        updateNumberButton.click()
        driver.delayMs(300)
        
        let numberValueAfter = numberValueDisplay.getText()
        @Expect(numberValueAfter.contains("43"), true)
    }
    
    /**
     * TC_094: @State Variable Used in Button Component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC094() {
        scrollTo("ViewComponentTC094")
        driver.delayMs(500)
        
        // Verify initial state
        let clickCountDisplay = driver.findComponent(On().id("click_count_display")).getOrThrow()
        let clickCountValue = clickCountDisplay.getText()
        @Expect(clickCountValue.contains("0"), true)
        
        // Test click dynamic button
        let dynamicButton = driver.findComponent(On().id("dynamic_button")).getOrThrow()
        dynamicButton.click()
        driver.delayMs(300)
        
        let clickCountAfter = clickCountDisplay.getText()
        @Expect(clickCountAfter.contains("1"), true)
        
        // Test update button text
        let updateTextButton = driver.findComponent(On().id("update_text_button")).getOrThrow()
        updateTextButton.click()
        driver.delayMs(300)
        
        // Test toggle enabled
        let toggleEnabledButton = driver.findComponent(On().id("toggle_enabled_button")).getOrThrow()
        toggleEnabledButton.click()
        driver.delayMs(300)
        
        let enabledStatusDisplay = driver.findComponent(On().id("enabled_status_display")).getOrThrow()
        let enabledStatus = enabledStatusDisplay.getText()
        @Expect(enabledStatus.contains("false"), true)
    }
    
    /**
     * TC_099: @State Variable Controls If Conditional Rendering
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC099() {
        scrollTo("ViewComponentTC099")
        driver.delayMs(500)
        
        // Verify initial state - main content should be visible
        let mainContent = driver.findComponent(On().id("main_content")).getOrThrow()
        let mainContentText = mainContent.getText()
        @Expect(mainContentText.contains("Main Content"), true)
        
        // Test toggle content
        let toggleContentButton = driver.findComponent(On().id("toggle_content_button")).getOrThrow()
        toggleContentButton.click()
        driver.delayMs(300)
        
        // Alternative content should be visible now
        let alternativeContent = driver.findComponent(On().id("alternative_content")).getOrThrow()
        let alternativeContentText = alternativeContent.getText()
        @Expect(alternativeContentText.contains("Alternative Content"), true)
    }
    
    /**
     * TC_100: @State Variable Controls Multiple If Conditional Rendering
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC100() {
        scrollTo("ViewComponentTC100")
        driver.delayMs(500)
        
        // Verify initial state - item1 and item2 should be visible
        let item1 = driver.findComponent(On().id("item1")).getOrThrow()
        let item2 = driver.findComponent(On().id("item2")).getOrThrow()
        
        // Test toggle item1
        let toggleItem1Button = driver.findComponent(On().id("toggle_item1_button")).getOrThrow()
        toggleItem1Button.click()
        driver.delayMs(300)
        
        // Test toggle item2
        let toggleItem2Button = driver.findComponent(On().id("toggle_item2_button")).getOrThrow()
        toggleItem2Button.click()
        driver.delayMs(300)
        
        // Test toggle item3
        let toggleItem3Button = driver.findComponent(On().id("toggle_item3_button")).getOrThrow()
        toggleItem3Button.click()
        driver.delayMs(300)
        
        let item3 = driver.findComponent(On().id("item3")).getOrThrow()
        let item3Text = item3.getText()
        @Expect(item3Text.contains("Item 3"), true)
    }
    
    /**
     * TC_101: @State Collection Used in ForEach
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC101() {
        scrollTo("ViewComponentTC101")
        driver.delayMs(500)
        
        // Verify initial list size
        let listSizeDisplay = driver.findComponent(On().id("list_size_display")).getOrThrow()
        let listSizeValue = listSizeDisplay.getText()
        @Expect(listSizeValue.contains("3"), true)
        
        // Test add item
        let addItemButton = driver.findComponent(On().id("add_item_button")).getOrThrow()
        addItemButton.click()
        driver.delayMs(300)
        
        let listSizeAfter = listSizeDisplay.getText()
        @Expect(listSizeAfter.contains("4"), true)
        
        // Test remove first item
        let removeFirstButton = driver.findComponent(On().id("remove_first_button")).getOrThrow()
        removeFirstButton.click()
        driver.delayMs(300)
        
        let listSizeAfter2 = listSizeDisplay.getText()
        @Expect(listSizeAfter2.contains("3"), true)
    }
}

