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
 * Unit tests for @StorageLink/@StorageProp macro test cases (TC_069-TC_077)
 */
@Test
class StateManagementUTStorage {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTStorage started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexStorage"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_069: @StorageLink Variable Definition (Primitive Types)
     * Test: Verify @StorageLink variables with primitive types are correctly initialized
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC069() {
        scrollTo("ViewStorageTC069")
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
        
        // Test update Float64
        let floatText = driver.findComponent(On().id("float_text")).getOrThrow()
        let floatValue = floatText.getText()
        @Expect(floatValue.contains("3.14"), true)
        
        let updateFloatButton = driver.findComponent(On().id("update_float_button")).getOrThrow()
        updateFloatButton.click()
        driver.delayMs(300)
        let floatValueAfter = floatText.getText()
        @Expect(floatValueAfter.contains("6.28"), true)
    }
    
    /**
     * TC_070: @StorageLink Two-way Binding Verification
     * Test: Verify @StorageLink two-way binding works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC070() {
        scrollTo("ViewStorageTC070")
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
        let parentCountAfterChild = parentCountText.getText()
        @Expect(parentCountAfterChild.contains("2"), true)
        let childCountAfterChild = childCountText.getText()
        @Expect(childCountAfterChild.contains("2"), true)
        
        // Test decrement in parent
        let parentDecrementButton = driver.findComponent(On().id("parent_decrement_button")).getOrThrow()
        parentDecrementButton.click()
        driver.delayMs(300)
        let parentCountAfterDecrement = parentCountText.getText()
        @Expect(parentCountAfterDecrement.contains("1"), true)
        
        // Verify child component also updated
        let childCountAfterDecrement = childCountText.getText()
        @Expect(childCountAfterDecrement.contains("1"), true)
        
        // Test decrement again
        parentDecrementButton.click()
        driver.delayMs(300)
        let parentCountFinal = parentCountText.getText()
        @Expect(parentCountFinal.contains("0"), true)
        let childCountFinal = childCountText.getText()
        @Expect(childCountFinal.contains("0"), true)
    }
    
    /**
     * TC_071: @StorageLink Cross-component Sharing
     * Test: Verify multiple components using same key @StorageLink sync correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC071() {
        scrollTo("ViewStorageTC071")
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
     * TC_073: @StorageProp Variable Definition (Primitive Types)
     * Test: Verify @StorageProp variables with primitive types are correctly initialized
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC073() {
        scrollTo("ViewStorageTC073")
        driver.delayMs(500)
        
        // Verify initial values
        let intText = driver.findComponent(On().id("int_text")).getOrThrow()
        let intValue = intText.getText()
        @Expect(intValue.contains("50"), true)
        
        // Test update AppStorage Int64
        let updateStorageIntButton = driver.findComponent(On().id("update_storage_int_button")).getOrThrow()
        updateStorageIntButton.click()
        driver.delayMs(300)
        let intValueAfter = intText.getText()
        @Expect(intValueAfter.contains("100"), true)
        
        // Test update AppStorage String
        let updateStorageStringButton = driver.findComponent(On().id("update_storage_string_button")).getOrThrow()
        updateStorageStringButton.click()
        driver.delayMs(300)
        let stringText = driver.findComponent(On().id("string_text")).getOrThrow()
        let stringValue = stringText.getText()
        @Expect(stringValue.contains("Updated"), true)
    }
    
    /**
     * TC_074: @StorageProp One-way Binding Verification
     * Test: Verify @StorageProp one-way binding works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC074() {
        scrollTo("ViewStorageTC074")
        driver.delayMs(500)
        
        // Verify initial count
        let countText = driver.findComponent(On().id("count_textView_StorageTC074")).getOrThrow()
        let countValue = countText.getText()
        @Expect(countValue.contains("0"), true)
        
        // Test increment in AppStorage
        let incrementStorageButton = driver.findComponent(On().id("increment_storage_button074")).getOrThrow()
        incrementStorageButton.click()
        driver.delayMs(300)
        let countValueAfter = countText.getText()
        @Expect(countValueAfter.contains("1"), true)
        
        // Test set to 100 in AppStorage
        let setStorageButton = driver.findComponent(On().id("set_storage_button_TC074")).getOrThrow()
        setStorageButton.click()
        driver.delayMs(300)
        let countValueFinal = countText.getText()
        @Expect(countValueFinal.contains("100"), true)
    }
    
    /**
     * TC_075: @StorageProp Variable Used in Component
     * Test: Verify @StorageProp variable can be used in build() method
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC075() {
        scrollTo("ViewStorageTC075")
        driver.delayMs(500)
        
        // Verify initial message
        let messageDisplay = driver.findComponent(On().id("message_display")).getOrThrow()
        let messageValue = messageDisplay.getText()
        @Expect(messageValue.contains("Hello"), true)
        
        // Test set to "World" in AppStorage
        let setWorldButton = driver.findComponent(On().id("set_world_button")).getOrThrow()
        setWorldButton.click()
        driver.delayMs(300)
        let messageValueAfter = messageDisplay.getText()
        @Expect(messageValueAfter.contains("World"), true)
        
        // Test set to "Hello World" in AppStorage
        let setHelloWorldButton = driver.findComponent(On().id("set_hello_world_button")).getOrThrow()
        setHelloWorldButton.click()
        driver.delayMs(300)
        let messageValueFinal = messageDisplay.getText()
        @Expect(messageValueFinal.contains("Hello World"), true)
        
        // Verify greeting text appears
        let greetingText = driver.findComponent(On().id("greeting_text")).getOrThrow()
        let greetingValue = greetingText.getText()
        @Expect(greetingValue.contains("Greeting"), true)
    }
    
    /**
     * TC_076: @StorageLink/@StorageProp Passing Complex Types
     * Test: Verify @StorageLink/@StorageProp can pass complex types
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC076() {
        scrollTo("ViewStorageTC076")
        driver.delayMs(500)
        
        // Verify initial array
        let arrayText = driver.findComponent(On().id("array_text")).getOrThrow()
        let arrayValue = arrayText.getText()
        @Expect(arrayValue.contains("1") && arrayValue.contains("2") && arrayValue.contains("3"), true)
        
        // Test update array
        let updateArrayButton = driver.findComponent(On().id("update_array_button")).getOrThrow()
        updateArrayButton.click()
        driver.delayMs(300)
        let arrayValueAfter = arrayText.getText()
        @Expect(arrayValueAfter.contains("4") && arrayValueAfter.contains("5") && arrayValueAfter.contains("6"), true)
        
        // Test update AppStorage ArrayList
        let updateStorageArrayListButton = driver.findComponent(On().id("update_storage_arraylist_button")).getOrThrow()
        updateStorageArrayListButton.click()
        driver.delayMs(300)
        let arraylistText = driver.findComponent(On().id("arraylist_text")).getOrThrow()
        let arraylistValue = arraylistText.getText()
        @Expect(arraylistValue.contains("X") && arraylistValue.contains("Y") && arraylistValue.contains("Z"), true)
    }
    
    /**
     * TC_077: @StorageLink Combined with @State
     * Test: Verify @StorageLink and @State work together correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC077() {
        scrollTo("ViewStorageTC077")
        driver.delayMs(500)
        
        // Verify initial values
        let storageValueText = driver.findComponent(On().id("storage_value_text")).getOrThrow()
        let storageValue = storageValueText.getText()
        @Expect(storageValue.contains("0"), true)
        
        let localValueText = driver.findComponent(On().id("local_value_text")).getOrThrow()
        let localValue = localValueText.getText()
        @Expect(localValue.contains("0"), true)
        
        // Test increment storage value
        let incrementStorageButton = driver.findComponent(On().id("increment_storage_button_TC077")).getOrThrow()
        incrementStorageButton.click()
        driver.delayMs(300)
        let storageValueAfter = storageValueText.getText()
        @Expect(storageValueAfter.contains("1"), true)
        
        // Test increment local value
        let incrementLocalButton = driver.findComponent(On().id("increment_local_button")).getOrThrow()
        incrementLocalButton.click()
        driver.delayMs(300)
        let localValueAfter = localValueText.getText()
        @Expect(localValueAfter.contains("1"), true)
        
        // Increment both values multiple times
        incrementStorageButton.click()
        driver.delayMs(200)
        incrementLocalButton.click()
        driver.delayMs(200)
        incrementStorageButton.click()
        driver.delayMs(200)
        
        // Verify both values are independent and incremented
        let storageValueMultiple = storageValueText.getText()
        @Expect(storageValueMultiple.contains("3"), true)
        
        let localValueMultiple = localValueText.getText()
        @Expect(localValueMultiple.contains("2"), true)
        
        // Test reset button - should reset both values
        let resetButton = driver.findComponent(On().id("reset_button")).getOrThrow()
        resetButton.click()
        driver.delayMs(300)
        
        // Verify both values are reset
        let storageValueFinal = storageValueText.getText()
        @Expect(storageValueFinal.contains("0"), true)
        
        let localValueFinal = localValueText.getText()
        @Expect(localValueFinal.contains("0"), true)
    }

    /**
     * TC_072: @StorageLink Variable Used in Component
     * Test: Verify @StorageLink variable can be used in build() method
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStorageTC072() {
        scrollTo("ViewStorageTC072")
        driver.delayMs(500)
        
        // Verify initial text
        let textDisplay = driver.findComponent(On().id("text_display")).getOrThrow()
        let textValue = textDisplay.getText()
        @Expect(textValue.contains("Initial"), true)
        
        // Test TextInput input - should update @StorageLink
        let textInput = driver.findComponent(On().id("text_input")).getOrThrow()
        textInput.inputText("User Input")
        driver.delayMs(500)
        
        // Verify text display updated
        let textValueAfterInput = textDisplay.getText()
        @Expect(textValueAfterInput.contains("User Input"), true)
        
        // Test set to "Hello World"
        let setHelloButton = driver.findComponent(On().id("set_hello_button")).getOrThrow()
        setHelloButton.click()
        driver.delayMs(300)
        let textValueAfter = textDisplay.getText()
        @Expect(textValueAfter.contains("Hello World"), true)
        
        // Verify TextInput also updated
        let textInputValue = textInput.getText()
        @Expect(textInputValue.contains("Hello World"), true)
        
        // Test set to "Cangjie"
        let setCangjieButton = driver.findComponent(On().id("set_cangjie_button")).getOrThrow()
        setCangjieButton.click()
        driver.delayMs(300)
        let textValueFinal = textDisplay.getText()
        @Expect(textValueFinal.contains("Cangjie"), true)
        
        // Test append button
        let appendButton = driver.findComponent(On().id("append_button")).getOrThrow()
        appendButton.click()
        driver.delayMs(300)
        let textValueAppended = textDisplay.getText()
        @Expect(textValueAppended.contains("Cangjie!"), true)
    }
    
}

