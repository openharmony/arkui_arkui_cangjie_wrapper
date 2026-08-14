/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
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
class TitleMenuDialogUTDialogV2 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(200)
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(200)
                isSuccess = true
            } catch (e: BusinessException) {
                driver.pressBack()
                driver.delayMs(200)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    func hasComponent(id: String): Bool {
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollSearch(On().id(id))
        return driver.findComponent(On().id(id)).isSome()
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        logger("started")
        scrollBar.scrollSearch(On().id("TitleMenuDialogIndex2")).getOrThrow().click()
        driver.delayMs(200)
        scrollTo("ViewPromptV2")
        driver.delayMs(200)
    }

    protected override func afterEach() {
        driver.pressBack()
    }


    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc01() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc01"))
        button?.click()
        driver.delayMs(1000)

        let resultText = driver.waitForComponent(On().id("testResultText"), 1000)?.getText()
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc02() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc02"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc03() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc03"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc04() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc04"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc05() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc05"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc06() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc06"))
        button?.click()
        driver.delayMs(1000)

        let resultText = driver.waitForComponent(On().id("testResultText"), 1000)?.getText()
        @Expect(resultText?.contains("Valid dialogId"), true)

        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc07() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc07"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testOpenCustomDialogTc08() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("openCustomDialog_tc08"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }


    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc01() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc01"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc02() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc02"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc03() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc03"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc04() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc04"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc05() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc05"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc06() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc06"))
        button?.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowActionMenuTc07() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showActionMenu_tc07"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }


    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc01() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc01"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc02() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc02"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc03() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc03"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc04() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc04"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc05() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc05"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc06() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc06"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc07() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc07"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc08() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc08"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc09() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc09"))
        button?.click()
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc10() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc010"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc11() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc11"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testShowDialogTc12() {
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().id("showDialog_tc12"))
        button?.click()
        driver.delayMs(200)
        driver.pressBack()
        driver.delayMs(200)
    }
}