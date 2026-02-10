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
class CanvasUTPath2D {
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
        scrollBar?.scrollSearch(On().id("CanvasDrawingPath2D"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        // driver.pressBack()
    }

    // Path2D init
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DInit() {
        scrollTo("ViewPath2DInit")
        @Expect(hasComponent("path2DInit"), true)
        driver.pressBack()
    }

    // Path2D init with SVG path string
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DInitWithSVGNormal() {
        scrollTo("ViewPath2DInitD")
        @Expect(hasComponent("path2DInitNormal"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DInitWithSVGException() {
        @Expect(hasComponent("path2DInitDException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DInitWithSVGNone() {
        @Expect(hasComponent("path2DInitDNone"), true)
        driver.pressBack()
    }

    // Path2D addPath
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DAddPathNormal1() {
        scrollTo("ViewPath2DAddPath")
        @Expect(hasComponent("path2DAddPathNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DAddPathNormal2() {
        @Expect(hasComponent("path2DAddPathNormal2"), true)
        driver.pressBack()
    }

    // Path2D setTransform
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DSetTransformNormal1() {
        scrollTo("ViewPath2DSetTransform")
        @Expect(hasComponent("path2DSetTransformNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DSetTransformNormal2() {
        scrollTo("ViewPath2DSetTransform")
        @Expect(hasComponent("path2DSetTransformNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DSetTransformNone() {
        @Expect(hasComponent("path2DSetTransformNone"), true)
        driver.pressBack()
    }

    // Path2D moveTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DMoveToNormal1() {
        scrollTo("ViewPath2DMoveTo")
        @Expect(hasComponent("path2DMoveToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DMoveToNormal2() {
        @Expect(hasComponent("path2DMoveToNormal2"), true)
        driver.pressBack()
    }

    // Path2D lineTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DLineToNormal1() {
        scrollTo("ViewPath2DLineTo")
        @Expect(hasComponent("path2DLineToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DLineToNormal2() {
        @Expect(hasComponent("path2DLineToNormal2"), true)
        driver.pressBack()
    }

    // Path2D arc
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcNormal1() {
        scrollTo("ViewPath2DArc")
        @Expect(hasComponent("path2DArcNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcNormal2() {
        @Expect(hasComponent("path2DArcNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcException1() {
        @Expect(hasComponent("path2DArcException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcBoundary1() {
        @Expect(hasComponent("path2DArcBoundary1"), true)
        driver.pressBack()
    }

    // Path2D arcTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcToNormal1() {
        scrollTo("ViewPath2DArcTo")
        @Expect(hasComponent("path2DArcToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcToNormal2() {
        @Expect(hasComponent("path2DArcToNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcToException1() {
        @Expect(hasComponent("path2DArcToException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DArcToBoundary1() {
        @Expect(hasComponent("path2DArcToBoundary1"), true)
        driver.pressBack()
    }

    // Path2D quadraticCurveTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DQuadraticCurveToNormal1() {
        scrollTo("ViewPath2DQuadraticCurveTo")
        @Expect(hasComponent("path2DQuadraticCurveToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DQuadraticCurveToNormal2() {
        @Expect(hasComponent("path2DQuadraticCurveToNormal2"), true)
        driver.pressBack()
    }

    // Path2D bezierCurveTo
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DBezierCurveToNormal1() {
        scrollTo("ViewPath2DBezierCurveTo")
        @Expect(hasComponent("path2DBezierCurveToNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DBezierCurveToNormal2() {
        @Expect(hasComponent("path2DBezierCurveToNormal2"), true)
        driver.pressBack()
    }

    // Path2D ellipse
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DEllipseNormal1() {
        scrollTo("ViewPath2DEllipse")
        @Expect(hasComponent("path2DEllipseNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DEllipseNormal2() {
        @Expect(hasComponent("path2DEllipseNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DEllipseException1() {
        @Expect(hasComponent("path2DEllipseException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DEllipseBoundary1() {
        @Expect(hasComponent("path2DEllipseBoundary1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DEllipseNone() {
        @Expect(hasComponent("path2DEllipseNone"), true)
        driver.pressBack()
    }

    // Path2D rect
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DRectNormal1() {
        scrollTo("ViewPath2DRect")
        @Expect(hasComponent("path2DRectNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DRectNormal2() {
        @Expect(hasComponent("path2DRectNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DRectException1() {
        @Expect(hasComponent("path2DRectException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DRectBoundary1() {
        @Expect(hasComponent("path2DRectBoundary1"), true)
        driver.pressBack()
    }

    // Path2D closePath
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DClosePathNormal1() {
        scrollTo("ViewPath2DClosePath")
        @Expect(hasComponent("path2DClosePathNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPath2DClosePathNormal2() {
        @Expect(hasComponent("path2DClosePathNormal2"), true)
        driver.pressBack()
    }
}
