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
class PageTransitionUT {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    protected override func beforeEach() {
        let scrollBar = driver
            .waitForComponent(On().id("scroller"), 500)
            .getOrThrow()
        logger("started")
        scrollBar
            .scrollSearch(On().id("ViewPageTransition"))
            .getOrThrow()
            .click()
        driver.delayMs(2000)
    }

    protected override func afterEach() {
        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionSlideLeft () {
        driver.delayMs(3000)

        var inspector = getInspectorByKey("homePageText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"HomePage PageTransitionEnter Push\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionSlideRight () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("validBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("homePageText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"HomePage PageTransitionEnter Pop\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionSlideBottom () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Push\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionSlideTop () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("validPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Pop\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslatePositiveXYZ () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Push\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateNegativeXYZ () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("validPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Pop\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateBoundaryZero() {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("boundaryText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Boundary\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleBoundaryZero() {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("boundaryText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Boundary\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionOpacityBoundaryZero() {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("boundaryText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Boundary\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateMax () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("boundaryPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("boundaryText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Boundary\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleMax () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("boundaryPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("boundaryText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Boundary\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateMin () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("boundaryPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        @Expect(AppStorage.get<String>("boundaryExit").getOrThrow(), "Push BoundaryExit")

        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleMin () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("boundaryPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        @Expect(AppStorage.get<String>("boundaryExit").getOrThrow(), "Push BoundaryExit")

        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        driver.pressBack()
        driver.delayMs(2000)
    }


    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionOpacityBoundaryOne () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("boundaryBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        @Expect(AppStorage.get<String>("boundaryExit").getOrThrow(), "Pop BoundaryExit")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionEnterInitDelayAndDurationZero () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        @Expect(AppStorage.get<String>("boundaryEnter").getOrThrow(), "Push BoundaryEnter")
        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionExitInitDelayAndDurationZero () {
        var buttion = driver.findComponent(On().id("pushBoundaryButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        buttion = driver.findComponent(On().id("boundaryBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        @Expect(AppStorage.get<String>("boundaryExit").getOrThrow(), "Pop BoundaryExit")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateNoCall () {
        var buttion = driver.findComponent(On().id("pushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        var inspector = getInspectorByKey("noCallText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"NoCall\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleNoCall () {
        var buttion = driver.findComponent(On().id("pushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        var inspector = getInspectorByKey("noCallText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"NoCall\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionOpacityNoCall () {
        var buttion = driver.findComponent(On().id("pushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        var inspector = getInspectorByKey("noCallText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"NoCall\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionOnEnterNoCall () {
        var buttion = driver.findComponent(On().id("pushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        var inspector = getInspectorByKey("noCallText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"NoCall\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionOnExitNoCall () {
        var buttion = driver.findComponent(On().id("pushNoCallButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        var inspector = getInspectorByKey("noCallText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"NoCall\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateOptionNone () {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2500)
        var inspector = getInspectorByKey("optionNoneText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"OptionNone\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleOptionNone () {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2500)
        var inspector = getInspectorByKey("optionNoneText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"OptionNone\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionOnEnterOptionNone () {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1500)
        var inspector = getInspectorByKey("optionNoneText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"OptionNone\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionOnExitOptionNone () {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2500)
        var inspector = getInspectorByKey("optionNoneText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"OptionNone\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionEnterInitOptionNone () {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(1500)
        var inspector = getInspectorByKey("optionNoneText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"OptionNone\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionExitInitOptionNone () {
        var buttion = driver.findComponent(On().id("pushOptionNoneButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2500)
        var inspector = getInspectorByKey("optionNoneText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"OptionNone\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionEnterInitNoSet () {
        var buttion = driver.findComponent(On().id("pushNoSetButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        @Expect(AppStorage.get<String>("noSetEnter").getOrThrow(), "NoSet PageTransitionEnter Push")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionExitInitNoSet () {
        var buttion = driver.findComponent(On().id("pushNoSetButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        buttion = driver.findComponent(On().id("noSetBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        @Expect(AppStorage.get<String>("noSetExit").getOrThrow(), "NoSet PageTransitionExit Pop")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionTranslateNoSet () {
        var buttion = driver.findComponent(On().id("pushNoSetButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        @Expect(AppStorage.get<String>("noSetEnter").getOrThrow(), "NoSet PageTransitionEnter Push")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleNoSet () {
        var buttion = driver.findComponent(On().id("pushNoSetButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        buttion = driver.findComponent(On().id("noSetBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        @Expect(AppStorage.get<String>("noSetExit").getOrThrow(), "NoSet PageTransitionExit Pop")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionOpacityLessZero () {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        @Expect(AppStorage.get<String>("invalidEnter").getOrThrow(), "Invalid PageTransitionEnter Push")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionOpacityGreaterOne () {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        buttion = driver.findComponent(On().id("invalidBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(2000)

        @Expect(AppStorage.get<String>("invalidExit").getOrThrow(), "Invalid PageTransitionEnter None")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionEnterDurationLessZero () {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        @Expect(AppStorage.get<String>("invalidEnter").getOrThrow(), "Invalid PageTransitionEnter Push")

        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionEnterDelayLessZero () {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        @Expect(AppStorage.get<String>("invalidEnter").getOrThrow(), "Invalid PageTransitionEnter Push")

        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionExitDurationLessZero () {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        buttion = driver.findComponent(On().id("invalidBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        @Expect(AppStorage.get<String>("invalidExit").getOrThrow(), "Invalid PageTransitionEnter None")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionExitDelayLessZero () {
        var buttion = driver.findComponent(On().id("pushInvalidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        buttion = driver.findComponent(On().id("invalidBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(500)

        @Expect(AppStorage.get<String>("invalidExit").getOrThrow(), "Invalid PageTransitionEnter None")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScalePositiveParams () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Push\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionScaleNegativeParams () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("validPushButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("optionNoneBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Pop\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionCommonTransitionOpacityNormalParams () {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("validText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionEnter Push\"")

        driver.pressBack()
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionPageTransitionEnterInit() {
        driver.delayMs(3000)

        var inspector = getInspectorByKey("homePageText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"HomePage PageTransitionEnter Push\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionPageTransitionEnterOnEnter() {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)
        buttion = driver.findComponent(On().id("validBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("homePageText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"HomePage PageTransitionEnter Pop\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionPageTransitionExistInit() {
        driver.delayMs(3000)

        var inspector = getInspectorByKey("homePageText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"HomePage PageTransitionEnter Push\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPageTransitionPageTransitionEnterOnExit() {
        var buttion = driver.findComponent(On().id("pushValidButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        var inspector = getInspectorByKey("homePageExit")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"HomePage PageTransitionExit Push\"")

        buttion = driver.findComponent(On().id("validBackButton")).getOrThrow()
        buttion.click()
        driver.delayMs(3000)

        inspector = getInspectorByKey("validExit")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        content = attrs.get("content").getOrThrow().toString()
        @Expect(content, "\"Valid PageTransitionExit Pop\"")
    }
}