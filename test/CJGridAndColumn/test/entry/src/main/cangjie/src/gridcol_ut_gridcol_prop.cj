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
class GridColUTGridColProp {
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
        scrollBar.scrollSearch(On().id("GridColIndexGridColProp")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanNormalValue1() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        
        let inspector = getInspectorByKey("testGridColSpanNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanNormalValue2() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        
        let inspector = getInspectorByKey("testGridColSpanNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanNormalValue3() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        
        let inspector = getInspectorByKey("testGridColSpanNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanExceptionValue1() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        
        let inspector = getInspectorByKey("testGridColSpanExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span == "\"1\"", true)  // Int32类型，异常值使用默认值，直接比较字符串值
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanBoundaryValue1() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        
        let inspector = getInspectorByKey("testGridColSpanBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanBoundaryValue2() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        
        let inspector = getInspectorByKey("testGridColSpanBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanBoundaryValue3() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"2147483647\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionNone() {
        scrollTo("ViewGridColSpanInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionsNormalValue1() {
        scrollTo("ViewGridColSpanOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionsNormalValue2() {
        scrollTo("ViewGridColSpanOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionsExceptionValue1() {
        scrollTo("ViewGridColSpanOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanOptionsExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionsBoundaryValue1() {
        scrollTo("ViewGridColSpanOptions")
        driver.delayMs(500)
        // span为0不参与渲染
        let component = driver.findComponent(On().id("testGridColSpanOptionsBoundaryValue1"))
        @Expect(component.isNone(), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionsBoundaryValue2() {
        scrollTo("ViewGridColSpanOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanOptionsBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColSpanOptionsOptionNone() {
        scrollTo("ViewGridColSpanOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColSpanOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let span = attrs.get("span").getOrThrow().toString()
        @Expect(span, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetNormalValue1() {
        scrollTo("ViewGridColGridColOffsetInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetNormalValue2() {
        scrollTo("ViewGridColGridColOffsetInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"2\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetNormalValue3() {
        scrollTo("ViewGridColGridColOffsetInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"6\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetExceptionValue1() {
        scrollTo("ViewGridColGridColOffsetInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset == "\"0\"", true)  // Int32类型，异常值使用默认值，直接比较字符串值
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetBoundaryValue1() {
        scrollTo("ViewGridColGridColOffsetInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetBoundaryValue2() {
        scrollTo("ViewGridColGridColOffsetInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"2147483647\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetOptionNone() {
        scrollTo("ViewGridColGridColOffsetInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetOptionsNormalValue1() {
        scrollTo("ViewGridColGridColOffsetOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"2\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetOptionsNormalValue2() {
        scrollTo("ViewGridColGridColOffsetOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"1\"")  // Options类型，选择sm断点的值进行比较
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetOptionsExceptionValue1() {
        scrollTo("ViewGridColGridColOffsetOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetOptionsExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetOptionsBoundaryValue1() {
        scrollTo("ViewGridColGridColOffsetOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetOptionsBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColGridColOffsetOptionsOptionNone() {
        scrollTo("ViewGridColGridColOffsetOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColGridColOffsetOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        @Expect(offset, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderNormalValue1() {
        scrollTo("ViewGridColOrderInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderNormalValue2() {
        scrollTo("ViewGridColOrderInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderNormalValue3() {
        scrollTo("ViewGridColOrderInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")  // negative set to 0
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderBoundaryValue1() {
        scrollTo("ViewGridColOrderInt32")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")  // negative set to 0
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderBoundaryValue2() {
        scrollTo("ViewGridColOrderInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderBoundaryValue3() {
        scrollTo("ViewGridColOrderInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"2147483647\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderOptionNone() {
        scrollTo("ViewGridColOrderInt32Part2")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"12\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderOptionsNormalValue1() {
        scrollTo("ViewGridColOrderOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderOptionsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"1\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderOptionsNormalValue2() {
        scrollTo("ViewGridColOrderOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderOptionsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"1\"")  // Options类型，选择sm断点的值进行比较
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderOptionsBoundaryValue1() {
        scrollTo("ViewGridColOrderOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderOptionsBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridColOrderOptionsOptionNone() {
        scrollTo("ViewGridColOrderOptions")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testGridColOrderOptionsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let order = attrs.get("order").getOrThrow().toString()
        @Expect(order, "\"12\"")
    }
}
