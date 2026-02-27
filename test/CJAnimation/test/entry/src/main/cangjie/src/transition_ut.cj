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
import stdx.encoding.json.*
import ohos.ui_test.*
import ohos.hilog.Hilog
import std.collection.*
import std.convert.*

@Test
class TransitionUT {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    protected override func beforeAll() {
        let scrollBar = driver
            .waitForComponent(On().id("scroller"), 500)
            .getOrThrow()
        logger("started")
        scrollBar
            .scrollSearch(On().id("ViewTransition"))
            .getOrThrow()
            .click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionAsymmetric() {
        var buttion = driver.findComponent(On().id("ViewTransitionAsymmetric")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCombine() {
        var buttion = driver.findComponent(On().id("ViewTransitionCombine")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionIdentity() {
        var buttion = driver.findComponent(On().id("ViewTransitionIdentity")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionMove() {
        var buttion = driver.findComponent(On().id("ViewTransitionMove")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionOpacity() {
        var buttion = driver.findComponent(On().id("ViewTransitionOpacity")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abcOPACITY\"")
        inspector = getInspectorByKey("identityButton2")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abcopacity\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionRotate() {
        var buttion = driver.findComponent(On().id("ViewTransitionRotate")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionScale() {
        var buttion = driver.findComponent(On().id("ViewTransitionScale")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionSlide() {
        var buttion = driver.findComponent(On().id("ViewTransitionSlide")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionSlideSwitch() {
        var buttion = driver.findComponent(On().id("ViewTransitionSlideSwitch")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionTranslate() {
        var buttion = driver.findComponent(On().id("ViewTransitionTranslate")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(5000)
        var inspector = getInspectorByKey("identityButton")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"abc\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackAsymmetric() {
        var buttion = driver.findComponent(On().id("ViewTransitionAsymmetric")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var inspector = getInspectorByKey("durationText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        Hilog.info(1, "testTransitionCallbackAsymmetric", "content: ${content}")
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)

        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackCombine() {
        var buttion = driver.findComponent(On().id("ViewTransitionAsymmetric")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var inspector = getInspectorByKey("durationText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)

        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackIdentity() {
        var buttion = driver.findComponent(On().id("ViewTransitionIdentity")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var inspector = getInspectorByKey("durationText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 1000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 1000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackMove() {
        var buttion = driver.findComponent(On().id("ViewTransitionMove")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var inspector = getInspectorByKey("durationText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        inspector = getInspectorByKey("durationText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        inspector = getInspectorByKey("transitionInText")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackOpacity() {
        var buttion = driver.findComponent(On().id("ViewTransitionOpacity")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var content = JsonValue.fromStr(getInspectorByKey("durationText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
        content = JsonValue.fromStr(getInspectorByKey("durationText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")
        content = JsonValue.fromStr(getInspectorByKey("durationText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")
        content = JsonValue.fromStr(getInspectorByKey("durationText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
        content = JsonValue.fromStr(getInspectorByKey("durationText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackRotate() {
        var buttion = driver.findComponent(On().id("ViewTransitionRotate")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackScale() {
        var buttion = driver.findComponent(On().id("ViewTransitionScale")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackSlide() {
        var buttion = driver.findComponent(On().id("ViewTransitionSlide")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackSlideSwitch() {
        var buttion = driver.findComponent(On().id("ViewTransitionSlideSwitch")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        var content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 600, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 600, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 600, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallbackTranslate() {
        var buttion = driver.findComponent(On().id("ViewTransitionTranslate")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        var content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) < 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"true\"")

        driver.delayMs(5000)
        content = JsonValue.fromStr(getInspectorByKey("durationText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(Int64.parse(content.replace("\"", "")) >= 5000, true)
        content = JsonValue.fromStr(getInspectorByKey("transitionInText")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("content").getOrThrow().toString()
        @Expect(content, "\"false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionOptionNone() {
        var buttion = driver.findComponent(On().id("ViewTransitionOptionNone")).getOrThrow()
        buttion.click()

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        var width = JsonValue.fromStr(getInspectorByKey("button1")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("width").getOrThrow().toString()
        @Expect(width, "\"800.00px\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionCallBackOptionNone() {
        var buttion = driver.findComponent(On().id("ViewTransitionOptionNone")).getOrThrow()
        buttion.click()

        buttion = driver.findComponent(On().id("clickButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)
        var width = JsonValue.fromStr(getInspectorByKey("button2")).asObject()
            .get("$attrs").getOrThrow().asObject()
            .get("width").getOrThrow().toString()
        @Expect(width, "\"800.00px\"")
    }

}