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
 * Unit tests for resource macro test cases (TC_137-TC_139)
 */
@Test
class StateManagementUTResource {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTResource started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexResource"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_137: @r Macro Used in State Variable
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC137() {
        scrollTo("ViewResourceTC137")
        driver.delayMs(500)
        
        // Verify initial resource index
        let resourceIndexDisplay = driver.findComponent(On().id("resource_index_display")).getOrThrow()
        let resourceIndexValue = resourceIndexDisplay.getText()
        @Expect(resourceIndexValue.contains("1"), true)
        
        // Test change resource index
        let changeIndexButton = driver.findComponent(On().id("change_index_button")).getOrThrow()
        changeIndexButton.click()
        driver.delayMs(300)
        
        let resourceIndexAfter = resourceIndexDisplay.getText()
        @Expect(resourceIndexAfter.contains("2"), true)
    }
    
    /**
     * TC_138: @r Macro Combined with @Prop
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC138() {
        scrollTo("ViewResourceTC138")
        driver.delayMs(500)
        
        // Verify initial state
        let parentResourceDisplay = driver.findComponent(On().id("parent_resource_display")).getOrThrow()
        let parentResourceValue = parentResourceDisplay.getText()
        @Expect(parentResourceValue.contains("1"), true)
        
        // Test change resource index
        let changeIndexButton = driver.findComponent(On().id("change_index_button")).getOrThrow()
        changeIndexButton.click()
        driver.delayMs(300)
        
        let parentResourceAfter = parentResourceDisplay.getText()
        @Expect(parentResourceAfter.contains("2"), true)
    }
    
    /**
     * TC_139: @rawfile Macro Used in State Variable
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC139() {
        scrollTo("ViewResourceTC139")
        driver.delayMs(500)
        
        // Verify initial file path
        let filePathDisplay = driver.findComponent(On().id("file_path_display")).getOrThrow()
        let filePathValue = filePathDisplay.getText()
        @Expect(filePathValue.contains("test.txt"), true)
        
        // Test change file path
        let changePathButton = driver.findComponent(On().id("change_path_button")).getOrThrow()
        changePathButton.click()
        driver.delayMs(300)
        
        let filePathAfter = filePathDisplay.getText()
        @Expect(filePathAfter.contains("data.json"), true)
    }
}

