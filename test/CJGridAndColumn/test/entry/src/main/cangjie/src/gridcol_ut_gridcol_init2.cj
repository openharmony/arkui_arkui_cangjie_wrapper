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
class GridColUTGridColInit2 {
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
        scrollBar.scrollSearch(On().id("GridColIndexGridColInit")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionsNormalValue1() {
        scrollTo("ViewGridColInitOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionsNormalValue2() {
        scrollTo("ViewGridColInitOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetOptionsNormalValue1() {
        scrollTo("ViewGridColInitOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"2\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetOptionsNormalValue2() {
        scrollTo("ViewGridColInitOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderOptionsNormalValue1() {
        scrollTo("ViewGridColInitOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderOptionsNormalValue2() {
        scrollTo("ViewGridColInitOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitChildOptionsNormalValue1() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitChildOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOptionsNormalValue1() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        let offset = attrs.get("offset").getOrThrow().toString()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(span, "\"6\"")
        @Expect(offset, "\"2\"")
        @Expect(order, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOptionsNormalValue2() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        let offset = attrs.get("offset").getOrThrow().toString()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(span, "\"12\"")
        @Expect(offset, "\"0\"")
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionsExceptionValue1() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanOptionsExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetOptionsExceptionValue1() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetOptionsExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionsBoundaryValue1() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("testGridColInitSpanOptionsBoundaryValue1"))
        @Expect(component.isNone(), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionsBoundaryValue2() {
        scrollTo("ViewGridColInitOptionsPart1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanOptionsBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetOptionsBoundaryValue1() {
        scrollTo("ViewGridColInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetOptionsBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderOptionsBoundaryValue1() {
        scrollTo("ViewGridColInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderOptionsBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionsOptionNone() {
        scrollTo("ViewGridColInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetOptionsOptionNone() {
        scrollTo("ViewGridColInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderOptionsOptionNone() {
        scrollTo("ViewGridColInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOptionsNoSet() {
        scrollTo("ViewGridColInitOptionsPart2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOptionsNoSet")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        let offset = attrs.get("offset").getOrThrow().toString()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(span, "\"1\"")
        @Expect(offset, "\"0\"")
        @Expect(order, "\"0\"")
    }
}
