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
 * Unit tests for state-driven update scenarios (TC_103-TC_114)
 */
@Test
class StateManagementUTStateDriven {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTStateDriven started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexStateDriven"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_103: onClick Event Drives @State Update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC103() {
        scrollTo("ViewDrivenTC103")
        driver.delayMs(500)
        
        // Verify initial state
        let clickCountText = driver.findComponent(On().id("click_count_display")).getOrThrow()
        let clickCountValue = clickCountText.getText()
        @Expect(clickCountValue.contains("0"), true)
        
        // Test click button
        let clickButton = driver.findComponent(On().id("click_button")).getOrThrow()
        clickButton.click()
        driver.delayMs(300)
        
        let clickCountAfter = clickCountText.getText()
        @Expect(clickCountAfter.contains("1"), true)
        
        // Test multiple clicks
        clickButton.click()
        driver.delayMs(300)
        clickButton.click()
        driver.delayMs(300)
        
        let clickCountFinal = clickCountText.getText()
        @Expect(clickCountFinal.contains("3"), true)
    }
    
    /**
     * TC_104: onInput Event Drives @State Update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC104() {
        scrollTo("ViewDrivenTC104")
        driver.delayMs(500)
        
        // Verify initial state
        let inputValueText = driver.findComponent(On().id("input_value_display")).getOrThrow()
        let inputValue = inputValueText.getText()
        @Expect(inputValue.contains(""), true)
    }
    
    /**
     * TC_111: Collection add Operation Drives Update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC111() {
        scrollTo("ViewDrivenTC111")
        driver.delayMs(500)
        
        // Verify initial list size
        let listSizeText = driver.findComponent(On().id("list_size_display")).getOrThrow()
        let listSizeValue = listSizeText.getText()
        @Expect(listSizeValue.contains("2"), true)
        
        // Test add item
        let addItemButton = driver.findComponent(On().id("add_item_button")).getOrThrow()
        addItemButton.click()
        driver.delayMs(300)
        
        let listSizeAfter = listSizeText.getText()
        @Expect(listSizeAfter.contains("3"), true)
        
        // Test add multiple items
        let addMultipleButton = driver.findComponent(On().id("add_multiple_button")).getOrThrow()
        addMultipleButton.click()
        driver.delayMs(300)
        
        let listSizeFinal = listSizeText.getText()
        @Expect(listSizeFinal.contains("6"), true)
    }
    
    /**
     * TC_112: Collection remove Operation Drives Update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC112() {
        scrollTo("ViewDrivenTC112")
        driver.delayMs(500)
        
        // Verify initial list size
        let listSizeText = driver.findComponent(On().id("list_size_display")).getOrThrow()
        let listSizeValue = listSizeText.getText()
        @Expect(listSizeValue.contains("5"), true)
        
        // Test remove first item
        let removeFirstButton = driver.findComponent(On().id("remove_first_button")).getOrThrow()
        removeFirstButton.click()
        driver.delayMs(300)
        
        let listSizeAfter = listSizeText.getText()
        @Expect(listSizeAfter.contains("4"), true)
        
        // Test remove last item
        let removeLastButton = driver.findComponent(On().id("remove_last_button")).getOrThrow()
        removeLastButton.click()
        driver.delayMs(300)
        
        let listSizeAfter2 = listSizeText.getText()
        @Expect(listSizeAfter2.contains("3"), true)
    }
}

