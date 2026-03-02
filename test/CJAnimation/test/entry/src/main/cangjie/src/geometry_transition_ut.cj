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
class GeometryTransitionUT {
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
            .scrollSearch(On().id("ViewGeometryTransition"))
            .getOrThrow()
            .click()
        driver.delayMs(2000)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGeometryTransitionValidParams() {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        var inspector = getInspectorByKey("image1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"350.00vp\"")
        Hilog.info(0, "geometryTransitionDuration", "${AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow()}")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)

        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        inspector = getInspectorByKey("column1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"80.00vp\"")
        Hilog.info(0, "geometryTransitionDuration", "${AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow()}")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGeometryTransitionInvalidParams() {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        var inspector = getInspectorByKey("image1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"350.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)

        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        inspector = getInspectorByKey("column1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"80.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGeometryTransitionIdNotEq() {
        var buttion = driver.findComponent(On().id("pushIdNotEqButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        var inspector = getInspectorByKey("image1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"350.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)

        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        inspector = getInspectorByKey("column1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"80.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGeometryTransitionNoCall() {
        var buttion = driver.findComponent(On().id("pushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        var inspector = getInspectorByKey("image1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"350.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)

        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        inspector = getInspectorByKey("column1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"80.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGeometryTransitionNoSet() {
        var buttion = driver.findComponent(On().id("pushNoSetButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        var inspector = getInspectorByKey("image1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"350.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)

        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        inspector = getInspectorByKey("column1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"80.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGeometryTransitionOptionNone() {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        var inspector = getInspectorByKey("image1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"350.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)

        buttion = driver.findComponent(On().id("stackId")).getOrThrow()
        buttion.click()
        driver.delayMs(6000)
        inspector = getInspectorByKey("column1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"80.00vp\"")
        @Expect(AppStorage.get<Int64>("geometryTransitionDuration").getOrThrow() >= 4500, true)
    }

}