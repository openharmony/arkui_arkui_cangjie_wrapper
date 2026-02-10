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
import ohos.device_info.*
import ohos.hilog.*

@Test
class CanvasUTContext2DState {
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
                driver.delayMs(800)
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
    
    func hasComponent(id: String): Bool {
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollSearch(On().id(id))
        return driver.findComponent(On().id(id)).isSome()
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("CanvasDrawingState"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // save / restore
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSaveRestore() {
        scrollTo("ViewCanvasContext2DSaveRestore")
        @Expect(hasComponent("canvasContext2DSaveRestore"), true)
    }

    // reset
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DReset() {
        scrollTo("ViewCanvasContext2DReset")
        @Expect(hasComponent("canvasContext2DReset"), true)
    }

    // saveLayer
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSaveLayer() {
        scrollTo("ViewCanvasContext2DSaveLayer")
        @Expect(hasComponent("canvasContext2DSaveLayer"), true)
    }

    // restoreLayer
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRestoreLayer() {
        scrollTo("ViewCanvasContext2DRestoreLayer")
        @Expect(hasComponent("canvasContext2DRestoreLayer"), true)
    }
}
