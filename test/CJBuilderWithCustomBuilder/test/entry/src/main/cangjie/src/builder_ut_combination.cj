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
 * CustomBuilder 组合场景单元测试 (TC_B058-TC_B072)
 * 验证 CustomBuilder 与 @State、条件渲染、ForEach、bindMenu 等组合使用
 */
@Test
class BuilderUTCombination {
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
        Hilog.error(1, "Cangjie-Test", "BuilderUTCombination started")
        scrollBar?.scrollSearch(On().id("BuilderIndexCombination"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }

    /**
     * TC_B058: CustomBuilder 与 @State 变量组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testUsesStateVariable() {
        scrollTo("ViewBuilderUsesStateVariable")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("State") || testTitle.getText().contains("state"), true)
    }

    /**
     * TC_B064: CustomBuilder 与条件渲染组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testUsesIfCondition() {
        scrollTo("ViewBuilderUsesIfCondition")
        driver.delayMs(500)

        let visibleText = driver.findComponent(On().id("visible_text")).getOrThrow()
        @Expect(visibleText.getText().contains("Content is visible"), true)

        let _ = driver.findComponent(On().id("toggle_button")).getOrThrow()
    }

    /**
     * TC_B066: CustomBuilder 与 ForEach 组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testUsesForEach() {
        scrollTo("ViewBuilderUsesForEach")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("ForEach"), true)

        let _ = driver.findComponent(On().id("list")).getOrThrow()
    }

    /**
     * TC_B070: CustomBuilder 与 bindMenu 内联组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testUsesBindMenu() {
        scrollTo("ViewBuilderUsesBindMenu")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindMenu"), true)

        let _ = driver.findComponent(On().id("content_column")).getOrThrow()
    }
}