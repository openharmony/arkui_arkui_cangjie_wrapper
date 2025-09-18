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
import ohos.hilog.Hilog

@Test
class ButtonSelectUT1 {
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
        logger("started")
        scrollBar.scrollSearch(On().id("ButtonSelectIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }
    //

    // checkboxgroup unittest
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testCheckboxgroupCommonAttrs() {
        scrollTo("ViewCheckboxGroup")

        let inspector = getInspectorByKey("checkboxGroupComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let group = attrs.get("group").getOrThrow().toString()
        @Expect(group, "\"checkboxGroup1\"")

        let selectAll = attrs.get("selectAll").getOrThrow().toString()
        @Expect(selectAll, "\"true\"")

        let selectedColor = attrs.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor, "\"#FFCC6F21\"")

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"50.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"50.00vp\"")

        let padding = attrs.get("padding").getOrThrow().toString()
        @Expect(padding, "\"10.00vp\"")

        let checkboxGroup = driver.findComponent(On().id("checkboxGroupComponent")).getOrThrow()
        let point = checkboxGroup.getBoundsCenter()
        driver.click(Int32(point.x), Int32(point.y))

        let content = driver.findComponent(On().id("textComponent")).getOrThrow().getText()
        @Expect(content, "Clicked")

        let inspector2 = getInspectorByKey("checkboxGroupComponent2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let width2 = attrs2.get("width").getOrThrow().toString()
        @Expect(width2, "\"60.00vp\"")

        let height2 = attrs2.get("height").getOrThrow().toString()
        @Expect(height2, "\"60.00vp\"")

        // unselectedColor，mark，checkboxShape 默认值测试
        let unselectedColor2 = attrs2.get("unselectedColor").getOrThrow().toString()
        @Expect(unselectedColor2, "\"#66000000\"")

        let mark2 = attrs2.get("mark").getOrThrow().toString()
        @Expect(mark2.contains("{\\\"strokeColor\\\":\\\"#FFFFFFFF\\\",\\\"size\\\":\\\"0.00vp\\\",\\\"strokeWidth\\\":\\\"2.00vp\\\"}"))

        let checkboxShape2 = attrs2.get("checkboxShape").getOrThrow().toString()
        @Expect(checkboxShape2, "\"0\"")

        // mark 边界值测试， checkboxShape 枚举值测试
        let inspector3 = getInspectorByKey("checkboxGroupComponent3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let checkboxShape3 = attrs3.get("checkboxShape").getOrThrow().toString()
        @Expect(checkboxShape3, "\"0\"")

        let Create = driver.findComponent(On().id("checkboxGroupComponent2")).getOrThrow()
        Create.click()
        driver.delayMs(500)
        Create.click()
        driver.delayMs(500)
    }

    // rating unittest
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testRating() {
        scrollTo("ViewRating")

        let inspector = getInspectorByKey("my_rating")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let stars = attrs.get("stars").getOrThrow().toString()
        @Expect(stars, "\"5\"")

        let margin = attrs.get("margin").getOrThrow().toString()
        @Expect(margin, "\"24.00vp\"")

        let text_begin = driver.findComponent(On().id("my_score")).getOrThrow().getText()
        @Expect(text_begin, "current score is 3.500000")

        let swiper = driver.findComponent(On().id("my_rating")).getOrThrow()
        let rect = swiper.getBounds()
        driver.delayMs(100)
        driver.swipe(Int32(rect.left), Int32(rect.top), Int32(rect.right), Int32(rect.bottom), speed: 200)

        let text_end = driver.waitForComponent(On().id("my_score"), 200).getOrThrow().getText()
        @Expect(text_end, "current score is 5.000000")
    }

    // select unittest

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testSelect3() {
        scrollTo("ViewSelect")

        let select6 = getInspectorByKey("my_select_06")
        let jsonObject6 = JsonValue.fromStr(select6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        Hilog.info(0, "0", "CangjieTest", "select_attrs6.toString():\t ${attrs6.toString()}")
        @Expect(attrs6.get("padding").getOrThrow().toString(), "\"50.00vp\"")
    }

    // Router
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testRouter2() {
        scrollTo("ViewRouter1")
        let button_errpushurl_1 = driver.findComponent(On().id("err_pushurl")).getOrThrow()
        button_errpushurl_1.click()
        let text_errpushurl_1 = driver.waitForComponent(On().id("router1_get_message"), 600).getOrThrow().getText()
        @Expect(text_errpushurl_1, "xxx")

        let button_errpushurl_2 = driver.findComponent(On().id("err_pushurl_single")).getOrThrow()
        button_errpushurl_2.click()
        let text_errpushurl_2 = driver.waitForComponent(On().id("router1_get_message"), 600).getOrThrow().getText()
        @Expect(text_errpushurl_2, "xxx")
    }

    // Router
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testRouter() {
        scrollTo("ViewRouter1")

        // 测试样例重构 Page_1 - > Page_2
        let button1 = driver.findComponent(On().id("jump1_to_page2")).getOrThrow()
        button1.click()
        let text2 = driver.waitForComponent(On().id("my_text2"), 600).getOrThrow().getText()
        @Expect(text2, "Page ViewRouter2")

        // Page_2 -> Page_1
        let button2 = driver.findComponent(On().id("page2_jumpBack1")).getOrThrow()
        button2.click()
        driver.delayMs(600)
        logger("Page_2 -> Page_1")

        // 覆盖率提升JsonObject back  带参url
        // Page_1 -> Page_2 and Page_2 -> Page_1·
        let button = driver.findComponent(On().id("jump2_to_page2")).getOrThrow()
        button.click()
        let button2_2 = driver.waitForComponent(On().id("page2_jumpBack2"), 600).getOrThrow()
        button2_2.click()
        driver.delayMs(600)

        // 覆盖率提升 back JsonObject
        // Page_1 - > Page_2
        let button3 = driver.findComponent(On().id("jump2_to_page2")).getOrThrow()
        button3.click()
        // Page_2 - > Page_1
        let button2_3 = driver.waitForComponent(On().id("page2_jumpBack3"), 600).getOrThrow()
        button2_3.click()
        driver.delayMs(600)

        // 覆盖率提升 getParamsObject
        let button4 = driver.findComponent(On().id("getParamsObject")).getOrThrow()
        button4.click()
        let text1 = driver.waitForComponent(On().id("my_text1"), 600).getOrThrow().getText()
        @Expect(text1, "Page ViewRouter1")

        //测试pushurl(standard, single)
        //1.从page1跳转到page2
        let button5_1 = driver.findComponent(On().id("to_page2_by_pushurl")).getOrThrow()
        button5_1.click()
        //校验是否跳转到page2
        let text5_1 = driver.waitForComponent(On().id("my_text2"), 600).getOrThrow().getText()
        @Expect(text5_1, "Page ViewRouter2")
        //校验从page1传过来的参数
        let button5_2 = driver.findComponent(On().id("get_params")).getOrThrow()
        button5_2.click()
        let text5_2 = driver.waitForComponent(On().id("router2_get_message"), 600).getOrThrow().getText()
        @Expect(text5_2, "from page1 by pushurl")
        //从page2跳转到page1
        let button5_3 = driver.findComponent(On().id("to_page1_by_pushurl")).getOrThrow()
        button5_3.click()
        //校验是否跳转到page1
        let text5_3 = driver.waitForComponent(On().id("my_text1"), 600).getOrThrow().getText()
        @Expect(text5_3, "Page ViewRouter1")

        //使用single模式去跳转到page2再跳转回page1，获取页面栈数据只会+1
        //从page1跳转到page2
        let button5_5 = driver.findComponent(On().id("to_page2_by_pushurl_single")).getOrThrow()
        button5_5.click()
        //从page2跳转到page1
        let button5_6 = driver.waitForComponent(On().id("to_page1_by_pushurl"), 600).getOrThrow()
        button5_6.click()

        //测试replaceurl
        //1.从page1跳转到page2
        let button6_1 = driver.findComponent(On().id("to_page2_by_replace")).getOrThrow()
        button6_1.click()
        //校验是否跳转到page2
        let text6_1 = driver.waitForComponent(On().id("my_text2"), 600).getOrThrow().getText()
        @Expect(text6_1, "Page ViewRouter2")
        //校验从page1传过来的参数
        let button6_2 = driver.findComponent(On().id("get_params")).getOrThrow()
        button6_2.click()
        let text6_2 = driver.waitForComponent(On().id("router2_get_message"), 600).getOrThrow().getText()
        @Expect(text6_2, "from page1 by replace")
        //从page2跳转到page1
        let button6_3 = driver.findComponent(On().id("to_page1_by_pushurl")).getOrThrow()
        button6_3.click()
        driver.delayMs(600)
        //校验是否跳转回到page1
        let text6_3 = driver.findComponent(On().id("my_text1")).getOrThrow().getText()
        @Expect(text6_3, "Page ViewRouter1")

        //验证backurl效果
        let button7_3 = driver.findComponent(On().id("back_page2")).getOrThrow()
        button7_3.click()
        driver.delayMs(600)
        //校验是否返回到page2
        let text7_3 = driver.findComponent(On().id("my_text2")).getOrThrow().getText()
        @Expect(text7_3, "Page ViewRouter2")

        //在page2中back到page1,会弹窗，需要点击确定
        //1.点击返回按钮
        let button7_4 = driver.findComponent(On().id("back_show_alert")).getOrThrow()
        button7_4.click()

        let button3_3 = driver.findComponent(On().id("jump2_to_page2")).getOrThrow()
        button3_3.click()
        //回到page1
        let button7_5 = driver.findComponent(On().id("to_page1_by_pushurl")).getOrThrow()
        button7_5.click()
        //校验时候回到page1
        let text7_5 = driver.waitForComponent(On().id("my_text1"), 600).getOrThrow().getText()
        @Expect(text7_5, "Page ViewRouter1")

        //验证backindex效果
        //点击按钮返回到指定index的页面
        let button7_6 = driver.findComponent(On().id("back_to_4")).getOrThrow()
        button7_6.click()
        //校验是否成功返回到指定index的页面
        // let text7_6 = driver.waitForComponent(On().id("my_text2"), 600).getOrThrow().getText()
        // @Expect(text7_6, "Page ViewRouter2")
        driver.pressBack()
        driver.delayMs(600)
    }
}