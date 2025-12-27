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
import std.collection.ArrayList
import std.math.*

@Test
class ScrollSplitUT11 {
    prop driver: Driver {
        get(){
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
                scrollBar
                    .scrollSearch(On().id(view)).getOrThrow()
                    .click()
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
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
        Hilog.error(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("ScrollSplitIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }
    func getLongPressPoints(startX: Float64, startY: Float64, pointNumber: Int64): ArrayList<ui_test.Point> {
        let res: ArrayList<ui_test.Point> = ArrayList<ui_test.Point>([])
        for (i in 0..pointNumber) {
            res.add(ui_test.Point(Int32(round(startX) + Float64(i % 2)), Int32(round(startY) + Float64(i % 2))))
        }
        return res
    }


    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyforeach() {
        scrollTo("ViewLazyforeach")

        let text_begin = driver.findComponent(On().id("my_text_0")).getOrThrow().getText()
        @Expect(text_begin, "name 0")

        let text = driver.findComponent(On().id("my_text")).getOrThrow()
        driver.delayMs(200)
        text.click()

        let text_end = driver.waitForComponent(On().id("my_text_0"),200).getOrThrow().getText()
        @Expect(text_end, "xiaoming")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyforeachDataoptions(){
        scrollTo("ViewLazyforeachDataOptions")

        let text = driver.findComponent(On().id("notifyChange")).getOrThrow()
        text.click()
        driver.delayMs(400)
        text.click()

        let button = driver.waitForComponent(On().id("verify"),400).getOrThrow()
        button.click()

        let text_msg = driver.waitForComponent(On().id("msg"),400).getOrThrow().getText()
        @Expect(text_msg, "2:xiaoming,3:name 0,4:name 1,5:name 2,11:name 9,12:name 10")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testListitemCommonAttrs() {
        scrollTo("ViewListItem")

        let getItem = driver.findComponent(On().id("getItem")).getOrThrow()
        getItem.click()
        let message = driver.waitForComponent(On().id("message"),100).getOrThrow().getText()
        @Expect(message.contains("x: 0"))

        let getInfo = driver.findComponent(On().id("getInfo")).getOrThrow()
        getInfo.click()

        let message1 = driver.waitForComponent(On().id("message"),100).getOrThrow().getText()
        @Expect(message1.contains("index: 0"))

        let scrollItem = driver.findComponent(On().id("scrollItem")).getOrThrow()
        scrollItem.click()

        let message2 = driver.waitForComponent(On().id("message"),100).getOrThrow().getText()
        @Expect(message2, "scrollToItemInGroup 0 1")

        let closeSwipe = driver.findComponent(On().id("closeSwipe")).getOrThrow()
        closeSwipe.click()
        let message3 = driver.waitForComponent(On().id("message"),100).getOrThrow().getText()
        @Expect(message3, "closeAllSwipeActions 0 1")

        let inspector = getInspectorByKey("listitem")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-App", "aaaa: ${jsonObject.toString()}")

        let selectable = attrs.get("selectable").getOrThrow().toString()
        @Expect(selectable,"true")

        let editable = attrs.get("editable").getOrThrow().toString()
        @Expect(editable,"false")

        let sticky = attrs.get("sticky").getOrThrow().toString()
        @Expect(sticky,"\"Sticky.None\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridItem() {
        scrollTo("ViewGridItem")

        let scroll_text = driver.findComponent(On().id("scroll_text")).getOrThrow()

        driver.swipe(100, 2500, 100, 2700)
        driver.delayMs(100)

        @Expect(scroll_text.getText(), "onScrollFrameBegin")
    }
}