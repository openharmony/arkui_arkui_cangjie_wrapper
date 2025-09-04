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
import ohos.router.*
import ohos.ui_test.*
import ohos.ui_test.Component as uitestComponent
import ohos.hilog.Hilog

@Test
class ButtonSelect_UT_1_1 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1,"Cangjie-Test", "ScrollTo ${view}")
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
                Hilog.error(1,"Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.error(1,"Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("Index_UT1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }
//
    // Button unittest
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_001() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("Testbutton")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FFFFFFFF\"")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"12.00fp\"")

        let stateEffect = attrs.get("stateEffect").getOrThrow().toString()
        @Expect(stateEffect, "\"true\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_002() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let shape = attrs.get("type").getOrThrow().toString()
        @Expect(shape, "\"ButtonType.Circle\"")

        let stateEffect = attrs.get("stateEffect").getOrThrow().toString()
        @Expect(stateEffect, "\"false\"")

        let buttonStyle = attrs.get("buttonStyle").getOrThrow().toString()
        @Expect(buttonStyle, "\"ButtonStyleMode.NORMAL\"")

        let controlSize = attrs.get("controlSize").getOrThrow().toString()
        @Expect(controlSize, "\"ControlSize.SMALL\"")

        let role = attrs.get("role").getOrThrow().toString()
        @Expect(role, "\"ButtonRole.NORMAL\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_003() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"Ok\"")

        let shape = attrs.get("type").getOrThrow().toString()
        let stateEffect = attrs.get("stateEffect").getOrThrow().toString()
        @Expect(stateEffect, "\"true\"")

        let buttonStyle = attrs.get("buttonStyle").getOrThrow().toString()
        @Expect(buttonStyle, "\"ButtonStyleMode.TEXTUAL\"")

        let controlSize = attrs.get("controlSize").getOrThrow().toString()
        @Expect(controlSize, "\"ControlSize.SMALL\"")

        let role = attrs.get("role").getOrThrow().toString()
        @Expect(role, "\"ButtonRole.ERROR\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_004() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"Disable\"")

        let shape = attrs.get("type").getOrThrow().toString()
        @Expect(shape, "\"ButtonType.Circle\"")

        let stateEffect = attrs.get("stateEffect").getOrThrow().toString()
        @Expect(stateEffect, "\"false\"")

        let buttonStyle = attrs.get("buttonStyle").getOrThrow().toString()
        @Expect(buttonStyle, "\"ButtonStyleMode.NORMAL\"")

        let controlSize = attrs.get("controlSize").getOrThrow().toString()
        @Expect(controlSize, "\"ControlSize.SMALL\"")

        let role = attrs.get("role").getOrThrow().toString()
        @Expect(role, "\"ButtonRole.ERROR\"")


    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_005() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let shape = attrs.get("type").getOrThrow().toString()
        @Expect(shape, "\"ButtonType.Capsule\"")

        let stateEffect = attrs.get("stateEffect").getOrThrow().toString()
        @Expect(stateEffect, "\"true\"")

        let buttonStyle = attrs.get("buttonStyle").getOrThrow().toString()
        @Expect(buttonStyle, "\"ButtonStyleMode.NORMAL\"")

        let controlSize = attrs.get("controlSize").getOrThrow().toString()
        @Expect(controlSize, "\"ControlSize.NORMAL\"")

        let role = attrs.get("role").getOrThrow().toString()
        @Expect(role, "\"ButtonRole.ERROR\"")

        let inspector2 = getInspectorByKey("Row")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let alignItems = attrs2.get("alignItems").getOrThrow().toString()
        @Expect(alignItems, "\"VerticalAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_006() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"15.00fp\"")

        let fontWeight = attrs.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight, "\"FontWeight.Bolder\"")

        let fontStyle = attrs.get("fontStyle").getOrThrow().toString()
        @Expect(fontStyle, "\"FontStyle.Italic\"")

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_007() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"20.00fp\"")

        let fontFamily = attrs.get("fontFamily").getOrThrow().toString()
        @Expect(fontFamily, "\"sans-serif\"")

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FF7F34AD\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_008() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button7")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"25.00vp\"")

        let fontFamily = attrs.get("fontFamily").getOrThrow().toString()
        @Expect(fontFamily, "\"Arial\"")

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FF116959\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func Test_button_009() {
        ScrollTo("View_Button")

        let inspector = getInspectorByKey("button8")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"20.00fp\"")

        let shape = attrs.get("type").getOrThrow().toString()
        @Expect(shape, "\"ButtonType.Circle\"")

        let stateEffect = attrs.get("stateEffect").getOrThrow().toString()
        @Expect(stateEffect, "\"false\"")

        let buttonStyle = attrs.get("buttonStyle").getOrThrow().toString()
        @Expect(buttonStyle, "\"ButtonStyleMode.EMPHASIZED\"")
    }

    // checkbox unittest
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_checkboxCommonAttrs() {
        ScrollTo("View_Checkbox")

        let inspector = getInspectorByKey("checkboxComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let value = attrs.get("select").getOrThrow().toString()
        @Expect(value, "\"true\"")

        let color = attrs.get("selectedColor").getOrThrow().toString()
        @Expect(color, "\"#FFED6F21\"")

        let shape = attrs.get("shape").getOrThrow().toString()
        @Expect(shape, "\"1\"")

        let padding = attrs.get("padding").getOrThrow().toString()
        @Expect(padding, "\"10.00vp\"")
    }

    // Radio
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_radio() {
        ScrollTo("View_Radio")

        let radio_1: uitestComponent = driver.findComponent(On().id("my_radio_1")).getOrThrow()
        let radio_2: uitestComponent = driver.findComponent(On().id("my_radio_2")).getOrThrow()
        radio_1.click()
        driver.delayMs(500)
        @Expect(radio_1.isChecked(), true)
        @Expect(radio_2.isChecked(), false)

        radio_2.click()
        driver.delayMs(500)
        @Expect(radio_1.isChecked(), false)
        @Expect(radio_2.isChecked(), true)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_radio2() {

        // test radio: radioStyle,padding,
        ScrollTo("View_Radio")
        let radio4 = getInspectorByKey("my_radio_4")
        let jsonObject4 = JsonValue.fromStr(radio4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "radio_attrs4.toString():\t ${attrs4.toString()}")

//        @Expect(attrs4.get("radioStyle").getOrThrow().toString().replace("\\","").contains('{"checkedBackgroundColor":"#FF0000FF","uncheckedBorderColor":"#FFFF0000","indicatorColor":"#FF808080"}') == true)
        @Expect(attrs4.get("padding").getOrThrow().toString(), "\"30.00vp\"")
//        @Expect(attrs4.get("hoverEffect").getOrThrow().toString(), "\"HoverEffect.Scale\"")
        @Expect(attrs4.get("size").getOrThrow().toString(), '{"width":"100.00vp","height":"150.00vp"}')
        @Expect(attrs4.get("indicatorType").getOrThrow().toString(), "\"TICK\"")

        let radio5 = getInspectorByKey("my_radio_5")
        let jsonObject5 = JsonValue.fromStr(radio5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "radio_attrs5.toString():\t ${attrs5.toString()}")

//        @Expect(attrs5.get("indicatorType").getOrThrow().toString(), '\"CUSTOM\"')
        @Expect(attrs5.get("padding").getOrThrow().toString().replace("\\","").contains('{"top":"10.00vp","right":"30.00vp","bottom":"5.00vp","left":"10.00vp"}'))
//        Hilog.info(1,"Cangjie-Test", "radio5_hoverEffect: ${attrs5.get("hoverEffect").getOrThrow().toString()}")
//        @Expect(attrs5.get("hoverEffect").getOrThrow().toString(), "\"HoverEffect.Highlight\"")

        let radio6 = getInspectorByKey("my_radio_6")
        let jsonObject6 = JsonValue.fromStr(radio6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "radio6_hoverEffect: ${attrs6.get("hoverEffect").getOrThrow().toString()}")

        @Expect(attrs6.get("hoverEffect").getOrThrow().toString(), "\"HoverEffect.Auto\"")

        let radio7 = getInspectorByKey("my_radio_7")
        let jsonObject7 = JsonValue.fromStr(radio7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()
//        Hilog.info(1,"Cangjie-Test", "radio7_hoverEffect: ${attrs7.get("hoverEffect").getOrThrow().toString()}")
//        @Expect(attrs7.get("hoverEffect").getOrThrow().toString(), "\"HoverEffect.None\"")
    }


    // select unittest
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_select() {
        ScrollTo("View_Select")

        let inspector = getInspectorByKey("my_select")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        Hilog.info(1,"Cangjie-Test", "aaaa: ${jsonObject.toString()}")
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let select = attrs.get("selected").getOrThrow().toString()
        @Expect(select, "\"1\"")

        let selectedOptionFont = attrs.get("selectedOptionFont").getOrThrow().toString()
        @Expect(selectedOptionFont.contains("16.00vp"), true)
        @Expect(selectedOptionFont.contains("400"), false)

        let selectButton = driver.findComponent(On().onType("Select")).getOrThrow()

        let text1 = selectButton.getText()
        @Expect(text1, "TTTTT")

        selectButton.click()
        driver.delayMs(500)

        let selectOption = driver.findComponent(On().text("bbb")).getOrThrow()

        selectOption.click()
        driver.delayMs(500)

        let text2 = selectButton.getText()
        @Expect(text2, "bbb")
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_select2() {
        ScrollTo("View_Select")

        let select4 = getInspectorByKey("my_select_04")
        let jsonObject4 = JsonValue.fromStr(select4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "select_attrs4.toString():\t ${attrs4.toString()}")

        @Expect(attrs4.get("size").getOrThrow().toString(), '{"width":"200.00vp","height":"100.00vp"}')
        @Expect(attrs4.get("direction").getOrThrow().toString(), "\"Direction.Ltr\"")
//        Hilog.info(1,"Cangjie-Test", "select_attrs4_divider:\t ${attrs4.get("divider").getOrThrow().toString()}")
//        @Expect(attrs4.get("divider").getOrThrow().toString().replace("\\","").contains('{"strokeWidth":"5.00vp","startMargin":"15.00vp","endMargin":"1.00vp","color":"#FFFFD700"}'))

        let select5 = getInspectorByKey("my_select_05")
        let jsonObject5 = JsonValue.fromStr(select5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "select_attrs5.toString():\t ${attrs5.toString()}")

        @Expect(attrs5.get("padding").getOrThrow().toString().replace("\\","").contains('{"top":"10.00vp","right":"30.00vp","bottom":"5.00vp","left":"10.00vp"}'))
        @Expect(attrs5.get("direction").getOrThrow().toString(), "\"Direction.Rtl\"")
//        Hilog.info(1,"Cangjie-Test", "select_attrs5_divider:\t ${attrs5.get("divider").getOrThrow().toString()}")
//
//        @Expect(attrs5.get("divider").getOrThrow().toString().replace("\\","").contains('{"strokeWidth":"0.00vp","startMargin":"-1.00vp","endMargin":"-1.00vp","color":"#00000000"}'))
    }

}