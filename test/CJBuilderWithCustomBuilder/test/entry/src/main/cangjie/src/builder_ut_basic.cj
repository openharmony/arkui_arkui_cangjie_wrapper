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
 * CustomBuilder 基础接口单元测试 (TC_B001-TC_B009)
 * 验证 bindMenu、bindContextMenu、bindContentCover、bindSheet、Gauge.description、
 * Navigation.title、TextInput.customKeyboard、CheckBox.indicatorBuilder 等 CustomBuilder 接口
 */
@Test
class BuilderUTBasic {
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
        Hilog.error(1, "Cangjie-Test", "BuilderUTBasic started")
        scrollBar?.scrollSearch(On().id("BuilderIndexBasic"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }

    /**
     * TC_B001: bindMenu CustomBuilder 接口验证
     * 验证 CommonMethodComponent.bindMenu(builder: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindMenuBasic() {
        scrollTo("ViewBuilderBindMenuBasic")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindMenu"), true)

        let _ = driver.findComponent(On().id("content_column")).getOrThrow()
    }

    /**
     * TC_B002: bindContextMenu CustomBuilder 接口验证
     * 验证 CommonMethodComponent.bindContextMenu(builder: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindContextMenuBasic() {
        scrollTo("ViewBuilderBindContextMenuBasic")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindContextMenu"), true)

        let _ = driver.findComponent(On().id("content_column")).getOrThrow()
    }

    /**
     * TC_B003: bindContentCover CustomBuilder 接口验证
     * 验证 CommonMethodComponent.bindContentCover(builder: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindContentCoverBasic() {
        scrollTo("ViewBuilderBindContentCoverBasic")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindContentCover"), true)

        let mainText = driver.findComponent(On().id("main_text")).getOrThrow()
        @Expect(mainText.getText().contains("Main Content"), true)
    }

    /**
     * TC_B004: bindSheet CustomBuilder 接口验证
     * 验证 CommonMethodComponent.bindSheet(builder: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBindSheetBasic() {
        scrollTo("ViewBuilderBindSheetBasic")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("bindSheet"), true)

        let mainText = driver.findComponent(On().id("main_text")).getOrThrow()
        @Expect(mainText.getText().contains("Main Content"), true)
    }

    /**
     * TC_B005: Gauge.description CustomBuilder 接口验证
     * 验证 Gauge.description(builder: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGaugeDescriptionBasic() {
        scrollTo("ViewBuilderGaugeDescriptionBasic")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("Gauge description"), true)

        let _ = driver.findComponent(On().id("gauge")).getOrThrow()
    }

    /**
     * TC_B007: @Builder 修饰符检查（非 CustomBuilder 接口，但属于基础验证）
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testModifierCheck() {
        scrollTo("ViewBuilderModifierCheck")
        driver.delayMs(500)

        let publicText = driver.findComponent(On().id("public_builder_text")).getOrThrow()
        @Expect(publicText.getText().contains("Public Builder"), true)
    }

    /**
     * TC_B008: Navigation.title CustomBuilder 接口验证
     * 验证 NavDestination.title(value: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNavigationTitleBasic() {
        scrollTo("ViewBuilderNavigationTitleBasic")
        driver.delayMs(500)

        let contentText = driver.findComponent(On().id("content_text")).getOrThrow()
        @Expect(contentText.getText().contains("Content"), true)
    }

    /**
     * TC_B009: TextInput.customKeyboard CustomBuilder 接口验证
     * 验证 TextInput.customKeyboard(value: CustomBuilder) 正确绑定
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextInputCustomKeyboardBasic() {
        scrollTo("ViewBuilderTextInputCustomKeyboardBasic")
        driver.delayMs(500)

        let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        @Expect(testTitle.getText().contains("customKeyboard"), true)

        let _ = driver.findComponent(On().id("text_input")).getOrThrow()
    }
}
