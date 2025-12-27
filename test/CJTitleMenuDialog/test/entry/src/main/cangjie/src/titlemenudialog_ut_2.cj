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
import ohos.ui_test.*

@Test
class TitleMenuDialogUT2 {
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
        scrollBar.scrollSearch(On().id("TitleMenuDialogIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // Global
    func clickButton(buttonId: String) {
        let button = driver.findComponent(On().id(buttonId)).getOrThrow()
        button.click()
    }
    func getContentFromText(textId: String): String {
        var inspector = getInspectorByKey(textId)
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        attrs.get("content").getOrThrow().toString()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGlobal() {
        scrollTo("ViewGlobal")

        var setTimeout_string: String = ""
        var setInterval_string: String = ""
        clickButton("Timer setTimeout")
        driver.delayMs(200)
        setTimeout_string = getContentFromText("timer_1")
        @Expect(setTimeout_string,"\"Nothing happen\"")
        driver.delayMs(1000)

        clickButton("Timer setInterval")
        driver.delayMs(200)
        setInterval_string = getContentFromText("timer_2")
        @Expect(setInterval_string,"\"0\"")
        driver.delayMs(2000)
        setInterval_string = getContentFromText("timer_2")
        @Expect(setInterval_string != "\"0\"")

        setTimeout_string = getContentFromText("timer_1")
        @Expect(setTimeout_string,"\"do after 1s delay\"")

        clickButton("cancelTimer")
        driver.delayMs(500)
        setTimeout_string = getContentFromText("timer_1")
        setInterval_string = getContentFromText("timer_2")
        @Expect(setTimeout_string,"\"Nothing happen\"")
        @Expect(setInterval_string,"\"0\"")

        clickButton("Timer setTimeout_Zero")
        driver.delayMs(200)
        setTimeout_string = getContentFromText("timer_1")
        @Expect(setTimeout_string,"\"do after 1s delay\"")

        clickButton("Timer setInterval_Delay_Zero")
        driver.delayMs(200)
        setInterval_string = getContentFromText("timer_2")
        @Expect(setInterval_string != "\"0\"")

        clickButton("cancelTimer")
        driver.delayMs(200)
        clickButton("Timer setTimeout_Max")
        driver.delayMs(200)
        clickButton("Timer setTimeout_Min")
        driver.delayMs(200)
        clickButton("Timer setInterval_Delay_Max")
        driver.delayMs(200)
        clickButton("Timer setInterval_Delay_Min")
        driver.delayMs(200)
        clickButton("Timer setInterval_Interval_Zero")
        driver.delayMs(200)
        clickButton("Timer setInterval_Interval_Max")
        driver.delayMs(200)
        clickButton("Timer setInterval_Interval_Min")
        driver.delayMs(200)
    }
}
