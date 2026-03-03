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
class BlankAndDividerUTBlank {
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
        scrollBar.scrollSearch(On().id("BlankAndDivider4Blank")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // ============================================================================
    // Blank 组件创建测试用例
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinNormalValue1() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinNormalValue2() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"5.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinNormalValue3() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"2.00fp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinNormalValue4() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"10.00lpx\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinNormalValue5() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinBoundaryValue1() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinBoundaryValue2() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinBoundaryValue3() {
        scrollTo("ViewBlankInitMinNormal")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitNoCall() {
        scrollTo("ViewBlankInitMinSpecial")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"0.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankInitMinOptionNone() {
        scrollTo("ViewBlankInitMinSpecial")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankInitMinOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let minSize = attrs.get("min").getOrThrow().toString()
        @Expect(minSize, "\"0.00vp\"")
    }

    // ============================================================================
    // Blank 组件属性测试用例
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorNormalValue1() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorNormalValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorNormalValue2() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorNormalValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorNormalValue3() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorNormalValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorNormalValue4() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorNormalValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorNormalValue5() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorNormalValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorExceptionValue1() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorExceptionValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorExceptionValue2() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorExceptionValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FF00FF00\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorExceptionValue3() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorExceptionValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FF00000F\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorBoundaryValue1() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FFFFFFFF\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorBoundaryValue2() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FF000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorNoCall() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorNoCall")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#00000000\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankColorOptionNone() {
        scrollTo("ViewBlankColor")
        driver.delayMs(500)
        let inspector = getInspectorByKey("testBlankColorOptionNone")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#00000000\"")
    }
}
