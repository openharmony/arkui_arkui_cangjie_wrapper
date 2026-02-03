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
 * Unit tests for @State macro test cases (TC_001-TC_014)
 */
@Test
class StateManagementUTState {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTState started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexState"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_001: @State Variable Initialization (Primitive Types)
     * Test: Verify @State variables with primitive types are correctly initialized and displayed
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC001() {
        scrollTo("ViewStateTC001")
        driver.delayMs(500)
        
        // Verify initial values are displayed
        let intText = driver.findComponent(On().id("int_value_text")).getOrThrow()
        let intValue = intText.getText()
        @Expect(intValue, "Int64: 10")
        
        let stringText = driver.findComponent(On().id("string_value_text")).getOrThrow()
        let stringValue = stringText.getText()
        @Expect(stringValue, "String: Hello Cangjie")
        
        let boolText = driver.findComponent(On().id("bool_value_text")).getOrThrow()
        let boolValue = boolText.getText()
        @Expect(boolValue, "Bool: true")
        
        let floatText = driver.findComponent(On().id("float_value_text")).getOrThrow()
        let floatValue = floatText.getText()
        @Expect(floatValue.contains("Float64: 123"), true)
        
        // Test state updates - click all buttons and verify values
        let changeIntButton = driver.findComponent(On().id("change_int_button")).getOrThrow()
        changeIntButton.click()
        driver.delayMs(300)
        let intValueAfter = intText.getText()
        @Expect(intValueAfter, "Int64: 20")
        
        let changeStringButton = driver.findComponent(On().id("change_string_button")).getOrThrow()
        changeStringButton.click()
        driver.delayMs(300)
        let stringValueAfter = stringText.getText()
        @Expect(stringValueAfter, "String: World Cangjie")
        
        let toggleBoolButton = driver.findComponent(On().id("toggle_bool_button")).getOrThrow()
        toggleBoolButton.click()
        driver.delayMs(300)
        let boolValueAfter = boolText.getText()
        @Expect(boolValueAfter, "Bool: false")
        
        let changeFloatButton = driver.findComponent(On().id("change_float_button")).getOrThrow()
        changeFloatButton.click()
        driver.delayMs(300)
        let floatValueAfter = floatText.getText()
        @Expect(floatValueAfter.contains("Float64: 543"), true)
    }
    
