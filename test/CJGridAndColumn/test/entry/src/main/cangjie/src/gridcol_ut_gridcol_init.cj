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
class GridColUTGridColInit {
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
    func testGridColInitSpanNormalValue1() {
        scrollTo("ViewGridColInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanNormalValue2() {
        scrollTo("ViewGridColInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanNormalValue3() {
        scrollTo("ViewGridColInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetNormalValue1() {
        scrollTo("ViewGridColInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetNormalValue2() {
        scrollTo("ViewGridColInitInt32Part1")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"2\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderNormalValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderNormalValue2() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderNormalValue3() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitChildNormalValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitChildNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitNormalValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitNormalValue1")
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
    func testGridColInitNormalValue2() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitNormalValue2")
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
    func testGridColInitSpanExceptionValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetExceptionValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanBoundaryValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("testGridColInitSpanBoundaryValue1"))
        @Expect(component.isNone(), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanBoundaryValue2() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanBoundaryValue3() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"2147483647\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetBoundaryValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderBoundaryValue1() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderBoundaryValue2() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderBoundaryValue3() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"2147483647\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitSpanOptionNone() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitSpanOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOffsetOptionNone() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOffsetOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitOrderOptionNone() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitOrderOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColInitNoCall() {
        scrollTo("ViewGridColInitInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColInitNoCall")
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
