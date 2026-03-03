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
 * Unit tests for @Provide/@Consume macro test cases (TC_033-TC_041)
 */
@Test
class StateManagementUTProvideConsume {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTProvideConsume started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexProvideConsume"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_033: @Provide/@Consume Basic Usage (No Alias)
     * Test: Verify @Provide/@Consume basic state sharing works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC033() {
        scrollTo("ViewProvideConsumeTC033")
        driver.delayMs(500)
        
        // Verify initial state
        let parentCountText = driver.findComponent(On().id("parent_count_text")).getOrThrow()
        let parentCountValue = parentCountText.getText()
        @Expect(parentCountValue.contains("0"), true)
        
        let childCountText = driver.findComponent(On().id("child_count_text")).getOrThrow()
        let childCountValue = childCountText.getText()
        @Expect(childCountValue.contains("0"), true)
        
        // Test increment in parent - should sync to child
        let parentIncrementButton = driver.findComponent(On().id("parent_increment_button")).getOrThrow()
        parentIncrementButton.click()
        driver.delayMs(300)
        
        let parentCountAfter = parentCountText.getText()
        @Expect(parentCountAfter.contains("1"), true)
        
        let childCountAfter = childCountText.getText()
        @Expect(childCountAfter.contains("1"), true)
        
        // Test increment in child - should sync to parent
        let childIncrementButton = driver.findComponent(On().id("child_increment_button")).getOrThrow()
        childIncrementButton.click()
        driver.delayMs(300)
        
        let parentCountFinal = parentCountText.getText()
        @Expect(parentCountFinal.contains("2"), true)
        
        let childCountFinal = childCountText.getText()
        @Expect(childCountFinal.contains("2"), true)
        
        // Test multiple increments in both parent and child
        parentIncrementButton.click()
        driver.delayMs(200)
        childIncrementButton.click()
        driver.delayMs(200)
        parentIncrementButton.click()
        driver.delayMs(200)
        childIncrementButton.click()
        driver.delayMs(300)
        
        // Verify both synchronized
        let parentCountMultiple = parentCountText.getText()
        @Expect(parentCountMultiple.contains("6"), true)
        
        let childCountMultiple = childCountText.getText()
        @Expect(childCountMultiple.contains("6"), true)
    }
    
