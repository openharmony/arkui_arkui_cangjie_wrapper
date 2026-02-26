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
 * CustomBuilder 类型安全检查单元测试 (TC_B033-TC_B048)
 * 验证 CustomBuilder 类型接口的类型检查正确通过（正确类型的 @Builder 可绑定）
 */
@Test
class BuilderUTTypeSafety {
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
        Hilog.error(1, "Cangjie-Test", "BuilderUTTypeSafety started")
        scrollBar?.scrollSearch(On().id("BuilderIndexTypeSafety"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }

    /**
     * TC_B033: bindMenu 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindMenuTypeCheck() {
        scrollTo("ViewBuilderBindMenuTypeCheck")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindMenu"), true)
    }

    /**
     * TC_B034: bindContextMenu 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindContextMenuTypeCheck() {
        scrollTo("ViewBuilderBindContextMenuTypeCheck")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindContextMenu"), true)
    }

    /**
     * TC_B035: bindContentCover 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindContentCoverTypeCheck() {
        scrollTo("ViewBuilderBindContentCoverTypeCheck")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindContentCover"), true)
    }

    /**
     * TC_B036: bindSheet 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindSheetTypeCheck() {
        scrollTo("ViewBuilderBindSheetTypeCheck")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindSheet"), true)
    }

    /**
     * TC_B037: Gauge.description 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGaugeDescriptionTypeCheck() {
        scrollTo("ViewBuilderGaugeDescriptionTypeCheck")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("Gauge"), true)
    }

    /**
     * TC_B039: Navigation.title 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNavigationTitleTypeCheck() {
        scrollTo("ViewBuilderNavigationTitleTypeCheck")
        driver.delayMs(500)

        let _ = driver.findComponent(On().id("navigation")).getOrThrow()
    }

    /**
     * TC_B041: TextInput.customKeyboard 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextInputCustomKeyboardTypeCheck() {
        scrollTo("ViewBuilderTextInputCustomKeyboardTypeCheck")
        driver.delayMs(500)

        let _ = driver.findComponent(On().id("text_input")).getOrThrow()
    }

    /**
     * TC_B043: TabContent.tabBar 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTabContentTabBarTypeCheck() {
        scrollTo("ViewBuilderTabContentTabBarTypeCheck")
        driver.delayMs(500)

        let _ = driver.findComponent(On().id("tab")).getOrThrow()
    }

    /**
     * TC_B045: RichEditor.bindSelectionMenu 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRichEditorBindSelectionMenuTypeCheck() {
        scrollTo("ViewBuilderRichEditorBindSelectionMenuTypeCheck")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("BindSelectionMenu"), true)
    }

    /**
     * TC_B047: ListItem.swipeAction 类型检查通过验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testListItemSwipeActionTypeCheck() {
        scrollTo("ViewBuilderListItemSwipeActionTypeCheck")
        driver.delayMs(500)

        let _ = driver.findComponent(On().id("list")).getOrThrow()
    }
}
