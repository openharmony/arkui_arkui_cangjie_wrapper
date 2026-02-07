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
 * Unit tests for multi-macro combination scenarios (TC_115-TC_123)
 */
@Test
class StateManagementUTMultiMacro {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTMultiMacro started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexMultiMacro"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_115: @State + @Prop + @Link Combination
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC115() {
        scrollTo("ViewMultiTC115")
        driver.delayMs(500)
        
        // Verify initial state
        let stateValueDisplay = driver.findComponent(On().id("state_value_display")).getOrThrow()
        let stateValue = stateValueDisplay.getText()
        @Expect(stateValue.contains("0"), true)
        
        let linkValueDisplay = driver.findComponent(On().id("link_value_display")).getOrThrow()
        let linkValue = linkValueDisplay.getText()
        @Expect(linkValue.contains("100"), true)
        
        // Test update state
        let updateStateButton = driver.findComponent(On().id("update_state_button")).getOrThrow()
        updateStateButton.click()
        driver.delayMs(300)
        
        let stateValueAfter = stateValueDisplay.getText()
        @Expect(stateValueAfter.contains("1"), true)
        
        // Test update link from child
        let childDisplay = driver.findComponent(On().id("child_display")).getOrThrow()
        let updateLinkButton = driver.findComponent(On().id("update_link_button")).getOrThrow()
        updateLinkButton.click()
        driver.delayMs(300)
        
        let linkValueAfter = linkValueDisplay.getText()
        @Expect(linkValueAfter.contains("110"), true)
    }
    
    /**
     * TC_118: @State + @Builder Combination
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC118() {
        scrollTo("ViewMultiTC118")
        driver.delayMs(500)
        
        // Verify initial builder value
        let builderValueDisplay = driver.findComponent(On().id("builder_value_display")).getOrThrow()
        let builderValue = builderValueDisplay.getText()
        @Expect(builderValue.contains("0"), true)
        
        // Test update builder value
        let updateValueButton = driver.findComponent(On().id("update_value_button")).getOrThrow()
        updateValueButton.click()
        driver.delayMs(300)
        
        let builderValueAfter = builderValueDisplay.getText()
        @Expect(builderValueAfter.contains("1"), true)
        
        // Test update builder text
        let updateTextButton = driver.findComponent(On().id("update_text_button")).getOrThrow()
        updateTextButton.click()
        driver.delayMs(300)
        
        let builderTextDisplay = driver.findComponent(On().id("builder_text_display")).getOrThrow()
        let builderText = builderTextDisplay.getText()
        @Expect(builderText.contains("Updated Text"), true)
    }
    
    /**
     * TC_120: @State + @StorageLink Combination
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC120() {
        scrollTo("ViewMultiTC120")
        driver.delayMs(500)
        
        // Verify initial values
        let localStateDisplay = driver.findComponent(On().id("local_state_display")).getOrThrow()
        let localStateValue = localStateDisplay.getText()
        @Expect(localStateValue.contains("0"), true)
        
        let sharedValueDisplay = driver.findComponent(On().id("shared_value_display")).getOrThrow()
        let sharedValue = sharedValueDisplay.getText()
        @Expect(sharedValue.contains("100"), true)
        
        // Test update local state
        let updateLocalButton = driver.findComponent(On().id("update_local_button")).getOrThrow()
        updateLocalButton.click()
        driver.delayMs(300)
        
        let localStateAfter = localStateDisplay.getText()
        @Expect(localStateAfter.contains("1"), true)
        
        // Test update shared value
        let updateSharedButton = driver.findComponent(On().id("update_shared_button")).getOrThrow()
        updateSharedButton.click()
        driver.delayMs(300)
        
        let sharedValueAfter = sharedValueDisplay.getText()
        @Expect(sharedValueAfter.contains("110"), true)
    }
    
    /**
     * TC_121: @State + @LocalStorageLink Combination
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC121() {
        scrollTo("ViewMultiTC121")
        driver.delayMs(500)
        
        // Verify initial values
        let localStateDisplay = driver.findComponent(On().id("local_state_display")).getOrThrow()
        let localStateValue = localStateDisplay.getText()
        @Expect(localStateValue.contains("0"), true)
        
        let localstorageValueDisplay = driver.findComponent(On().id("localstorage_value_display")).getOrThrow()
        let localstorageValue = localstorageValueDisplay.getText()
        @Expect(localstorageValue.contains("200"), true)
        
        // Test update local state
        let updateLocalButton = driver.findComponent(On().id("update_local_button")).getOrThrow()
        updateLocalButton.click()
        driver.delayMs(300)
        
        let localStateAfter = localStateDisplay.getText()
        @Expect(localStateAfter.contains("1"), true)
        
        // Test update LocalStorage value
        let updateLocalstorageButton = driver.findComponent(On().id("update_localstorage_button")).getOrThrow()
        updateLocalstorageButton.click()
        driver.delayMs(300)
        
        let localstorageValueAfter = localstorageValueDisplay.getText()
        @Expect(localstorageValueAfter.contains("210"), true)
    }
}

