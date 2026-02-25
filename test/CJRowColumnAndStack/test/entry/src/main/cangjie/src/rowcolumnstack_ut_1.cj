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
class RowColumnStackUT1 {
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
        scrollBar.scrollSearch(On().id("RowColumnStackIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // Column Init tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceNormalValue1() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceNormalValue2() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"5.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceNormalValue3() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"2.00fp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitChildNormalValue1() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitChildNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitChildNormalValue2() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitChildNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitNormalValue1() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitNormalValue2() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"5.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitNormalValue3() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"1.00%\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceExceptionValue1() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceBoundaryValue1() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceBoundaryValue2() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitNoCall() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnInitSpaceOptionNone() {
        scrollTo("ViewColumnInit")
        let inspector = getInspectorByKey("testColumnInitSpaceOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    // Column AlignItems tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnAlignItemsNormalValue1() {
        scrollTo("ViewColumnAlignItems")
        let inspector = getInspectorByKey("testColumnAlignItemsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"HorizontalAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnAlignItemsNormalValue2() {
        scrollTo("ViewColumnAlignItems")
        let inspector = getInspectorByKey("testColumnAlignItemsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"HorizontalAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnAlignItemsNormalValue3() {
        scrollTo("ViewColumnAlignItems")
        let inspector = getInspectorByKey("testColumnAlignItemsNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"HorizontalAlign.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnAlignItemsNoCall() {
        scrollTo("ViewColumnAlignItems")
        let inspector = getInspectorByKey("testColumnAlignItemsNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"HorizontalAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnAlignItemsOptionNone() {
        scrollTo("ViewColumnAlignItems")
        let inspector = getInspectorByKey("testColumnAlignItemsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"HorizontalAlign.Center\"")
    }

    // Column JustifyContent tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNormalValue1() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNormalValue2() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNormalValue3() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNormalValue4() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceBetween\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNormalValue5() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceAround\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNormalValue6() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceEvenly\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentNoCall() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColumnJustifyContentOptionNone() {
        scrollTo("ViewColumnJustifyContent")
        let inspector = getInspectorByKey("testColumnJustifyContentOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    // Row Init tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceNormalValue1() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceNormalValue2() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"5.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceNormalValue3() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"2.00fp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitChildNormalValue1() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitChildNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitChildNormalValue2() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitChildNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitNormalValue1() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitNormalValue2() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"5.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceExceptionValue1() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceExceptionValue2() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceExceptionValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"1.00%\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceBoundaryValue1() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceBoundaryValue2() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitNoCall() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowInitSpaceOptionNone() {
        scrollTo("ViewRowInit")
        let inspector = getInspectorByKey("testRowInitSpaceOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let space = attrs.get("space").getOrThrow().toString()
        @Expect(space, "\"0.00vp\"")
    }

    // Row AlignItems tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowAlignItemsNormalValue1() {
        scrollTo("ViewRowAlignItems")
        let inspector = getInspectorByKey("testRowAlignItemsNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"VerticalAlign.Top\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowAlignItemsNormalValue2() {
        scrollTo("ViewRowAlignItems")
        let inspector = getInspectorByKey("testRowAlignItemsNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"VerticalAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowAlignItemsNormalValue3() {
        scrollTo("ViewRowAlignItems")
        let inspector = getInspectorByKey("testRowAlignItemsNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"VerticalAlign.Bottom\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowAlignItemsNoCall() {
        scrollTo("ViewRowAlignItems")
        let inspector = getInspectorByKey("testRowAlignItemsNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"VerticalAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowAlignItemsOptionNone() {
        scrollTo("ViewRowAlignItems")
        let inspector = getInspectorByKey("testRowAlignItemsOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let alignItems = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"VerticalAlign.Center\"")
    }

    // Row JustifyContent tests
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNormalValue1() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNormalValue2() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNormalValue3() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.End\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNormalValue4() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceBetween\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNormalValue5() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceAround\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNormalValue6() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNormalValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.SpaceEvenly\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentNoCall() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRowJustifyContentOptionNone() {
        scrollTo("ViewRowJustifyContent")
        let inspector = getInspectorByKey("testRowJustifyContentOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let justifyContent = attrs.get("justifyContent").getOrThrow().toString()
        @Expect(justifyContent, "\"FlexAlign.Start\"")
    }
}
