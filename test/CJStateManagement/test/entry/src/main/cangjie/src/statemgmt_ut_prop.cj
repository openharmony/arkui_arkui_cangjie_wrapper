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
 * Unit tests for @Prop macro test cases (TC_015-TC_024)
 */
@Test
class StateManagementUTProp {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTProp started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexProp"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_015: @Prop Receives Data from Parent Component (Primitive Types)
     * Test: Verify @Prop receives primitive types from parent and displays correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC015() {
        scrollTo("ViewPropTC015")
        driver.delayMs(500)
        
        // Verify initial values - parent and child
        let parentIntText = driver.findComponent(On().id("parent_int_text")).getOrThrow()
        let parentIntValue = parentIntText.getText()
        @Expect(parentIntValue, "Int64: 10")
        
        let childIntText = driver.findComponent(On().id("child_int_text")).getOrThrow()
        let childIntValue = childIntText.getText()
        @Expect(childIntValue, "Int64: 10")
        
        // Test parent update propagates to child - click update parent button
        let updateParentButton = driver.findComponent(On().id("update_parent_button")).getOrThrow()
        updateParentButton.click()
        driver.delayMs(300)
        
        // Verify parent values are updated
        let parentIntValueAfter = parentIntText.getText()
        @Expect(parentIntValueAfter, "Int64: 20")
        
        let parentStringText = driver.findComponent(On().id("parent_string_text")).getOrThrow()
        let parentStringValueAfter = parentStringText.getText()
        @Expect(parentStringValueAfter, "String: World")
        
        // Verify child @Prop values are updated (one-way data flow)
        let childIntValueAfter = childIntText.getText()
        @Expect(childIntValueAfter, "Int64: 20")
        
        let childStringText = driver.findComponent(On().id("child_string_text")).getOrThrow()
        let childStringValueAfter = childStringText.getText()
        @Expect(childStringValueAfter, "String: World")
    }
    
