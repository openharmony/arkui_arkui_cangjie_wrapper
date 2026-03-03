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
class CanvasUTContext2DPath {
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
        scrollBar?.scrollSearch(On().id("CanvasDrawingPath"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        // driver.pressBack()
    }

    // beginPath
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DBeginPath() {
        scrollTo("ViewCanvasContext2DBeginPath")
        @Expect(hasComponent("canvasContext2DBeginPath"), true)
        driver.pressBack()
    }

    // rect
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRectNormal1() {
        scrollTo("ViewCanvasContext2DRect")
        @Expect(hasComponent("canvasContext2DRectNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRectNormal2() {
        @Expect(hasComponent("canvasContext2DRectNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRectException1() {
        @Expect(hasComponent("canvasContext2DRectException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRectBoundary1() {
        @Expect(hasComponent("canvasContext2DFillRectBoundary1"), true)
        driver.pressBack()
    }

    // arc
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcNormal1() {
        scrollTo("ViewCanvasContext2DArc")
        @Expect(hasComponent("canvasContext2DArcNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcNormal2() {
        @Expect(hasComponent("canvasContext2DArcNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcException1() {
        @Expect(hasComponent("canvasContext2DArcException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcNone() {
        @Expect(hasComponent("canvasContext2DArcNone"), true)
        driver.pressBack()
    }

    // ellipse
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DEllipseNormal1() {
        scrollTo("ViewCanvasContext2DEllipse")
        @Expect(hasComponent("canvasContext2DEllipseNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DEllipseNormal2() {
        @Expect(hasComponent("canvasContext2DEllipseNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DEllipseException1() {
        @Expect(hasComponent("canvasContext2DEllipseException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DEllipseBoundary1() {
        @Expect(hasComponent("canvasContext2DEllipseBoundary1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DEllipseNone() {
        @Expect(hasComponent("canvasContext2DEllipseNone"), true)
        driver.pressBack()
    }

    // bezierCurveTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DBezierCurveToNormal1() {
        scrollTo("ViewCanvasContext2DBezierCurveTo")
        @Expect(hasComponent("canvasContext2DBezierCurveToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DBezierCurveToNormal2() {
        @Expect(hasComponent("canvasContext2DBezierCurveToNormal2"), true)
        driver.pressBack()
    }

    // quadraticCurveTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DQuadraticCurveToNormal1() {
        scrollTo("ViewCanvasContext2DQuadraticCurveTo")
        @Expect(hasComponent("canvasContext2DQuadraticCurveToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DQuadraticCurveToNormal2() {
        @Expect(hasComponent("canvasContext2DQuadraticCurveToNormal1"), true)
        driver.pressBack()
    }

    // arcTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcToNormal1() {
        scrollTo("ViewCanvasContext2DArcTo")
        @Expect(hasComponent("canvasContext2DArcToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcToNormal2() {
        @Expect(hasComponent("canvasContext2DArcToNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcToException() {
        @Expect(hasComponent("canvasContext2DArcToException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DArcToBoundary() {
        @Expect(hasComponent("canvasContext2DArcToBoundary"), true)
        driver.pressBack()
    }

    // closePath
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClosePath() {
        scrollTo("ViewCanvasContext2DClosePath")
        @Expect(hasComponent("canvasContext2DClosePath"), true)
        driver.pressBack()
    }

    // moveTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DMoveToNormal1() {
        scrollTo("ViewCanvasContext2DMoveTo")
        @Expect(hasComponent("canvasContext2DMoveToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DMoveToNormal2() {
        @Expect(hasComponent("canvasContext2DMoveToNormal2"), true)
        driver.pressBack()
    }

    // lineTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineToNormal1() {
        scrollTo("ViewCanvasContext2DLineTo")
        @Expect(hasComponent("canvasContext2DLineToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineToNormal2() {
        @Expect(hasComponent("canvasContext2DLineToNormal2"), true)
        driver.pressBack()
    }

    // fill
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillNormal() {
        scrollTo("ViewCanvasContext2DFill")
        @Expect(hasComponent("canvasContext2DFillNormal"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillNone() {
        @Expect(hasComponent("canvasContext2DFillNone"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillPathNormal1() {
        @Expect(hasComponent("canvasContext2DFillPathNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillPathNormal2() {
        @Expect(hasComponent("canvasContext2DFillPathNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillPathNone() {
        @Expect(hasComponent("canvasContext2DFillPathNone"), true)
        driver.pressBack()
    }

    // stroke
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStroke() {
        scrollTo("ViewCanvasContext2DStroke")
        @Expect(hasComponent("canvasContext2DStroke"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokePathNormal1() {
        @Expect(hasComponent("canvasContext2DStrokePathNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokePathNormal2() {
        @Expect(hasComponent("canvasContext2DStrokePathNormal2"), true)
        driver.pressBack()
    }

    // clip
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClipNormal1() {
        scrollTo("ViewCanvasContext2DClip")
        @Expect(hasComponent("canvasContext2DClipNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClipNone() {
        @Expect(hasComponent("canvasContext2DClipNone"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClipNoSet() {
        @Expect(hasComponent("canvasContext2DClipNoSet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClipPathNormal1() {
        @Expect(hasComponent("canvasContext2DClipPathNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClipPathNormal2() {
        @Expect(hasComponent("canvasContext2DClipPathNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DClipPathNone() {
        @Expect(hasComponent("canvasContext2DClipPathNone"), true)
        driver.pressBack()
    }
}
