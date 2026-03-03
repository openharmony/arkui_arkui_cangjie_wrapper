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
 * Unit tests for @Link macro test cases (TC_025-TC_032)
 */
@Test
class StateManagementUTLink {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTLink started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexLink"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_025: @Link Two-way Binding (Primitive Types)
     * Test: Verify @Link enables two-way binding between parent and child
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC025() {
        scrollTo("ViewLinkTC025")
        driver.delayMs(500)
        
        // Verify initial state - parent and child should have same values
        let parentIntText = driver.findComponent(On().id("parent_int_text")).getOrThrow()
        let parentIntValue = parentIntText.getText()
        @Expect(parentIntValue.contains("10"), true)
        
        let childIntText = driver.findComponent(On().id("child_int_text")).getOrThrow()
        let childIntValue = childIntText.getText()
        @Expect(childIntValue.contains("10"), true)
        
        // Test child modification updates parent - click child increment button
        let childIncrementButton = driver.findComponent(On().id("child_increment_int_button")).getOrThrow()
        childIncrementButton.click()
        driver.delayMs(300)
        
        // Both parent and child should be updated (two-way binding)
        let parentIntValueAfter = parentIntText.getText()
        @Expect(parentIntValueAfter.contains("11"), true)
        
        let childIntValueAfter = childIntText.getText()
        @Expect(childIntValueAfter.contains("11"), true)
        
        // Test parent modification updates child - click parent increment button
        let parentIncrementButton = driver.findComponent(On().id("parent_increment_int_button")).getOrThrow()
        parentIncrementButton.click()
        driver.delayMs(300)
        
        // Both should be synchronized
        let parentIntValueFinal = parentIntText.getText()
        @Expect(parentIntValueFinal.contains("12"), true)
        
        let childIntValueFinal = childIntText.getText()
        @Expect(childIntValueFinal.contains("12"), true)
        
        // Test reset all values button
        let resetAllButton = driver.findComponent(On().id("reset_all_button")).getOrThrow()
        resetAllButton.click()
        driver.delayMs(300)
        
        // Values should be reset
        let parentIntValueReset = parentIntText.getText()
        @Expect(parentIntValueReset.contains("10"), true)
    }
    