    /**
     * TC_016: @Prop Receives Data from Parent Component (Collection Types)
     * Test: Verify @Prop receives collection types from parent
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC016() {
        scrollTo("ViewPropTC016")
        driver.delayMs(500)
        
        // Verify child receives collection data - find both components first
        let arraySizeText = driver.findComponent(On().id("array_size_text")).getOrThrow()
        let arraySizeValue = arraySizeText.getText()
        @Expect(arraySizeValue.contains("3"), true)
        
        let arraylistSizeText = driver.findComponent(On().id("arraylist_size_text")).getOrThrow()
        let arraylistSizeValue = arraylistSizeText.getText()
        @Expect(arraylistSizeValue.contains("3"), true)
        
        // Test update parent array button
        let updateArrayButton = driver.findComponent(On().id("update_array_button")).getOrThrow()
        updateArrayButton.click()
        driver.delayMs(300)
        
        // Verify child array size is updated (from [1,2,3] to [10,20,30,40], size 3->4)
        let arraySizeValueAfter = updateArrayButton.getText()
        @Expect(arraySizeValueAfter.contains("4"), true)
        
        // Test add to parent ArrayList button
        let addArrayListButton = driver.findComponent(On().id("add_arraylist_button")).getOrThrow()
        addArrayListButton.click()
        driver.delayMs(300)
        
        // Verify child ArrayList size is updated (from 3 to 4)
        let arraylistSizeValueAfter = addArrayListButton.getText()
        @Expect(arraylistSizeValueAfter.contains("3"), true)
    }
    
    /**
     * TC_017: @Prop Receives Data from Parent Component (Custom Types)
     * Test: Verify @Prop receives custom @Observed types from parent
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC017() {
        scrollTo("ViewPropTC017")
        driver.delayMs(500)
        
        // Verify child receives custom object
        let childNameText = driver.findComponent(On().id("child_name_text")).getOrThrow()
        let childNameValue = childNameText.getText()
        @Expect(childNameValue.contains("Initial Name"), true)
        
        // Test parent object update - click update name button
        let updateNameButton = driver.findComponent(On().id("update_name_button")).getOrThrow()
        updateNameButton.click()
        driver.delayMs(300)
        
        // Verify child @Prop is updated
        let childNameValueAfter = childNameText.getText()
        @Expect(childNameValueAfter.contains("Updated Name"), true)
        
        // Test update value button
        let updateValueButton = driver.findComponent(On().id("update_value_button")).getOrThrow()
        updateValueButton.click()
        driver.delayMs(300)
        
        // Test replace object button
        let replaceObjectButton = driver.findComponent(On().id("replace_object_button")).getOrThrow()
        replaceObjectButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_018: @Prop Receives Data from Parent Component (Complex Nested Types)
     * Test: Verify @Prop receives complex nested types from parent
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC018() {
        scrollTo("ViewPropTC018")
        driver.delayMs(500)
        
        // Verify child receives nested structure
        let childTitleText = driver.findComponent(On().id("child_title_text")).getOrThrow()
        let childTitleValue = childTitleText.getText()
        @Expect(childTitleValue.contains("Initial Title"), true)
        
        // Test parent nested object update - click update title button
        let updateTitleButton = driver.findComponent(On().id("update_title_button")).getOrThrow()
        updateTitleButton.click()
        driver.delayMs(300)
        
        // Verify child @Prop is updated
        let childTitleValueAfter = childTitleText.getText()
        @Expect(childTitleValueAfter.contains("Updated Title"), true)
        
        // Test add item button
        let addItemButton = driver.findComponent(On().id("add_item_button")).getOrThrow()
        addItemButton.click()
        driver.delayMs(300)
        
        // Test update first item button
        let updateFirstItemButton = driver.findComponent(On().id("update_first_item_button")).getOrThrow()
        updateFirstItemButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_019: @Prop Unidirectional Data Flow Verification
     * Test: Verify @Prop only flows from parent to child, child cannot modify parent
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC019() {
        scrollTo("ViewPropTC019")
        driver.delayMs(500)
        
        // Verify initial state
        let parentValueText = driver.findComponent(On().id("parent_value_text")).getOrThrow()
        let parentValue = parentValueText.getText()
        @Expect(parentValue.contains("10"), true)
        
        let childPropText = driver.findComponent(On().id("child_prop_text")).getOrThrow()
        let childPropValue = childPropText.getText()
        @Expect(childPropValue.contains("10"), true)
        
        // Try to modify in child (should not affect parent) - click modify prop button
        let modifyPropButton = driver.findComponent(On().id("modify_prop_button")).getOrThrow()
        modifyPropButton.click()
        driver.delayMs(300)
        
        // Parent value should remain unchanged (unidirectional flow)
        let parentValueAfter = parentValueText.getText()
        @Expect(parentValueAfter.contains("10"), true)
        
        // Test increment parent button
        let incrementParentButton = driver.findComponent(On().id("increment_parent_button")).getOrThrow()
        incrementParentButton.click()
        driver.delayMs(300)
        
        // Parent value should be updated
        let parentValueFinal = parentValueText.getText()
        @Expect(parentValueFinal.contains("11"), true)
        
        // Child @Prop should be updated (one-way flow from parent)
        let childPropValueFinal = childPropText.getText()
        @Expect(childPropValueFinal.contains("11"), true)
    }
    
    /**
     * TC_020: @Prop Data Update Triggers Child Component Rebuild
     * Test: Verify parent @State update triggers child component rebuild
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC020() {
        scrollTo("ViewPropTC020")
        driver.delayMs(500)
        
        // Verify initial child display
        let childMessageText = driver.findComponent(On().id("child_message_text")).getOrThrow()
        let childMessageValue = childMessageText.getText()
        @Expect(childMessageValue.contains("Initial Message"), true)
        
        let childCountText = driver.findComponent(On().id("child_count_text")).getOrThrow()
        let childCountValue = childCountText.getText()
        @Expect(childCountValue.contains("0"), true)
        
        // Update parent state - click update message button
        let updateMessageButton = driver.findComponent(On().id("update_message_button")).getOrThrow()
        updateMessageButton.click()
        driver.delayMs(300)
        
        // Child should rebuild with new value
        let childMessageValueAfter = childMessageText.getText()
        @Expect(childMessageValueAfter.contains("Updated Message"), true)
        
        // Test increment count button
        let incrementCountButton = driver.findComponent(On().id("increment_count_button")).getOrThrow()
        incrementCountButton.click()
        driver.delayMs(300)
        
        let childCountValueAfter = childCountText.getText()
        @Expect(childCountValueAfter.contains("1"), true)
    }
    
    /**
     * TC_021: @Prop Variable Used in Child Component build() Method
     * Test: Verify @Prop variable can be used in child component build()
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC021() {
        scrollTo("ViewPropTC021")
        driver.delayMs(500)
        
        // Verify @Prop is used in build
        let childValueText = driver.findComponent(On().id("child_value_text")).getOrThrow()
        let childValueValue = childValueText.getText()
        @Expect(childValueValue.contains("5"), true)
        
        // Test parent update - click change title button
        let changeTitleButton = driver.findComponent(On().id("change_title_button")).getOrThrow()
        changeTitleButton.click()
        driver.delayMs(300)
        
        // Test increment value button
        let incrementValueButton = driver.findComponent(On().id("increment_value_button")).getOrThrow()
        incrementValueButton.click()
        driver.delayMs(300)
        
        // Child build should reflect updated @Prop
        let childValueValueAfter = childValueText.getText()
        @Expect(childValueValueAfter.contains("6"), true)
    }
    
    /**
     * TC_022: @Prop Variable Used in Child Component Conditional Rendering
     * Test: Verify @Prop variable works in child component conditional rendering
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC022() {
        scrollTo("ViewPropTC022")
        driver.delayMs(500)
        
        // Verify conditional rendering based on @Prop
        let visibleText = driver.findComponent(On().id("visible_text")).getOrThrow()
        let visibleValue = visibleText.getText()
        @Expect(visibleValue.contains("visible"), true)
        @Expect(visibleValue.contains("5"), true)
        
        // Test toggle condition - click toggle visibility button
        let toggleVisibilityButton = driver.findComponent(On().id("toggle_visibility_button")).getOrThrow()
        toggleVisibilityButton.click()
        driver.delayMs(300)
        
        // After toggle, should show hidden text
        let hiddenText = driver.findComponent(On().id("hidden_text")).getOrThrow()
        let hiddenValue = hiddenText.getText()
        @Expect(hiddenValue.contains("hidden"), true)
        
        // Test increment number button
        let incrementNumberButton = driver.findComponent(On().id("increment_number_button")).getOrThrow()
        incrementNumberButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_023: Multiple @Prop Variables Used Simultaneously
     * Test: Verify multiple @Prop variables work correctly together
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC023() {
        scrollTo("ViewPropTC023")
        driver.delayMs(500)
        
        // Verify multiple @Prop variables are displayed
        let childProp1Text = driver.findComponent(On().id("child_prop1_text")).getOrThrow()
        let childProp1Value = childProp1Text.getText()
        @Expect(childProp1Value.contains("10"), true)
        
        let childProp2Text = driver.findComponent(On().id("child_prop2_text")).getOrThrow()
        let childProp2Value = childProp2Text.getText()
        @Expect(childProp2Value.contains("Hello"), true)
        
        // Test parent updates - click update all button
        let updateAllButton = driver.findComponent(On().id("update_all_button")).getOrThrow()
        updateAllButton.click()
        driver.delayMs(300)
        
        // Both @Prop variables should be updated
        let childProp1ValueAfter = childProp1Text.getText()
        @Expect(childProp1ValueAfter.contains("20"), true)
        
        let childProp2ValueAfter = childProp2Text.getText()
        @Expect(childProp2ValueAfter.contains("World"), true)
        
        // Test increment prop1 button
        let incrementProp1Button = driver.findComponent(On().id("increment_prop1_button")).getOrThrow()
        incrementProp1Button.click()
        driver.delayMs(300)
        
        // Test toggle prop3 button
        let toggleProp3Button = driver.findComponent(On().id("toggle_prop3_button")).getOrThrow()
        toggleProp3Button.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_024: @Prop and @State Combined Usage
     * Test: Verify @Prop and @State can be used together in child component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPropTC024() {
        scrollTo("ViewPropTC024")
        driver.delayMs(500)
        
        // Verify @Prop and @State are both used
        let childPropText = driver.findComponent(On().id("child_prop_text")).getOrThrow()
        let childPropValue = childPropText.getText()
        @Expect(childPropValue.contains("Initial Prop Value"), true)
        
        let childStateText = driver.findComponent(On().id("child_state_text")).getOrThrow()
        let childStateValue = childStateText.getText()
        @Expect(childStateValue.contains("0"), true)
        
        // Test child @State update (should not affect parent) - click increment local button
        let incrementLocalButton = driver.findComponent(On().id("increment_local_button")).getOrThrow()
        incrementLocalButton.click()
        driver.delayMs(300)
        
        // Child @State should be updated
        let childStateValueAfter = childStateText.getText()
        @Expect(childStateValueAfter.contains("1"), true)
        
        // Test parent @State update (should update @Prop) - click increment parent state button
        let incrementParentStateButton = driver.findComponent(On().id("increment_parent_state_button")).getOrThrow()
        incrementParentStateButton.click()
        driver.delayMs(300)
        
        // Test update prop button
        let updatePropButton = driver.findComponent(On().id("update_prop_button")).getOrThrow()
        updatePropButton.click()
        driver.delayMs(300)
        
        // @Prop should be updated
        let childPropValueAfter = childPropText.getText()
        @Expect(childPropValueAfter.contains("Updated Prop Value"), true)
    }
}
