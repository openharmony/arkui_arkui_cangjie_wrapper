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

@Test
class BasicCommon_UT_1 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1,"1","Cangjie-Test", "ScrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1,"1","Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.info(1,"1","Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("Index_UT1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_accessibility() {
        ScrollTo("View_Accessibility")

        // 正常值测试
        let inspector = getInspectorByKey("accessibility_id")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","Cangjie-App", "accessibility_id: ${attrs.toString()}")

        // CjResource和异常值测试
        let inspector2 = getInspectorByKey("accessibility_id2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","Cangjie-App", "accessibility_id2: ${attrs2.toString()}")

        let accessibilityLevel2 = attrs2.get("accessibilityLevel").getOrThrow().toString()
        @Expect(accessibilityLevel2, "\"auto\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_animation() {
        ScrollTo("View_Animation")

        let button = driver.findComponent(On().id("my_button")).getOrThrow()
        button.click()

        let businessException: BusinessException = BusinessException(1234, "")
        Hilog.info(1,"1","Cangjie-Test", "aaaa: ${businessException.toString()}")

        let text = driver.findComponent(On().id("text")).getOrThrow().getText()
        @Expect(text, "Animation")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_appStorage() {
        ScrollTo("View_Appstorage")

        var inspector = getInspectorByKey("parentText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()

        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width1 = attrs.get("width").getOrThrow().toString()
        @Expect(width1, "\"100.00vp\"")

        let pbtn = driver.waitForComponent(On().id("parentBtn"),500).getOrThrow()
        pbtn.click()

        driver.delayMs(500)
        inspector = getInspectorByKey("parentText")
        jsonObject = JsonValue.fromStr(inspector).asObject()

        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width2 = attrs.get("width").getOrThrow().toString()
        @Expect(width2, "\"110.00vp\"")

        let sbtn = driver.waitForComponent(On().id("sonBtn"),500).getOrThrow()
        sbtn.click()

        driver.delayMs(500)
        inspector = getInspectorByKey("parentText")
        jsonObject = JsonValue.fromStr(inspector).asObject()

        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width3 = attrs.get("width").getOrThrow().toString()
        @Expect(width3, "\"100.00vp\"")

        let linkBtn = driver.findComponent(On().id("changeLinkTextButton")).getOrThrow()
        linkBtn.click()
        let msgText_1 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_1,"changed")

        let hasBtn = driver.findComponent(On().id("hasButton")).getOrThrow()
        hasBtn.click()
        let msgText_2 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_2,"true")

        let nohasBtn = driver.findComponent(On().id("nohasButton")).getOrThrow()
        nohasBtn.click()
        let msgText_3 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_3,"false")

        let keysSizeBtn_1 = driver.findComponent(On().id("keysSizeButton")).getOrThrow()
        keysSizeBtn_1.click()
        let msgText_4 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_4,"AppStorage has 5 elements: [count, msg, propmsg, abilityContext, windowStage]")

        let clearBtn = driver.findComponent(On().id("clearButton")).getOrThrow()
        clearBtn.click()
        let msgText_5 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_5,"false") // 目前的情况下，只要有一个属性被订阅，就无法成功删除，所以返回false

        let keysSizeBtn_2 = driver.findComponent(On().id("keysSizeButton")).getOrThrow()
        keysSizeBtn_2.click()
        let msgText_6 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        // 后期如果功能修改，可能需要重新修改测试用例
        @Expect(msgText_6,"AppStorage has 5 elements: [count, msg, propmsg, abilityContext, windowStage]")

        let setBtn = driver.findComponent(On().id("setButton")).getOrThrow()
        setBtn.click()
        let msgText_7 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_7,"true")

        let getBtn = driver.findComponent(On().id("getButton")).getOrThrow()
        getBtn.click()
        let msgText_8 = driver.waitForComponent(On().id("msgText"),500).getOrThrow().getText()
        @Expect(msgText_8,"666")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_background() {
        ScrollTo("View_Background")

        var inspector = getInspectorByKey("my_background")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let backgroundImage_t = attrs.get("backgroundImage").getOrThrow().toString()
        @Expect(backgroundImage_t.contains("ImageRepeat.NoRepeat"))

        let backgroundImagePosition_t = attrs.get("backgroundImagePosition").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "[test_background] backgroundImagePosition_t: ${backgroundImagePosition_t}")
        @Expect(backgroundImagePosition_t.contains("65"))

        let backgroundImageSize_t = attrs.get("backgroundImageSize").getOrThrow().toString()

        Hilog.info(1,"1","Cangjie-App", "[test_background] backgroundImageSize_t: ${backgroundImagePosition_t}")
        @Expect(backgroundImageSize_t.contains("\\\"width\\\":\\\"97.50px\\\""))
    }


    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_backgroundSetting3() {
        ScrollTo("View_Background3")
    }

    // View_Base
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_base() {
        ScrollTo("View_Base")
        let bindPopup = driver.findComponent(On().text("BindPopup")).getOrThrow()
        bindPopup.click()
        let cjresource = driver.waitForComponent(On().id("cjresource"),2000).getOrThrow()
        var text = cjresource.getText()
        @Expect(text, "margin cjresource and constraintSize ")
        driver.delayMs(1000)
    }

    // BindContentCover
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_bindContentcover() {
        ScrollTo("View_BindContentCover")

        let bindContentCover: Component = driver.findComponent(On().id("bindContentCover")).getOrThrow()
        bindContentCover.click()
        driver.delayMs(1000)
        let text_1 = driver.findComponent(On().id("text1")).getOrThrow()
        let text1 = text_1.getText().toString()
        @Expect(text1, "123")

        let button2: Component = driver.findComponent(On().id("button2")).getOrThrow()
        button2.click()
        driver.delayMs(1000)
        let text_2 = driver.findComponent(On().id("text2")).getOrThrow()
        let text2 = text_2.getText().toString()
        @Expect(text2, "BindContentCover onDisappear.")
    }


    // border
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_render() {
        ScrollTo("View_Border")

        var inspector = getInspectorByKey("my_border")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        @Expect(attrs.get("borderWidth").getOrThrow().toString(),"\"5.00vp\"")
        @Expect(attrs.get("borderColor").getOrThrow().toString(),"\"#FFCCCCCC\"")
        @Expect(attrs.get("borderRadius").getOrThrow().toString(), "\"20.00vp\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_Animator() {
        ScrollTo("View_Animator")
        let Create = driver.findComponent(On().id("CreateButton")).getOrThrow()
        Create.click()
        driver.delayMs(500)

        let Reverse = driver.findComponent(On().id("ReverseButton")).getOrThrow()
        Reverse.click()
        driver.delayMs(3000)
        let frameText2 = driver.findComponent(On().id("forFrame")).getOrThrow()
        let text2 = frameText2.getText()
        @Expect(text2, "Frame 200.000000")

        let Finish = driver.findComponent(On().id("FinishButton")).getOrThrow()
        Finish.click()
        let finishText2 = driver.waitForComponent(On().id("forFinish"),500).getOrThrow()
        let text6 = finishText2.getText()
        @Expect(text6, "Finish")

        let Play = driver.findComponent(On().id("PlayButton")).getOrThrow()
        Play.click()
        driver.delayMs(3000)

        let Reset1 = driver.findComponent(On().id("ResetButton1")).getOrThrow()
        Reset1.click()
        driver.delayMs(500)

        Play.click()
        let repeatText = driver.waitForComponent(On().id("forRepeat"),4000).getOrThrow()
        let text3 = repeatText.getText()
        @Expect(text3, "Repeat")

        Play.click()
        let Cancel = driver.waitForComponent(On().id("CancelButton"),1000).getOrThrow()
        Cancel.click()
        let cancelText = driver.waitForComponent(On().id("forCancel"),500).getOrThrow()
        let text4 = cancelText.getText()
        @Expect(text4, "Cancel")

        let finishText1 = driver.findComponent(On().id("forFinish")).getOrThrow()
        let text5 = finishText1.getText()
        @Expect(text5, "notFinished")

        let expectedFrameRateRange = driver.findComponent(On().id("expectedFrameRateRangeButton")).getOrThrow()
        expectedFrameRateRange.click()
        driver.delayMs(600)

        Play.click()

        let Pause = driver.waitForComponent(On().id("PauseButton"),1000).getOrThrow()
        Pause.click()

        let temp1 = driver.waitForComponent(On().id("temp1Button"),3000).getOrThrow()
        temp1.click()

        let temp2 = driver.waitForComponent(On().id("temp2Button"),600).getOrThrow()
        temp2.click()

        let temp4 = driver.waitForComponent(On().id("expectedFrameRateRangeButton2"),600).getOrThrow()
        temp4.click()

        let temp5 = driver.waitForComponent(On().id("expectedFrameRateRangeButton3"),600).getOrThrow()
        temp5.click()

        let temp6 = driver.waitForComponent(On().id("expectedFrameRateRangeButton4"),600).getOrThrow()
        temp6.click()
        driver.delayMs(600)
    }
}
