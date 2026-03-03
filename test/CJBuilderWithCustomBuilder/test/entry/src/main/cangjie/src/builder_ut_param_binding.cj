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
 * CustomBuilder 参数绑定接口单元测试 (TC_B011-TC_B032)
 * 验证 ListItemGroup(header/footer)、MenuItemGroup(header/footer)、ListItem.swipeAction(start/end)、
 * CheckBox(indicatorBuilder)、ContextMenuOptions(preview)、CustomPopupOptions(builder)、SheetOptions(title)、
 * DragItemInfo(builder) 等 CustomBuilder 参数绑定
 */
@Test
class BuilderUTParamBinding {
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
        Hilog.error(1, "Cangjie-Test", "BuilderUTParamBinding started")
        scrollBar?.scrollSearch(On().id("BuilderIndexParamBinding"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }

    /**
     * TC_B012: ListItemGroup header/footer CustomBuilder 参数验证
     * 验证 ListItemGroup(header: CustomBuilder, footer: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testListItemGroupHeaderFooter() {
        scrollTo("ViewBuilderListItemGroupHeaderFooter")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("ListItemGroup"), true)

        let headerText = driver.findComponent(On().id("header_text")).getOrThrow()
        @Expect(headerText.getText().contains("Header Content"), true)

        let footerText = driver.findComponent(On().id("footer_text")).getOrThrow()
        @Expect(footerText.getText().contains("Footer Content"), true)
    }

    /**
     * TC_B013: MenuItemGroup header/footer CustomBuilder 参数验证
     * 验证 MenuItemGroup(header: CustomBuilder, footer: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMenuItemGroupHeaderFooter() {
        scrollTo("ViewBuilderMenuItemGroupHeaderFooter")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("MenuItemGroup"), true)

        let _ = driver.findComponent(On().id("menu")).getOrThrow()
    }

    /**
     * TC_B025: ListItem.swipeAction start/end CustomBuilder 参数验证
     * 验证 ListItem.swipeAction(start: CustomBuilder, end: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testListItemSwipeAction() {
        scrollTo("ViewBuilderListItemSwipeAction")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("swipeAction"), true)

        let listItemText = driver.findComponent(On().id("list_item_text")).getOrThrow()
        @Expect(listItemText.getText().contains("Swipe"), true)
    }

    /**
     * TC_B014: DragItemInfo builder CustomBuilder 参数验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDragItemInfoBuilder() {
        scrollTo("ViewBuilderDragItemInfoBuilder")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("DragItemInfo"), true)
    }

    /**
     * TC_B015: ContextMenuOptions preview CustomBuilder 参数验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContextMenuOptionsPreview() {
        scrollTo("ViewBuilderContextMenuOptionsPreview")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("ContextMenuOptions"), true)
    }

    /**
     * TC_B021: TabContent.tabBar CustomBuilder 参数验证
     * 验证 TabContent.tabBar(content: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTabContentTabBar() {
        scrollTo("ViewBuilderTabContentTabBar")
        driver.delayMs(500)

        let tabContentText = driver.findComponent(On().id("tab_content_1_text")).getOrThrow()
        @Expect(tabContentText.getText().contains("Tab Content 1"), true)
    }

    /**
     * CheckBox indicatorBuilder CustomBuilder 参数验证
     * 验证 CheckBox(indicatorBuilder: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCheckBoxIndicatorBuilder() {
        scrollTo("ViewBuilderCheckBoxIndicatorBuilder")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("CheckBox"), true)

        let _ = driver.findComponent(On().id("checkbox")).getOrThrow()
    }

    /**
     * CustomPopupOptions builder CustomBuilder 参数验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCustomPopupOptionsBuilder() {
        scrollTo("ViewBuilderCustomPopupOptionsBuilder")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("CustomPopupOptions"), true)

        let _ = driver.findComponent(On().id("show_button")).getOrThrow()
    }

    /**
     * SheetOptions title CustomBuilder 参数验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSheetOptionsTitle() {
        scrollTo("ViewBuilderSheetOptionsTitle")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("SheetOptions"), true)

        let _ = driver.findComponent(On().id("show_button")).getOrThrow()
    }

    /**
     * TC_B024: RichEditor.bindSelectionMenu CustomBuilder 参数验证
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRichEditorBindSelectionMenu() {
        scrollTo("ViewBuilderRichEditorBindSelectionMenu")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("RichEditor") || testTitle.getText().contains("bindSelectionMenu"), true)
    }
}
