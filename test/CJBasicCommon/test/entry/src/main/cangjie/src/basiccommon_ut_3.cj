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
import std.convert.*

@Test
class BasicCommonUT3 {
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
        let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("BasicCommonIndex3")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    //location
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLocation() {
        scrollTo("ViewLocation")

        var inspector = getInspectorByKey("my_location")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let markAn = attrs.get("markAnchor").getOrThrow().toString()
        @Expect(markAn.contains("\"x\":\"25.00vp\""))
        @Expect(markAn.contains("\"y\":\"25.00vp\""))
        let offSet = attrs.get("offset").getOrThrow().toString()
        @Expect(offSet.contains("\"x\":\"15.00vp\""))
        @Expect(offSet.contains("\"y\":\"12.00vp\""))

        var inspector2 = getInspectorByKey("my_location_inner")
        var jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        var attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let align_t2 = attrs2.get("align").getOrThrow().toString()
        @Expect(align_t2, "\"Alignment.Top\"")
        let position_t2 = attrs2.get("position").getOrThrow().toString()
        @Expect(position_t2.contains("\"x\":\"10.00vp\""))
        @Expect(position_t2.contains("\"y\":\"15.00vp\""))
    }

    // MonopolizeEvents


    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMotionPath() {
        scrollTo("ViewMotionPath")
        let button01 = driver.findComponent(On().id("motionPathButton_id")).getOrThrow()
        button01.click()
    }


    // Opacity
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testOpacity() {
        scrollTo("ViewOpacity")
        var inspector = getInspectorByKey("my_opacity")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let opacity_t = attrs.get("opacity").getOrThrow().toString()
        @Expect(opacity_t, "0.700000")
    }