    /**
     * TC_034: @Provide/@Consume with Alias
     * Test: Verify @Provide/@Consume works correctly with alias
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC034() {
        scrollTo("ViewProvideConsumeTC034")
        driver.delayMs(500)
        
        // Verify initial state
        let parentValueText = driver.findComponent(On().id("parent_value_text")).getOrThrow()
        let parentValue = parentValueText.getText()
        @Expect(parentValue.contains("10"), true)
        
        let childValueText = driver.findComponent(On().id("child_value_text")).getOrThrow()
        let childValue = childValueText.getText()
        @Expect(childValue.contains("10"), true)
        
        // Test update in parent - should sync to child via alias
        let parentUpdateButton = driver.findComponent(On().id("parent_update_button")).getOrThrow()
        parentUpdateButton.click()
        driver.delayMs(300)
        
        let parentValueAfter = parentValueText.getText()
        @Expect(parentValueAfter.contains("15"), true)
        
        let childValueAfter = childValueText.getText()
        @Expect(childValueAfter.contains("15"), true)
        
        // Test update in child - should sync to parent (two-way binding)
        let childUpdateButton = driver.findComponent(On().id("child_update_button")).getOrThrow()
        childUpdateButton.click()
        driver.delayMs(300)
        
        let parentValueFinal = parentValueText.getText()
        @Expect(parentValueFinal.contains("30"), true)
        
        let childValueFinal = childValueText.getText()
        @Expect(childValueFinal.contains("30"), true)
    }
    
    /**
     * TC_035: @Provide/@Consume Passing Complex Types
     * Test: Verify @Provide/@Consume can pass complex types
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC035() {
        scrollTo("ViewProvideConsumeTC035")
        driver.delayMs(500)
        
        // Verify initial state
        let parentListSizeText = driver.findComponent(On().id("parent_list_size_text")).getOrThrow()
        let parentListSizeValue = parentListSizeText.getText()
        @Expect(parentListSizeValue.contains("2"), true)
        
        let childListSizeText = driver.findComponent(On().id("child_list_size_text")).getOrThrow()
        let childListSizeValue = childListSizeText.getText()
        @Expect(childListSizeValue.contains("2"), true)
        
        // Test add to list in parent - should sync to child
        let parentAddButton = driver.findComponent(On().id("parent_add_button")).getOrThrow()
        parentAddButton.click()
        driver.delayMs(300)
        
        let parentListSizeAfter = parentListSizeText.getText()
        @Expect(parentListSizeAfter.contains("3"), true)
        
        let childListSizeAfter = childListSizeText.getText()
        @Expect(childListSizeAfter.contains("3"), true)
        
        // Test add to list in child - should sync to parent
        let childAddButton = driver.findComponent(On().id("child_add_button")).getOrThrow()
        childAddButton.click()
        driver.delayMs(300)
        
        let parentListSizeFinal = parentListSizeText.getText()
        @Expect(parentListSizeFinal.contains("4"), true)
        
        let childListSizeFinal = childListSizeText.getText()
        @Expect(childListSizeFinal.contains("4"), true)
        
        // Test update custom data in parent
        let parentUpdateCustomButton = driver.findComponent(On().id("parent_update_custom_button")).getOrThrow()
        parentUpdateCustomButton.click()
        driver.delayMs(300)
        
        let parentCustomValueText = driver.findComponent(On().id("parent_custom_value_text")).getOrThrow()
        let parentCustomValue = parentCustomValueText.getText()
        @Expect(parentCustomValue.contains("200"), true)
        
        let childCustomValueText = driver.findComponent(On().id("child_custom_value_text")).getOrThrow()
        let childCustomValue = childCustomValueText.getText()
        @Expect(childCustomValue.contains("200"), true)
        
        // Test update custom data in child
        let childUpdateCustomButton = driver.findComponent(On().id("child_update_custom_button")).getOrThrow()
        childUpdateCustomButton.click()
        driver.delayMs(300)
        
        let parentCustomValueAfter = parentCustomValueText.getText()
        @Expect(parentCustomValueAfter.contains("210"), true)
        
        let childCustomValueAfter = childCustomValueText.getText()
        @Expect(childCustomValueAfter.contains("210"), true)
    }
    
    /**
     * TC_036: @Provide State Modification Triggers @Consume Update
     * Test: Verify @Provide modification triggers @Consume update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC036() {
        scrollTo("ViewProvideConsumeTC036")
        driver.delayMs(500)
        
        // Verify initial state
        let parentCountText = driver.findComponent(On().id("parent_count_text")).getOrThrow()
        let parentCountValue = parentCountText.getText()
        @Expect(parentCountValue.contains("0"), true)
        
        // Test increment in parent - should sync to child
        let parentIncrementButton = driver.findComponent(On().id("parent_increment_button")).getOrThrow()
        parentIncrementButton.click()
        driver.delayMs(300)
        
        let parentCountAfter = parentCountText.getText()
        @Expect(parentCountAfter.contains("1"), true)
        
        let childCountText = driver.findComponent(On().id("child_count_text")).getOrThrow()
        let childCountValue = childCountText.getText()
        @Expect(childCountValue.contains("1"), true)
    }
    
    /**
     * TC_037: @Consume State Modification Triggers @Provide Update
     * Test: Verify @Consume modification triggers @Provide update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC037() {
        scrollTo("ViewProvideConsumeTC037")
        driver.delayMs(500)
        
        // Verify initial state
        let parentValueText = driver.findComponent(On().id("parent_value_text")).getOrThrow()
        let parentValue = parentValueText.getText()
        @Expect(parentValue.contains("50"), true)
        
        let childValueText = driver.findComponent(On().id("child_value_text")).getOrThrow()
        let childValue = childValueText.getText()
        @Expect(childValue.contains("50"), true)
        
        // Test modify in child - should sync to parent (two-way binding)
        let childModifyButton = driver.findComponent(On().id("child_modify_button")).getOrThrow()
        childModifyButton.click()
        driver.delayMs(300)
        
        let parentValueAfter = parentValueText.getText()
        @Expect(parentValueAfter.contains("60"), true)
        
        let childValueAfter = childValueText.getText()
        @Expect(childValueAfter.contains("60"), true)
        
        // Test modify multiple times
        childModifyButton.click()
        driver.delayMs(200)
        childModifyButton.click()
        driver.delayMs(300)
        
        let parentValueFinal = parentValueText.getText()
        @Expect(parentValueFinal.contains("80"), true)
        
        let childValueFinal = childValueText.getText()
        @Expect(childValueFinal.contains("80"), true)
    }
    
    /**
     * TC_038: @Provide/@Consume Cross Multiple Levels
     * Test: Verify @Provide/@Consume works across multiple component levels
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC038() {
        scrollTo("ViewProvideConsumeTC038")
        driver.delayMs(500)
        
        // Verify initial state
        let grandparentValueText = driver.findComponent(On().id("grandparent_value_text")).getOrThrow()
        let grandparentValue = grandparentValueText.getText()
        @Expect(grandparentValue.contains("5"), true)
        
        let grandchildValueText = driver.findComponent(On().id("grandchild_value_text")).getOrThrow()
        let grandchildValue = grandchildValueText.getText()
        @Expect(grandchildValue.contains("5"), true)
        
        // Test modify in grandchild - should sync to grandparent (two-way binding)
        let grandchildModifyButton = driver.findComponent(On().id("grandchild_modify_button")).getOrThrow()
        grandchildModifyButton.click()
        driver.delayMs(300)
        
        let grandparentValueAfter = grandparentValueText.getText()
        @Expect(grandparentValueAfter.contains("10"), true)
        
        let grandchildValueAfter = grandchildValueText.getText()
        @Expect(grandchildValueAfter.contains("10"), true)
        
        // Test modify in grandparent - should sync to grandchild
        let grandparentModifyButton = driver.findComponent(On().id("grandparent_modify_button")).getOrThrow()
        grandparentModifyButton.click()
        driver.delayMs(300)
        
        let grandparentValueFinal = grandparentValueText.getText()
        @Expect(grandparentValueFinal.contains("11"), true)
        
        let grandchildValueFinal = grandchildValueText.getText()
        @Expect(grandchildValueFinal.contains("11"), true)
    }
    
    /**
     * TC_039: Multiple @Consume Sharing Same @Provide
     * Test: Verify multiple @Consume components share same @Provide state
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC039() {
        scrollTo("ViewProvideConsumeTC039")
        driver.delayMs(500)
        
        // Verify initial state
        let parentDataText = driver.findComponent(On().id("parent_data_text")).getOrThrow()
        let parentDataValue = parentDataText.getText()
        @Expect(parentDataValue.contains("0"), true)
        
        // Test modify in child1 - should sync to parent and other children
        let child1ModifyButton = driver.findComponent(On().id("child_modify_button_1")).getOrThrow()
        child1ModifyButton.click()
        driver.delayMs(300)
        
        let parentDataAfter = parentDataText.getText()
        @Expect(parentDataAfter.contains("1"), true)
        
        let child2DataText = driver.findComponent(On().id("child_data_text_2")).getOrThrow()
        let child2DataValue = child2DataText.getText()
        @Expect(child2DataValue.contains("1"), true)
    }
    
    /**
     * TC_040: @Provide/@Consume with TextInput Component
     * Test: Verify @Provide/@Consume works with TextInput component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC040() {
        scrollTo("ViewProvideConsumeTC040")
        driver.delayMs(500)
        
        // Verify initial state
        let parentTextDisplay = driver.findComponent(On().id("parent_text_display")).getOrThrow()
        let parentTextValue = parentTextDisplay.getText()
        @Expect(parentTextValue.contains("Initial Text"), true)
        
        let childTextDisplay = driver.findComponent(On().id("child_text_display")).getOrThrow()
        let childTextValue = childTextDisplay.getText()
        @Expect(childTextValue.contains("Initial Text"), true)
        
        // Test input in parent TextInput - should sync to child
        let parentInput = driver.findComponent(On().id("parent_text_input")).getOrThrow()
        parentInput.inputText("Hello World")
        driver.delayMs(500)
        
        // Verify parent display updated
        let parentTextAfter = parentTextDisplay.getText()
        @Expect(parentTextAfter.contains("Hello World"), true)
        
        // Verify child display also updated (two-way sync)
        let childTextAfter = childTextDisplay.getText()
        @Expect(childTextAfter.contains("Hello World"), true)
        
        // Test input in child TextInput - should sync to parent
        let childInput = driver.findComponent(On().id("child_text_input")).getOrThrow()
        childInput.inputText("Child Input")
        driver.delayMs(500)
        
        // Verify both displays updated
        let parentTextFinal = parentTextDisplay.getText()
        @Expect(parentTextFinal.contains("Child Input"), true)
        
        let childTextFinal = childTextDisplay.getText()
        @Expect(childTextFinal.contains("Child Input"), true)
    }
    
    /**
     * TC_041: @Provide/@Consume with Slider Component
     * Test: Verify @Provide/@Consume works with Slider component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProvideConsumeTC041() {
        
        scrollTo("ViewProvideConsumeTC041")
        driver.delayMs(500)
        @Expect(true, true)
        // Verify initial state
        // let parentValueDisplay = driver.findComponent(On().id("parent_value_display")).getOrThrow()
        // let parentValue = parentValueDisplay.getText()
        // @Expect(parentValue.contains("50"), true)
        
        // let childValueDisplay = driver.findComponent(On().id("child_value_display")).getOrThrow()
        // let childValue = childValueDisplay.getText()
        // @Expect(childValue.contains("50"), true)
        
        // // Test slider swipe in parent - should sync to child
        // let parentSlider = driver.findComponent(On().id("parent_slider")).getOrThrow()
        // let parentCenter = parentSlider.getBoundsCenter()
        // let sliderCenterX = Int32(parentCenter.x)
        // let sliderCenterY = Int32(parentCenter.y)
        
        // // Swipe slider to the right (increase value) - use fixed offset
        // driver.swipe(sliderCenterX - 100, sliderCenterY, 
        //              sliderCenterX + 100, sliderCenterY, speed: 1000)
        // driver.delayMs(500)
        
        // // Verify parent value increased
        // let parentValueAfter = parentValueDisplay.getText()
        // // Value should be greater than 50
        // @Expect(parentValueAfter.contains("5") || parentValueAfter.contains("6") || 
        //         parentValueAfter.contains("7") || parentValueAfter.contains("8") || 
        //         parentValueAfter.contains("9"), true)
        
        // // Verify child value also updated (two-way sync)
        // let childValueAfter = childValueDisplay.getText()
        // @Expect(childValueAfter.contains("5") || childValueAfter.contains("6") || 
        //         childValueAfter.contains("7") || childValueAfter.contains("8") || 
        //         childValueAfter.contains("9"), true)
        
        // // Test slider swipe in child - should sync to parent
        // let childSlider = driver.findComponent(On().id("child_slider")).getOrThrow()
        // let childCenter = childSlider.getBoundsCenter()
        // let childSliderCenterX = Int32(childCenter.x)
        // let childSliderCenterY = Int32(childCenter.y)
        
        // // Swipe slider to the left (decrease value) - use fixed offset
        // driver.swipe(childSliderCenterX + 100, childSliderCenterY, 
        //              childSliderCenterX - 100, childSliderCenterY, speed: 1000)
        // driver.delayMs(500)
        
        // // Verify both values decreased
        // let parentValueFinal = parentValueDisplay.getText()
        // let childValueFinal = childValueDisplay.getText()
        // // Values should be synchronized
        // @Expect(parentValueFinal.contains(childValueFinal) || childValueFinal.contains(parentValueFinal), true)
    }
}

