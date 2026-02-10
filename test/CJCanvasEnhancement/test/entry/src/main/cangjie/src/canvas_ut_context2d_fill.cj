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
class CanvasUTContext2DFill {
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
        scrollBar?.scrollSearch(On().id("CanvasDrawingFill"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
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

    // setLineDash
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetLineDashNormal1() {
        scrollTo("ViewCanvasContext2DSetLineDash")
        @Expect(hasComponent("canvasContext2DSetLineDashNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetLineDashNormal2() {
        @Expect(hasComponent("canvasContext2DSetLineDashNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DSetLineDashBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DSetLineDashBoundaryValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DSetLineDashOptionNone() {
        @Expect(hasComponent("canvasContext2DSetLineDashOptionNone"), true)
        driver.pressBack()
    }

    // fillRect
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillRectNormal1() {
        scrollTo("ViewCanvasContext2DFillRect")
        @Expect(hasComponent("canvasContext2DFillRectNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillRectNormal2() {
        @Expect(hasComponent("canvasContext2DFillRectNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DFillRectExceptionValue1() {
        @Expect(hasComponent("canvasContext2DFillRectExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DFillRectBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DFillRectBoundaryValue1"), true)
        driver.pressBack()
    }

    // strokeRect
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeRectNormal1() {
        scrollTo("ViewCanvasContext2DStrokeRect")
        @Expect(hasComponent("canvasContext2DStrokeRectNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeRectNormal2() {
        @Expect(hasComponent("canvasContext2DStrokeRectNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeRectExceptionValue1() {
        @Expect(hasComponent("canvasContext2DStrokeRectExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeRectBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DStrokeRectBoundaryValue1"), true)
        driver.pressBack()
    }

    // clearRect
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClearRectNormal1() {
        scrollTo("ViewCanvasContext2DClearRect")
        @Expect(hasComponent("canvasContext2DClearRectNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClearRectNormal2() {
        @Expect(hasComponent("canvasContext2DClearRectNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DClearRectExceptionValue1() {
        @Expect(hasComponent("canvasContext2DClearRectExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DClearRectBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DClearRectBoundaryValue1"), true)
        driver.pressBack()
    }

    // fillText
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillTextNormal1() {
        scrollTo("ViewCanvasContext2DFillText")
        @Expect(hasComponent("canvasContext2DFillTextNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillTextNormal2() {
        @Expect(hasComponent("canvasContext2DFillTextNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DFillTextExceptionValue1() {
        @Expect(hasComponent("canvasContext2DFillTextExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DFillTextBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DFillTextBoundaryValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DFillTextBoundaryValue2() {
        @Expect(hasComponent("canvasContext2DFillTextBoundaryValue2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DFillTextOptionNone() {
        @Expect(hasComponent("canvasContext2DFillTextOptionNone"), true)
        driver.pressBack()
    }

    // strokeText
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeTextNormal1() {
        scrollTo("ViewCanvasContext2DStrokeText")
        @Expect(hasComponent("canvasContext2DStrokeTextNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeTextNormal2() {
        @Expect(hasComponent("canvasContext2DStrokeTextNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeTextExceptionValue1() {
        @Expect(hasComponent("canvasContext2DStrokeTextExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeTextBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DStrokeTextBoundaryValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeTextBoundaryValue2() {
        @Expect(hasComponent("canvasContext2DStrokeTextBoundaryValue2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DStrokeTextOptionNone() {
        @Expect(hasComponent("canvasContext2DStrokeTextOptionNone"), true)
        driver.pressBack()
    }

    // measureText
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DMeasureTextNormal1() {
        scrollTo("ViewCanvasContext2DMeasureText")
        let button = driver.findComponent(On().id("canvasContext2DMeasureTextNormal1")).getOrThrow()
        button.click()
        driver.delayMs(500)
        let width = getFloat64FromText("measureTextNormal1Width")
        let height = getFloat64FromText("measureTextNormal1Height")
        @Expect(width > 10.0 && width < 11.0)
        @Expect(height > 4.0 && height < 5.0)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DMeasureTextBoundaryValue1() {
        let button = driver.findComponent(On().id("canvasContext2DMeasureTextBoundaryValue1")).getOrThrow()
        button.click()
        driver.delayMs(500)
        let width = getFloat64FromText("measureTextBoundary1Width")
        let height = getFloat64FromText("measureTextBoundary1Height")
        @Expect(width == 0.0)
        @Expect(height > 4.0 && height < 5.0)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasRenderingContext2DMeasureTextOptionNone() {
        let button = driver.findComponent(On().id("canvasContext2DMeasureTextOptionNone")).getOrThrow()
        button.click()
        driver.delayMs(500)
        let width = getFloat64FromText("measureTextNone1Width")
        let height = getFloat64FromText("measureTextNone1Height")
        @Expect(width > 19.0 && width < 20.0)
        @Expect(height > 4.0 && height < 5.0)
        driver.pressBack()
    }
}
