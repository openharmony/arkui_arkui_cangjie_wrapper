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
class CanvasUTContext2DTransform {
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
        scrollBar?.scrollSearch(On().id("CanvasDrawingTransform"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        // driver.pressBack()
    }

    // translate
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTranslateNormal1() {
        scrollTo("ViewCanvasContext2DTranslate")
        @Expect(hasComponent("canvasContext2DTranslateNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTranslateNormal2() {
        @Expect(hasComponent("canvasContext2DTranslateNormal2"), true)
        driver.pressBack()
    }

    // rotate
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRotateNormal1() {
        scrollTo("ViewCanvasContext2DRotate")
        @Expect(hasComponent("canvasContext2DRotateNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DRotateNormal2() {
        @Expect(hasComponent("canvasContext2DRotateNormal2"), true)
        driver.pressBack()
    }

    // scale
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DScaleNormal1() {
        scrollTo("ViewCanvasContext2DScale")
        @Expect(hasComponent("canvasContext2DScaleNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DScaleNormal2() {
        @Expect(hasComponent("canvasContext2DScaleNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DScaleException1() {
        @Expect(hasComponent("canvasContext2DScaleException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DScaleException2() {
        @Expect(hasComponent("canvasContext2DScaleException2"), true)
        driver.pressBack()
    }
    
    // transform
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTransformNoramal1() {
        scrollTo("ViewCanvasContext2DTransform")
        @Expect(hasComponent("canvasContext2DTransformNoramal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTransformNoramal2() {
        @Expect(hasComponent("canvasContext2DTransformNoramal2"), true)
        driver.pressBack()
    }

    // setTransform
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetTransformNomal1() {
        scrollTo("ViewCanvasContext2DSetTransform")
        @Expect(hasComponent("canvasContext2DSetTransformNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetTransformNomal2() {
        @Expect(hasComponent("canvasContext2DSetTransformNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetTransformMaxtrixNormal1() {
        @Expect(hasComponent("canvasContext2DSetTransformMatrixNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetTransformMaxtrixNormal2() {
        @Expect(hasComponent("canvasContext2DSetTransformMatrixNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetTransformMaxtrixNone() {
        @Expect(hasComponent("canvasContext2DSetTransformMaxtrixNone"), true)
        driver.pressBack()
    }

    // resetTransform
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DResetTransform() {
        scrollTo("ViewCanvasContext2DResetTransform")
        @Expect(hasComponent("canvasContext2DResetTransform"), true)
        driver.pressBack()
    }

    // getTransform
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetTransform() {
        scrollTo("ViewCanvasContext2DGetTransform")
        @Expect(hasComponent("canvasContext2DGetTransform"), true)
        driver.pressBack()
    }
}
