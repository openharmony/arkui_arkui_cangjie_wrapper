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
import ohos.arkui.component.common.getInspectorByKey
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.hilog.Hilog
import ohos.business_exception.*
import stdx.encoding.json.*

@Test
class RowColumnStackUT2 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        logger("scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                logger(e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        logger("started")
        scrollBar.scrollSearch(On().id("RowColumnStackIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // Stack Init tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue1() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.TopStart\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue2() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Top\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue3() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.TopEnd\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue4() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue5() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue6() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue7() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue7")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.BottomStart\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue8() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue8")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Bottom\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentNormalValue9() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentNormalValue9")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.BottomEnd\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitChildNormalValue1() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitChildNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitChildNormalValue2() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitChildNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitNormalValue1() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitNormalValue2() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.TopStart\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitNormalValue3() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.BottomEnd\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitNoCall() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackInitAlignContentOptionNone() {
        scrollTo("ViewStackInit")
        let inspector = getInspectorByKey("testStackInitAlignContentOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    // Stack AlignContent tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue1() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.TopStart\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue2() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Top\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue3() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.TopEnd\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue4() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue5() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue6() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue7() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue7")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.BottomStart\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue8() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue8")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Bottom\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNormalValue9() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNormalValue9")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.BottomEnd\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentNoCall() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackAlignContentOptionNone() {
        scrollTo("ViewStackAlignContent")
        let inspector = getInspectorByKey("testStackAlignContentOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignContent = attrs.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"Alignment.Center\"")
    }

    // Flex Init tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitDirectionNormalValue1() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitDirectionNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitDirectionNormalValue2() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitDirectionNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Column\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitDirectionNormalValue3() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitDirectionNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.RowReverse\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitDirectionNormalValue4() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitDirectionNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.ColumnReverse\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitWrapNormalValue1() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitWrapNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        @Expect(wrap, "\"FlexWrap.NoWrap\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitWrapNormalValue2() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitWrapNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        @Expect(wrap, "\"FlexWrap.Wrap\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitWrapNormalValue3() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitWrapNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        @Expect(wrap, "\"FlexWrap.WrapReverse\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentNormalValue1() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentNormalValue2() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentNormalValue3() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentNormalValue4() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceBetween\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentNormalValue5() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceAround\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentNormalValue6() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceEvenly\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsNormalValue1() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.Auto\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsNormalValue2() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsNormalValue3() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsNormalValue4() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsNormalValue5() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.Stretch\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsNormalValue6() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.Baseline\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentNormalValue1() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentNormalValue2() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentNormalValue3() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentNormalValue4() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.SpaceBetween\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentNormalValue5() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.SpaceAround\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentNormalValue6() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.SpaceEvenly\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitChildNormalValue1() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitChildNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitChildNormalValue2() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitChildNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitChildNormalValue3() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitChildNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitNormalValue1() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
        @Expect(wrap, "\"FlexWrap.Wrap\"")
        @Expect(justifyContent, "\"FlexAlign.Center\"")
        @Expect(alignItems, "\"ItemAlign.Center\"")
        @Expect(alignContent, "\"FlexAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitNormalValue2() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Column\"")
        @Expect(wrap, "\"FlexWrap.NoWrap\"")
        @Expect(justifyContent, "\"FlexAlign.SpaceBetween\"")
        @Expect(alignItems, "\"ItemAlign.Stretch\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitNormalValue3() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
        @Expect(wrap, "\"FlexWrap.WrapReverse\"")
        @Expect(justifyContent, "\"FlexAlign.SpaceEvenly\"")
        @Expect(alignItems, "\"ItemAlign.Baseline\"")
        @Expect(alignContent, "\"FlexAlign.SpaceAround\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitNoCall() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
        @Expect(wrap, "\"FlexWrap.NoWrap\"")
        @Expect(justifyContent, "\"FlexAlign.Start\"")
        @Expect(alignItems, "\"ItemAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitDirectionOptionNone() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitDirectionOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let direction = constructor.get("direction").getOrThrow().toString()
        @Expect(direction, "\"FlexDirection.Row\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitWrapOptionNone() {
        scrollTo("ViewFlexInitDirectionWrap")
        let inspector = getInspectorByKey("testFlexInitWrapOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let wrap = constructor.get("wrap").getOrThrow().toString()
        @Expect(wrap, "\"FlexWrap.NoWrap\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitJustifyContentOptionNone() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitJustifyContentOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let justifyContent = constructor.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignItemsOptionNone() {
        scrollTo("ViewFlexInitJustifyAlignItems")
        let inspector = getInspectorByKey("testFlexInitAlignItemsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignItems = constructor.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"ItemAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexInitAlignContentOptionNone() {
        scrollTo("ViewFlexInitAlignContentOther")
        let inspector = getInspectorByKey("testFlexInitAlignContentOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let alignContent = constructor.get("alignContent").getOrThrow().toString()
        @Expect(alignContent, "\"FlexAlign.Start\"")
    }
}
