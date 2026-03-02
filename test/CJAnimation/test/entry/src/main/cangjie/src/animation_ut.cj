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
import stdx.encoding.json.*
import ohos.ui_test.*
import ohos.hilog.Hilog
import std.collection.*
import std.convert.*

@Test
class AnimationUT {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    protected override func beforeAll() {
        let scrollBar = driver
            .waitForComponent(On().id("scroller"), 500)
            .getOrThrow()
        logger("started")
        scrollBar
            .scrollSearch(On().id("ViewAnimation"))
            .getOrThrow()
            .click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationParamsValid() {
        let buttion0 = driver.findComponent(On().id("buttonParamsValid")).getOrThrow()
        buttion0.click()
        driver.delayMs(5000)

        var inspector = getInspectorByKey("buttonParamsValid")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textParamsValid")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 4750, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationDurationLessThanZero() {
        let buttion0 = driver.findComponent(On().id("buttonDurationLessThanZero")).getOrThrow()
        buttion0.click()
        driver.delayMs(500)
        var inspector = getInspectorByKey("buttonDurationLessThanZero")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textDurationLessThanZero")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime <= 50, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationDurationEqZero() {
        let buttion0 = driver.findComponent(On().id("buttonDurationEqZero")).getOrThrow()
        buttion0.click()
        driver.delayMs(500)
        var inspector = getInspectorByKey("buttonDurationEqZero")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textDurationEqZero")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime <= 50, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationTempoLessThanZero() {
        let buttion0 = driver.findComponent(On().id("buttonTempoLessThanZero")).getOrThrow()
        buttion0.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("buttonTempoLessThanZero")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textTempoLessThanZero")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 3500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationTempoEqZero() {
        let buttion0 = driver.findComponent(On().id("buttonTempoEqZero")).getOrThrow()
        buttion0.click()
        driver.delayMs(4000)
        var inspector = getInspectorByKey("buttonTempoEqZero")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textTempoEqZero")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime <= 50, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationCurveLinear() {
        let buttion0 = driver.findComponent(On().id("buttonCurveLinear")).getOrThrow()
        buttion0.click()
        driver.delayMs(4000)
        var inspector = getInspectorByKey("buttonCurveLinear")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textCurveLinear")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 3500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationCurveFriction() {
        let buttion0 = driver.findComponent(On().id("buttonCurveFriction")).getOrThrow()
        buttion0.click()
        driver.delayMs(4000)
        var inspector = getInspectorByKey("buttonCurveFriction")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textCurveFriction")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 3500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationDelayZero() {
        let buttion0 = driver.findComponent(On().id("buttonDelayZero")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonDelayZero")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textDelayZero")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationDelayAbsLessThanActualTime() {
        let buttion0 = driver.findComponent(On().id("buttonDelayAbsLessThanActualTime")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonDelayAbsLessThanActualTime")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textDelayAbsLessThanActualTime")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 500, true)
        @Expect(totalTime < 1000, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationDelayAbsMoreThanActualTime() {
        let buttion0 = driver.findComponent(On().id("buttonDelayAbsMoreThanActualTime")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonDelayAbsMoreThanActualTime")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textDelayAbsMoreThanActualTime")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime <= 50, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationIterationsZero() {
        let buttion0 = driver.findComponent(On().id("buttonIterationsZero")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonIterationsZero")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textIterationsZero")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime <= 50, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationIterationsLowerBoundary() {
        let buttion0 = driver.findComponent(On().id("buttonIterationsLowerBoundary")).getOrThrow()
        buttion0.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("buttonIterationsLowerBoundary")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textIterationsLowerBoundary")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime == -1, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationIterationsInvalid() {
        let buttion0 = driver.findComponent(On().id("buttonIterationsInvalid")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonIterationsInvalid")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textIterationsInvalid")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationPlayModeReverse() {
        let buttion0 = driver.findComponent(On().id("buttonPlayModeReverse")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonPlayModeReverse")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textPlayModeReverse")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 750, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationPlayModeAlternate() {
        let buttion0 = driver.findComponent(On().id("buttonPlayModeAlternate")).getOrThrow()
        buttion0.click()
        driver.delayMs(7000)
        var inspector = getInspectorByKey("buttonPlayModeAlternate")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textPlayModeAlternate")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 5500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationPlayModeAlternateReverse() {
        let buttion0 = driver.findComponent(On().id("buttonPlayModeAlternateReverse")).getOrThrow()
        buttion0.click()
        driver.delayMs(8000)
        var inspector = getInspectorByKey("buttonPlayModeAlternateReverse")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textPlayModeAlternateReverse")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 6500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationFrameRateLessThanLowerBoundary() {
        let buttion0 = driver.findComponent(On().id("buttonFrameRateLessThanLowerBoundary")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonFrameRateLessThanLowerBoundary")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textFrameRateLessThanLowerBoundary")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1000, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationExpectedFrameRateNotInRange() {
        let buttion0 = driver.findComponent(On().id("buttonExpectedFrameRateNotInRange")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonExpectedFrameRateNotInRange")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textExpectedFrameRateNotInRange")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1000, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationFrameRateMinMoreThanMax() {
        let buttion0 = driver.findComponent(On().id("buttonFrameRateMinMoreThanMax")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonFrameRateMinMoreThanMax")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textFrameRateMinMoreThanMax")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1000, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationNoSet() {
        let buttion0 = driver.findComponent(On().id("buttonNoSet")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonNoSet")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textNoSet")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1000, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationOptionNone() {
        let buttion0 = driver.findComponent(On().id("buttonOptionNone")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonOptionNone")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textOptionNone")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1000, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimationAnimateParamOptionNone() {
        let buttion0 = driver.findComponent(On().id("buttonAnimateParamOptionNone")).getOrThrow()
        buttion0.click()
        driver.delayMs(2000)
        var inspector = getInspectorByKey("buttonAnimateParamOptionNone")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"100.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"20.00vp\"")

        inspector = getInspectorByKey("textAnimateParamOptionNone")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString().replace("\"", "")
        let totalTime = Int64.parse(content)
        @Expect(totalTime >= 1000, true)
    }
}
