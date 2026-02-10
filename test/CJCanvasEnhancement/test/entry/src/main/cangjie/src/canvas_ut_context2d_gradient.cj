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
import std.convert.*

@Test
class CanvasUTContext2DGradient {
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
        scrollBar?.scrollSearch(On().id("CanvasDrawingGradient"))?.click()
        driver.delayMs(500)
    }
    
    func getContent(id: String): String {
        let strJson = getInspectorByKey(id)
        let obj = JsonValue.fromStr(strJson).asObject()
        let attrsInfo = obj.get("$attrs").getOrThrow().asObject()
        return attrsInfo.get("content").getOrThrow().toString()
    }
    
    func getFloat64FromText(id: String): Float64 {
        let str = getContent(id)
        return Float64.parse(str.trimAscii().removePrefix('"').removeSuffix('"'))
    }

    protected override func afterEach() {
        // driver.pressBack()
    }

    // createLinearGradient
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateLinearGradientNormal1() {
        scrollTo("ViewCanvasContext2DCreateLinearGradient")
        @Expect(hasComponent("canvasContext2DCreateLinearGradientNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateLinearGradientNormal2() {
        @Expect(hasComponent("canvasContext2DCreateLinearGradientNormal2"), true)
        driver.pressBack()
    }

    // createRadialGradient
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateRadialGradientNormal1() {
        scrollTo("ViewCanvasContext2DCreateRadialGradient")
        @Expect(hasComponent("canvasContext2DCreateRadialGradientNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateRadialGradientNormal2() {
        @Expect(hasComponent("canvasContext2DCreateRadialGradientNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateRadialGradientException1() {
        @Expect(hasComponent("canvasContext2DCreateRadialGradientException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateRadialGradientException2() {
        @Expect(hasComponent("canvasContext2DCreateRadialGradientException2"), true)
        driver.pressBack()
    }
    
    // getLineDash
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetLineDashNormal1() {
        scrollTo("ViewCanvasContext2DGetLineDash")
        let button = driver.findComponent(On().id("getLineDashEmpty")).getOrThrow()
        button.click()
        driver.delayMs(500)
        let lineDash = getContent("getLineDashNormal1")
        @Expect(lineDash, "\"[]\"")
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetLineDashNormal2() {
        let button = driver.findComponent(On().id("getLineDashLength2")).getOrThrow()
        button.click()
        driver.delayMs(500)
        let lineDash = getContent("getLineDashNormal2")
        @Expect(lineDash, "\"[5.000000, 4.000000]\"")
        driver.pressBack()
    }

    // createConicGradient
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateConicGradientNormal1() {
        scrollTo("ViewCanvasContext2DCreateConicGradient")
        @Expect(hasComponent("canvasContext2DCreateConicGradientNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateConicGradientNormal2() {
        @Expect(hasComponent("canvasContext2DCreateConicGradientNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateConicGradientNone() {
        @Expect(hasComponent("canvasContext2DCreateConicGradientNone"), true)
        
    }
}