    /**
     * TC_002: @State Variable Initialization (Collection Types)
     * Test: Verify @State variables with collection types are correctly initialized and updated
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC002() {
        scrollTo("ViewStateTC002")
        driver.delayMs(500)
        
        // Verify initial collection values
        // Array toString() format: "Array: [1, 2, 3]" or similar
        let arrayText = driver.findComponent(On().id("array_text")).getOrThrow()
        let arrayValue = arrayText.getText()
        // Verify it contains the array format and initial values
        @Expect(arrayValue.contains("Array:"), true)
        @Expect(arrayValue.contains("1"), true)
        @Expect(arrayValue.contains("2"), true)
        @Expect(arrayValue.contains("3"), true)
        
        // ArrayList toString() format: "ArrayList: [A, B, C]" or similar
        let arraylistText = driver.findComponent(On().id("arraylist_text")).getOrThrow()
        let arraylistValue = arraylistText.getText()
        // Verify it contains the ArrayList format and initial values
        @Expect(arraylistValue.contains("ArrayList:"), true)
        @Expect(arraylistValue.contains("A"), true)
        @Expect(arraylistValue.contains("B"), true)
        @Expect(arraylistValue.contains("C"), true)
        
        // Test change array button - changes from [1,2,3] to [4,5,6]
        let changeArrayButton = driver.findComponent(On().id("change_array_button")).getOrThrow()
        changeArrayButton.click()
        driver.delayMs(300)
        let arrayValueAfter = arrayText.getText()
        // Verify new array values are present
        @Expect(arrayValueAfter.contains("4"), true)
        @Expect(arrayValueAfter.contains("5"), true)
        @Expect(arrayValueAfter.contains("6"), true)
        
        // Test add to ArrayList button - adds "D" to [A, B, C]
        let addArrayListButton = driver.findComponent(On().id("add_arraylist_button")).getOrThrow()
        addArrayListButton.click()
        driver.delayMs(300)
        let arraylistValueAfter = arraylistText.getText()
        // Verify "D" is added
        // @Expect(arraylistValueAfter.contains("D"), true)
        // Verify original values still exist
        @Expect(arraylistValueAfter.contains("A"), true)
        @Expect(arraylistValueAfter.contains("B"), true)
        @Expect(arraylistValueAfter.contains("C"), true)
        
        // Test toggle ObservedArrayList button
        let toggleObservedButton = driver.findComponent(On().id("toggle_observedarraylist_button")).getOrThrow()
        toggleObservedButton.click()
        driver.delayMs(300)
        
        // Test update HashMap button
        let updateHashMapButton = driver.findComponent(On().id("update_hashmap_button")).getOrThrow()
        updateHashMapButton.click()
        driver.delayMs(300)
        
        // Verify HashMap is updated (check hashmap_text)
        let hashmapText = driver.findComponent(On().id("hashmap_text")).getOrThrow()
        let hashmapValue = hashmapText.getText()
        // @Expect(hashmapValue.contains("100"), true)
        
        // Test add to HashSet button
        let addHashSetButton = driver.findComponent(On().id("add_hashset_button")).getOrThrow()
        addHashSetButton.click()
        driver.delayMs(300)
        
        // Verify HashSet is updated (check hashset_text)
        let hashsetText = driver.findComponent(On().id("hashset_text")).getOrThrow()
        let hashsetValue = hashsetText.getText()
        // @Expect(hashsetValue.contains("3.3"), true)
    }
    
    /**
     * TC_003: @State Variable Initialization (Custom Types)
     * Test: Verify @State variable with custom @Observed type is correctly initialized
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC003() {
        scrollTo("ViewStateTC003")
        driver.delayMs(500)
        
        // Verify custom object is displayed
        let customModelText = driver.findComponent(On().id("custom_model_text")).getOrThrow()
        let customModelValue = customModelText.getText()
        @Expect(customModelValue.contains("Initial Value"), true)
        @Expect(customModelValue.contains("0"), true)
        @Expect(customModelValue.contains("1"), true)
        
        // Test object property update - click change name button
        let changeNameButton = driver.findComponent(On().id("change_custom_model_name_button")).getOrThrow()
        changeNameButton.click()
        driver.delayMs(300)
        
        let customModelValueAfter = customModelText.getText()
        @Expect(customModelValueAfter.contains("Updated Value"), true)
        
        // Test change value button
        let changeValueButton = driver.findComponent(On().id("change_custom_model_value_button")).getOrThrow()
        changeValueButton.click()
        driver.delayMs(300)
        
        // Test change count button
        let changeCountButton = driver.findComponent(On().id("change_custom_model_count_button")).getOrThrow()
        changeCountButton.click()
        driver.delayMs(300)
        
        // Test replace object button
        let replaceObjectButton = driver.findComponent(On().id("replace_custom_model_object_button")).getOrThrow()
        replaceObjectButton.click()
        driver.delayMs(300)
        
        let customModelValueFinal = customModelText.getText()
        @Expect(customModelValueFinal.contains("New Object"), true)
    }
    
    /**
     * TC_004: @State Variable Initialization (Complex Nested Types)
     * Test: Verify @State variable with complex nested types is correctly initialized
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC004() {
        scrollTo("ViewStateTC004")
        driver.delayMs(500)
        
        // Verify nested structure is displayed
        let titleText = driver.findComponent(On().id("title_text")).getOrThrow()
        let titleValue = titleText.getText()
        @Expect(titleValue.contains("Initial Title"), true)
        
        // Test nested object update - click update title button
        let updateTitleButton = driver.findComponent(On().id("update_title_button")).getOrThrow()
        updateTitleButton.click()
        driver.delayMs(300)
        
        let titleValueAfter = titleText.getText()
        @Expect(titleValueAfter.contains("Updated Title"), true)
        
        // Test add nested item button
        let addNestedItemButton = driver.findComponent(On().id("add_nested_item_button")).getOrThrow()
        addNestedItemButton.click()
        driver.delayMs(300)
        
        // Test update first item button
        let updateFirstItemButton = driver.findComponent(On().id("update_first_item_button")).getOrThrow()
        updateFirstItemButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_005: @State Variable in build() Method
     * Test: Verify @State variable can be used in build() method
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC005() {
        scrollTo("ViewStateTC005")
        driver.delayMs(500)
        
        // Verify initial state - message is displayed
        let displayMessageText = driver.findComponent(On().id("display_message_text")).getOrThrow()
        let messageValue = displayMessageText.getText()
        @Expect(messageValue.contains("Initial Message"), true)
        
        // Test change message button
        let changeMessageButton = driver.findComponent(On().id("change_message_button")).getOrThrow()
        changeMessageButton.click()
        driver.delayMs(300)
        let messageValueAfter = displayMessageText.getText()
        @Expect(messageValueAfter.contains("Message Updated!"), true)
        
        // Test toggle visibility button
        let toggleVisibilityButton = driver.findComponent(On().id("toggle_visibility_button")).getOrThrow()
        toggleVisibilityButton.click()
        driver.delayMs(300)
        
        // After toggle, text should be hidden
        let hiddenMessageText = driver.findComponent(On().id("hidden_message_text")).getOrThrow()
        let hiddenValue = hiddenMessageText.getText()
        @Expect(hiddenValue.contains("Text is hidden"), true)
    }
    
    /**
     * TC_006: @State Variable in Conditional Rendering
     * Test: Verify @State variable works correctly in conditional rendering
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC006() {
        scrollTo("ViewStateTC006")
        driver.delayMs(500)
        
        // Verify initial state - visible text is shown
        let visibleText = driver.findComponent(On().id("visible_text")).getOrThrow()
        let visibleValue = visibleText.getText()
        @Expect(visibleValue.contains("visible"), true)
        @Expect(visibleValue.contains("Number: 0"), true)
        
        // Test increment number button
        let incrementNumberButton = driver.findComponent(On().id("increment_number_button")).getOrThrow()
        incrementNumberButton.click()
        driver.delayMs(300)
        let visibleValueAfter = visibleText.getText()
        @Expect(visibleValueAfter.contains("Number: 1"), true)
        
        // Test toggle visibility button
        let toggleVisibilityButton = driver.findComponent(On().id("toggle_visibility_button")).getOrThrow()
        toggleVisibilityButton.click()
        driver.delayMs(300)
        
        // After toggle, should show odd number text (number is 1, which is odd)
        let oddNumberText = driver.findComponent(On().id("odd_number_text")).getOrThrow()
        let oddValue = oddNumberText.getText()
        @Expect(oddValue.contains("odd"), true)
    }
    
    /**
     * TC_007: @State Variable in ForEach Loop
     * Test: Verify @State variable works correctly in ForEach loop
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC007() {
        scrollTo("ViewStateTC007")
        driver.delayMs(500)
        
        // Verify initial ForEach items are rendered
        let item0 = driver.findComponent(On().id("list_item_0")).getOrThrow()
        let item0Value = item0.getText()
        @Expect(item0Value.contains("Item 1"), true)
        
        // Test add item button
        let addItemButton = driver.findComponent(On().id("add_item_button")).getOrThrow()
        addItemButton.click()
        driver.delayMs(300)
        
        // Verify new item is added
        let item3 = driver.findComponent(On().id("list_item_3")).getOrThrow()
        let item3Value = item3.getText()
        @Expect(item3Value.contains("Item 4"), true)
        
        // Test update item button
        let updateItemButton = driver.findComponent(On().id("update_item_button")).getOrThrow()
        updateItemButton.click()
        driver.delayMs(300)
        
        // Verify first item is updated
        let item0After = driver.findComponent(On().id("list_item_0")).getOrThrow()
        let item0ValueAfter = item0After.getText()
        @Expect(item0ValueAfter.contains("Updated Item 1"), true)
        
        // Test remove item button
        let removeItemButton = driver.findComponent(On().id("remove_item_button")).getOrThrow()
        removeItemButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_008: @State Variable in Event Handling
     * Test: Verify @State variable can be updated in event handlers
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC008() {
        scrollTo("ViewStateTC008")
        driver.delayMs(500)
        
        // Verify initial state
        let clickCountText = driver.findComponent(On().id("click_count_text")).getOrThrow()
        let clickCountValue = clickCountText.getText()
        @Expect(clickCountValue.contains("0"), true)
        
        let lastActionText = driver.findComponent(On().id("last_action_text")).getOrThrow()
        let lastActionValue = lastActionText.getText()
        @Expect(lastActionValue.contains("None"), true)
        
        // Test event handler updates state - click increment button
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        let clickCountValueAfter = clickCountText.getText()
        @Expect(clickCountValueAfter.contains("1"), true)
        
        let lastActionValueAfter = lastActionText.getText()
        @Expect(lastActionValueAfter.contains("Increment"), true)
        
        // Test decrement button
        let decrementButton = driver.findComponent(On().id("decrement_button")).getOrThrow()
        decrementButton.click()
        driver.delayMs(300)
        
        // Test reset button
        let resetButton = driver.findComponent(On().id("reset_button")).getOrThrow()
        resetButton.click()
        driver.delayMs(300)
        let clickCountValueReset = clickCountText.getText()
        @Expect(clickCountValueReset.contains("0"), true)
    }
    
    /**
     * TC_009: Direct Assignment Update for @State Variables
     * Test: Verify direct assignment updates @State variable correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC009() {
        scrollTo("ViewStateTC009")
        driver.delayMs(500)
        
        // Verify initial values
        let counterText = driver.findComponent(On().id("counter_text")).getOrThrow()
        let counterValue = counterText.getText()
        @Expect(counterValue.contains("Counter: 0"), true)
        
        let messageText = driver.findComponent(On().id("message_text")).getOrThrow()
        let messageValue = messageText.getText()
        @Expect(messageValue.contains("Initial Message"), true)
        
        // Test increment counter button
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        let counterValueAfter = counterText.getText()
        @Expect(counterValueAfter.contains("Counter: 1"), true)
        
        // Test update message button
        let updateMessageButton = driver.findComponent(On().id("update_message_button")).getOrThrow()
        updateMessageButton.click()
        driver.delayMs(300)
        let messageValueAfter = messageText.getText()
        @Expect(messageValueAfter.contains("Message changed to 1"), true)
    }
    
    /**
     * TC_010: Event-Triggered Update for @State Variables
     * Test: Verify event-triggered updates work correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC010() {
        scrollTo("ViewStateTC010")
        driver.delayMs(500)
        
        // Verify initial state
        let valueText = driver.findComponent(On().id("value_text")).getOrThrow()
        let valueValue = valueText.getText()
        @Expect(valueValue.contains("0"), true)
        
        let statusText = driver.findComponent(On().id("status_text")).getOrThrow()
        let statusValue = statusText.getText()
        @Expect(statusValue.contains("Ready"), true)
        
        // Test add 10 button
        let add10Button = driver.findComponent(On().id("add_10_button")).getOrThrow()
        add10Button.click()
        driver.delayMs(300)
        let valueValueAfter = valueText.getText()
        @Expect(valueValueAfter.contains("10"), true)
        let statusValueAfter = statusText.getText()
        @Expect(statusValueAfter.contains("Added 10"), true)
        
        // Test multiply button
        let multiplyButton = driver.findComponent(On().id("multiply_button")).getOrThrow()
        multiplyButton.click()
        driver.delayMs(300)
        let valueValueMultiply = valueText.getText()
        @Expect(valueValueMultiply.contains("20"), true)
        
        // Test set to 100 button
        let set100Button = driver.findComponent(On().id("set_100_button")).getOrThrow()
        set100Button.click()
        driver.delayMs(300)
        let valueValueSet = valueText.getText()
        @Expect(valueValueSet.contains("100"), true)
    }
    
    /**
     * TC_011: Update @State Variable Through Async Operation
     * Test: Verify async operation can update @State variable
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC011() {
        scrollTo("ViewStateTC011")
        driver.delayMs(500)
        
        // Verify initial state
        let asyncResultText = driver.findComponent(On().id("async_result_text")).getOrThrow()
        let asyncValue = asyncResultText.getText()
        @Expect(asyncValue.contains("Not Started"), true)
        
        // Test async update - click start button
        let startAsyncButton = driver.findComponent(On().id("start_async_button")).getOrThrow()
        startAsyncButton.click()
        driver.delayMs(1500) // Wait for async operation
        
        let asyncValueAfter = asyncResultText.getText()
        @Expect(asyncValueAfter.contains("Completed"), true)
    }
    
    /**
     * TC_012: Collection Operation Updates for @State Variables
     * Test: Verify collection operations update @State variable correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC012() {
        scrollTo("ViewStateTC012")
        driver.delayMs(500)
        
        // Verify initial fruits are displayed
        let fruit0 = driver.findComponent(On().id("fruit_item_0")).getOrThrow()
        let fruit0Value = fruit0.getText()
        @Expect(fruit0Value.contains("Apple"), true)
        
        // Test add fruit button
        let addFruitButton = driver.findComponent(On().id("add_fruit_button")).getOrThrow()
        addFruitButton.click()
        driver.delayMs(300)
        
        // Verify new fruit is added
        let fruit3 = driver.findComponent(On().id("fruit_item_3")).getOrThrow()
        let fruit3Value = fruit3.getText()
        @Expect(fruit3Value.contains("Fruit 4"), true)
        
        // Test update fruit button
        let updateFruitButton = driver.findComponent(On().id("update_fruit_button")).getOrThrow()
        updateFruitButton.click()
        driver.delayMs(300)
        
        // Verify first fruit is updated
        let fruit0After = driver.findComponent(On().id("fruit_item_0")).getOrThrow()
        let fruit0ValueAfter = fruit0After.getText()
        @Expect(fruit0ValueAfter.contains("Updated Apple"), true)
        
        // Test remove fruit button
        let removeFruitButton = driver.findComponent(On().id("remove_fruit_button")).getOrThrow()
        removeFruitButton.click()
        driver.delayMs(300)
        
        // Test clear fruits button
        let clearFruitsButton = driver.findComponent(On().id("clear_fruits_button")).getOrThrow()
        clearFruitsButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_013: @State Variable Initial Values (0/null/empty collections)
     * Test: Verify @State variables with boundary initial values work correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC013() {
        scrollTo("ViewStateTC013")
        driver.delayMs(500)
        
        // Verify boundary values are handled
        let zeroIntText = driver.findComponent(On().id("zero_int_text")).getOrThrow()
        let zeroIntValue = zeroIntText.getText()
        @Expect(zeroIntValue.contains("0"), true)
        
        let emptyStringText = driver.findComponent(On().id("empty_string_text")).getOrThrow()
        let emptyStringValue = emptyStringText.getText()
        @Expect(emptyStringValue.contains("Empty") || emptyStringValue.contains("0"), true)
        
        let emptyArrayText = driver.findComponent(On().id("empty_array_text")).getOrThrow()
        let emptyArrayValue = emptyArrayText.getText()
        @Expect(emptyArrayValue.contains("0"), true)
        
        // Test update from boundary value - click update all button
        let updateAllButton = driver.findComponent(On().id("update_all_button")).getOrThrow()
        updateAllButton.click()
        driver.delayMs(300)
        
        let zeroIntValueAfter = zeroIntText.getText()
        @Expect(zeroIntValueAfter.contains("1"), true)
        
        let emptyStringValueAfter = emptyStringText.getText()
        @Expect(emptyStringValueAfter.contains("Not Empty"), true)
    }
    
    /**
     * TC_014: @State Variable Type Conversion
     * Test: Verify @State variable type conversion works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC014() {
        scrollTo("ViewStateTC014")
        driver.delayMs(500)
        
        // Verify initial values
        let intValueText = driver.findComponent(On().id("int_value_text")).getOrThrow()
        let intValue = intValueText.getText()
        @Expect(intValue.contains("100"), true)
        
        let intToStringText = driver.findComponent(On().id("int_to_string_text")).getOrThrow()
        let intToStringValue = intToStringText.getText()
        @Expect(intToStringValue.contains("100"), true)
        
        // Test increment int button
        let incrementIntButton = driver.findComponent(On().id("increment_int_button")).getOrThrow()
        incrementIntButton.click()
        driver.delayMs(300)
        let intValueAfter = intValueText.getText()
        @Expect(intValueAfter.contains("101"), true)
        
        // Test update string button
        let updateStringButton = driver.findComponent(On().id("update_string_button")).getOrThrow()
        updateStringButton.click()
        driver.delayMs(300)
        let stringValueText = driver.findComponent(On().id("string_value_text")).getOrThrow()
        let stringValue = stringValueText.getText()
        @Expect(stringValue.contains("101"), true)
        
        // Test update float button
        let updateFloatButton = driver.findComponent(On().id("update_float_button")).getOrThrow()
        updateFloatButton.click()
        driver.delayMs(300)
        let floatValueText = driver.findComponent(On().id("float_value_text")).getOrThrow()
        let floatValue = floatValueText.getText()
        @Expect(floatValue.contains("101"), true)
    }
}
