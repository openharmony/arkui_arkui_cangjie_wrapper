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
import ohos.ui_test.*
import ohos.hilog.Hilog
import ohos.business_exception.*
import stdx.encoding.json.*
import ohos.display

@Test
class GridColUTGridRowInit2 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("GridColIndexGridRowInit")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsOptionsNormalValue1() {
        scrollTo("ViewGridRowInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"4\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsOptionsNormalValue2() {
        scrollTo("ViewGridRowInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsOptionsOptionNone() {
        scrollTo("ViewGridRowInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"4\"") 
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionNormalValue1() {
        scrollTo("ViewGridRowInitGutterOptionInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        //根据不同机型计算
        let sizeVpLpxIntx = 10.0*display.getDefaultDisplaySync().densityPixels
        let sizeVpLpxInty = 5.0*display.getDefaultDisplaySync().densityPixels
        @Expect(gutter, "\"<${sizeVpLpxIntx}, ${sizeVpLpxInty}\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionNormalValue2() {
        scrollTo("ViewGridRowInitGutterOptionInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        //根据不同机型计算
        let sizeVpLpxIntx = 5.0*display.getDefaultDisplaySync().densityPixels
        let sizeVpLpxInty = 3.0*display.getDefaultDisplaySync().densityPixels
        @Expect(gutter, "\"<${sizeVpLpxIntx}, ${sizeVpLpxInty}\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionOptionNone() {
        scrollTo("ViewGridRowInitGutterOptionInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionOptionsNormalValue1() {
        scrollTo("ViewGridRowInitGutterOptionOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        //根据不同机型计算
        let sizeVpLpxIntx = 10.0*display.getDefaultDisplaySync().densityPixels
        let sizeVpLpxInty = 5.0*display.getDefaultDisplaySync().densityPixels
        @Expect(gutter, "\"<${sizeVpLpxIntx}, ${sizeVpLpxInty}\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionOptionsNormalValue2() {
        scrollTo("ViewGridRowInitGutterOptionOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        //根据不同机型计算
        let sizeVpLpxIntx = 5.0*display.getDefaultDisplaySync().densityPixels
        let sizeVpLpxInty = 3.0*display.getDefaultDisplaySync().densityPixels
        @Expect(gutter, "\"<${sizeVpLpxIntx}, ${sizeVpLpxInty}\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionOptionsOptionNone() {
        scrollTo("ViewGridRowInitGutterOptionOptionsPart3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitNoCall() {
        scrollTo("ViewGridRowInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(columns, "\"4\"")
        @Expect(gutter, "\"<0.000000, 0.000000\"")
        @Expect(direction, "\"Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionInt32NoCall() {
        scrollTo("ViewGridRowInitGutterOptionInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(columns, "\"4\"")
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionOptionsNoCall() {
        scrollTo("ViewGridRowInitGutterOptionOptionsPart3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(columns, "\"4\"") 
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }
}
