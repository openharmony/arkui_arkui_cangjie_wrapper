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
 *
 * LLT for general attribute shadow: one test case per component.
 */

package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.arkui.component.common.getInspectorByKey
import std.convert.*

@Test
class BasicCommonUTShadow {
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

    private func assertShadowRadius(id: String, radiusSub: Float64) {
        let inspector = getInspectorByKey(id)
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let shadow = attrs.get("shadow").getOrThrow().asObject()
        let radius = shadow.get("radius").getOrThrow().toString()
        @Expect(radius.contains(radiusSub.toString()))
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        Hilog.info(1, "Cangjie-App", "BasicCommonUTShadow started")
        scrollBar.scrollSearch(On().id("BasicCommonIndex4")).getOrThrow().click()
        driver.delayMs(500)
        let scrollBar4 = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        scrollBar4.scrollSearch(On().id("ViewShadow")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_normal() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_normal", 10.0)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_abnormal() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_abnormal", -10.0)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_boundary_zero() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_boundary(0)", 0.0)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_boundary_one() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_boundary(1)", 1.0)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_boundary_negative_one() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_boundary(-1)", -1.0)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_boundary_max() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_boundary(Float64.Max)", Float64.Max)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_boundary_min() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_boundary(Float64.Min)", Float64.Min)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_no_call() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("shadow_no_call", -1.0)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func test_button_shadow_radius_option_none() {
        scrollTo("ViewButtonShadow")
        assertShadowRadius("radius_option_none", -1.0)
    }

}
