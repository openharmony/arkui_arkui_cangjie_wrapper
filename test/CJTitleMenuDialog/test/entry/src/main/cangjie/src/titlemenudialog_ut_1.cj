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
import std.time.*

@Test
class TitleMenuDialogUT11 {
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
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        scrollBar.scrollSearch(On().id("TitleMenuDialogIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testAccessibility() {
        scrollTo("ViewAccessibility")

        // 正常值测试
        let inspector = getInspectorByKey("accessibility_id")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "1", "1", "accessibility_id: ${attrs.toString()}")

        // CjResource和异常值测试
        let inspector2 = getInspectorByKey("accessibility_id2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "1", "1", "accessibility_id2: ${attrs2.toString()}")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testAlertDialog() {
        scrollTo("ViewAlertDialog")

        let inspector = getInspectorByKey("my_aDialog")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(0, "0", "CangjieTest", "aaaa: ${attrs.getFields()}")

        let text = driver.findComponent(On().id("text")).getOrThrow().getText()
        @Expect(text, "begin")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testAlertDialogButtons() {
        scrollTo("ViewAlertDialog")

        let button_1 = driver.findComponent(On().id("button_1"))
        button_1?.click()
        let text1 = driver.waitForComponent(On().id("text_1"), 600)?.getText()
        @Expect(text1, "button1")

        driver.delayMs(600)
        driver.pressBack()
        driver.delayMs(600)

        let button_2 = driver.waitForComponent(On().id("button_2"), 1000)
        button_2?.click()
        let text2 = driver.waitForComponent(On().id("text_2"), 1000)?.getText()
        @Expect(text2, "button2")

        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(1000)

        let button_3 = driver.waitForComponent(On().id("button_3"), 1000)
        button_3?.click()
        let text3 = driver.waitForComponent(On().id("text_3"), 1000)?.getText()
        @Expect(text3, "button1")
        driver.pressBack()
        driver.delayMs(1000)

        let button_4 = driver.waitForComponent(On().id("button_4"), 1000)
        button_4?.click()
        let text4 = driver.waitForComponent(On().id("text_4"), 1000)?.getText()
        @Expect(text4, "button2")
        driver.pressBack()
        driver.delayMs(1000)

        let button_5 = driver.waitForComponent(On().id("button_5"), 1000)
        button_5?.click()
        let text5 = driver.waitForComponent(On().id("text_5"), 1000)?.getText()
        @Expect(text5, "button2")
        driver.pressBack()
        driver.delayMs(1000)

        let button_6 = driver.waitForComponent(On().id("button_6"), 1000)
        button_6?.click()
        let text6 = driver.waitForComponent(On().id("text_6"), 1000)?.getText()
        @Expect(text6, "button2")
        driver.pressBack()
        driver.delayMs(1000)

        let button_7 = driver.waitForComponent(On().id("button_7"), 1000)
        button_7?.click()
        let text7 = driver.waitForComponent(On().id("text_7"), 1000)?.getText()
        @Expect(text7, "button3")
        driver.pressBack()
        driver.delayMs(1000)

        let button_8 = driver.waitForComponent(On().id("button_8"), 1000)
        button_8?.click()
        let text8 = driver.waitForComponent(On().id("text_8"), 1000)?.getText()
        @Expect(text8, "button3")
        driver.pressBack()
        driver.delayMs(1000)

        let button_9 = driver.waitForComponent(On().id("button_9"), 1000)
        button_9?.click()
        let text9 = driver.waitForComponent(On().id("text_9"), 1000)?.getText()
        @Expect(text9, "button3")
        driver.pressBack()
        driver.delayMs(1000)

        let button_11 = driver.findComponent(On().id("button_11"))
        button_11?.click()
        let text11 = driver.waitForComponent(On().id("text_11"), 1000)?.getText()
        @Expect(text11, "test None")
        driver.pressBack()
        driver.delayMs(1000)

        let button_10 = driver.findComponent(On().id("button_10"))
        button_10?.click()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)

        let button_12 = driver.findComponent(On().id("button_12"))
        button_12?.click()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testContextMenu() {
        scrollTo("ViewContextMenu")
        let inspector = getInspectorByKey("my_menu")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(0, "0", "CangjieTest", "aaaa: ${attrs.getFields()}")

        let test_drag = driver.waitForComponent(On().id("context_menu"), 1000)
        test_drag?.longClick()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testCustomDialog() {
        scrollTo("ViewCustomDialog")
        driver.delayMs(1000)
        let inspector = getInspectorByKey("my_dialog")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(0, "0", "CangjieTest", "aaaa: ${attrs.getFields()}")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testOpenDialog() {
        scrollTo("ViewCustomDialog")

        let open_button = driver.findComponent(On().id("open_button"))
        open_button?.click()
        let text = driver.waitForComponent(On().id("text"), 1000)?.getText()
        @Expect(text, "open")

        let cancle_button = driver.findComponent(On().id("cancel_button")).getOrThrow()
        cancle_button.click()
        let text2 = driver.waitForComponent(On().id("text"), 1000)?.getText()
        @Expect(text2, "cancel")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testCustomdialog2() {
        scrollTo("ViewCustomDialog2")
        var button = driver.findComponent(On().id("open_button1")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button2")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button3")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button4")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button5")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button6")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button7")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button8")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button9")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
        button = driver.findComponent(On().id("open_button10")).getOrThrow()
        button.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(500)
    }

    // data picker unittest
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testDatepickerCommonAttrs() {
        scrollTo("ViewDatePicker")

        let inspector = getInspectorByKey("DatePickerV1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let disappearTextStyle = attrs.get("disappearTextStyle").getOrThrow().toString()
        let textStyle = attrs.get("textStyle").getOrThrow().toString()
        let selectedTextStyle = attrs.get("selectedTextStyle").getOrThrow().toString()
        let constructor = attrs.get("constructor").getOrThrow().toString()
        let lunar = attrs.get("lunar").getOrThrow().toString()
        @Expect(disappearTextStyle, '{"color":"#FFFA9600","font":{"size":"20.00fp","weight":"FontWeight.Bolder"}}')
        @Expect(textStyle, '{"color":"#FFFF0000","font":{"size":"18.00fp","weight":"FontWeight.Bold"}}')
        @Expect(selectedTextStyle, '{"color":"#FF0000FF","font":{"size":"14.00fp","weight":"FontWeight.Lighter"}}')
        @Expect(constructor, '{"start":"1994-12-13","end":"2030-12-13","selected":"2025-12-13","mode":"DatePickerMode.DATE"}')
        @Expect(lunar, "\"false\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testDatepickerClickAttrs() {
        scrollTo("ViewDatePicker")

        let switchButton = driver.findComponent(On().id("switch")).getOrThrow()
        switchButton.click()
        driver.delayMs(500)

        let inspector = getInspectorByKey("DatePickerV1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lunar = attrs.get("lunar").getOrThrow().toString()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let selected = constructor.get("selected").getOrThrow().toString()
        @Expect(lunar, "\"true\"")
        @Expect(selected, '\"2025-10-24\"') // 是否正确转换为农历日期
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testDatepickerSwpieAttrs() {
        scrollTo("ViewDatePicker")

        // DatePickerV1 swipe
        let datepicker_1 = driver.findComponent(On().id("DatePickerV1")).getOrThrow()
        let point = datepicker_1.getBoundsCenter()
        driver.swipe(Int32(point.x), Int32(point.y), Int32(point.x), Int32(point.y + 280))
        driver.delayMs(5000)

        let inspector = getInspectorByKey("DatePickerV1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let constructor = attrs.get("constructor").getOrThrow().asObject()
        let selected = constructor.get("selected").getOrThrow().toString()
        @Expect(selected, '\"2025-9-13\"') // 是否滑到对应的日期
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testDatepickerDefaultAttrs() {
        scrollTo("ViewDatePicker")

        let inspector = getInspectorByKey("DatePickerDefault")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let disappearTextStyle = attrs.get("disappearTextStyle").getOrThrow().toString()
        let textStyle = attrs.get("textStyle").getOrThrow().toString()
        let selectedTextStyle = attrs.get("selectedTextStyle").getOrThrow().toString()
        let constructor = attrs.get("constructor").getOrThrow().toString()
        @Expect(disappearTextStyle, '{"color":"#E5000000","font":{"size":"14.00fp","weight":"FontWeight.Regular"}}')
        @Expect(textStyle, '{"color":"#FF182431","font":{"size":"16.00fp","weight":"FontWeight.Regular"}}')
        @Expect(selectedTextStyle, '{"color":"#FF007DFF","font":{"size":"20.00fp","weight":"FontWeight.Medium"}}')
        let result = '{\"start\":\"1970-1-1\",\"end\":\"2100-12-31\",\"selected\":\"${formatCurrentDate()}\",\"mode\":\"DatePickerMode.DATE\"}'
        @Expect(constructor, result)
    }

    private func formatCurrentDate(): String {
        return DateTime.now().format("yyyy-M-d")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testDatepickerdialog() {
        scrollTo("ViewDatePickerDialog")
        let show_datePickerDialog = driver.findComponent(On().id("show_datePickerDialog1")).getOrThrow()
        show_datePickerDialog.click()
        driver.delayMs(500)
        let text = show_datePickerDialog.getText()
        @Expect(text, "显示DatePicker非默认弹窗")
        driver.pressBack()
        driver.delayMs(500)

        scrollTo("ViewDatePickerDialog")
        let show_datePickerDialog2 = driver.findComponent(On().id("show_datePickerDialog2")).getOrThrow()
        show_datePickerDialog2.click()
        driver.delayMs(500)
        let text2 = show_datePickerDialog2.getText()
        @Expect(text2, "显示DatePicker默认弹窗")
        driver.pressBack()
        driver.delayMs(500)

        scrollTo("ViewDatePickerDialog")
        let show_datePickerDialog3 = driver.findComponent(On().id("show_datePickerDialog3")).getOrThrow()
        show_datePickerDialog3.click()
        driver.delayMs(500)
        let text3 = show_datePickerDialog3.getText()
        @Expect(text3, "显示默认弹窗")
        driver.pressBack()
        driver.delayMs(500)

        scrollTo("ViewDatePickerDialog")
        let show_datePickerDialog4 = driver.findComponent(On().id("show_datePickerDialog4")).getOrThrow()
        show_datePickerDialog4.click()
        driver.delayMs(500)
        let text4 = show_datePickerDialog4.getText()
        @Expect(text4, "显示DatePicker边界值弹窗背板")
        driver.pressBack()
        driver.delayMs(500)
    }

}