    // overlay
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testOverlay() {
        scrollTo("ViewOverlay")

        let inspector = getInspectorByKey("image")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let overlay = attrs.get("overlay").getOrThrow().toString()
        @Expect(overlay, "{\"title\":\"Winter is a beautiful season, especially when it snows.\",\"options\":{\"align\":\"Alignment.Bottom\",\"offset\":{\"x\":\"0.00vp\",\"y\":\"-15.00vp\"}}}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPersistentStorage() {
        scrollTo("ViewPersistentStorage")

        var inspector = getInspectorByKey("p_text")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width1 = attrs.get("width").getOrThrow().toString()
        Hilog.info(1, "Cangjie-App", "######### ${width1}")
        @Expect(width1, "\"100.00vp\"")

        let pbtn = driver.waitForComponent(On().id("plusBtn"),500).getOrThrow()
        pbtn.click()

        driver.delayMs(500)
        inspector = getInspectorByKey("p_text")
        jsonObject = JsonValue.fromStr(inspector).asObject()

        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width2 = attrs.get("width").getOrThrow().toString()
        Hilog.info(1, "Cangjie-App", "######### ${width2}")
        @Expect(width2, "\"110.00vp\"")
        let Per_keys = driver.findComponent(On().id("PersistentStorage_keys")).getOrThrow()
        Per_keys.click()
        let Per_deleteProp = driver.findComponent(On().id("PersistentStorage_deleteProp")).getOrThrow()
        Per_deleteProp.click()
    }

    // ViewPixelRound
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProp() {
        scrollTo("ViewProp")
        let button1 = driver.findComponent(On().id("ParentComponent")).getOrThrow()
        button1.click()
        let button2 = driver.findComponent(On().id("SubComponent")).getOrThrow()
        button2.click()
        let button3 = driver.findComponent(On().id("update")).getOrThrow()
        button3.click()
        let button4 = driver.findComponent(On().id("clear")).getOrThrow()
        button4.click()
    }

    // ResponseRegion
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testResponseregion() {
        scrollTo("ViewResponseRegion")
        let inspector1 = getInspectorByKey("responseRegion1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let responseRegion1 = attrs1.get("responseRegion").getOrThrow().toString()

        // 热区宽度为按钮的一半，点击右侧无响应
        let rect1 = jsonObject1.get("$rect").getOrThrow().toString()
        let rectArr1 = rect1.replace("[", "").replace("]", "").replace(" ", "").replace("\"", "").split(",")
        Hilog.info(0x0001, "InspectorInfo", "responseRegion1  rect1 ${rect1}")
        let rect1x0 = Float64.tryParse(rectArr1[0]).getOrThrow()
        let rect1y0 = Float64.tryParse(rectArr1[1]).getOrThrow()
        let rect1x1 = Float64.tryParse(rectArr1[2]).getOrThrow()
        let rect1y1 = Float64.tryParse(rectArr1[3]).getOrThrow()

        // 点击右半边，不响应点击事件
        let textUI = driver.findComponent(On().id("expect_text")).getOrThrow()
        var x1 = Int32((rect1x1 + rect1x0)/ 2.0 + 5.0)
        var y1 = Int32((rect1y1 + rect1y0) / 2.0)
        driver.click(x1, y1)
        driver.delayMs(500)
        Hilog.info(0x0001, "InspectorInfo", "responseRegion1  click  (${x1}, ${y1}), textLeft ${textUI.getText()}")
        @Expect(textUI.getText().contains("no button click"))

        // 点击左半边，响应点击事件
        var x11 = Int32((rect1x1 + rect1x0)/ 2.0 - 5.0)
        var y11 = Int32((rect1y1 + rect1y0) / 2.0)
        driver.click(x11, y11)
        driver.delayMs(500)
        Hilog.info(0x0001, "InspectorInfo", "responseRegion1  click  (${x11}, ${y11}), textLeft ${textUI.getText()}")
        @Expect(textUI.getText().contains("button1 clicked"))

        // getInspectorByKey获取到的responseRegion值为空， ArkTs侧目前返回的responseRegion值也是空
        //        @Expect(responseRegion1.contains('\\"x\\":\\"0.00vp\\"'))
        //        @Expect(responseRegion1.contains('\\"y\\":\\"0.00vp\\"'))
        //        @Expect(responseRegion1.contains('\\"width\\":\\"50.00%\\"'))
        //        @Expect(responseRegion1.contains('\\"height\\":\\"100.00%\\"'))

        let inspector2 = getInspectorByKey("responseRegion2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let responseRegion2 = attrs2.get("responseRegion").getOrThrow().toString()
        // getInspectorByKey获取到的responseRegion值为空， ArkTs侧目前返回的responseRegion值也是空
        //        @Expect(responseRegion2.contains('\\"x\\":\\"100.00%\\"'))
        //        @Expect(responseRegion2.contains('\\"y\\":\\"0.00vp\\"'))
        //        @Expect(responseRegion2.contains('\\"width\\":\\"50.00%\\"'))
        //        @Expect(responseRegion2.contains('\\"height\\":\\"100.00%\\"'))
        // 热区宽度为按钮的一半，且右移一个按钮宽度，点击button2右侧左边，点击事件生效
        let rect2 = jsonObject2.get("$rect").getOrThrow().toString()
        let rectArr2 = rect2.replace("[", "").replace("]", "").replace(" ", "").replace("\"", "").split(",")
        Hilog.info(0x0001, "InspectorInfo", "responseRegion2  rectArr2 ${rectArr2}")
        let rect2x0 = Float64.tryParse(rectArr2[0]).getOrThrow()
        let rect2y0 = Float64.tryParse(rectArr2[1]).getOrThrow()
        let rect2x1 = Float64.tryParse(rectArr2[2]).getOrThrow()
        let rect2y1 = Float64.tryParse(rectArr2[3]).getOrThrow()

        // 点击按钮任何区域，不响应点击事件
        driver.click(Int32((rect2x1 + rect2x0)/ 2.0), Int32((rect2y1 + rect2y0) / 2.0))
        driver.delayMs(500)
        @Expect(textUI.getText().contains("button1 clicked"))

        // 点击按钮右边超过一半的区域，不响应点击事件
        driver.click(Int32(rect2x1 + (rect2x1 - rect2x0)/ 2.0 + 5.0), Int32((rect2y1 + rect2y0) / 2.0))
        driver.delayMs(500)
        @Expect(textUI.getText().contains("button1 clicked"))

        // 点击按钮右边不超过一半的区域，响应点击事件
        driver.click(Int32(rect2x1 + 5.0), Int32((rect2y1 + rect2y0) / 2.0))
        driver.delayMs(500)
        @Expect(textUI.getText().contains("button2 clicked"))

        let inspector3 = getInspectorByKey("responseRegion3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let responseRegion3 = attrs3.get("responseRegion").getOrThrow().toString()
        // getInspectorByKey获取到的responseRegion值为空， ArkTs侧目前返回的responseRegion值也是空
        //        @Expect(responseRegion3.contains('\\"x\\":\\"0.00vp\\"'))
        //        @Expect(responseRegion3.contains('\\"y\\":\\"100.00%\\"'))
        //        @Expect(responseRegion3.contains('\\"width\\":\\"100.00%\\"'))
        //        @Expect(responseRegion3.contains('\\"height\\":\\"100.00%\\"'))
        // 热区大小为整个按钮，且下移一个按钮高度，点击button3下方按钮大小区域，点击事件生效
        let rect3 = jsonObject3.get("$rect").getOrThrow().toString()
        let rectArr3 = rect3.replace("[", "").replace("]", "").replace(" ", "").replace("\"", "").split(",")
        Hilog.info(0x0001, "InspectorInfo", "responseRegion3  rectArr3 ${rectArr3}")
        let rect3x0 = Float64.tryParse(rectArr3[0]).getOrThrow()
        let rect3y0 = Float64.tryParse(rectArr3[1]).getOrThrow()
        let rect3x1 = Float64.tryParse(rectArr3[2]).getOrThrow()
        let rect3y1 = Float64.tryParse(rectArr3[3]).getOrThrow()

        // 点击按钮任何区域，不响应点击事件
        driver.click(Int32((rect3x1 + rect3x0)/ 2.0), Int32((rect3y1 + rect3y0) / 2.0))
        driver.delayMs(500)
        @Expect(textUI.getText().contains("button2 clicked"))

        // 点击按钮右边不超过一半的区域，不响应点击事件
        driver.click(Int32(rect3x1 + 5.0), Int32((rect3y1 + rect3y0) / 2.0))
        driver.delayMs(500)
        @Expect(textUI.getText().contains("button2 clicked"))

        // 点击按钮右边超过一半的区域，不响应点击事件
        driver.click(Int32((rect3x1 + rect3x0)/ 2.0), Int32(rect3y1 + 10.0))
        driver.delayMs(500)
        @Expect(textUI.getText().contains("button3 clicked"))
    }

    // Popup
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPopup001() {
        scrollTo("ViewPopup")
        driver.findComponent(On().id("button1")).getOrThrow().click()
        driver.findComponent(On().text("OK")).getOrThrow().click()

        driver.delayMs(500)
        let otherInspector_01 = getInspectorByKey("Test_Text_01")
        let otherJsonObject_01 = JsonValue.fromStr(otherInspector_01).asObject()
        let otherContent_01 = otherJsonObject_01.get("$attrs").getOrThrow().asObject()
        let finalContent_01 = otherContent_01.get("content")
        let optionContent_01 = finalContent_01.getOrThrow()
        let maxContent_01 = optionContent_01.toString()
        @Expect(maxContent_01, "\"primaryButton current state is false\"")

        driver.delayMs(500)
        let otherInspector_03 = getInspectorByKey("Test_Text_03")
        let otherJsonObject_03 = JsonValue.fromStr(otherInspector_03).asObject()
        let otherContent_03 = otherJsonObject_03.get("$attrs").getOrThrow().asObject()
        let finalContent_03 = otherContent_03.get("content")
        let optionContent_03 = finalContent_03.getOrThrow()
        let maxContent_03 = optionContent_03.toString()
        @Expect(maxContent_03, "\"onStateChange current state is false\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPopup002() {
        scrollTo("ViewPopup")
        driver.findComponent(On().id("button2")).getOrThrow().click()
        driver.findComponent(On().id("button2")).getOrThrow().click()

        let otherInspector_04 = getInspectorByKey("Test_Text_04")
        let otherJsonObject_04 = JsonValue.fromStr(otherInspector_04).asObject()
        let otherContent_04 = otherJsonObject_04.get("$attrs").getOrThrow().asObject()
        let finalContent_04 = otherContent_04.get("content")
        let optionContent_04 = finalContent_04.getOrThrow()
        let maxContent_04 = optionContent_04.toString()
        @Expect(maxContent_04, "\"show current state is true\"")

        driver.delayMs(500)
        let otherInspector_05 = getInspectorByKey("Test_Text_05")
        let otherJsonObject_05 = JsonValue.fromStr(otherInspector_05).asObject()
        let otherContent_05 = otherJsonObject_05.get("$attrs").getOrThrow().asObject()
        let finalContent_05 = otherContent_05.get("content")
        let optionContent_05 = finalContent_05.getOrThrow()
        let maxContent_05 = optionContent_05.toString()
        @Expect(maxContent_05, "\"enableArrow current state is true\"")

        driver.delayMs(500)
        let otherInspector_06 = getInspectorByKey("Test_Text_06")
        let otherJsonObject_06 = JsonValue.fromStr(otherInspector_06).asObject()
        let otherContent_06 = otherJsonObject_06.get("$attrs").getOrThrow().asObject()
        let finalContent_06 = otherContent_06.get("content")
        let optionContent_06 = finalContent_06.getOrThrow()
        let maxContent_06 = optionContent_06.toString()
        @Expect(maxContent_06, "\"onStateChange state is false\"")
    }
}
