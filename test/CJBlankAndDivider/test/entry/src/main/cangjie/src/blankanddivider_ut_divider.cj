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
import ohos.ui_test.*
import ohos.ui_test
import std.collection.ArrayList
import std.math.*
import ohos.device_info.*
import ohos.hilog.Hilog
import ohos.business_exception.*
import ohos.arkui.component.common.getInspectorByKey

@Test
class BlankAndDividerUTDivider {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "Cangjie-Test", e.message)
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
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar.scrollSearch(On().id("BlankAndDivider4Divider")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // ============================================================================
    // Divider 组件创建测试用例
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerInitMainThread() {
        scrollTo("ViewDividerInit")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("testDividerInitMainThread")).getOrThrow()
        @Expect(true, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerInitNoCall() {
        scrollTo("ViewDividerInit")
        driver.delayMs(500)
        let component = driver.findComponent(On().id("testDividerInitNoCall")).getOrThrow()
        @Expect(true, true)
    }

    // ============================================================================
    // Divider 组件属性测试用例 - vertical
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerVerticalNormalValue1() {
        scrollTo("ViewDividerVerticalNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerVerticalNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let vertical = attrs.get("vertical").getOrThrow().toString()
        @Expect(vertical, "\"true\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerVerticalNormalValue2() {
        scrollTo("ViewDividerVerticalNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerVerticalNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let vertical = attrs.get("vertical").getOrThrow().toString()
        @Expect(vertical, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerVerticalNoCall() {
        scrollTo("ViewDividerVerticalSpecial")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerVerticalNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let vertical = attrs.get("vertical").getOrThrow().toString()
        @Expect(vertical, "\"true\"")   // different from the doc
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerVerticalOptionNone() {
        scrollTo("ViewDividerVerticalSpecial")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerVerticalOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let vertical = attrs.get("vertical").getOrThrow().toString()
        @Expect(vertical, "\"false\"")
    }

    // ============================================================================
    // Divider 组件属性测试用例 - color
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorNormalValue1() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorNormalValue2() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorNormalValue3() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorNormalValue4() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorNormalValue5() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorExceptionValue1() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorExceptionValue2() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorExceptionValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FF00FF00\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorExceptionValue3() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorExceptionValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FF00000F\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorBoundaryValue1() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FFFFFFFF\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorBoundaryValue2() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FF000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorNoCall() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#33000000\"")   // different from the doc
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerColorOptionNone() {
        scrollTo("ViewDividerColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerColorOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#33182431\"")
    }

    // ============================================================================
    // Divider 组件属性测试用例 - strokeWidth
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthNormalValue1() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"10.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthNormalValue2() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"5.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthNormalValue3() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"2.00fp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthNormalValue4() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"10.00lpx\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthNormalValue5() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"2.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthBoundaryValue1() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthBoundaryValue2() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthBoundaryValue3() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"0.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthNoCall() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"1.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerStrokeWidthOptionNone() {
        scrollTo("ViewDividerStrokeWidth")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerStrokeWidthOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"1.00px\"")
    }

    // ============================================================================
    // Divider 组件属性测试用例 - lineCap
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerLineCapNormalValue1() {
        scrollTo("ViewDividerLineCap")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerLineCapNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineCap = attrs.get("lineCap").getOrThrow().toString()
        @Expect(lineCap, "\"BUTT\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerLineCapNormalValue2() {
        scrollTo("ViewDividerLineCap")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerLineCapNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineCap = attrs.get("lineCap").getOrThrow().toString()
        @Expect(lineCap, "\"ROUND\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerLineCapNormalValue3() {
        scrollTo("ViewDividerLineCap")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerLineCapNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineCap = attrs.get("lineCap").getOrThrow().toString()
        @Expect(lineCap, "\"SQUARE\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerLineCapNoCall() {
        scrollTo("ViewDividerLineCap")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerLineCapNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineCap = attrs.get("lineCap").getOrThrow().toString()
        @Expect(lineCap, "\"SQUARE\"")  // different from the doc
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDividerLineCapOptionNone() {
        scrollTo("ViewDividerLineCap")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testDividerLineCapOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineCap = attrs.get("lineCap").getOrThrow().toString()
        @Expect(lineCap, "\"BUTT\"")
    }
}
