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
import ohos.ui_test
import ohos.business_exception.BusinessException
import ohos.hilog.Hilog
import ohos.device_info.*

@Test
class InformationDisplayUT1 {
    prop driver: Driver {
        get(){
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1,"Cangjie-Test","scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar
                    .scrollSearch(On().id(view)).getOrThrow()
                    .click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1,"1",e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
        Hilog.error(1,"Cangjie-Test","started")
        scrollBar.scrollSearch(On().id("InformationDisplayIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAlphabetIndexerCommonAttrs() {
        scrollTo("ViewAlphabetIndexer")

        let inspector = getInspectorByKey("my_alphabet_indexer")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","aaaa: ${attrs.toString()}")


        let selectedColor = attrs.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor, "\"#FFFFFFFF\"")

        let popupColor = attrs.get("popupColor").getOrThrow().toString()
        @Expect(popupColor, "\"#FFFFFAF0\"")

        let selectedBackgroundColor = attrs.get("selectedBackgroundColor").getOrThrow().toString()
        @Expect(selectedBackgroundColor, "\"#FFCCCCCC\"")

        let popupBackground = attrs.get("popupBackground").getOrThrow().toString()
        @Expect(popupBackground, "\"#FFD2B48C\"")

        let usingPopup = attrs.get("usingPopup").getOrThrow().toString()
        @Expect(usingPopup, "\"true\"")

        let itemSize = attrs.get("itemSize").getOrThrow().toString()
        @Expect(itemSize, "\"28.00vp\"")

        let alignStyle = attrs.get("alignStyle").getOrThrow().toString()
        @Expect(alignStyle, "\"IndexerAlign.Left\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAlphabetIndexerOnselectA() {
        scrollTo("ViewAlphabetIndexer")
        let indexer = driver.findComponent(On().id("my_alphabet_indexer")).getOrThrow()
        indexer.click()
        let indexerA = indexer.scrollSearch(On().text("A")).getOrThrow()
        indexerA.click()
        let indexerB = indexer.scrollSearch(On().text("B")).getOrThrow()
        indexerB.click()
        let indexerC = indexer.scrollSearch(On().text("C")).getOrThrow()
        indexerC.click()

        let button = driver.findComponent(On().id("buttonA")).getOrThrow()
        button.click()
        let text = driver.findComponent(On().id("text")).getOrThrow().getText()
        driver.delayMs(500)
        @Expect(text, "An Ai ")

        let buttonB = driver.findComponent(On().id("buttonB")).getOrThrow()
        buttonB.click()
        let textCB = driver.findComponent(On().id("text")).getOrThrow().getText()
        driver.delayMs(500)
        @Expect(textCB, "Bai Bao Bi ")

        let buttonC = driver.findComponent(On().id("buttonC")).getOrThrow()
        buttonC.click()
        let textC = driver.findComponent(On().id("text")).getOrThrow().getText()
        driver.delayMs(500)
        @Expect(textC, "Chu Cai Chen ")
    }
@TestCase
    @Tag[APILevel22, TestLevel0]
    func testAlphabetIndexer1OnselectA() {
        scrollTo("ViewAlphabetIndexer")
        let indexer = driver.findComponent(On().id("my_alphabet_indexer_1")).getOrThrow()
        indexer.click()
        let indexerA = indexer.scrollSearch(On().text("A")).getOrThrow()
        indexerA.click()
        let indexerB = indexer.scrollSearch(On().text("B")).getOrThrow()
        indexerB.click()
        let indexerC = indexer.scrollSearch(On().text("C")).getOrThrow()
        indexerC.click()

        let button = driver.findComponent(On().id("buttonA")).getOrThrow()
        button.click()
        let text = driver.findComponent(On().id("text")).getOrThrow().getText()
        driver.delayMs(500)
        @Expect(text, "An Ai ")

        let buttonB = driver.findComponent(On().id("buttonB")).getOrThrow()
        buttonB.click()
        let textCB = driver.findComponent(On().id("text")).getOrThrow().getText()
        driver.delayMs(500)
        @Expect(textCB, "Bai Bao Bi ")

        let buttonC = driver.findComponent(On().id("buttonC")).getOrThrow()
        buttonC.click()
        let textC = driver.findComponent(On().id("text")).getOrThrow().getText()
        driver.delayMs(500)
        @Expect(textC, "Chu Cai Chen ")
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBadgeCommonAttrs() {
        scrollTo("ViewBadge")
        let inspector1 = getInspectorByKey("my_badge1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()

        let count1 = attrs1.get("count").getOrThrow().toString()
        @Expect(count1, "\"1\"")

        let style1 = attrs1.get("style").getOrThrow().toString()

        @Expect(style1.contains("#FF00FFFF"))
        @Expect(style1.contains("16.00vp"))
        @Expect(style1.contains("20.00vp"))
        @Expect(style1.contains("#FFFF0000"))
        @Expect(style1.contains("FontWeight.Bolder"))
        @Expect(style1.contains("#FF000000"))
        @Expect(style1.contains("2.00vp"))


        let position1 = attrs1.get("position").getOrThrow().toString()
        @Expect(position1, "\"BadgePosition.Left\"")

        let maxCount1 = attrs1.get("maxCount").getOrThrow().toString()
        @Expect(maxCount1, "\"89\"")

        let inspector2 = getInspectorByKey("my_badge2")
        let obj2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = obj2.get("$attrs").getOrThrow().asObject()

        let value2 = attrs2.get("value").getOrThrow().toString()
        @Expect(value2, "\"new\"")

        let inspector3 = getInspectorByKey("my_badge3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let count3 = attrs3.get("count").getOrThrow().toString()
        @Expect(count3, "\"32\"")

        let style3 = attrs3.get("style").getOrThrow().toString()

        @Expect(style3.contains("#FFFFFFFF"))
        @Expect(style3.contains("10.00vp"))
        @Expect(style3.contains("11.00vp"))
        @Expect(style3.contains("#FFFF0000"))
        @Expect(style3.contains("#FFFFFFFF"))
        @Expect(style3.contains("1.00vp"))

        let inspector4 = getInspectorByKey("my_badge4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let count4 = attrs4.get("count").getOrThrow().toString()
        @Expect(count4, "\"42\"")

        let style4 = attrs4.get("style").getOrThrow().toString()

        @Expect(style4.contains("#FFFFFFFF"))
        @Expect(style4.contains("12.00vp"))
        @Expect(style4.contains("13.00vp"))
        @Expect(style4.contains("#FFFFFFFF"))

        let inspector5 = getInspectorByKey("my_badge5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()

        let count5 = attrs5.get("count").getOrThrow().toString()
        @Expect(count5, "\"52\"")

        let style5 = attrs5.get("style").getOrThrow().toString()

        @Expect(style5.contains("#FFFF0000"))
        @Expect(style5.contains("14.00vp"))
        @Expect(style5.contains("15.00vp"))
        @Expect(style5.contains("#FFFFFFFF"))
    }

    // Counter
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCounter() {
        scrollTo("ViewCounter")
        let count = driver.findComponent(On().id("counter1")).getOrThrow()
        let point = count.getBoundsCenter()
        driver.click(Int32(point.x) + 90, Int32(point.y))
        driver.delayMs(500)
        driver.click(Int32(point.x) + 90, Int32(point.y))
        driver.delayMs(500)
        driver.click(Int32(point.x) + 90, Int32(point.y))
        driver.delayMs(500)
        driver.click(Int32(point.x) - 90, Int32(point.y))
        driver.delayMs(500)
        let textCB = driver.findComponent(On().id("text1")).getOrThrow().getText()
        @Expect(textCB, "2")

        let count2 = driver.findComponent(On().id("counter2")).getOrThrow()
        let point2 = count2.getBoundsCenter()
        driver.click(Int32(point2.x) + 90, Int32(point2.y))
        driver.delayMs(500)
        driver.click(Int32(point2.x) + 90, Int32(point2.y))
        driver.delayMs(500)
        driver.click(Int32(point2.x) + 90, Int32(point2.y))
        driver.delayMs(500)
        driver.click(Int32(point2.x) - 90, Int32(point2.y))
        driver.delayMs(500)
        let textCB2 = driver.findComponent(On().id("text2")).getOrThrow().getText()
        @Expect(textCB2, "0")

        let count3 = driver.findComponent(On().id("counter3")).getOrThrow()
        let point3 = count3.getBoundsCenter()
        driver.click(Int32(point3.x) + 90, Int32(point3.y))
        driver.delayMs(500)
        driver.click(Int32(point3.x) + 90, Int32(point3.y))
        driver.delayMs(500)
        driver.click(Int32(point3.x) + 90, Int32(point3.y))
        driver.delayMs(500)
        driver.click(Int32(point3.x) - 90, Int32(point3.y))
        driver.delayMs(500)
        let textCB3 = driver.findComponent(On().id("text3")).getOrThrow().getText()
        @Expect(textCB3, "2")

        let count4 = driver.findComponent(On().id("counter4")).getOrThrow()
        let point4 = count4.getBoundsCenter()
        driver.click(Int32(point4.x) + 90, Int32(point4.y))
        driver.delayMs(500)
        driver.click(Int32(point4.x) + 90, Int32(point4.y))
        driver.delayMs(500)
        driver.click(Int32(point4.x) + 90, Int32(point4.y))
        driver.delayMs(500)
        driver.click(Int32(point4.x) - 90, Int32(point4.y))
        driver.delayMs(500)
        let textCB4 = driver.findComponent(On().id("text4")).getOrThrow().getText()
        @Expect(textCB4, "3")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDatapanelCommonAttrs() {
        scrollTo("ViewDataPanel")

        let inspector = getInspectorByKey("dataPanelComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let closeEffect = attrs.get("closeEffect").getOrThrow().toString()
        @Expect(closeEffect, "\"true\"")

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"168.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"168.00vp\"")

        let values = attrs.get("values").getOrThrow().toString()
        @Expect(values.contains("[30]"))

        let max = attrs.get("max").getOrThrow().toString()
        @Expect(max, "\"100.000000\"")

        let panelType = attrs.get("type").getOrThrow().toString()
        @Expect(panelType, "\"DataPanelType.Circle\"")

        let inspector1 = getInspectorByKey("dataPanelComponent1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let panelType1 = attrs1.get("type").getOrThrow().toString()
        @Expect(panelType1, "\"DataPanelType.Line\"")

        let inspector2 = getInspectorByKey("dataPanelComponent2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let valueColors = attrs2.get("valueColors").getOrThrow().toString()
        let vc = "["
            + "[{\"color\":\"#65EEC9A3\",\"offset\":\"0.000000\"},{\"color\":\"#FFEF629F\",\"offset\":\"1.000000\"}],"
            + "[{\"color\":\"#FF67F9D4\",\"offset\":\"0.000000\"},{\"color\":\"#FFFF9554\",\"offset\":\"1.000000\"}],"
            + "[{\"color\":\"#FF00FF00\",\"offset\":\"0.000000\"},{\"color\":\"#FF00FF00\",\"offset\":\"1.000000\"}],"
            + "[{\"color\":\"#20FF0000\",\"offset\":\"0.000000\"},{\"color\":\"#20FF0000\",\"offset\":\"1.000000\"}]"
            + "]"
        @Expect(valueColors, vc)

        let trackShadow = attrs2.get("trackShadow").getOrThrow().toString()
        let ts = "{"
            + "\"radius\":\"5.000000\",\"offsetX\":\"15.000000\",\"offsetY\":\"15.000000\",\"colors\":"
            + "["
            + "[{\"color\":\"#65EEC9A3\",\"offset\":\"0.000000\"},{\"color\":\"#65EF629F\",\"offset\":\"1.000000\"}],"
            + "[{\"color\":\"#65E26709\",\"offset\":\"0.000000\"},{\"color\":\"#65EFBD08\",\"offset\":\"1.000000\"}],"
            + "[{\"color\":\"#6572B513\",\"offset\":\"0.000000\"},{\"color\":\"#6508EFA6\",\"offset\":\"1.000000\"}],"
            + "[{\"color\":\"#65ED08F5\",\"offset\":\"0.000000\"},{\"color\":\"#65EF0849\",\"offset\":\"1.000000\"}]"
            + "]"
            + "}"
        @Expect(trackShadow, ts)

        let trackBackgroundColor = attrs2.get("trackBackgroundColor").getOrThrow().toString()
        @Expect(trackBackgroundColor, "\"#08182431\"")

        let strokeWidth = attrs2.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"30.00vp\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBlankCommonAttrs() {
        scrollTo("ViewBlank")

        let inspector = getInspectorByKey("test_blank")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","aaaa: ${attrs.toString()}")

        let color = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(color, "\"#FF99FFFF\"")

        let hoverEffect = attrs.get("hoverEffect").getOrThrow().toString()
        @Expect(hoverEffect, "\"HoverEffect.Auto\"")

        let blank = driver.findComponent(On().id("blank")).getOrThrow()
        blank.click()
        driver.delayMs(300)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDivider() {
        scrollTo("ViewDivider")

        let inspector = getInspectorByKey("my_divider")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","aaaa: ${jsonObject.toString()}")

        // must set manual ，cannot check default value。
        let vertical = attrs.get("vertical").getOrThrow().toString()
        @Expect(vertical, "\"false\"")

        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FF2788D9\"")

        let strokWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokWidth, "\"50.00vp\"")

        let lineCap = attrs.get("lineCap").getOrThrow().toString()
        @Expect(lineCap, "\"ROUND\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGauge() {
        scrollTo("ViewGauge")

        let inspector = getInspectorByKey("my_gauge")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","aaaa: ${jsonObject.toString()}")

        //         must set manual ，cannot check default value
        let startAngle = attrs.get("startAngle").getOrThrow().toString()
        @Expect(startAngle, "\"220.00\"")

        let endAngle = attrs.get("endAngle").getOrThrow().toString()
        @Expect(endAngle, "\"135.00\"")

        let value = attrs.get("value").getOrThrow().toString()
        @Expect(value, "\"30.00\"")

        let colors = attrs.get("colors").getOrThrow().toString()
        @Expect(colors.contains("#FF2788D9"))

        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"28.00vp\"")

        let trackShadow = attrs.get("trackShadow").getOrThrow().toString()
        @Expect(trackShadow.contains("\"7.000000\""))

        let indicator = attrs.get("indicator").getOrThrow().toString()
        @Expect(indicator.contains("SystemStyle"))
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGauge5() {
        scrollTo("ViewGauge")

        let inspector = getInspectorByKey("my_gauge5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","aaaa: ${jsonObject.toString()}")

        //         must set manual ，cannot check default value
        let startAngle = attrs.get("startAngle").getOrThrow().toString()
        @Expect(startAngle, "\"220.00\"")

        let endAngle = attrs.get("endAngle").getOrThrow().toString()
        @Expect(endAngle, "\"135.00\"")

        let value = attrs.get("value").getOrThrow().toString()
        @Expect(value, "\"30.00\"")

        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"28.00vp\"")

        let trackShadow = attrs.get("trackShadow").getOrThrow().toString()
        @Expect(trackShadow.contains("\"7.000000\""))

        let indicator = attrs.get("indicator").getOrThrow().toString()
        @Expect(indicator.contains("SystemStyle"))
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGauge7() {
        scrollTo("ViewGauge")

        let inspector = getInspectorByKey("my_gauge7")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","aaaa: ${jsonObject.toString()}")

        //         must set manual ，cannot check default value
        let startAngle = attrs.get("startAngle").getOrThrow().toString()
        @Expect(startAngle, "\"220.00\"")

        let endAngle = attrs.get("endAngle").getOrThrow().toString()
        @Expect(endAngle, "\"135.00\"")

        let value = attrs.get("value").getOrThrow().toString()
        @Expect(value, "\"30.00\"")

        let strokeWidth = attrs.get("strokeWidth").getOrThrow().toString()
        @Expect(strokeWidth, "\"28.00vp\"")

        let trackShadow = attrs.get("trackShadow").getOrThrow().toString()
        @Expect(trackShadow.contains("\"7.000000\""))

        let indicator = attrs.get("indicator").getOrThrow().toString()
        @Expect(indicator.contains("SystemStyle"))
    }


    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPatternlock2() {
        scrollTo("ViewPatternLock2")

        let patternLock = driver.findComponent(On().id("patternLock")).getOrThrow()
        let naType = patternLock.getType()
        @Expect(naType, "PatternLock")

        var inspector = getInspectorByKey("patternLock")
        var attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()

        @Expect(attrs.get("sideLength").getOrThrow().toString(), "\"200.00vp\"")
        @Expect(attrs.get("pathStrokeWidth").getOrThrow().toString(), "\"18.00vp\"")
        @Expect(attrs.get("activeColor").getOrThrow().toString(), "\"#FFB0C4DE\"")
        @Expect(attrs.get("selectedColor").getOrThrow().toString(), "\"#FF228B22\"")
        @Expect(attrs.get("regularColor").getOrThrow().toString(), "\"#FF228A52\"")
        @Expect(attrs.get("pathColor").getOrThrow().toString(), "\"#FF90EE90\"")
        @Expect(attrs.get("autoReset").getOrThrow().toString(), "\"true\"")
        @Expect(attrs.get("circleRadius").getOrThrow().toString(), "\"16.00vp\"")
        @Expect(attrs.get("enableWaveEffect").getOrThrow().toString(), "\"true\"")

        let pointers: PointerMatrix = PointerMatrix.create(1,5)
        pointers.setPoint(0,0,ui_test.Point(406, 638))
        pointers.setPoint(0,1,ui_test.Point(406, 848))
        pointers.setPoint(0,2,ui_test.Point(406, 1058))
        pointers.setPoint(0,3,ui_test.Point(616, 1058))
        pointers.setPoint(0,4,ui_test.Point(826, 1058))
        driver.injectMultiPointerAction(pointers)
        driver.injectMultiPointerAction(pointers)
        var text0 = driver.findComponent(On().id("text0")).getOrThrow()
        let device_name = DeviceInfo.marketName
        Hilog.info(1, "Cangjie-Test", "The current device is ${device_name}, text0: ${text0.getText()}")
        if (device_name == "HUAWEI Mate 70 Pro") {
            @Expect(text0.getText(), "The password length needs to be greater than 5, please enter again.")
        } else {
            @Expect(text0.getText(), "Set password successfully: [0, 3, 6, 7, 8]")
        }

        let resetPattern = driver.findComponent(On().id("reset_pattern")).getOrThrow()
        resetPattern.click()
        text0 = driver.waitForComponent(On().id("text0"),500).getOrThrow()
        @Expect(text0.getText(), "Please input password")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLoadingprogressCommonAttrs001() {
        scrollTo("ViewLoadingProgress")

        let inspector = getInspectorByKey("loadingprogressComponent1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let color = attrs.get("color").getOrThrow().toString()
        @Expect(color, "\"#FF0000FF\"")
        let enableLoading = attrs.get("enableLoading").getOrThrow().toString()
        @Expect(enableLoading, "\"true\"")

        let loadingprogressComponent2 = getInspectorByKey("loadingprogressComponent2")
        let jsonObject2 = JsonValue.fromStr(loadingprogressComponent2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let color2 = attrs2.get("color").getOrThrow().toString()
        @Expect(color2, "\"#FFFFFF00\"")
        let enableLoading2 = attrs2.get("enableLoading").getOrThrow().toString()
        @Expect(enableLoading2, "\"true\"")

        let loadingprogressComponent3 = getInspectorByKey("loadingprogressComponent3")
        let jsonObject3 = JsonValue.fromStr(loadingprogressComponent3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let color3 = attrs3.get("color").getOrThrow().toString()
        @Expect(color3, "\"#FFCCCCCC\"")
        let enableLoading3 = attrs3.get("enableLoading").getOrThrow().toString()
        @Expect(enableLoading3, "\"true\"")
    }
}