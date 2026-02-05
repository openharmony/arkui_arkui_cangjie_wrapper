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
 * Unit tests for @Observed/@Publish macro test cases (TC_048-TC_057)
 */
@Test
class StateManagementUTObservedPublish {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTObservedPublish started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexObservedPublish"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_048: @Observed Class Definition
     * Test: Verify @Observed class can be defined and instantiated
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC048() {
        scrollTo("ViewObservedPublishTC048")
        driver.delayMs(500)
        
        // Verify initial state
        let modelNameText = driver.findComponent(On().id("model_name_text")).getOrThrow()
        let modelNameValue = modelNameText.getText()
        @Expect(modelNameValue.contains("Test"), true)
        
        let modelValueText = driver.findComponent(On().id("model_value_text")).getOrThrow()
        let modelValue = modelValueText.getText()
        @Expect(modelValue.contains("10"), true)
        
        // Test update model
        let updateModelButton = driver.findComponent(On().id("update_model_button")).getOrThrow()
        updateModelButton.click()
        driver.delayMs(300)
        
        let modelNameAfter = modelNameText.getText()
        @Expect(modelNameAfter.contains("Updated"), true)
        
        let modelValueAfter = modelValueText.getText()
        @Expect(modelValueAfter.contains("100"), true)
    }
    
