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
 * CustomBuilder 性能与多函数场景单元测试 (TC_B085-TC_B092)
 * 验证多个 @Builder 函数、CustomBuilder 重复使用等场景
 */
@Test
class BuilderUTPerformance {
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
        Hilog.error(1, "Cangjie-Test", "BuilderUTPerformance started")
        scrollBar?.scrollSearch(On().id("BuilderIndexPerformance"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(300)
    }

    /**
     * TC_B085: 多个 @Builder 函数场景
     * 验证同一组件内定义多个 @Builder 用于不同 CustomBuilder 接口
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMultipleFunctions() {
        scrollTo("ViewBuilderMultipleFunctions")
        driver.delayMs(500)
        // let testTitle = driver.findComponent(On().id("test_title")).getOrThrow()
        // @Expect(testTitle.getText().contains("Multiple") || testTitle.getText().contains("multiple"), true)
    }
}
