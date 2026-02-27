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
class SharedTransitionUT {
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
            .scrollSearch(On().id("ViewSharedTransition"))
            .getOrThrow()
            .click()
        driver.delayMs(2000)
    }

    protected override func afterAll() {
        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionDurationValid() {
        var buttion = driver.findComponent(On().id("homePagePushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        var inspector = getInspectorByKey("homePageImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr != "\"250.00vp\"" && widthStr != "\"100.00vp\"", true)

        driver.delayMs(5000)
        inspector = getInspectorByKey("validImage")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionDelayValid() {
        var buttion = driver.findComponent(On().id("homePagePushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)

        buttion = driver.findComponent(On().id("validBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(7000)

        var inspector = getInspectorByKey("validImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr != "\"250.00vp\"" && widthStr != "\"100.00vp\"", true)

        driver.delayMs(2000)
        inspector = getInspectorByKey("homePageImage")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"150.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionBoundary() {
        var buttion = driver.findComponent(On().id("homePagePushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        var inspector = getInspectorByKey("boundaryImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionInvalidParams() {
        var buttion = driver.findComponent(On().id("homePagePushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        var inspector = getInspectorByKey("invalidImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionIdNotEq() {
        var buttion = driver.findComponent(On().id("homePagePushIdNotEqButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        var inspector = getInspectorByKey("idNotEqImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionNoCall() {
        var buttion = driver.findComponent(On().id("homePagePushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        var inspector = getInspectorByKey("noCallImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionNoSet() {
        var buttion = driver.findComponent(On().id("homePagePushNoSetButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        var inspector = getInspectorByKey("noSetImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSharedTransitionOptionNone() {
        var buttion = driver.findComponent(On().id("homePagePushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        var inspector = getInspectorByKey("optionNoneImage")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var widthStr = attrs.get("width").getOrThrow().toString()
        @Expect(widthStr, "\"100.00vp\"")
        driver.pressBack()
        driver.delayMs(9000)
    }
}
