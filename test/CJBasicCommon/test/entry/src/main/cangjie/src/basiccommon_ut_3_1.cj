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
class BasicCommonUT31 {
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
        scrollBar.scrollSearch(On().id("BasicCommonIndex3")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    

    // MonopolizeEvents
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testMonopolizeEvents() {
        scrollTo("ViewMonopolizeEvents")

        let column1 = driver.findComponent(On().id("monopolizeEvents-column")).getOrThrow()
        column1.click()

        let clean = driver.findComponent(On().id("monopolizeEvents-clean")).getOrThrow()
        clean.click()
        let button = driver.findComponent(On().id("monopolizeEvents-change")).getOrThrow()
        button.click()
        let column2 = driver.findComponent(On().id("monopolizeEvents-column")).getOrThrow()
        column2.click()
    }

    // ViewMotionBlur
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testMotionBlur() {
        scrollTo("ViewMotionBlur")

        let motionBlurDivider = driver.findComponent(On().id("motionBlur")).getOrThrow()
        motionBlurDivider.click()
        driver.delayMs(1000)
    }


    // ViewObservable
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testObservable() {
        scrollTo("ViewObservable")
        let text1 = driver.findComponent(On().id("text1")).getOrThrow()
        var text = text1.getText()
        @Expect(text, "arr[0] is 1")

        let click = driver.findComponent(On().id("click")).getOrThrow()
        click.click()
        driver.delayMs(500)
        text = text1.getText()
        @Expect(text, "arr[0] is 0")

        let click2 = driver.findComponent(On().id("click2")).getOrThrow()
        click2.click()
        driver.delayMs(500)
        text = text1.getText()
        @Expect(text, "arr[0] is 0")

        let arr3_value = driver.findComponent(On().id("arr3_value_text")).getOrThrow()
        let arr3 = driver.findComponent(On().id("arr3_text")).getOrThrow()
        let arr3_size = driver.findComponent(On().id("arr3_size_text")).getOrThrow()
        var text_arr3_value = arr3_value.getText()
        var text_arr3 = arr3.getText()
        var text_arr3_size = arr3_size.getText()
        @Expect(text_arr3, "arr_test3_index[0] is 1")
        @Expect(text_arr3_value, "arr_test3_value[0] is 0")
        @Expect(text_arr3_size, "arr_test3_size is 0")

        let click_array_get = driver.findComponent(On().id("test_array_get")).getOrThrow()
        click_array_get.click()
        driver.delayMs(500)
        text_arr3_value = arr3_value.getText()

        let click_array_setA = driver.findComponent(On().id("test_array_setA")).getOrThrow()
        click_array_setA.click()
        driver.delayMs(500)
        text_arr3 = arr3.getText()

        let click_array_setOCA = driver.findComponent(On().id("test_array_setOCA")).getOrThrow()
        click_array_setOCA.click()
        driver.delayMs(500)
        text_arr3 = arr3.getText()

        let click_array_prop_size = driver.findComponent(On().id("test_array_prop_size")).getOrThrow()
        click_array_prop_size.click()
        driver.delayMs(500)
        text_arr3_size = arr3_size.getText()
    }

    // ViewObservableArrayList
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testObservableArraylist(){
        scrollTo("ViewObservableArrayList")
        let obs_arrlist_firbook = driver.findComponent(On().id("obs_arrlist_firbook")).getOrThrow()
        let obs_arrlist_size = driver.findComponent(On().id("obs_arrlist_size")).getOrThrow()
        let obs_arrlist_isempty = driver.findComponent(On().id("obs_arrlist_isempty")).getOrThrow()
        let tmp_obs_arrlist_firbook = driver.findComponent(On().id("tmp_obs_arrlist_firbook")).getOrThrow()
        let tmp_obs_arrlist_isempty = driver.findComponent(On().id("tmp_obs_arrlist_isempty")).getOrThrow()
        let arrlist_firbook = driver.findComponent(On().id("arrlist_firbok")).getOrThrow()

        var text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        var text_obs_arrlist_size = obs_arrlist_size.getText()
        var text_obs_arrlist_isempty = obs_arrlist_isempty.getText()
        var text_tmp_obs_arrlist_firbook = tmp_obs_arrlist_firbook.getText()
        var text_tmp_obs_arrlist_isempty = tmp_obs_arrlist_isempty.getText()
        var text_arrlist_firbook = arrlist_firbook.getText()

        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is arrlist1")
        @Expect(text_obs_arrlist_size, "obs_arrlist_size[0] is 0")
        @Expect(text_obs_arrlist_isempty, "obs_arrlist_isempty is true")
        @Expect(text_tmp_obs_arrlist_firbook, "tmp_obs_arrlist[0].title is tmp_arrlist1")
        @Expect(text_tmp_obs_arrlist_isempty, "tmp_obs_arrlist_isempty is false")
        @Expect(text_arrlist_firbook, "arrlist[0].title is arrlist1")

        let test_arrlist_get = driver.findComponent(On().id("test_arrlist_get")).getOrThrow()
        test_arrlist_get.click()
        driver.delayMs(500)
        text_arrlist_firbook = arrlist_firbook.getText()
        @Expect(text_arrlist_firbook, "arrlist[0].title is arrlist1")

        let test_set_arr = driver.findComponent(On().id("test_set_arr")).getOrThrow()
        test_set_arr.click()
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is set_arr1")

        let test_set_arrlist = driver.findComponent(On().id("test_set_arrlist")).getOrThrow()
        test_set_arrlist.click()
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_set_arrlist1")

        let test_set_oca = driver.findComponent(On().id("test_set_oca")).getOrThrow()
        test_set_oca.click()
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_set_oca")

        let test_arrlist_prop_size = driver.findComponent(On().id("test_arrlist_prop_size")).getOrThrow()
        test_arrlist_prop_size.click()
        driver.delayMs(500)
        text_obs_arrlist_size = obs_arrlist_size.getText()

        let test_clone = driver.findComponent(On().id("test_arrlist_clone")).getOrThrow()
        test_clone.click()
        driver.delayMs(500)
        text_tmp_obs_arrlist_firbook = tmp_obs_arrlist_firbook.getText()
        @Expect(text_tmp_obs_arrlist_firbook, "tmp_obs_arrlist[0].title is test_clone")

        let test_clear = driver.findComponent(On().id("test_arrlist_clear")).getOrThrow()
        test_clear.click()
        driver.delayMs(1000)
        text_tmp_obs_arrlist_isempty = tmp_obs_arrlist_isempty.getText()

        let test_appendAll = driver.findComponent(On().id("test_appendAll")).getOrThrow()
        test_appendAll.click()
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_appendAll_1")

        let test_insert = driver.findComponent(On().id("test_arrlist_insert")).getOrThrow()
        test_insert.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()

        let test_insertAll = driver.findComponent(On().id("test_arrlist_insertAll")).getOrThrow()
        test_insertAll.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_insertAll_1")

        let test_prepend = driver.findComponent(On().id("test_prepend")).getOrThrow()
        test_prepend.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_prepend")

        let test_prependAll = driver.findComponent(On().id("test_prependAll")).getOrThrow()
        test_prependAll.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_prependAll_1")

        let test_remove = driver.findComponent(On().id("test_remove")).getOrThrow()
        test_remove.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_remove_2")

        let test_remove_range = driver.findComponent(On().id("test_remove_range")).getOrThrow()
        test_remove_range.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_remove_range_3")

        let test_removeif = driver.findComponent(On().id("test_removeif")).getOrThrow()
        test_removeif.click()
        driver.delayMs(500)
        text_obs_arrlist_firbook = obs_arrlist_firbook.getText()
        @Expect(text_obs_arrlist_firbook, "obs_arrlist[0].title is test_removeif2")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testOnChildTouchTest() {
        scrollTo("ViewOnChildTouchTest")
        let myList = driver.findComponent(On().id("MyList")).getOrThrow()
        myList.click()
        myList.scrollToBottom(speed: 3000)
        driver.delayMs(300)
        driver.click(520, 520)
        let mybutton = driver.findComponent(On().id("Mybutton")).getOrThrow()
        @Expect(mybutton.getText(), "onScrollFrameBegin")
        mybutton.click()
        @Expect(mybutton.getText(), "click the button")
    }

   

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testOutlineComponent001() {
        scrollTo("ViewOutline")

        let Inspector = getInspectorByKey("outline_properties")
        let jsonObject = JsonValue.fromStr(Inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let outlineStyle = attrs.get("outlineStyle").getOrThrow().toString()
        @Expect(outlineStyle, "\"OutlineStyle.SOLID\"")

        let outlineWidth = attrs.get("outlineWidth").getOrThrow().toString()
        @Expect(outlineWidth, "\"0.00vp\"")

        let outlineColor = attrs.get("outlineColor").getOrThrow().toString()
        @Expect(outlineColor, "\"#FF000000\"")

        let outlineRadius = attrs.get("outlineRadius").getOrThrow().toString()
        @Expect(outlineRadius, "{\"topLeft\":\"0.00vp\",\"topRight\":\"0.00vp\",\"bottomLeft\":\"0.00vp\",\"bottomRight\":\"0.00vp\"}")

        // let Inspector2 = getInspectorByKey("outline_test")
        // let jsonObject2 = JsonValue.fromStr(Inspector2).asObject()
        // let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        // let outlineStyle2 = attrs2.get("outlineStyle").getOrThrow().toString()
        // @Expect(outlineStyle2, "\"OutlineStyle.DOTTED\"")

        // let outlineWidth2 = attrs2.get("outlineWidth").getOrThrow().toString()
        // @Expect(outlineWidth2, "\"5.00vp\"")

        // let outlineColor2 = attrs2.get("outlineColor").getOrThrow().toString()
        // @Expect(outlineColor2, "\"#FF008000\"")

        // let outlineRadius2 = attrs2.get("outlineRadius").getOrThrow().toString()
        // @Expect(outlineRadius2, "\"10.00vp\"")

        // let Inspector3 = getInspectorByKey("outline_properties_2")
        // let jsonObject3 = JsonValue.fromStr(Inspector3).asObject()
        // let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        // let outlineStyle3 = attrs3.get("outlineStyle").getOrThrow().toString()
        // @Expect(outlineStyle3, "{\"left\":\"OutlineStyle.DOTTED\",\"top\":\"OutlineStyle.SOLID\",\"right\":\"OutlineStyle.DOTTED\",\"bottom\":\"OutlineStyle.DASHED\"}")

        // let outlineWidth3 = attrs3.get("outlineWidth").getOrThrow().toString()
        // @Expect(outlineWidth3, "{\"left\":\"3.00vp\",\"top\":\"10.00vp\",\"start\":\"0.00vp\",\"end\":\"0.00vp\",\"right\":\"6.00vp\",\"bottom\":\"15.00vp\"}")

        // let outlineColor3 = attrs3.get("outlineColor").getOrThrow().toString()
        // @Expect(outlineColor3, "{\"left\":\"#FFFFA500\",\"right\":\"#FF0000FF\",\"top\":\"#FFFF0000\",\"bottom\":\"#FF008000\"}")

        // let outlineRadius3 = attrs3.get("outlineRadius").getOrThrow().toString()
        // @Expect(outlineRadius3, "{\"topLeft\":\"10.00vp\",\"topRight\":\"20.00vp\",\"bottomLeft\":\"40.00vp\",\"bottomRight\":\"80.00vp\"}")
    }

    // ViewPopup
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testPopup001() {
        scrollTo("ViewPopup")
        clickButton("button5")
        let text1 = driver.findComponent(On().id("Test_Button5")).getOrThrow()
        var text = text1.getText()
        @Expect(text, "Button5 Clicked")

        clickButton("button6")
        let text2 = driver.findComponent(On().id("Test_Button6")).getOrThrow()
        text = text2.getText()
        @Expect(text, "Button6 Clicked")
    }

    // ViewPixelRound
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testPixelRound() {
        scrollTo("ViewPixelRound")

        let pixelRoundDivider = driver.findComponent(On().id("pixelRoundButton")).getOrThrow()
        pixelRoundDivider.click()
        driver.delayMs(500)
        pixelRoundDivider.click()
        driver.delayMs(500)
        pixelRoundDivider.click()
        driver.delayMs(500)

        var inspector = getInspectorByKey("parentRow")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let parentRowWidth = attrs.get("width").getOrThrow().toString()
        let parentPixelRound = attrs.get("pixelRound").getOrThrow().toString()
        Hilog.info(1, "Cangjie-App", "parentRowWidth:${parentRowWidth}")
        Hilog.info(1, "Cangjie-App", "parentPixelRound:${parentPixelRound}")
        @Expect(parentRowWidth, "\"300.30px\"")
//        @Expect(parentPixelRound, "\"{\\\"start\\\":\\\"PixelRoundCalcPolicy.FORCE_CEIL\\\",\\\"top\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\",\\\"end\\\":\\\"PixelRoundCalcPolicy.FORCE_CEIL\\\",\\\"bottom\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\"}\"")

        inspector = getInspectorByKey("subRow")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let subRowWidth = attrs.get("width").getOrThrow().toString()
        let subPixelRound = attrs.get("pixelRound").getOrThrow().toString()
        Hilog.info(1, "Cangjie-App", "subRowWidth:${subRowWidth}")
        Hilog.info(1, "Cangjie-App", "subPixelRound:${subPixelRound}")
        @Expect(subRowWidth, "\"100.00%\"")
//        @Expect(subPixelRound, "\"{\\\"start\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\",\\\"top\\\":\\\"PixelRoundCalcPolicy.FORCE_FLOOR\\\",\\\"end\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\",\\\"bottom\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\"}\"")

        inspector = getInspectorByKey("topColumn")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let topColumnPixelRound = attrs.get("pixelRound").getOrThrow().toString()
        Hilog.info(1, "Cangjie-App", "topColumnPixelRound:${topColumnPixelRound}")
        @Expect(topColumnPixelRound, "\"{\\\"start\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\",\\\"top\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\",\\\"end\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\",\\\"bottom\\\":\\\"PixelRoundCalcPolicy.NO_FORCE_ROUND\\\"}\"")
    }

    func clickButton(buttonId: String) {
        let button = driver.waitForComponent(On().id(buttonId),200).getOrThrow()
        button.click()
        driver.delayMs(200)
    }
}
