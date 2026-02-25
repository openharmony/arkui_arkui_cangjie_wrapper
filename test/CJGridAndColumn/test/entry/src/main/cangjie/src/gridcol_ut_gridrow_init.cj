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

@Test
class GridColUTGridRowInit {
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
    func testGridRowInitColumnsNormalValue1() {
        scrollTo("ViewGridRowInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsNormalValue2() {
        scrollTo("ViewGridRowInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterNormalValue1() {
        scrollTo("ViewGridRowInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<32.500000, 32.500000\"")        // change vp to px
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterNormalValue2() {
        scrollTo("ViewGridRowInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<5.000000, 5.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitBreakpointsNormalValue1() {
        scrollTo("ViewGridRowInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitBreakpointsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let breakpoints = attrs.get("breakpoints").getOrThrow().toString()
        @Expect(breakpoints, "\"[320.00vp, 600.00vp, 840.00vp,]\"")  // breakpoints是复杂对象，需要检查JSON字符串是否包含值
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitDirectionNormalValue1() {
        scrollTo("ViewGridRowInitInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitDirectionNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(direction, "\"Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitDirectionNormalValue2() {
        scrollTo("ViewGridRowInitInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitDirectionNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(direction, "\"RowReverse\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitChildNormalValue1() {
        scrollTo("ViewGridRowInitInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitChildNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitNormalValue1() {
        scrollTo("ViewGridRowInitInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(columns, "\"12\"")
        @Expect(gutter, "\"<32.500000, 32.500000\"")
        @Expect(direction, "\"Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitNormalValue2() {
        scrollTo("ViewGridRowInitInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(columns, "\"6\"")
        @Expect(gutter, "\"<5.000000, 5.000000\"")
        @Expect(direction, "\"RowReverse\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsExceptionValue1() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"4\"")  // need check
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsExceptionValue2() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsExceptionValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"4\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsBoundaryValue1() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterBoundaryValue1() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterBoundaryValue2() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitColumnsOptionNone() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitColumnsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        @Expect(columns == "\"12\"", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitGutterOptionNone() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitGutterOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        @Expect(gutter, "\"<0.000000, 0.000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitBreakpointsOptionNone() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitBreakpointsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let breakpoints = attrs.get("breakpoints").getOrThrow().toString()
        @Expect(breakpoints, "\"[320.00vp, 600.00vp, 840.00vp,]\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitDirectionOptionNone() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitDirectionOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(direction, "\"Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowInitNoCall() {
        scrollTo("ViewGridRowInitInt32Part3")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridRowInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let columns = attrs.get("columns").getOrThrow().toString()
        let gutter = attrs.get("gutter").getOrThrow().toString()
        let direction = attrs.get("direction").getOrThrow().toString()
        @Expect(columns ,"\"4\"")
        @Expect(gutter, "\"<0.000000, 0.000000\"")
        @Expect(direction, "\"Row\"")
    }
}
