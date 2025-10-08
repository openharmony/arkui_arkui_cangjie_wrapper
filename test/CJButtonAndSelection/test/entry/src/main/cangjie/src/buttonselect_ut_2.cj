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
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*

@Test
class ButtonSelectUT2 {
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
        scrollBar.scrollSearch(On().id("ButtonSelectIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testStepper() {
        scrollTo("ViewStepper")
        // OnNext
        var buttonNext = driver.findComponent(On().text("下一页")).getOrThrow()
        buttonNext.click()
        var secondText = driver.findComponent(On().id("secondText")).getOrThrow()
        var text = secondText.getText()
        @Expect(text, "Page Two")

        // OnChange
        let buttonPrev = driver.findComponent(On().text("上一页")).getOrThrow()
        buttonPrev.click()
        secondText = driver.findComponent(On().id("firstText")).getOrThrow()
        text = secondText.getText()
        @Expect(text, "Page One")

        // OnSkip
        let firstButton = driver.findComponent(On().id("firstButton")).getOrThrow()
        firstButton.click()
        buttonNext = driver.findComponent(On().text("下一页")).getOrThrow()
        buttonNext.click()
        let thirdText = driver.findComponent(On().id("thirdText")).getOrThrow()
        text = thirdText.getText()
        @Expect(text, "Page Three")

        //onPrevious
        let buttonPrevious = driver.findComponent(On().text("上一页")).getOrThrow()
        buttonPrevious.click()
        secondText = driver.findComponent(On().id("secondText")).getOrThrow()
        text = secondText.getText()
        @Expect(text, "Page Two")

        // OnFinish
        let buttonFinish1 = driver.findComponent(On().text("下一页")).getOrThrow()
        buttonFinish1.click()
        driver.delayMs(600)
        buttonNext = driver.findComponent(On().text("下一页")).getOrThrow()
        buttonNext.click()
        driver.delayMs(600)
        buttonNext = driver.findComponent(On().text("下一页")).getOrThrow()
        buttonNext.click()
        driver.delayMs(600)
        buttonNext = driver.findComponent(On().text("下一页")).getOrThrow()
        buttonNext.click()
        buttonNext = driver.waitForComponent(On().text("开始"), 1000).getOrThrow()
        buttonNext.click()
        secondText = driver.waitForComponent(On().id("firstText"), 1000).getOrThrow()
        text = secondText.getText()
        @Expect(text, "Page One")
    }

    // ViewStepper
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testStepperItemCommonAttrs() {
        scrollTo("ViewStepper")

        let inspector = getInspectorByKey("firstStepperItem")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let nextLabel = attrs.get("nextLabel").getOrThrow().toString()
        @Expect(nextLabel, "\"下一页\"")

        let status = attrs.get("status").getOrThrow().toString()
        @Expect(status, "\"ItemState.Normal\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testTabContent() {
        scrollTo("ViewTabContent")

        let treeInspector = getInspectorTree()
        let jsonObject = JsonValue.fromStr(treeInspector).asObject()
        var tabContent0TabBar = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("tabBar")
            .getOrThrow()
            .asObject()
        Hilog.info(1, "1", "1", "tabContent0TabBar:${tabContent0TabBar.toString()}")
        @Expect(tabContent0TabBar.get("selectedMode").getOrThrow().toString(),
            "\"SelectedMode.INDICATOR\"")

        var tabContent1TabBar = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(1)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("tabBar")
            .getOrThrow()
            .asObject()
        Hilog.info(1, "1", "1", "tabContent1TabBar:${tabContent1TabBar.toString()}")
        @Expect(tabContent1TabBar.get("verticalAlign").getOrThrow().toString(),
            "\"VerticalAlign.Center\"")
        @Expect(tabContent1TabBar.get("layoutMode").getOrThrow().toString(),
            "\"LayoutMode.VERTICAL\"")
        @Expect(tabContent1TabBar.get("symmetricExtensible").getOrThrow().toString(),
            "\"false\"")
        // @Expect(tabContent1TabBar.get("labelStyle").getOrThrow().toString(),
        //     "{\"overflow\":\"TextOverflow.Ellipsis\",\"maxLines\":\"1\",\"minFontSize\":\"10.00vp\",\"maxFontSize\":\"0.00fp\",\"heightAdaptivePolicy\":\"TextHeightAdaptivePolicy.MAX_LINES_FIRST\",\"font\":{\"size\":\"20.00vp\",\"weight\":\"FontWeight.Normal\",\"family\":\"HarmonyOS Sans\",\"style\":\"FontStyle.Normal\"},\"unselectedColor\":\"#FFFF0000\",\"selectedColor\":\"#FF00CB87\"}")

        var tabContent2TabBar = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(2)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("tabBar")
            .getOrThrow()
            .asObject()
        Hilog.info(1, "1", "1", "tabContent2TabBar:${tabContent2TabBar.toString()}")

        var tabContent3TabBar = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(3)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("tabBar")
            .getOrThrow()
            .asObject()
        Hilog.info(1, "1", "1", "tabContent3TabBar:${tabContent3TabBar.toString()}")

        var tabContent4TabBar = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(4)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("tabBar")
            .getOrThrow()
            .asObject()
        Hilog.info(1, "1", "1", "tabContent4TabBar:${tabContent4TabBar.toString()}")

        var tabContent5TabBar = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(5)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("tabBar")
            .getOrThrow()
            .asObject()
        Hilog.info(1, "1", "1", "tabContent5TabBar:${tabContent5TabBar.toString()}")

        var tabContent6Attrs = jsonObject
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("$children")
            .getOrThrow()
            .asArray()
            .get(6)
            .getOrThrow()
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
        let tabContent6TabBar = tabContent6Attrs.get("tabBar").getOrThrow().asObject()
        Hilog.info(1, "1", "1", "tabContent6TabBar:${tabContent6TabBar.toString()}")

        let constraintSize = tabContent6Attrs.get("constraintSize").getOrThrow().toString()
        Hilog.info(1, "1", "1", "constraintSize:${constraintSize}")
        @Expect(constraintSize, "\"{\\\"minWidth\\\":\\\"20.00%\\\",\\\"minHeight\\\":\\\"50.00%\\\",\\\"maxWidth\\\":\\\"20.00%\\\",\\\"maxHeight\\\":\\\"50.00%\\\"}\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testTabContentOnWillShowAndWillHide() {
        scrollTo("ViewTabContent")

        driver.findComponent(On().text("2")).getOrThrow().click()
        driver.delayMs(1000)
        @Expect(driver.findComponent(On().id("onWillShow")).getOrThrow().getText(), "onWillShow")
        @Expect(driver.findComponent(On().id("onWillHide")).getOrThrow().getText(), "onWillHide")
    }

    // ViewTextPicker
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testTextPicker() {
        scrollTo("ViewTextPicker")
        let picker = driver.findComponent(On().id("TextPicker1")).getOrThrow()
        picker.click()
        picker.scrollToTop()
        let textPicker = driver.waitForComponent(On().id("textPicker"), 500).getOrThrow()
        let picker1 = textPicker.getType()
        @Expect(picker1, "TextPicker")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testTextpickerHeightLength() {
        scrollTo("ViewTextPicker")
        let picker = driver.findComponent(On().id("height_length")).getOrThrow()
        picker.click()
        picker.scrollToTop()
        let textPicker = driver.waitForComponent(On().id("height_length"), 500).getOrThrow()
        let picker2 = textPicker.getType()

        let inspector_HL = getInspectorByKey("height_length")
        let jsonObject_HL = JsonValue.fromStr(inspector_HL).asObject()
        let attrs_HL = jsonObject_HL.get("$attrs").getOrThrow().asObject()
        let fading_effect_HL = attrs_HL.get("defaultPickerItemHeight").getOrThrow().toString()
        @Expect(fading_effect_HL, '"15.00vp"')
        @Expect(picker2, "TextPicker")
    }

    // toggle unittest

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testBarPositionSetFadingEdgeSetTabsExample3() {
        scrollTo("ViewTab")

        clickTabsExample("ButtonTabsExample3")

        var inspector = getInspectorByKey("TabsExample3_01")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let barPosition = attrs.get("barPosition").getOrThrow().toString()

        let fadingEdgeFalse = driver.findComponent(On().id("fadingEdgeFalse")).getOrThrow()
        fadingEdgeFalse.click()
        var fadingEdge = driver.waitForComponent(On().id("fadingEdge"), 1000).getOrThrow()
        @Expect(fadingEdge.getText().contains("false"))

        let fadingEdgeTrue = driver.findComponent(On().id("fadingEdgeTrue")).getOrThrow()
        fadingEdgeTrue.click()
        driver.delayMs(1000)
        fadingEdge = driver.findComponent(On().id("fadingEdge")).getOrThrow()
        @Expect(fadingEdge.getText().contains("true"))
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testBarOverlapSetTabsExample4() {
        clickTabsExample("ButtonTabsExample4")

        let barOverlapChange = driver.findComponent(On().id("barOverlapChange")).getOrThrow()
        barOverlapChange.click()
        driver.delayMs(1000)
        barOverlapChange.click()
        driver.delayMs(1000)
        let inspector = getInspectorByKey("TabsExample4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        // var barOverlap = attrs.get("barOverlap").getOrThrow().toString()
        // @Expect(barOverlap, "\"true\"")
        let barBackgroundColor = attrs.get("barBackgroundColor").getOrThrow().toString()
        Hilog.info(1, "1", "1", "tabsExample4 barBackgroundColor:${barBackgroundColor}")
        @Expect(barBackgroundColor, "\"#00000000\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testDividerSetTabsExample2() {
        clickTabsExample("ButtonTabsExample2")

        let normalDivider = driver.findComponent(On().id("normalDivider")).getOrThrow()
        normalDivider.click()
        var dividerButton = driver.waitForComponent(On().id("dividerButton"), 1000).getOrThrow()
        dividerButton.click()

        let nullDivider = driver.findComponent(On().id("nullDivider")).getOrThrow()
        nullDivider.click()
        driver.delayMs(1000)
        dividerButton = driver.findComponent(On().id("dividerButton")).getOrThrow()
        dividerButton.click()
    }

    func clickTabsExample(id: String) {
        driver.waitForComponent(On().id(id), 1000).getOrThrow().click()
        driver.delayMs(1000)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testOnContentWillChangeTabsExample8() {
        clickTabsExample("ButtonTabsExample8")
        driver.findComponent(On().text("首页")).getOrThrow().click()
        @Expect(driver.waitForComponent(On().id("currentIndex"),1000).getOrThrow().getText(), "0")

        driver.waitForComponent(On().text("推荐"), 1000).getOrThrow().click()
        @Expect(driver.waitForComponent(On().id("currentIndex"),1000).getOrThrow().getText(), "2")
    }
}