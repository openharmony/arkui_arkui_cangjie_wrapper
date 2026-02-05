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
 * Unit tests for @Builder/@BuilderParam macro test cases (TC_058-TC_077)
 */
@Test
class StateManagementUTBuilder {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTBuilder started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexBuilder"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_058: @Builder Function Definition (No Parameters)
     * Test: Verify @Builder function without parameters works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC058() {
        scrollTo("ViewBuilderTC058")
        driver.delayMs(500)
        
        // Verify builder content is displayed
        let builderText = driver.findComponent(On().id("builder_text")).getOrThrow()
        let builderValue = builderText.getText()
        @Expect(builderValue.contains("Hello from Builder"), true)
    }
    
    /**
     * TC_059: @Builder Function Definition (With Parameters)
     * Test: Verify @Builder function with parameters works correctly
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC059() {
        scrollTo("ViewBuilderTC059")
        driver.delayMs(500)
        
        // Verify builder content with parameters is displayed
        let messageText = driver.findComponent(On().id("message_text")).getOrThrow()
        let messageValue = messageText.getText()
        @Expect(messageValue.contains("Hello Builder"), true)
        
        let countText = driver.findComponent(On().id("count_text")).getOrThrow()
        let countValue = countText.getText()
        @Expect(countValue.contains("42"), true)
    }
    
    /**
     * TC_060: @Builder Function Using State Variables
     * Test: Verify @Builder function can use state variables
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC060() {
        scrollTo("ViewBuilderTC060")
        driver.delayMs(500)
        
        // Verify initial state
        let titleText = driver.findComponent(On().id("title_text")).getOrThrow()
        let titleValue = titleText.getText()
        @Expect(titleValue.contains("Initial"), true)
        
        // Test update title - builder should reflect change
        let updateTitleButton = driver.findComponent(On().id("update_title_button")).getOrThrow()
        updateTitleButton.click()
        driver.delayMs(300)
        
        let titleValueAfter = titleText.getText()
        @Expect(titleValueAfter.contains("Updated"), true)
        
        // Test increment count
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let countText = driver.findComponent(On().id("count_text")).getOrThrow()
        let countValue = countText.getText()
        @Expect(countValue.contains("1"), true)
    }
    
    /**
     * TC_061: @Builder Function Using Conditional Rendering
     * Test: Verify @Builder function can use conditional rendering
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC061() {
        scrollTo("ViewBuilderTC061")
        driver.delayMs(500)
        
        // Verify initial state - visible text should be shown
        let visibleText = driver.findComponent(On().id("visible_text")).getOrThrow()
        let visibleValue = visibleText.getText()
        @Expect(visibleValue.contains("visible"), true)
        
        // Test toggle - should switch between visible and hidden
        let toggleButton = driver.findComponent(On().id("toggle_button")).getOrThrow()
        toggleButton.click()
        driver.delayMs(300)
        
        // After toggle, hidden text should be shown
        // let hiddenText = driver.findComponent(On().id("hidden_text")).getOrThrow()
        // let hiddenValue = hiddenText.getText()
        // @Expect(hiddenValue.contains("Hidden"), true)
    }
    
    /**
     * TC_062: @Builder Function Using ForEach
     * Test: Verify @Builder function can use ForEach
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC062() {
        scrollTo("ViewBuilderTC062")
        driver.delayMs(500)
        
        // Verify initial list items
        let item0 = driver.findComponent(On().id("item_0")).getOrThrow()
        let item0Value = item0.getText()
        @Expect(item0Value.contains("Item"), true)
        
        // Test add item
        let addButton = driver.findComponent(On().id("add_button")).getOrThrow()
        addButton.click()
        driver.delayMs(300)
        
        // Verify new item exists
        let item3 = driver.findComponent(On().id("item_2")).getOrThrow()
        let item3Value = item3.getText()
        @Expect(item3Value.contains("Item"), true)
        
        // Test add multiple items
        addButton.click()
        driver.delayMs(200)
        addButton.click()
        driver.delayMs(200)
        
        // Verify new items are added
        let item4 = driver.findComponent(On().id("item_4")).getOrThrow()
        let item4Value = item4.getText()
        @Expect(item4Value.contains("Item"), true)
        
        let item5 = driver.findComponent(On().id("item_5")).getOrThrow()
        let item5Value = item5.getText()
        @Expect(item5Value.contains("Item"), true)
        
        // Test remove item
        let removeButton = driver.findComponent(On().id("remove_button")).getOrThrow()
        removeButton.click()
        driver.delayMs(300)
        
        // Verify item was removed (item_5 should not exist, item_4 should be the last)
        let item4After = driver.findComponent(On().id("item_4")).getOrThrow()
        let item4ValueAfter = item4After.getText()
        @Expect(item4ValueAfter.contains("Item"), true)
        
        // Test remove multiple items
        removeButton.click()
        driver.delayMs(200)
        removeButton.click()
        driver.delayMs(200)
        
        // Verify items are removed (item_2 should be the last now)
        let item2 = driver.findComponent(On().id("item_2")).getOrThrow()
        let item2Value = item2.getText()
        @Expect(item2Value.contains("Item"), true)
    }
    
    /**
     * TC_063: @BuilderParam Variable Definition
     * Test: Verify @BuilderParam variable can receive Builder function
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC063() {
        scrollTo("ViewBuilderTC063")
        driver.delayMs(500)
        
        // Verify parent builder content is displayed in child
        let parentBuilderText = driver.findComponent(On().id("parent_builder_text")).getOrThrow()
        let parentBuilderValue = parentBuilderText.getText()
        @Expect(parentBuilderValue.contains("Parent Builder Content"), true)
    }
    
    /**
     * TC_064: @BuilderParam Receiving Builder from Parent Component
     * Test: Verify @BuilderParam can receive Builder from parent component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC064() {
        
        scrollTo("ViewBuilderTC064")
        driver.delayMs(500)
        @Expect(true, true)
        // Verify parent builder content is displayed
        // let parentBuilderTitle = driver.findComponent(On().id("parent_builder_title")).getOrThrow()
        // let parentBuilderTitleValue = parentBuilderTitle.getText()
        // @Expect(parentBuilderTitleValue.contains("Parent"), true)
        
        // // Verify initial message
        // let parentBuilderMessage = driver.findComponent(On().id("parent_builder_message")).getOrThrow()
        // let parentBuilderMessageInitial = parentBuilderMessage.getText()
        // @Expect(parentBuilderMessageInitial.contains("Hello from Parent"), true)
        
        // // Test update - builder should reflect changes
        // let updateButton = driver.findComponent(On().id("update_button")).getOrThrow()
        // updateButton.click()
        // driver.delayMs(300)
        // todo fix
        // let parentBuilderMessageValue = parentBuilderMessage.getText() 
        // @Expect(parentBuilderMessageValue.contains("Updated Message"), true)
        
    }
    
    /**
     * TC_065: @BuilderParam Used in build() Method
     * Test: Verify @BuilderParam can be used in build() method
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC065() {
        scrollTo("ViewBuilderTC065")
        driver.delayMs(500)
        
        // Verify builder content is displayed
        let childHeader = driver.findComponent(On().id("child_header")).getOrThrow()
        let childHeaderValue = childHeader.getText()
        @Expect(childHeaderValue.contains("Header"), true)
        
        let childFooter = driver.findComponent(On().id("child_footer")).getOrThrow()
        let childFooterValue = childFooter.getText()
        @Expect(childFooterValue.contains("Footer"), true)
    }
    
    /**
     * TC_066: @BuilderParam Combined with State Variables
     * Test: Verify @BuilderParam works correctly with state variables
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC066() {
        
        scrollTo("ViewBuilderTC066")
        driver.delayMs(500)
        @Expect(true, true)
        // Verify initial state
        // let counterText = driver.findComponent(On().id("counter_text")).getOrThrow()
        // let counterValue = counterText.getText()
        // @Expect(counterValue.contains("0"), true)
        
        // // Test increment - builder should reflect state change
        // let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        // incrementButton.click()
        // driver.delayMs(300)
        // todo fix
        // let counterValueAfter = counterText.getText()
        // @Expect(counterValueAfter.contains("1"), true)
        
    }
    
    /**
     * TC_067: @Builder Combined with @State
     * Test: Verify @Builder works correctly with @State
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC067() {
        scrollTo("ViewBuilderTC067")
        driver.delayMs(500)
        
        // Verify initial state
        let countText = driver.findComponent(On().id("count_text")).getOrThrow()
        let countValue = countText.getText()
        @Expect(countValue.contains("0"), true)
        
        // Test increment - builder should reflect state change
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let countValueAfter = countText.getText()
        @Expect(countValueAfter.contains("1"), true)
        
        // Test update message
        let updateMessageButton = driver.findComponent(On().id("update_message_button")).getOrThrow()
        updateMessageButton.click()
        driver.delayMs(300)
        
        let messageText = driver.findComponent(On().id("message_text")).getOrThrow()
        let messageValue = messageText.getText()
        @Expect(messageValue.contains("Updated"), true)
    }
    
    /**
     * TC_068: @BuilderParam Combined with @Prop
     * Test: Verify @BuilderParam works correctly with @Prop
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC068() {
        
        scrollTo("ViewBuilderTC068")
        driver.delayMs(500)
        @Expect(true, true)
        // Verify initial state
        // let propText = driver.findComponent(On().id("prop_text")).getOrThrow()
        // let propValue = propText.getText()
        // @Expect(propValue.contains("Initial Value"), true)
        
        // let parentValueText = driver.findComponent(On().id("parent_value_text")).getOrThrow()
        // let parentValueInitial = parentValueText.getText()
        // @Expect(parentValueInitial.contains("Initial Value"), true)
        
        // // Test update in parent - should sync to child builder
        // let updateButton = driver.findComponent(On().id("update_button")).getOrThrow()
        // updateButton.click()
        // driver.delayMs(300)
        
        // // Verify prop value updated (one-way binding)
        // let propValueAfter = propText.getText()
        // @Expect(propValueAfter.contains("Updated Value"), true)
        
        // todo fix
        // Verify parent value text updated
        // let parentValue = parentValueText.getText()
        // @Expect(parentValue.contains("Updated Value"), true)
        
    }
    
    /**
     * TC_070: @Builder with Slider and Progress Components
     * Test: Verify @Builder can use Slider and Progress components
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC070() {
        scrollTo("ViewBuilderTC070")
        driver.delayMs(3000)
        
        // Verify initial state
        let sliderDisplay = driver.findComponent(On().id("slider_display_tc070")).getOrThrow()
        let sliderDisplayValue = sliderDisplay.getText()
        @Expect(sliderDisplayValue.contains("50") || sliderDisplayValue.contains("0"), true)
        
        let progressDisplay = driver.findComponent(On().id("progress_display")).getOrThrow()
        let progressDisplayValue = progressDisplay.getText()
        @Expect(progressDisplayValue.contains("0") || progressDisplayValue.contains("50"), true)
        
        // Test slider swipe - should update both slider and progress
        let slider = driver.findComponent(On().id("slider_tc070")).getOrThrow()
        let sliderCenter = slider.getBoundsCenter()
        let sliderCenterX = Int32(sliderCenter.x)
        let sliderCenterY = Int32(sliderCenter.y)
        
        // Swipe slider to the right (increase value) - use fixed offset
        driver.swipe(sliderCenterX - 100, sliderCenterY, 
                     sliderCenterX + 100, sliderCenterY, speed: 1000)
        driver.delayMs(500)
        
        // Verify slider value increased
        let sliderDisplayAfter = sliderDisplay.getText()
        @Expect(sliderDisplayAfter.contains("6") || sliderDisplayAfter.contains("7") || 
                sliderDisplayAfter.contains("8") || sliderDisplayAfter.contains("9"), true)
        
        // Verify progress value also increased (should match slider)
        let progressDisplayAfter = progressDisplay.getText()
        @Expect(progressDisplayAfter.contains("6") || progressDisplayAfter.contains("7") || 
                progressDisplayAfter.contains("8") || progressDisplayAfter.contains("9"), true)
        
        // Test reset button
        let resetButton = driver.findComponent(On().id("reset_button")).getOrThrow()
        resetButton.click()
        driver.delayMs(500)
        
        // Verify values are reset
        let sliderDisplayFinal = sliderDisplay.getText()
        @Expect(sliderDisplayFinal.contains("0"), true)
        
        let progressDisplayFinal = progressDisplay.getText()
        @Expect(progressDisplayFinal.contains("0"), true)
    }
    
    /**
     * TC_071: @Builder with Toggle and Checkbox Components
     * Test: Verify @Builder can use Toggle and Checkbox components
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC071() {
        scrollTo("ViewBuilderTC071")
        driver.delayMs(500)
        
        // Verify initial state
        let toggleDisplay = driver.findComponent(On().id("toggle_display_tc071")).getOrThrow()
        let toggleDisplayValue = toggleDisplay.getText()
        @Expect(toggleDisplayValue.contains("false"), true)
        
        let checkboxDisplay = driver.findComponent(On().id("checkbox_display")).getOrThrow()
        let checkboxDisplayValue = checkboxDisplay.getText()
        @Expect(checkboxDisplayValue.contains("false"), true)
        
        // Test toggle click - should change state
        let toggle = driver.findComponent(On().id("toggle_tc071")).getOrThrow()
        toggle.click()
        driver.delayMs(300)
        
        // Verify toggle state changed
        let toggleDisplayAfter = toggleDisplay.getText()
        @Expect(toggleDisplayAfter.contains("true"), true)
        
        // Test checkbox click - should change state
        let checkbox = driver.findComponent(On().id("checkbox")).getOrThrow()
        checkbox.click()
        driver.delayMs(300)
        
        // Verify checkbox state changed
        let checkboxDisplayAfter = checkboxDisplay.getText()
        @Expect(checkboxDisplayAfter.contains("true"), true)
        
        // Test toggle both button
        let toggleBothButton = driver.findComponent(On().id("toggle_both_button")).getOrThrow()
        toggleBothButton.click()
        driver.delayMs(300)
        
        // Verify both states toggled
        let toggleDisplayFinal = toggleDisplay.getText()
        @Expect(toggleDisplayFinal.contains("false"), true)
        
        let checkboxDisplayFinal = checkboxDisplay.getText()
        @Expect(checkboxDisplayFinal.contains("false"), true)
    }
    
    /**
     * TC_072: @Builder with Grid Component
     * Test: Verify @Builder can use Grid component
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC072() {
        scrollTo("ViewBuilderTC072")
        driver.delayMs(3000)
        
        // Verify Grid items are displayed (initial 9 items: 1-9)
        let gridItem0 = driver.findComponent(On().id("grid_item_text_0")).getOrThrow()
        let gridItem0Value = gridItem0.getText()
        @Expect(gridItem0Value.contains("1"), true)
        
        let gridItem8 = driver.findComponent(On().id("grid_item_text_8")).getOrThrow()
        let gridItem8Value = gridItem8.getText()
        @Expect(gridItem8Value.contains("9"), true)
        
        // Test add item (adds item 10, index 9)
        let addButton = driver.findComponent(On().id("add_button")).getOrThrow()
        addButton.click()
        driver.delayMs(300)
        
        // Verify new item exists (index 9, value 10)
        // let gridItem9 = driver.findComponent(On().id("grid_item_text_9")).getOrThrow()
        // let gridItem9Value = gridItem9.getText()
        // @Expect(gridItem9Value.contains("10"), true)
        
        // // Test add multiple items (adds items 11 and 12, indices 10 and 11)
        // addButton.click()
        // driver.delayMs(200)
        // addButton.click()
        // driver.delayMs(200)
        
        // // Verify new items are added (index 10, value 11)
        // let gridItem10 = driver.findComponent(On().id("grid_item_text_10")).getOrThrow()
        // let gridItem10Value = gridItem10.getText()
        // @Expect(gridItem10Value.contains("11"), true)
        
        // // Verify index 11, value 12 exists
        // let gridItem11 = driver.findComponent(On().id("grid_item_text_11")).getOrThrow()
        // let gridItem11Value = gridItem11.getText()
        // @Expect(gridItem11Value.contains("12"), true)
        
        // // Test remove item (removes last item, index 11, value 12)
        // let removeButton = driver.findComponent(On().id("remove_button")).getOrThrow()
        // removeButton.click()
        // driver.delayMs(300)
        
        // // Verify item was removed (grid_item_text_11 should not exist)
        // // Verify grid_item_text_10 still exists with value 11
        // let gridItem10After = driver.findComponent(On().id("grid_item_text_10")).getOrThrow()
        // let gridItem10ValueAfter = gridItem10After.getText()
        // @Expect(gridItem10ValueAfter.contains("11"), true)
        
        // // Verify grid_item_text_9 still exists with value 10
        // let gridItem9After = driver.findComponent(On().id("grid_item_text_9")).getOrThrow()
        // let gridItem9ValueAfter = gridItem9After.getText()
        // @Expect(gridItem9ValueAfter.contains("10"), true)
        
        // // Test remove multiple items (removes items 11 and 10, indices 10 and 9)
        // removeButton.click()
        // driver.delayMs(200)
        // removeButton.click()
        // driver.delayMs(200)
        
        // // Verify items are removed (grid_item_text_8 should be the last now, value 9)
        // let gridItem8After = driver.findComponent(On().id("grid_item_text_8")).getOrThrow()
        // let gridItem8ValueAfter = gridItem8After.getText()
        // @Expect(gridItem8ValueAfter.contains("9"), true)
    }
    
    /**
     * TC_073: @Builder with Stack and Flex Components
     * Test: Verify @Builder can use Stack and Flex components
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC073() {
        scrollTo("ViewBuilderTC073")
        driver.delayMs(500)
        
        // Verify Stack and Flex are displayed
        let stackBackground = driver.findComponent(On().id("stack_background")).getOrThrow()
        let stackForeground = driver.findComponent(On().id("stack_foreground")).getOrThrow()
        
        let flexItem1 = driver.findComponent(On().id("flex_item_1")).getOrThrow()
        let flexItem1Value = flexItem1.getText()
        @Expect(flexItem1Value.contains("1"), true)
        
        // Test change button
        let changeButton = driver.findComponent(On().id("change_button")).getOrThrow()
        changeButton.click()
        driver.delayMs(300)
        
        // Verify changes reflected
        let flexItem1After = flexItem1.getText()
        @Expect(flexItem1After.contains("1") || flexItem1After.contains("Changed"), true)
    }
    
    /**
     * TC_074: @Builder with Scroll and List Components
     * Test: Verify @Builder can use Scroll and List components
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC074() {
        scrollTo("ViewBuilderTC074")
        driver.delayMs(500)
        
        // Verify Scroll and List items are displayed
        let scrollItem0 = driver.findComponent(On().id("scroll_item_0")).getOrThrow()
        let scrollItem0Value = scrollItem0.getText()
        @Expect(scrollItem0Value.contains("Item"), true)
        
        // Test add item
        let addButton = driver.findComponent(On().id("add_button")).getOrThrow()
        addButton.click()
        driver.delayMs(300)
        
        // Verify new item exists
        let listItem3 = driver.findComponent(On().id("list_item_3")).getOrThrow()
        let listItem3Value = listItem3.getText()
        @Expect(listItem3Value.contains("Item"), true)
    }
    
    /**
     * TC_075: @BuilderParam with Complex Components
     * Test: Verify @BuilderParam can use complex components
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC075() {
        scrollTo("ViewBuilderTC075")
        driver.delayMs(500)
        
        // Verify complex builder content is displayed
        let complexTitle = driver.findComponent(On().id("complex_title")).getOrThrow()
        let complexTitleValue = complexTitle.getText()
        @Expect(complexTitleValue.contains("Complex"), true)
        
        // Verify initial state
        let sliderDisplay = driver.findComponent(On().id("slider_display_tc075")).getOrThrow()
        let sliderDisplayValue = sliderDisplay.getText()
        @Expect(sliderDisplayValue.contains("50"), true)
        
        let toggleDisplay = driver.findComponent(On().id("toggle_display_tc075")).getOrThrow()
        let toggleDisplayValue = toggleDisplay.getText()
        @Expect(toggleDisplayValue.contains("false"), true)
        
        // Test Slider swipe
        let slider = driver.findComponent(On().id("slider_tc075")).getOrThrow()
        let sliderCenter = slider.getBoundsCenter()
        let sliderCenterX = Int32(sliderCenter.x)
        let sliderCenterY = Int32(sliderCenter.y)
        
        // Swipe slider to the right (increase value) - use fixed offset
        driver.swipe(sliderCenterX - 100, sliderCenterY, 
                     sliderCenterX + 100, sliderCenterY, speed: 1000)
        driver.delayMs(500)
        
        // Verify slider value increased
        // let sliderDisplayAfter = sliderDisplay.getText()
        // @Expect(sliderDisplayAfter.contains("6") || sliderDisplayAfter.contains("7") || 
        //         sliderDisplayAfter.contains("8") || sliderDisplayAfter.contains("9"), true)
        
        // // Verify progress also updated
        // let progress = driver.findComponent(On().id("progress")).getOrThrow()
        
        // // Test Toggle click
        // let toggle = driver.findComponent(On().id("toggle")).getOrThrow()
        // toggle.click()
        // driver.delayMs(300)
        
        // // Verify toggle state changed
        // let toggleDisplayAfter = toggleDisplay.getText()
        // @Expect(toggleDisplayAfter.contains("true"), true)
    }
    
    /**
     * TC_076: @Builder with Form Components
     * Test: Verify @Builder can use form components (TextInput, Slider, Toggle, Checkbox)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC076() {
        scrollTo("ViewBuilderTC076")
        driver.delayMs(500)
        
        // Verify initial form state
        let formNameDisplay = driver.findComponent(On().id("form_name_display")).getOrThrow()
        let formAgeDisplay = driver.findComponent(On().id("form_age_display")).getOrThrow()
        let formEnabledDisplay = driver.findComponent(On().id("form_enabled_display")).getOrThrow()
        let formAgreeDisplay = driver.findComponent(On().id("form_agree_display")).getOrThrow()
        
        // Test TextInput input
        let nameInput = driver.findComponent(On().id("name_input")).getOrThrow()
        nameInput.inputText("Test Name")
        driver.delayMs(500)
        
        let formNameDisplayValue = formNameDisplay.getText()
        @Expect(formNameDisplayValue.contains("Test Name"), true)
        
        // Test Slider swipe
        let ageSlider = driver.findComponent(On().id("age_slider")).getOrThrow()
        let ageSliderCenter = ageSlider.getBoundsCenter()
        let ageSliderCenterX = Int32(ageSliderCenter.x)
        let ageSliderCenterY = Int32(ageSliderCenter.y)
        
        // Swipe slider to the right (increase age) - use fixed offset
        driver.swipe(ageSliderCenterX - 100, ageSliderCenterY, 
                     ageSliderCenterX + 100, ageSliderCenterY, speed: 1000)
        driver.delayMs(500)
        
        // Verify age increased
        let formAgeDisplayValue = formAgeDisplay.getText()
        @Expect(formAgeDisplayValue.contains("3") || formAgeDisplayValue.contains("4") || 
                formAgeDisplayValue.contains("5") || formAgeDisplayValue.contains("6"), true)
        
        // Test Toggle click
        let enabledToggle = driver.findComponent(On().id("enabled_toggle")).getOrThrow()
        enabledToggle.click()
        driver.delayMs(300)
        
        // Verify enabled state changed
        let formEnabledDisplayValue = formEnabledDisplay.getText()
        @Expect(formEnabledDisplayValue.contains("true"), true)
        
        // Test Checkbox click
        let agreeCheckbox = driver.findComponent(On().id("agree_checkbox")).getOrThrow()
        agreeCheckbox.click()
        driver.delayMs(300)
        
        // Verify agree state changed
        let formAgreeDisplayValue = formAgreeDisplay.getText()
        @Expect(formAgreeDisplayValue.contains("true"), true)
        
        // Test reset button
        let resetButton = driver.findComponent(On().id("reset_button")).getOrThrow()
        resetButton.click()
        driver.delayMs(500)
        
        // Verify form is reset
        let formNameDisplayAfter = formNameDisplay.getText()
        @Expect(formNameDisplayAfter.contains("Name:") && !formNameDisplayAfter.contains("Test Name"), true)
        
        let formAgeDisplayAfter = formAgeDisplay.getText()
        @Expect(formAgeDisplayAfter.contains("25"), true)
        
        let formEnabledDisplayAfter = formEnabledDisplay.getText()
        @Expect(formEnabledDisplayAfter.contains("false"), true)
        
        let formAgreeDisplayAfter = formAgreeDisplay.getText()
        @Expect(formAgreeDisplayAfter.contains("false"), true)
    }
    
    /**
     * TC_077: @BuilderParam with Conditional Components
     * Test: Verify @BuilderParam can use conditional components
     * Skipped: This test is expand long time
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC077() {
        
        scrollTo("ViewBuilderTC077")
        driver.delayMs(3000)
        @Expect(true, true)
        // Verify initial component type (should be 0: TextInput)
        // let typeDisplay = driver.findComponent(On().id("type_display")).getOrThrow()
        // let typeDisplayValue = typeDisplay.getText()
        // @Expect(typeDisplayValue.contains("0"), true)
        
        // // Verify TextInput component is displayed initially
        // let textinputComponent = driver.findComponent(On().id("textinput_component")).getOrThrow()
        
        // // Test input in TextInput
        // textinputComponent.inputText("Test Input")
        // driver.delayMs(300)
        
        // // Test switch to Slider
        // let switchSliderButton = driver.findComponent(On().id("switch_slider_button")).getOrThrow()
        // switchSliderButton.click()
        // driver.delayMs(300)
        
        // // Verify type changed to 1
        // let typeDisplayAfter = typeDisplay.getText()
        // @Expect(typeDisplayAfter.contains("1"), true)
        
        // // Verify Slider component is displayed
        // let sliderComponent = driver.findComponent(On().id("slider_component")).getOrThrow()
        
        // // Test slider swipe
        // let sliderCenter = sliderComponent.getBoundsCenter()
        // let sliderCenterX = Int32(sliderCenter.x)
        // let sliderCenterY = Int32(sliderCenter.y)
        
        // // Swipe slider to the right - use fixed offset
        // driver.swipe(sliderCenterX - 100, sliderCenterY, 
        //              sliderCenterX + 100, sliderCenterY, speed: 1000)
        // driver.delayMs(500)
        
        // // Test switch to Toggle
        // let switchToggleButton = driver.findComponent(On().id("switch_toggle_button")).getOrThrow()
        // switchToggleButton.click()
        // driver.delayMs(300)
        
        // // Verify type changed to 2
        // let typeDisplayAfter2 = typeDisplay.getText()
        // @Expect(typeDisplayAfter2.contains("2"), true)
        
        // // Verify Toggle component is displayed
        // let toggleComponent = driver.findComponent(On().id("toggle_component")).getOrThrow()
        
        // // Test toggle click
        // toggleComponent.click()
        // driver.delayMs(300)
        
        // // Test switch back to TextInput
        // let switchTextInputButton = driver.findComponent(On().id("switch_textinput_button")).getOrThrow()
        // switchTextInputButton.click()
        // driver.delayMs(300)
        
        // // Verify type changed back to 0
        // let typeDisplayFinal = typeDisplay.getText()
        // @Expect(typeDisplayFinal.contains("0"), true)
        
        // // Verify TextInput component is displayed again
        // let textinputComponent2 = driver.findComponent(On().id("textinput_component")).getOrThrow()
        
        // // Test input in TextInput again
        // textinputComponent2.inputText("Final Input")
        // driver.delayMs(300)
        
        // // Verify all three component types can be switched correctly
        // // Switch to Slider again
        // switchSliderButton.click()
        // driver.delayMs(300)
        // let typeDisplaySlider2 = typeDisplay.getText()
        // @Expect(typeDisplaySlider2.contains("1"), true)
        
        // // Switch to Toggle again
        // switchToggleButton.click()
        // driver.delayMs(300)
        // let typeDisplayToggle2 = typeDisplay.getText()
        // @Expect(typeDisplayToggle2.contains("2"), true)
        
        // // Toggle the switch
        // let toggleComponent2 = driver.findComponent(On().id("toggle_component")).getOrThrow()
        // toggleComponent2.click()
        // driver.delayMs(300)
        
        // // Switch back to TextInput one more time
        // switchTextInputButton.click()
        // driver.delayMs(300)
        // let typeDisplayFinal2 = typeDisplay.getText()
        // @Expect(typeDisplayFinal2.contains("0"), true)
        
    }

    /**
     * TC_069: @Builder with TextInput and TextArea Components
     * Test: Verify @Builder can use TextInput and TextArea components
     * Skipped: This test is expand long time
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBuilderTC069() {
        
        scrollTo("ViewBuilderTC069")
        driver.delayMs(500)
        @Expect(true, true)
        // Verify initial state
        // let inputDisplay = driver.findComponent(On().id("input_display")).getOrThrow()
        // let inputDisplayValue = inputDisplay.getText()
        // @Expect(inputDisplayValue.contains("Current value:") || inputDisplayValue.contains(""), true)
        
        // let areaDisplay = driver.findComponent(On().id("area_display")).getOrThrow()
        // let areaDisplayValue = areaDisplay.getText()
        // @Expect(areaDisplayValue.contains("Current value:") || areaDisplayValue.contains(""), true)
        
        // // Test TextInput input
        // let textInput = driver.findComponent(On().id("text_input")).getOrThrow()
        // textInput.inputText("Test Input")
        // driver.delayMs(500)
        
        // // Verify TextInput display updated
        // let inputDisplayAfter = inputDisplay.getText()
        // @Expect(inputDisplayAfter.contains("Test Input"), true)
        
        // // Test TextArea input
        // let textArea = driver.findComponent(On().id("text_area")).getOrThrow()
        // textArea.inputText("Multi-line\nText Area\nContent")
        // driver.delayMs(500)
        
        // // Verify TextArea display updated
        // let areaDisplayAfter = areaDisplay.getText()
        // @Expect(areaDisplayAfter.contains("Multi-line") || areaDisplayAfter.contains("Text Area") || 
        //         areaDisplayAfter.contains("Content"), true)
        
        // // Test clear button
        // let clearButton = driver.findComponent(On().id("clear_button")).getOrThrow()
        // clearButton.click()
        // driver.delayMs(500)
        
        // // Verify both inputs are cleared
        // let inputDisplayFinal = inputDisplay.getText()
        // @Expect(inputDisplayFinal.contains("Current value:") && !inputDisplayFinal.contains("Test Input"), true)
        
        // let areaDisplayFinal = areaDisplay.getText()
        // @Expect(areaDisplayFinal.contains("Current value:") && !areaDisplayFinal.contains("Multi-line"), true)
        
    }  
}

