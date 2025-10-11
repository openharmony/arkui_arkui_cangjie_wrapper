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
import ohos.arkui.ui_context.*

@Test
class BasicCommonUT21 {
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
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.error(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("BasicCommonIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }


    // CursorControl
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testCursorControl() {
        scrollTo("ViewCursorControl")

        // check cursor style
        let button = driver.findComponent(On().id("CursorControl-change")).getOrThrow()
        button.click()
        let button2 = driver.findComponent(On().id("CursorControl-change2")).getOrThrow()
        button2.click()
        let button3 = driver.findComponent(On().id("CursorControl-change3")).getOrThrow()
        button3.click()
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testDragControl1() {
        scrollTo("ViewDragControl")
        driver.delayMs(500)

        let inspector = getInspectorByKey("image1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let draggable = attrs.get("draggable").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "draggable: " + draggable)
        @Expect(draggable, "\"true\"")

        let inspector2 = getInspectorByKey("image2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let draggable2 = attrs2.get("draggable").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "draggable2: " + draggable2)
        @Expect(draggable2, "\"true\"")
    }


    // Environment
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testEnvironment() {
        scrollTo("ViewEnvironment")
        // 总计内置环境变量 和 对应的id tuple数组
        let tot_env = 6; // unused
        let checkList = [
            ("accessibilityText", "System?1"),
            ("colorModeText", "System?2"),
            ("fontScaleText", "System?3"),
            ("fontWeightScale", "System?4"),
            ("layoutDirection", "System?5"),
            ("languageCode", "System?6")
        ]
        // view_environment.cj 中设置的默认值
        let defaultValue = [
            "false",
            "Light",
            "1.30",
            "1.40",
            "Ltr",
            "en"
        ]
        var cnt = 1;
        for (i in checkList) {
            // 防止RE
            if (cnt > tot_env) {
                break
            }
            // 跳过 fontScale 和 fontWeightScale
            if (cnt == 3 || cnt == 4) {
                cnt++
                continue
            }

            // 是否为系统默认值 true-跳过
            let tmpTuple: (String, String) = i
            let tmpString1: String = tmpTuple[1]
            let inspector1 = getInspectorByKey(tmpString1)
            let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
            let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
            let systemProvided = attrs1.get("content").getOrThrow().toString()
            if (systemProvided == '"  SystemProvided: true"') {
                cnt++
                continue
            }
                // 否则判断是否与设置的默认值相同
                else {
                let tmpString2: String = tmpTuple[0]
                let inspector2 = getInspectorByKey(tmpString2)
                let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
                let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
                let Env = attrs2.get("content").getOrThrow().toString()
                @Expect(Env,'  "${defaultValue[cnt]}"')
            }
            cnt++
        }

        clickButton("parseStatus")
        let colorText1 = driver.findComponent(On().id("parsedColorMode")).getOrThrow()
        @Expect(colorText1.getText(), "Light 0")
        let layoutText1 = driver.findComponent(On().id("parsedLayoutDirection")).getOrThrow()
        @Expect(layoutText1.getText(), "Ltr 0")

        clickButton("parseStatus")
        let colorText2 = driver.findComponent(On().id("parsedColorMode")).getOrThrow()
        @Expect(colorText2.getText(), "Dark 1")
        let layoutText2 = driver.findComponent(On().id("parsedLayoutDirection")).getOrThrow()
        @Expect(layoutText2.getText(), "Rtl 1")
    }

    // Focus
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocus001() {
        scrollTo("ViewFocus")

        let inspector = getInspectorByKey("A")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")
        let focusOnTouch = attrs.get("focusOnTouch").getOrThrow().toString()
        @Expect(focusOnTouch, "true")
        let defaultFocus = attrs.get("defaultFocus").getOrThrow().toString()
        @Expect(defaultFocus, "true")
        let tabIndex = attrs.get("tabIndex").getOrThrow().toString()
        @Expect(tabIndex, "1")

        let inspector2 = getInspectorByKey("B")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs2.toString():\t ${attrs2.toString()}")

        let focusOnTouch2 = attrs2.get("focusOnTouch").getOrThrow().toString()
        @Expect(focusOnTouch2, "false")
        let tabIndex2 = attrs2.get("tabIndex").getOrThrow().toString()
        @Expect(tabIndex2, "2")

        let inspector3 = getInspectorByKey("C")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs3.toString():\t ${attrs3.toString()}")
        let focusable3 = attrs3.get("focusable").getOrThrow().toString()
        @Expect(focusable3, "false")
        let tabIndex3 = attrs3.get("tabIndex").getOrThrow().toString()
        @Expect(tabIndex3, "3")

        let inspector4 = getInspectorByKey("D")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs4.toString():\t ${attrs4.toString()}")
        let focusOnTouch4 = attrs4.get("focusOnTouch").getOrThrow().toString()
        @Expect(focusOnTouch4, "true")
        let focusable4 = attrs4.get("focusable").getOrThrow().toString()
        @Expect(focusable4, "true")
        let tabIndex4 = attrs4.get("tabIndex").getOrThrow().toString()
        @Expect(tabIndex4, "4")

        let inspector5 = getInspectorByKey("E")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs5.toString():\t ${attrs5.toString()}")
        let groupDefaultFocus = attrs5.get("groupDefaultFocus").getOrThrow().toString()
        @Expect(groupDefaultFocus, "true")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusGroupArrowStepOut012() {
        scrollTo("ViewFocus")

        // 焦点组，允许方向键走焦
        let bl = driver.findComponent(On().id("L")).getOrThrow()
        bl.click()
        let res = bl.isFocused()
        @Expect(res, false)
        driver.triggerKey(2049)
        driver.triggerKey(2013)
        let bm = driver.findComponent(On().id("M")).getOrThrow()
        let res2 = bm.isFocused()
        //@Expect(res2, true)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusGroupNotArrowStepOut013() {
        scrollTo("ViewFocus")

        // 焦点组，不允许方向键走焦
        let bm = driver.findComponent(On().id("M")).getOrThrow()
        bm.click()
        let res = bm.isFocused()
        @Expect(res, true)
        driver.triggerKey(2049)
        driver.triggerKey(2012)
        let bl = driver.findComponent(On().id("L")).getOrThrow()
        let res2 = bl.isFocused()
//        @Expect(res2, true)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusGroupFirst014() {
        scrollTo("ViewFocus")

        // 焦点组，首次获焦，最高优先级获焦
        let bm = driver.findComponent(On().id("N")).getOrThrow()
        bm.click()
        let res = bm.isFocused()
        @Expect(res, true)
        driver.triggerKey(2049)
        driver.triggerKey(2013)
        let b14 = driver.findComponent(On().id("b14")).getOrThrow()
        let res2 = b14.isFocused()
        @Expect(res2, false)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusNotGroupFirst015() {
        scrollTo("ViewFocus")

        // 非焦点组，首次获焦，最高优先级获焦
        let bn = driver.findComponent(On().id("N")).getOrThrow()
        bn.click()
        let res = bn.isFocused()
        @Expect(res, true)
        driver.triggerKey(2049)
        driver.triggerKey(2013)
        driver.triggerKey(2014)
        let b8 = driver.findComponent(On().id("b8")).getOrThrow()
        let res2 = b8.isFocused()
        @Expect(res2, false)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusGroupNotFirstPREVIOUS016() {
        scrollTo("ViewFocus")

        // 焦点组，非首次获焦，有PREVIOUS，PREVIOUS获焦
        let b11 = driver.findComponent(On().id("b11")).getOrThrow()
        b11.click()
        driver.triggerKey(2049)
        driver.triggerKey(2014)
        driver.triggerKey(2015)
        let b14 = driver.findComponent(On().id("b14")).getOrThrow()
        let res = b14.isFocused()
        @Expect(res, false)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusNotGroupNotFirst017() {
        scrollTo("ViewFocus")

        // 非焦点组，非首次获焦，默认走焦顺序
        let b1 = driver.findComponent(On().id("b1")).getOrThrow()
        b1.click()
        driver.triggerKey(2049)
        driver.triggerKey(2015)
        driver.triggerKey(2014)
        let b5 = driver.findComponent(On().id("b5")).getOrThrow()
        let res = b5.isFocused()
        @Expect(res, false)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFocusGroupNotFirstNoPREVIOUS018() {
        scrollTo("ViewFocus")

        // 焦点组，非首次获焦，无PREVIOUS，上次获焦组件获焦
        let bm2 = driver.findComponent(On().id("M2")).getOrThrow()
        bm2.click()
        driver.triggerKey(2049)
        driver.triggerKey(2012)
        driver.triggerKey(2013)
        let res = bm2.isFocused()
        @Expect(res, true)
    }

    // ViewFont
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testFont() {
        scrollTo("ViewFont")

        let button_1 = driver.findComponent(On().id("getSystemFontList")).getOrThrow()
        button_1.click()
        driver.delayMs(500)

    }

    // ForegroundColor
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testForegroundColor() {
        scrollTo("ViewForegroundColor")

        let inspector2 = getInspectorByKey("foregroundColor2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let foregroundColor2 = attrs2.get("foregroundColor").getOrThrow().toString()
        @Expect(foregroundColor2, "\"#FF008000\"")

        let inspector3 = getInspectorByKey("foregroundColor3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let foregroundColor3 = attrs3.get("foregroundColor").getOrThrow().toString()
        @Expect(foregroundColor3, "\"#FF0000FF\"")
    }

    func clickButton(buttonId: String) {
        let button = driver.waitForComponent(On().id(buttonId),200).getOrThrow()
        button.click()
        driver.delayMs(200)
    }
}
