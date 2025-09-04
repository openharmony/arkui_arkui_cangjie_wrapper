/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import ohos.router.*
import std.convert.*
import std.math.abs
import ohos.ui_test.*
import ohos.business_exception.*

@Test
class CanvasDrawing_UT_1 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1,"1","Cangjie-Test", "ScrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1,"1","Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500)
        Hilog.error(1,"1","Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("Index_UT1"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }



    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_circleCommonAttrs() {
        ScrollTo("View_Circle")

        let inspector = getInspectorByKey("circleComponent1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","1","attrs is: " + attrs.toString())

        let circleComponent1 = driver.findComponent(On().id("circleComponent1"))
        circleComponent1?.click()

        let sendTouchEvent = driver.findComponent(On().id("sendTouchEvent"))
        sendTouchEvent?.click()

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width,"\"150.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height,"\"200.00vp\"")

        let fillOpacity = attrs.get("fillOpacity").getOrThrow().toString()
        @Expect(fillOpacity,"\"0.000000\"")

        let stroke = attrs.get("stroke").getOrThrow().toString()
        @Expect(stroke,"\"#FFFF0000\"")
        let strokeDashArray = attrs.get("strokeDashArray").getOrThrow().toString()
        @Expect(strokeDashArray,"[\"1.00vp\",\"2.00vp\"]")
        driver.delayMs(1000)
    }


    func approxEquals(expected: Float32, actualStr: String) {
        let actual = Float32.parse(actualStr)
        @Expect(abs(expected - actual) < 1e-4)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_gradientColorAttrs1() {
        ScrollTo("View_GradientColor")

        let inspector = getInspectorByKey("row1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let linearGradient = attrs.get("linearGradient").getOrThrow().toString()
        @Expect(linearGradient, "{\"angle\":\"90.00px\",\"direction\":\"GradientDirection.Bottom\",\"colors\":[[\"#FF0000FF\",\"0.000000\"],[\"#FFFF0000\",\"0.300000\"],[\"#FFFFFF00\",\"1.000000\"]],\"repeating\":\"false\"}")
        driver.delayMs(600)

        let inspector5 = getInspectorByKey("row2")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()

        let linearGradient5 = attrs5.get("linearGradient").getOrThrow().toString()
        @Expect(linearGradient5, "{\"direction\":\"GradientDirection.Left\",\"colors\":[[\"#FF0000FF\",\"0.000000\"],[\"#FFFF0000\",\"0.300000\"],[\"#FFFFFF00\",\"0.500000\"]],\"repeating\":\"true\"}")

        let inspector1 = getInspectorByKey("row3")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()

        let sweepGradient1 = attrs1.get("sweepGradient").getOrThrow().toString()
        @Expect(sweepGradient1, "{\"center\":[\"100.00px\",\"100.00px\"],\"start\":\"0.00px\",\"end\":\"359.00px\",\"colors\":[[\"#FFFF0000\",\"0.000000\"],[\"#FF0000FF\",\"0.300000\"],[\"#FFFFFF00\",\"1.000000\"]],\"repeating\":\"false\"}")

        let inspector2 = getInspectorByKey("row4")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let sweepGradient2 = attrs2.get("sweepGradient").getOrThrow().toString()
        @Expect(sweepGradient2, "{\"center\":[\"100.00px\",\"100.00px\"],\"start\":\"0.00px\",\"end\":\"359.00px\",\"colors\":[[\"#FFFF0000\",\"0.000000\"],[\"#FF0000FF\",\"0.300000\"],[\"#FFFFFF00\",\"0.500000\"]],\"repeating\":\"true\"}")

        let inspector3 = getInspectorByKey("row5")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let radialGradient3 = attrs3.get("radialGradient").getOrThrow().toString()
        Hilog.info(0,"0","CangjieTest","[test_gradientColorAttrs2] radialGradient3: ${radialGradient3}")
        @Expect(radialGradient3, "{\"center\":[\"100.00px\",\"100.00px\"],\"radius\":\"120.00vp\",\"colors\":[[\"#FFFF0000\",\"0.000000\"],[\"#FF0000FF\",\"0.300000\"],[\"#FFFFFF00\",\"1.000000\"]],\"repeating\":\"false\"}")

        let inspector4 = getInspectorByKey("row6")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let radialGradient4 = attrs4.get("radialGradient").getOrThrow().toString()
        Hilog.info(0,"0","CangjieTest","[test_gradientColorAttrs2] radialGradient4: ${radialGradient4}")
        @Expect(radialGradient4, "{\"center\":[\"100.00px\",\"100.00px\"],\"radius\":\"120.00vp\",\"colors\":[[\"#FFFF0000\",\"0.000000\"],[\"#FF0000FF\",\"0.300000\"],[\"#FFFFFF00\",\"0.500000\"]],\"repeating\":\"true\"}")
        driver.delayMs(600)
    }

    // image unittest


    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_image_animator() {
        ScrollTo("View_Image_Animator")
        let start = driver.findComponent(On().id("start"))
        start?.click()
        let pause = driver.waitForComponent(On().id("pause"),5000)
        pause?.click()
        let stop = driver.waitForComponent(On().id("stop"),5000)
        stop?.click()
        let reverse = driver.waitForComponent(On().id("reverse"),5000)
        reverse?.click()
        let once = driver.waitForComponent(On().id("once"),5000)
        once?.click()
        let infinite = driver.waitForComponent(On().id("infinite"),5000)
        infinite?.click()
        driver.delayMs(500)
    }

}
