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
import ohos.ui_test.*
import ohos.hilog.Hilog
import ohos.business_exception.*

@Test
class GridColUTGridRowEvent {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("GridColIndexGridRowEvent")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowOnBreakpointChangeNormalValue1() {
        scrollTo("ViewGridRowOnBreakpointChange1")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("currentBp_test")).getOrThrow()
        @Expect(component.getText(), "testGridRowOnBreakpointChangeNormalValue1")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowOnBreakpointChangeNormalValue2() {
        scrollTo("ViewGridRowOnBreakpointChange2")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("currentBp_test")).getOrThrow()
        @Expect(component.getText(), "testGridRowOnBreakpointChangeNormalValue2")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowOnBreakpointChangeNormalValue3() {
        scrollTo("ViewGridRowOnBreakpointChange")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("currentBp_test1")).getOrThrow()
        @Expect(component.getText(), "testGridRowOnBreakpointChangeNormalValue3")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowOnBreakpointChangeOptionNone() {
        scrollTo("ViewGridRowOnBreakpointChange")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("currentBp_test2")).getOrThrow()
        // param option none equal donnot do anything
        @Expect(component.getText(), "testGridRowOnBreakpointChangeNormalValue3")
    }
}
