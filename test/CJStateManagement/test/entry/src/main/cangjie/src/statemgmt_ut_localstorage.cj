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
 * Unit tests for @LocalStorageLink/@LocalStorageProp macro test cases (TC_078-TC_083)
 */
@Test
class StateManagementUTLocalStorage {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTLocalStorage started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexLocalStorage"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_078: @LocalStorageLink Variable Definition
     * Test: Verify @LocalStorageLink variables are correctly initialized
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocalStorageTC078() {
        scrollTo("ViewLocalStorageTC078")
        driver.delayMs(500)
        
        // Verify initial values
        let intText = driver.findComponent(On().id("int_text")).getOrThrow()
        let intValue = intText.getText()
        @Expect(intValue.contains("100"), true)
        
        let stringText = driver.findComponent(On().id("string_text")).getOrThrow()
        let stringValue = stringText.getText()
        @Expect(stringValue.contains("Hello"), true)
        
        let boolText = driver.findComponent(On().id("bool_text")).getOrThrow()
        let boolValue = boolText.getText()
        @Expect(boolValue.contains("true"), true)
        
        // Test update Int64
        let updateIntButton = driver.findComponent(On().id("update_int_button")).getOrThrow()
        updateIntButton.click()
        driver.delayMs(300)
        let intValueAfter = intText.getText()
        @Expect(intValueAfter.contains("200"), true)
        
        // Test update String
        let updateStringButton = driver.findComponent(On().id("update_string_button")).getOrThrow()
        updateStringButton.click()
        driver.delayMs(300)
        let stringValueAfter = stringText.getText()
        @Expect(stringValueAfter.contains("World"), true)
        
        // Test update Bool
        let updateBoolButton = driver.findComponent(On().id("update_bool_button")).getOrThrow()
        updateBoolButton.click()
        driver.delayMs(300)
        let boolValueAfter = boolText.getText()
        @Expect(boolValueAfter.contains("false"), true)
        
        // Toggle bool again
        updateBoolButton.click()
        driver.delayMs(300)
        let boolValueFinal = boolText.getText()
        @Expect(boolValueFinal.contains("true"), true)
    }
    
