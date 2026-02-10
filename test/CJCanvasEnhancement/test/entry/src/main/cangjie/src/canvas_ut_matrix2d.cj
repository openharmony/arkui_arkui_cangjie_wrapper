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
class CanvasUTMatrix2D {
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
        scrollBar?.scrollSearch(On().id("CanvasDrawingMatrix2D"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
    }

    // Matrix2D init
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DInitNormal1() {
        scrollTo("ViewMatrix2DInit")
        @Expect(hasComponent("matrix2DInitNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DInitNormal2() {
        @Expect(hasComponent("matrix2DInitNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DInitNone() {
        @Expect(hasComponent("matrix2DInitNone"), true)
        driver.pressBack()
    }

    // Matrix2D scaleX
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleXNormal() {
        scrollTo("ViewMatrix2DScaleX")
        @Expect(hasComponent("matrix2DScaleXNormal"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleXException() {
        @Expect(hasComponent("matrix2DScaleXException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleXBoundary() {
        @Expect(hasComponent("matrix2DScaleXBoundary"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleXNone() {
        @Expect(hasComponent("matrix2DScaleXNone"), true)
        driver.pressBack()
    }

    // Matrix2D scaleY
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleYNormal() {
        scrollTo("ViewMatrix2DScaleY")
        @Expect(hasComponent("matrix2DScaleYNormal"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleYException() {
        @Expect(hasComponent("matrix2DScaleYException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleYBoundary() {
        @Expect(hasComponent("matrix2DScaleYBoundary"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleYNone() {
        @Expect(hasComponent("matrix2DScaleYNone"), true)
        driver.pressBack()
    }

    // Matrix2D rotateX
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateXNormal() {
        scrollTo("ViewMatrix2DRotateX")
        @Expect(hasComponent("matrix2DRotateXNormal"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateXException() {
        @Expect(hasComponent("matrix2DRotateXException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateXBoundary() {
        @Expect(hasComponent("matrix2DRotateXBoundary"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateXNone() {
        @Expect(hasComponent("matrix2DRotateXNone"), true)
        driver.pressBack()
    }

    // Matrix2D rotateY
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateYNormal() {
        scrollTo("ViewMatrix2DRotateY")
        @Expect(hasComponent("matrix2DRotateYNormal"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateYException() {
        @Expect(hasComponent("matrix2DRotateYException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateYBoundary() {
        @Expect(hasComponent("matrix2DRotateYBoundary"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateYNone() {
        @Expect(hasComponent("matrix2DRotateYNone"), true)
        driver.pressBack()
    }

    // Matrix2D translateX
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateXNormal1() {
        scrollTo("ViewMatrix2DTranslateX")
        @Expect(hasComponent("matrix2DTranslateXNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateXNormal2() {
        @Expect(hasComponent("matrix2DTranslateXNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateXNone() {
        @Expect(hasComponent("matrix2DTranslateXNone"), true)
        driver.pressBack()
    }

    // Matrix2D translateY
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateYNormal1() {
        scrollTo("ViewMatrix2DTranslateY")
        @Expect(hasComponent("matrix2DTranslateYNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateYNormal2() {
        @Expect(hasComponent("matrix2DTranslateYNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateYNone() {
        @Expect(hasComponent("matrix2DTranslateYNone"), true)
        driver.pressBack()
    }

    // Matrix2D identity
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DIdentity() {
        scrollTo("ViewMatrix2DIdentity")
        @Expect(hasComponent("matrix2DIdentity"), true)
        driver.pressBack()
    }

    // Matrix2D invert
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DInvert() {
        scrollTo("ViewMatrix2DInvert")
        @Expect(hasComponent("matrix2DInvert"), true)
        driver.pressBack()
    }

    // Matrix2D rotate
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateNormal1() {
        scrollTo("ViewMatrix2DRotate")
        @Expect(hasComponent("matrix2DRotateNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateNormal2() {
        @Expect(hasComponent("matrix2DRotateNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DRotateNone() {
        @Expect(hasComponent("matrix2DRotateNone"), true)
        driver.pressBack()
    }

    // Matrix2D translate
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateNormal1() {
        scrollTo("ViewMatrix2DTranslate")
        @Expect(hasComponent("matrix2DTranslateNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateNormal2() {
        @Expect(hasComponent("matrix2DTranslateNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DTranslateNone() {
        @Expect(hasComponent("matrix2DTranslateNone"), true)
        driver.pressBack()
    }

    // Matrix2D scale
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleNormal1() {
        scrollTo("ViewMatrix2DScale")
        @Expect(hasComponent("matrix2DScaleNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleNormal2() {
        @Expect(hasComponent("matrix2DScaleNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMatrix2DScaleNone() {
        @Expect(hasComponent("matrix2DScaleNone"), true)
        driver.pressBack()
    }
}