    /**
     * TC_049: @Observed Class as @State Type
     * Test: Verify @Observed class can be used as @State type
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC049() {
        scrollTo("ViewObservedPublishTC049")
        driver.delayMs(500)
        
        // Verify initial state
        let titleText = driver.findComponent(On().id("title_text")).getOrThrow()
        let titleValue = titleText.getText()
        @Expect(titleValue.contains("Initial Title"), true)
        
        // Test update @Publish variable - should trigger UI update
        let updateTitleButton = driver.findComponent(On().id("update_title_button")).getOrThrow()
        updateTitleButton.click()
        driver.delayMs(300)
        
        let titleValueAfter = titleText.getText()
        @Expect(titleValueAfter.contains("Updated Title"), true)
        
        // Test increment count button
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let countText = driver.findComponent(On().id("count_text")).getOrThrow()
        let countValue = countText.getText()
        @Expect(countValue.contains("1"), true)
        
        // Test increment multiple times
        incrementButton.click()
        driver.delayMs(200)
        incrementButton.click()
        driver.delayMs(200)
        
        let countValueMultiple = countText.getText()
        @Expect(countValueMultiple.contains("3"), true)
        
        // Test toggle enabled button
        let toggleButton = driver.findComponent(On().id("toggle_button")).getOrThrow()
        toggleButton.click()
        driver.delayMs(300)
        
        let enabledText = driver.findComponent(On().id("enabled_text")).getOrThrow()
        let enabledValue = enabledText.getText()
        @Expect(enabledValue.contains("false"), true)
        
        // Toggle again
        toggleButton.click()
        driver.delayMs(300)
        
        let enabledValueAfter = enabledText.getText()
        @Expect(enabledValueAfter.contains("true"), true)
    }
    
    /**
     * TC_050: @Observed Class as @Prop Type
     * Test: Verify @Observed class can be used as @Prop type
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC050() {
        scrollTo("ViewObservedPublishTC050")
        driver.delayMs(500)
        
        // Verify initial state - parent and child should have same values
        let parentNameText = driver.findComponent(On().id("parent_name_text")).getOrThrow()
        let parentNameValue = parentNameText.getText()
        @Expect(parentNameValue.contains("Player1"), true)
        
        let nameText = driver.findComponent(On().id("name_text")).getOrThrow()
        let nameValue = nameText.getText()
        @Expect(nameValue.contains("Player1"), true)
        
        // Test update in parent - should sync to child
        let updateNameButton = driver.findComponent(On().id("update_name_button")).getOrThrow()
        updateNameButton.click()
        driver.delayMs(300)
        
        // Verify parent updated
        let parentNameValueAfter = parentNameText.getText()
        @Expect(parentNameValueAfter.contains("Updated Player"), true)
        
        // Verify child @Prop is updated (one-way flow)
        let nameValueAfter = nameText.getText()
        @Expect(nameValueAfter.contains("Updated Player"), true)
        
        // Test update score button
        let updateScoreButton = driver.findComponent(On().id("update_score_button")).getOrThrow()
        updateScoreButton.click()
        driver.delayMs(300)
        
        // Verify score updated
        let parentScoreText = driver.findComponent(On().id("parent_score_text")).getOrThrow()
        let parentScoreValue = parentScoreText.getText()
        @Expect(parentScoreValue.contains("110"), true)
        
        let scoreText = driver.findComponent(On().id("score_text")).getOrThrow()
        let scoreValue = scoreText.getText()
        @Expect(scoreValue.contains("110"), true)
    }
    
    /**
     * TC_051: @Observed Class as @Link Type
     * Test: Verify @Observed class can be used as @Link type
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC051() {
        scrollTo("ViewObservedPublishTC051")
        driver.delayMs(500)
        
        // Verify initial state - parent and child should have same values
        let parentTitleText = driver.findComponent(On().id("parent_title_text")).getOrThrow()
        let parentTitleValue = parentTitleText.getText()
        @Expect(parentTitleValue.contains("Initial"), true)
        
        let titleText = driver.findComponent(On().id("title_text")).getOrThrow()
        let titleValue = titleText.getText()
        @Expect(titleValue.contains("Initial"), true)
        
        // Test modify in child - should sync to parent (two-way binding)
        let modifyChildButton = driver.findComponent(On().id("modify_child_button")).getOrThrow()
        modifyChildButton.click()
        driver.delayMs(300)
        
        // Verify parent updated
        let parentTitleAfter = parentTitleText.getText()
        @Expect(parentTitleAfter.contains("Modified in Child"), true)
        
        // Verify child updated
        let titleValueAfter = titleText.getText()
        @Expect(titleValueAfter.contains("Modified in Child"), true)
        
        // Test modify in parent - should sync to child
        let modifyParentButton = driver.findComponent(On().id("modify_parent_button")).getOrThrow()
        modifyParentButton.click()
        driver.delayMs(300)
        
        // Verify both updated
        let parentTitleFinal = parentTitleText.getText()
        @Expect(parentTitleFinal.contains("Modified in Parent"), true)
        
        let titleValueFinal = titleText.getText()
        @Expect(titleValueFinal.contains("Modified in Parent"), true)
    }
    
    /**
     * TC_052: @Publish Variable Definition (Primitive Types)
     * Test: Verify @Publish variables with primitive types work correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC052() {
        scrollTo("ViewObservedPublishTC052")
        driver.delayMs(500)
        
        // Verify initial state
        let intValueText = driver.findComponent(On().id("int_value_text")).getOrThrow()
        let intValue = intValueText.getText()
        @Expect(intValue.contains("10"), true)
        
        let stringValueText = driver.findComponent(On().id("string_value_text")).getOrThrow()
        let stringValue = stringValueText.getText()
        @Expect(stringValue.contains("Hello"), true)
        
        let boolValueText = driver.findComponent(On().id("bool_value_text")).getOrThrow()
        let boolValue = boolValueText.getText()
        @Expect(boolValue.contains("true"), true)
        
        // Test update @Publish variable - increment int
        let updateIntButton = driver.findComponent(On().id("update_int_button")).getOrThrow()
        updateIntButton.click()
        driver.delayMs(300)
        
        let intValueAfter = intValueText.getText()
        @Expect(intValueAfter.contains("11"), true)
        
        // Test update string
        let updateStringButton = driver.findComponent(On().id("update_string_button")).getOrThrow()
        updateStringButton.click()
        driver.delayMs(300)
        
        let stringValueAfter = stringValueText.getText()
        @Expect(stringValueAfter.contains("Updated String"), true)
        
        // Test toggle bool
        let toggleBoolButton = driver.findComponent(On().id("toggle_bool_button")).getOrThrow()
        toggleBoolButton.click()
        driver.delayMs(300)
        
        let boolValueAfter = boolValueText.getText()
        @Expect(boolValueAfter.contains("false"), true)
        
        // Test update float
        let updateFloatButton = driver.findComponent(On().id("update_float_button")).getOrThrow()
        updateFloatButton.click()
        driver.delayMs(300)
        
        let floatValueText = driver.findComponent(On().id("float_value_text")).getOrThrow()
        let floatValue = floatValueText.getText()
        @Expect(floatValue.contains("3.24"), true)
    }
    
    /**
     * TC_053: @Publish Variable Definition (Collection Types)
     * Test: Verify @Publish variables with collection types work correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC053() {
        scrollTo("ViewObservedPublishTC053")
        driver.delayMs(500)
        
        // Verify initial state
        let listSizeText = driver.findComponent(On().id("list_size_text")).getOrThrow()
        let listSizeValue = listSizeText.getText()
        @Expect(listSizeValue.contains("3"), true)
        
        // Test add to list - should trigger UI update
        let addListButton = driver.findComponent(On().id("add_list_button")).getOrThrow()
        addListButton.click()
        driver.delayMs(300)
        
        let listSizeAfter = listSizeText.getText()
        @Expect(listSizeAfter.contains("4"), true)
    }
    
    /**
     * TC_054: @Publish Variable Modification Triggers UI Update
     * Test: Verify @Publish variable modification triggers UI update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC054() {
        scrollTo("ViewObservedPublishTC054")
        driver.delayMs(500)
        
        // Verify initial state
        let counterText = driver.findComponent(On().id("counter_text")).getOrThrow()
        let counterValue = counterText.getText()
        @Expect(counterValue.contains("0"), true)
        
        // Test increment @Publish variable
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let counterValueAfter = counterText.getText()
        @Expect(counterValueAfter.contains("1"), true)
        
        // Verify update count increased
        let updateCountText = driver.findComponent(On().id("update_count_text")).getOrThrow()
        let updateCountValue = updateCountText.getText()
        @Expect(updateCountValue.contains("1"), true)
        
        // Test change message button
        let changeMessageButton = driver.findComponent(On().id("change_message_button")).getOrThrow()
        changeMessageButton.click()
        driver.delayMs(300)
        
        let messageText = driver.findComponent(On().id("message_text")).getOrThrow()
        let messageValue = messageText.getText()
        @Expect(messageValue.contains("Message 1"), true)
        
        // Verify update count increased
        let updateCountValueAfter = updateCountText.getText()
        @Expect(updateCountValueAfter.contains("2"), true)
        
        // Test toggle status button
        let toggleStatusButton = driver.findComponent(On().id("toggle_status_button")).getOrThrow()
        toggleStatusButton.click()
        driver.delayMs(300)
        
        let statusText = driver.findComponent(On().id("status_text")).getOrThrow()
        let statusValue = statusText.getText()
        @Expect(statusValue.contains("true"), true)
        
        // Verify update count increased
        let updateCountValueAfter2 = updateCountText.getText()
        @Expect(updateCountValueAfter2.contains("3"), true)
        
        // Test increment multiple times
        incrementButton.click()
        driver.delayMs(200)
        incrementButton.click()
        driver.delayMs(200)
        
        let counterValueMultiple = counterText.getText()
        @Expect(counterValueMultiple.contains("3"), true)
        
        // Verify update count increased
        let updateCountValueMultiple = updateCountText.getText()
        @Expect(updateCountValueMultiple.contains("5"), true)
    }
    
    /**
     * TC_055: Multiple @Publish Variables Simultaneous Use
     * Test: Verify multiple @Publish variables work correctly simultaneously
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC055() {
        scrollTo("ViewObservedPublishTC055")
        driver.delayMs(500)
        
        // Verify initial state
        let nameText = driver.findComponent(On().id("name_text")).getOrThrow()
        let nameValue = nameText.getText()
        @Expect(nameValue.contains("User1"), true)
        
        let ageText = driver.findComponent(On().id("age_text")).getOrThrow()
        let ageValue = ageText.getText()
        @Expect(ageValue.contains("25"), true)
        
        let scoreText = driver.findComponent(On().id("score_text")).getOrThrow()
        let scoreValue = scoreText.getText()
        @Expect(scoreValue.contains("85.5"), true)
        
        let activeText = driver.findComponent(On().id("active_text")).getOrThrow()
        let activeValue = activeText.getText()
        @Expect(activeValue.contains("true"), true)
        
        // Test update all @Publish variables
        let updateAllButton = driver.findComponent(On().id("update_all_button")).getOrThrow()
        updateAllButton.click()
        driver.delayMs(300)
        
        // Verify all fields updated
        let nameValueAfter = nameText.getText()
        @Expect(nameValueAfter.contains("Updated User"), true)
        
        let ageValueAfter = ageText.getText()
        @Expect(ageValueAfter.contains("26"), true)
        
        let scoreValueAfter = scoreText.getText()
        @Expect(scoreValueAfter.contains("87"), true)
        
        let activeValueAfter = activeText.getText()
        @Expect(activeValueAfter.contains("false"), true)
        
        // Verify tags count increased
        let tagsLabel = driver.findComponent(On().id("tags_label")).getOrThrow()
        let tagsValue = tagsLabel.getText()
        @Expect(tagsValue.contains("3"), true)
    }
    
    /**
     * TC_056: @Observed Class Nesting
     * Test: Verify @Observed class nesting works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC056() {
        scrollTo("ViewObservedPublishTC056")
        driver.delayMs(500)
        
        // Verify initial state
        let childNameText = driver.findComponent(On().id("child_name_text")).getOrThrow()
        let childNameValue = childNameText.getText()
        @Expect(childNameValue.contains("Child"), true)
        
        // Test update child @Observed object
        let updateChildButton = driver.findComponent(On().id("update_child_button")).getOrThrow()
        updateChildButton.click()
        driver.delayMs(300)
        
        let childNameAfter = childNameText.getText()
        @Expect(childNameAfter.contains("Updated"), true)
    }
    
    /**
     * TC_057: @Observed Class Used in Collections
     * Test: Verify @Observed class can be used in collections
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testObservedPublishTC057() {
        scrollTo("ViewObservedPublishTC057")
        driver.delayMs(500)
        
        // Verify initial state
        let listSizeText = driver.findComponent(On().id("list_size_text")).getOrThrow()
        let listSizeValue = listSizeText.getText()
        @Expect(listSizeValue.contains("3"), true)
        
        // Test update @Publish variable in first collection item
        let updateItemButton = driver.findComponent(On().id("update_item_button_0")).getOrThrow()
        updateItemButton.click()
        driver.delayMs(300)
        
        // Verify UI updated - check first item text
        let itemText = driver.findComponent(On().id("item_text_0")).getOrThrow()
        let itemValue = itemText.getText()
        @Expect(itemValue.contains("Updated"), true)
    }
}