    /**
     * TC_079: @LocalStorageLink Two-way Binding Verification
     * Test: Verify @LocalStorageLink two-way binding works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocalStorageTC079() {
        scrollTo("ViewLocalStorageTC079")
        driver.delayMs(500)
        
        // Verify initial count
        let parentCountText = driver.findComponent(On().id("parent_count_text")).getOrThrow()
        let parentCountValue = parentCountText.getText()
        @Expect(parentCountValue.contains("0"), true)
        
        // Test increment in parent
        let parentIncrementButton = driver.findComponent(On().id("parent_increment_button")).getOrThrow()
        parentIncrementButton.click()
        driver.delayMs(300)
        let parentCountAfter = parentCountText.getText()
        @Expect(parentCountAfter.contains("1"), true)
        
        // Verify child component also updated
        let childCountText = driver.findComponent(On().id("child_count_text")).getOrThrow()
        let childCountValue = childCountText.getText()
        @Expect(childCountValue.contains("1"), true)
        
        // Test increment in child
        let childIncrementButton = driver.findComponent(On().id("child_increment_button")).getOrThrow()
        childIncrementButton.click()
        driver.delayMs(300)
        let parentCountFinal = parentCountText.getText()
        @Expect(parentCountFinal.contains("2"), true)
        let childCountFinal = childCountText.getText()
        @Expect(childCountFinal.contains("2"), true)
    }
    
    /**
     * TC_080: @LocalStorageLink Cross-component Sharing
     * Test: Verify multiple components using same key @LocalStorageLink sync correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocalStorageTC080() {
        scrollTo("ViewLocalStorageTC080")
        driver.delayMs(500)
        
        // Verify initial value
        let mainValueText = driver.findComponent(On().id("main_value_text")).getOrThrow()
        let mainValue = mainValueText.getText()
        @Expect(mainValue.contains("0"), true)
        
        // Test set in main component
        let mainButton = driver.findComponent(On().id("main_button")).getOrThrow()
        mainButton.click()
        driver.delayMs(300)
        let mainValueAfter = mainValueText.getText()
        @Expect(mainValueAfter.contains("5"), true)
        
        // Verify component1 also updated
        let comp1ValueText = driver.findComponent(On().id("comp1_value_text")).getOrThrow()
        let comp1Value = comp1ValueText.getText()
        @Expect(comp1Value.contains("5"), true)
        
        // Test set in component1
        let comp1Button = driver.findComponent(On().id("comp1_button")).getOrThrow()
        comp1Button.click()
        driver.delayMs(300)
        let mainValueFinal = mainValueText.getText()
        @Expect(mainValueFinal.contains("10"), true)
        let comp1ValueFinal = comp1ValueText.getText()
        @Expect(comp1ValueFinal.contains("10"), true)
    }
    
    /**
     * TC_081: @LocalStorageProp Variable Definition
     * Test: Verify @LocalStorageProp variables are correctly initialized
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocalStorageTC081() {
        scrollTo("ViewLocalStorageTC081")
        driver.delayMs(500)
        
        // Verify initial values
        let intText = driver.findComponent(On().id("int_text")).getOrThrow()
        let intValue = intText.getText()
        @Expect(intValue.contains("50"), true)
        
        // Test update LocalStorage Int64
        let updateStorageIntButton = driver.findComponent(On().id("update_storage_int_button")).getOrThrow()
        updateStorageIntButton.click()
        driver.delayMs(300)
        let intValueAfter = intText.getText()
        @Expect(intValueAfter.contains("100"), true)
        
        // Test update LocalStorage String
        let updateStorageStringButton = driver.findComponent(On().id("update_storage_string_button")).getOrThrow()
        updateStorageStringButton.click()
        driver.delayMs(300)
        let stringText = driver.findComponent(On().id("string_text")).getOrThrow()
        let stringValue = stringText.getText()
        @Expect(stringValue.contains("Updated"), true)
        
        // Test update LocalStorage Bool
        let boolText = driver.findComponent(On().id("bool_text")).getOrThrow()
        let boolValue = boolText.getText()
        @Expect(boolValue.contains("false"), true)
        
        let updateStorageBoolButton = driver.findComponent(On().id("update_storage_bool_button")).getOrThrow()
        updateStorageBoolButton.click()
        driver.delayMs(300)
        let boolValueAfter = boolText.getText()
        @Expect(boolValueAfter.contains("true"), true)
    }
    
    /**
     * TC_082: @LocalStorageProp One-way Binding Verification
     * Test: Verify @LocalStorageProp one-way binding works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocalStorageTC082() {
        scrollTo("ViewLocalStorageTC082")
        driver.delayMs(500)
        
        // Verify initial count
        let countText = driver.findComponent(On().id("count_text")).getOrThrow()
        let countValue = countText.getText()
        @Expect(countValue.contains("0"), true)
        
        // Test increment in LocalStorage
        let incrementStorageButton = driver.findComponent(On().id("increment_storage_button")).getOrThrow()
        incrementStorageButton.click()
        driver.delayMs(300)
        let countValueAfter = countText.getText()
        @Expect(countValueAfter.contains("1"), true)
        
        // Test increment again
        incrementStorageButton.click()
        driver.delayMs(300)
        let countValueAfter2 = countText.getText()
        @Expect(countValueAfter2.contains("2"), true)
        
        // Test decrement in LocalStorage
        let decrementStorageButton = driver.findComponent(On().id("decrement_storage_button")).getOrThrow()
        decrementStorageButton.click()
        driver.delayMs(300)
        let countValueAfterDecrement = countText.getText()
        @Expect(countValueAfterDecrement.contains("1"), true)
        
        // Test set to 100 in LocalStorage
        let setStorageButton = driver.findComponent(On().id("set_storage_button")).getOrThrow()
        setStorageButton.click()
        driver.delayMs(300)
        let countValueFinal = countText.getText()
        @Expect(countValueFinal.contains("100"), true)
    }
    
    /**
     * TC_083: @LocalStorageLink Combined with @State
     * Test: Verify @LocalStorageLink and @State work together correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocalStorageTC083() {
        scrollTo("ViewLocalStorageTC083")
        driver.delayMs(500)
        
        // Verify initial values
        let localValueText = driver.findComponent(On().id("local_value_text")).getOrThrow()
        let localValue = localValueText.getText()
        @Expect(localValue.contains("0"), true)
        
        let stateValueText = driver.findComponent(On().id("state_value_text")).getOrThrow()
        let stateValue = stateValueText.getText()
        @Expect(stateValue.contains("0"), true)
        
        // Test increment local value
        let incrementLocalButton = driver.findComponent(On().id("increment_local_button")).getOrThrow()
        incrementLocalButton.click()
        driver.delayMs(300)
        let localValueAfter = localValueText.getText()
        @Expect(localValueAfter.contains("1"), true)
        
        // Test increment state value
        let incrementStateButton = driver.findComponent(On().id("increment_state_button")).getOrThrow()
        incrementStateButton.click()
        driver.delayMs(300)
        let stateValueAfter = stateValueText.getText()
        @Expect(stateValueAfter.contains("1"), true)
        
        // Increment both values multiple times
        incrementLocalButton.click()
        driver.delayMs(200)
        incrementStateButton.click()
        driver.delayMs(200)
        incrementLocalButton.click()
        driver.delayMs(200)
        
        // Verify both values are independent and incremented
        let localValueMultiple = localValueText.getText()
        @Expect(localValueMultiple.contains("3"), true)
        
        let stateValueMultiple = stateValueText.getText()
        @Expect(stateValueMultiple.contains("2"), true)
        
        // Test reset button - should reset both values
        let resetButton = driver.findComponent(On().id("reset_button")).getOrThrow()
        resetButton.click()
        driver.delayMs(300)
        
        // Verify both values are reset
        let localValueFinal = localValueText.getText()
        @Expect(localValueFinal.contains("0"), true)
        
        let stateValueFinal = stateValueText.getText()
        @Expect(stateValueFinal.contains("0"), true)
    }
}