    /**
     * TC_026: @Link Two-way Binding (Collection Types)
     * Test: Verify @Link enables two-way binding for collections
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC026() {
        scrollTo("ViewLinkTC026")
        driver.delayMs(500)
        
        // Verify initial collection state
        let parentArraySizeText = driver.findComponent(On().id("parent_array_size_text")).getOrThrow()
        let parentArraySizeValue = parentArraySizeText.getText()
        @Expect(parentArraySizeValue.contains("3"), true)
        
        let childArraySizeText = driver.findComponent(On().id("child_array_size_text")).getOrThrow()
        let childArraySizeValue = childArraySizeText.getText()
        @Expect(childArraySizeValue.contains("3"), true)
        
        // Test child modification updates parent - click child add array button
        let childAddArrayButton = driver.findComponent(On().id("child_add_array_button")).getOrThrow()
        childAddArrayButton.click()
        driver.delayMs(300)
        
        // Both parent and child sizes should be updated (two-way binding)
        // Note: Text format is different ("Parent Array Size: 4" vs "Linked Array Size: 4")
        // So we verify they both contain the same size number
        let parentArraySizeAfter = parentArraySizeText.getText()
        let childArraySizeAfter = childArraySizeText.getText()
        @Expect(parentArraySizeAfter.contains("4"), true)
        @Expect(childArraySizeAfter.contains("4"), true)
        
        // Test parent modification updates child - click parent add array button
        let parentAddArrayButton = driver.findComponent(On().id("parent_add_array_button")).getOrThrow()
        parentAddArrayButton.click()
        driver.delayMs(300)
        
        // Both should be synchronized
        let parentArraySizeFinal = parentArraySizeText.getText()
        let childArraySizeFinal = childArraySizeText.getText()
        @Expect(parentArraySizeFinal.contains("5"), true)
        @Expect(childArraySizeFinal.contains("5"), true)
        
        // Test reset collections button
        let resetCollectionsButton = driver.findComponent(On().id("reset_collections_button")).getOrThrow()
        resetCollectionsButton.click()
        driver.delayMs(300)
        
        // Collections should be reset
        let parentArraySizeReset = parentArraySizeText.getText()
        @Expect(parentArraySizeReset.contains("3"), true)
    }
    
    /**
     * TC_027: @Link Two-way Binding (Custom Types)
     * Test: Verify @Link enables two-way binding for custom @Observed types
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC027() {
        scrollTo("ViewLinkTC027")
        driver.delayMs(500)
        
        // Verify custom object binding
        let parentModelNameText = driver.findComponent(On().id("parent_model_name_text")).getOrThrow()
        let parentModelNameValue = parentModelNameText.getText()
        @Expect(parentModelNameValue.contains("Initial Model"), true)
        
        let childModelNameText = driver.findComponent(On().id("child_model_name_text")).getOrThrow()
        let childModelNameValue = childModelNameText.getText()
        @Expect(childModelNameValue.contains("Initial Model"), true)
        
        // Test child modification updates parent - click child change name button
        let childChangeNameButton = driver.findComponent(On().id("child_change_name_button")).getOrThrow()
        childChangeNameButton.click()
        driver.delayMs(300)
        
        // Both parent and child should be updated (two-way binding)
        let parentModelNameValueAfter = parentModelNameText.getText()
        @Expect(parentModelNameValueAfter.contains("Child Modified Name"), true)
        
        let childModelNameValueAfter = childModelNameText.getText()
        @Expect(childModelNameValueAfter.contains("Child Modified Name"), true)
        
        // Test parent modification updates child - click parent change name button
        let parentChangeNameButton = driver.findComponent(On().id("parent_change_name_button")).getOrThrow()
        parentChangeNameButton.click()
        driver.delayMs(300)
        
        // Test reset model button
        let resetModelButton = driver.findComponent(On().id("reset_model_button")).getOrThrow()
        resetModelButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_028: @Link Modification Triggers Parent Update
     * Test: Verify child @Link modification triggers parent @State update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC028() {
        scrollTo("ViewLinkTC028")
        driver.delayMs(500)
        
        // Verify initial state
        let parentCountText = driver.findComponent(On().id("parent_count_text")).getOrThrow()
        let parentCountValue = parentCountText.getText()
        @Expect(parentCountValue.contains("0"), true)
        
        let parentMessageText = driver.findComponent(On().id("parent_message_text")).getOrThrow()
        let parentMessageValue = parentMessageText.getText()
        @Expect(parentMessageValue.contains("Initial Message"), true)
        
        // Test child modification - click child set count button
        let childSetCountButton = driver.findComponent(On().id("child_set_count_button")).getOrThrow()
        childSetCountButton.click()
        driver.delayMs(300)
        
        // Parent should be updated
        let parentCountValueAfter = parentCountText.getText()
        @Expect(parentCountValueAfter.contains("100"), true)
        
        // Test child set count to 200 button
        let childSetCount200Button = driver.findComponent(On().id("child_set_count_200_button")).getOrThrow()
        childSetCount200Button.click()
        driver.delayMs(300)
        
        let parentCountValueFinal = parentCountText.getText()
        @Expect(parentCountValueFinal.contains("200"), true)
        
        // Test child set message button
        let childSetMessageButton = driver.findComponent(On().id("child_set_message_button")).getOrThrow()
        childSetMessageButton.click()
        driver.delayMs(300)
        
        let parentMessageValueAfter = parentMessageText.getText()
        @Expect(parentMessageValueAfter.contains("Child Changed"), true)
        
        // Test parent reset button
        let parentResetButton = driver.findComponent(On().id("parent_reset_button")).getOrThrow()
        parentResetButton.click()
        driver.delayMs(300)
        
        let parentCountValueReset = parentCountText.getText()
        @Expect(parentCountValueReset.contains("0"), true)
    }
    
    /**
     * TC_029: @Link Modification Triggers Child Update
     * Test: Verify parent @State modification triggers child @Link update
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC029() {
        scrollTo("ViewLinkTC029")
        driver.delayMs(500)
        
        // Verify initial state
        let childScoreText = driver.findComponent(On().id("child_score_text")).getOrThrow()
        let childScoreValue = childScoreText.getText()
        @Expect(childScoreValue.contains("0"), true)
        
        let childStatusText = driver.findComponent(On().id("child_status_text")).getOrThrow()
        let childStatusValue = childStatusText.getText()
        @Expect(childStatusValue.contains("Ready"), true)
        
        // Test parent modification - click parent set score to 50 button
        let parentSetScore50Button = driver.findComponent(On().id("parent_set_score_50_button")).getOrThrow()
        parentSetScore50Button.click()
        driver.delayMs(300)
        
        // Child should be updated (two-way binding)
        let childScoreValueAfter = childScoreText.getText()
        @Expect(childScoreValueAfter.contains("50"), true)
        
        // Test parent set status to running button
        let parentSetStatusRunningButton = driver.findComponent(On().id("parent_set_status_running_button")).getOrThrow()
        parentSetStatusRunningButton.click()
        driver.delayMs(300)
        
        let childStatusValueAfter = childStatusText.getText()
        @Expect(childStatusValueAfter.contains("Running"), true)
        
        // Test parent reset all button
        let parentResetAllButton = driver.findComponent(On().id("parent_reset_all_button")).getOrThrow()
        parentResetAllButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_030: @Link Variable Used in Child Component
     * Test: Verify @Link variable can be used in child component build()
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC030() {
        scrollTo("ViewLinkTC030")
        driver.delayMs(500)
        
        // Verify @Link is used in child
        let childValueText = driver.findComponent(On().id("child_value_text")).getOrThrow()
        let childValueValue = childValueText.getText()
        @Expect(childValueValue.contains("25"), true)
        
        let childTextDisplay = driver.findComponent(On().id("child_text_display")).getOrThrow()
        let childTextValue = childTextDisplay.getText()
        @Expect(childTextValue.contains("Hello Link"), true)
        
        // Test modification - click parent increment button
        let parentIncrementButton = driver.findComponent(On().id("parent_increment_button")).getOrThrow()
        parentIncrementButton.click()
        driver.delayMs(300)
        
        // Child display should be updated
        let childValueValueAfter = childValueText.getText()
        @Expect(childValueValueAfter.contains("30"), true)
        
        // Test parent change text button
        let parentChangeTextButton = driver.findComponent(On().id("parent_change_text_button")).getOrThrow()
        parentChangeTextButton.click()
        driver.delayMs(300)
        
        let childTextValueAfter = childTextDisplay.getText()
        @Expect(childTextValueAfter.contains("Updated Text"), true)
        
        // Test child value button (child can modify @Link)
        let childValueButton = driver.findComponent(On().id("child_value_button")).getOrThrow()
        childValueButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_031: @Link and @State Combined Usage
     * Test: Verify @Link and @State can be used together
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC031() {
        scrollTo("ViewLinkTC031")
        driver.delayMs(500)
        
        // Verify both @Link and @State are used
        let childLinkedCountText = driver.findComponent(On().id("child_linked_count_text")).getOrThrow()
        let childLinkedCountValue = childLinkedCountText.getText()
        @Expect(childLinkedCountValue.contains("10"), true)
        
        let childLocalCountText = driver.findComponent(On().id("child_local_count_text")).getOrThrow()
        let childLocalCountValue = childLocalCountText.getText()
        @Expect(childLocalCountValue.contains("0"), true)
        
        // Test @Link modification - click child increment linked button
        let childIncrementLinkedButton = driver.findComponent(On().id("child_increment_linked_button")).getOrThrow()
        childIncrementLinkedButton.click()
        driver.delayMs(300)
        
        let childLinkedCountValueAfter = childLinkedCountText.getText()
        @Expect(childLinkedCountValueAfter.contains("11"), true)
        
        // Test @State modification - click child increment local button
        let childIncrementLocalButton = driver.findComponent(On().id("child_increment_local_button")).getOrThrow()
        childIncrementLocalButton.click()
        driver.delayMs(300)
        
        let childLocalCountValueAfter = childLocalCountText.getText()
        @Expect(childLocalCountValueAfter.contains("1"), true)
        
        // Test parent increment shared button
        let parentIncrementSharedButton = driver.findComponent(On().id("parent_increment_shared_button")).getOrThrow()
        parentIncrementSharedButton.click()
        driver.delayMs(300)
    }
    
    /**
     * TC_032: Multi-level Component @Link Passing
     * Test: Verify @Link can be passed through multiple component levels
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLinkTC032() {
        scrollTo("ViewLinkTC032")
        driver.delayMs(500)
        
        // Verify multi-level binding
        let parentValueText = driver.findComponent(On().id("parent_value_text")).getOrThrow()
        let parentValue = parentValueText.getText()
        @Expect(parentValue.contains("100"), true)
        
        let childValueText = driver.findComponent(On().id("child_value_text")).getOrThrow()
        let childValue = childValueText.getText()
        @Expect(childValue.contains("100"), true)
        
        let grandchildValueText = driver.findComponent(On().id("grandchild_value_text")).getOrThrow()
        let grandchildValue = grandchildValueText.getText()
        @Expect(grandchildValue.contains("100"), true)
        
        // Test grandchild modification updates all levels - click grandchild set value button
        let grandchildSetValueButton = driver.findComponent(On().id("grandchild_set_value_button")).getOrThrow()
        grandchildSetValueButton.click()
        driver.delayMs(300)
        
        // All levels should be synchronized (two-way binding)
        let parentValueAfter = parentValueText.getText()
        let childValueAfter = childValueText.getText()
        let grandchildValueAfter = grandchildValueText.getText()
        
        @Expect(parentValueAfter.contains("300"), true)
        @Expect(childValueAfter.contains("300"), true)
        @Expect(grandchildValueAfter.contains("300"), true)
        
        // Test child modification
        let childSetValueButton = driver.findComponent(On().id("child_set_value_button")).getOrThrow()
        childSetValueButton.click()
        driver.delayMs(300)
        
        // Test parent modification
        let parentSetValueButton = driver.findComponent(On().id("parent_set_value_button")).getOrThrow()
        parentSetValueButton.click()
        driver.delayMs(300)
    }
}
