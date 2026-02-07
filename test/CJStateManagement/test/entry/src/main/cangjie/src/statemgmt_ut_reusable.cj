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
 * Unit tests for @Reusable test cases (TC_133-TC_136)
 */
@Test
class StateManagementUTReusable {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTReusable started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexReusable"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_134: @Reusable Component Defined Before @Entry
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC134() {
        scrollTo("ViewReusableTC134")
        driver.delayMs(500)
        
        // Verify reusable component is displayed
        let reusableText = driver.findComponent(On().id("reusable_text")).getOrThrow()
        let reusableValue = reusableText.getText()
        @Expect(reusableValue.contains("Reusable Component"), true)
        @Expect(reusableValue.contains("0"), true)
        
        // Test increment
        let incrementButton = driver.findComponent(On().id("increment_button")).getOrThrow()
        incrementButton.click()
        driver.delayMs(300)
        
        let reusableValueAfter = reusableText.getText()
        @Expect(reusableValueAfter.contains("1"), true)
    }
    
    /**
     * TC_135: @Reusable Component with State Variables
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC135() {
        scrollTo("ViewReusableTC135")
        driver.delayMs(500)
        
        // Verify initial state
        let parentValueDisplay = driver.findComponent(On().id("parent_value_display")).getOrThrow()
        let parentValue = parentValueDisplay.getText()
        @Expect(parentValue.contains("10"), true)
        
        // Verify reusable components are displayed
        let reusableDisplay1 = driver.findComponent(On().id("reusable_display_1")).getOrThrow()
        let reusableValue1 = reusableDisplay1.getText()
        @Expect(reusableValue1.contains("10"), true)
        
        let reusableDisplay2 = driver.findComponent(On().id("reusable_display_2")).getOrThrow()
        let reusableValue2 = reusableDisplay2.getText()
        @Expect(reusableValue2.contains("10"), true)
        
        // Test update parent
        let updateParentButton = driver.findComponent(On().id("update_parent_button")).getOrThrow()
        updateParentButton.click()
        driver.delayMs(300)
        
        let parentValueAfter = parentValueDisplay.getText()
        @Expect(parentValueAfter.contains("11"), true)
        
        // Verify both reusable components updated
        let reusableValue1After = reusableDisplay1.getText()
        @Expect(reusableValue1After.contains("11"), true)
        
        let reusableValue2After = reusableDisplay2.getText()
        @Expect(reusableValue2After.contains("11"), true)
    }
    
    /**
     * TC_136: @Reusable Component with @Builder
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC136() {
        scrollTo("ViewReusableTC136")
        driver.delayMs(500)
        
        // Verify initial state
        let builderText1 = driver.findComponent(On().id("builder_text_1")).getOrThrow()
        let builderValue1 = builderText1.getText()
        @Expect(builderValue1.contains("Reusable Component 1"), true)
        
        let builderText2 = driver.findComponent(On().id("builder_text_2")).getOrThrow()
        let builderValue2 = builderText2.getText()
        @Expect(builderValue2.contains("Reusable Component 2"), true)
        
        // Test update title 1
        let updateTitle1Button = driver.findComponent(On().id("update_title1_button")).getOrThrow()
        updateTitle1Button.click()
        driver.delayMs(300)
        
        let builderValue1After = builderText1.getText()
        @Expect(builderValue1After.contains("Updated Component 1"), true)
        
        // Test update title 2
        let updateTitle2Button = driver.findComponent(On().id("update_title2_button")).getOrThrow()
        updateTitle2Button.click()
        driver.delayMs(300)
        
        let builderValue2After = builderText2.getText()
        @Expect(builderValue2After.contains("Updated Component 2"), true)
    }
}

