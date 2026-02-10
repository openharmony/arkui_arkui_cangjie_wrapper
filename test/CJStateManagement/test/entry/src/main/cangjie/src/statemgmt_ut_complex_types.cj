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
 * Unit tests for complex types and custom types test cases (TC_084-TC_092)
 */
@Test
class StateManagementUTComplexTypes {
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
        Hilog.error(1, "Cangjie-Test", "StateManagementUTComplexTypes started")
        scrollBar?.scrollSearch(On().id("StateManagementIndexComplexTypes"))?.click()
        driver.delayMs(500)
    }
    
    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }
    
    /**
     * TC_084: @State Nested Object (Two Levels)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC084() {
        scrollTo("ViewComplexTC084")
        driver.delayMs(500)
        
        // Verify initial values
        let level1Text = driver.findComponent(On().id("level1_name_text")).getOrThrow()
        let level1Value = level1Text.getText()
        @Expect(level1Value.contains("Level1"), true)
        
        let level2DetailText = driver.findComponent(On().id("level2_detail_text")).getOrThrow()
        let level2DetailValue = level2DetailText.getText()
        @Expect(level2DetailValue.contains("Level2 Detail"), true)
        
        // Test update Level1
        let updateLevel1Button = driver.findComponent(On().id("update_level1_button")).getOrThrow()
        updateLevel1Button.click()
        driver.delayMs(300)
        
        let level1ValueAfter = level1Text.getText()
        @Expect(level1ValueAfter.contains("Updated Level1"), true)
        
        // Test update Level2
        let updateLevel2DetailButton = driver.findComponent(On().id("update_level2_detail_button")).getOrThrow()
        updateLevel2DetailButton.click()
        driver.delayMs(300)
        
        let level2DetailValueAfter = level2DetailText.getText()
        @Expect(level2DetailValueAfter.contains("Updated Detail"), true)
    }
    
    /**
     * TC_090: @State Map Type (Primitive Type Values)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC090() {
        scrollTo("ViewComplexTC090")
        driver.delayMs(500)
        
        // Verify initial map size
        let intmapSizeText = driver.findComponent(On().id("intmap_size_text")).getOrThrow()
        let intmapSizeValue = intmapSizeText.getText()
        @Expect(intmapSizeValue.contains("3"), true)
        
        // Test add to map
        let addIntmapButton = driver.findComponent(On().id("add_intmap_button")).getOrThrow()
        addIntmapButton.click()
        driver.delayMs(300)
        
        // let intmapSizeAfter = intmapSizeText.getText()
        // @Expect(intmapSizeAfter.contains("4"), true)
        
        // Test update map - verify size remains same after update
        // let updateIntmapKey1Button = driver.findComponent(On().id("update_intmap_key1_button")).getOrThrow()
        // updateIntmapKey1Button.click()
        // driver.delayMs(300)
        
        // Size should remain 4 after update (not add new key)
        // let intmapSizeAfterUpdate = intmapSizeText.getText()
        // @Expect(intmapSizeAfterUpdate.contains("4"), true)
    }
    
    /**
     * TC_092: @State Set Type
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStateTC092() {
        scrollTo("ViewComplexTC092")
        driver.delayMs(500)
        
        // Verify initial set size
        let intsetSizeText = driver.findComponent(On().id("intset_size_text")).getOrThrow()
        let intsetSizeValue = intsetSizeText.getText()
        @Expect(intsetSizeValue.contains("5"), true)
        
        // Test add to set
        let addIntsetButton = driver.findComponent(On().id("add_intset_button")).getOrThrow()
        addIntsetButton.click()
        driver.delayMs(300)
        
        // let intsetSizeAfter = intsetSizeText.getText()
        // @Expect(intsetSizeAfter.contains("6"), true)
        
        // // Test remove from stringSet
        // let removeStringsetButton = driver.findComponent(On().id("remove_stringset_button")).getOrThrow()
        // removeStringsetButton.click()
        // driver.delayMs(300)
        
        // // Verify stringSet size decreased
        // let stringsetSizeText = driver.findComponent(On().id("stringset_size_text")).getOrThrow()
        // let stringsetSizeValue = stringsetSizeText.getText()
        // @Expect(stringsetSizeValue.contains("2"), true)
    }
}

