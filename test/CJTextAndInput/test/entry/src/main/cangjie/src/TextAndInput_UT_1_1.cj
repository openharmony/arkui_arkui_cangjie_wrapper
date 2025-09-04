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
//import ohos.observer.*
import ohos.ui_test.*
import ohos.business_exception.*

@Test
class TextAndInput_UT_1_1 {
    prop driver: Driver {
        get(){
            OpenHarmonyTestRunner.driver
        }
    }
    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1,"1","Cangjie-Test", "ScrollTo ${view}")
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
                Hilog.error(1,"1","Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.error(1,"1","Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("TextAndInput_UT1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    func click(buttonStr: String) {
        let button = driver.findComponent(On().text(buttonStr)).getOrThrow()
        button.click()
        driver.delayMs(200)
        button.click()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel20, TestLevel0]
    func test_richeditor3() {
        ScrollTo("View_RichEditor2")
        let text = driver.findComponent(On().id("RichEditor_Test1_Text")).getOrThrow()

        let inspector01 = getInspectorByKey("RichEditor_Test1_RichEditor1")
        let jsonObject01 = JsonValue.fromStr(inspector01).asObject()
        let attrs01 = jsonObject01.get("$attrs").getOrThrow().asObject()

        let placeholder01 = attrs01.get("placeholder").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "test richeditor1 placeholder1 ${placeholder01}")
        driver.delayMs(500)
        @Expect(!placeholder01.contains("test"))

        let richEditor1 = driver.findComponent(On().id("RichEditor_Test1_RichEditor1")).getOrThrow()
        richEditor1.click()
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        @Expect(text.getText(), "text")

        let inspector02 = getInspectorByKey("RichEditor_Test1_RichEditor2")
        let jsonObject02 = JsonValue.fromStr(inspector02).asObject()
        let attrs02 = jsonObject02.get("$attrs").getOrThrow().asObject()

        let placeholder02 = attrs02.get("placeholder").getOrThrow().toString()
        driver.delayMs(500)
        @Expect(!placeholder02.contains("test"))

        let richEditor2 = driver.findComponent(On().id("RichEditor_Test1_RichEditor2")).getOrThrow()
        richEditor2.click()
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        @Expect(text.getText(), "text")

        let richEditor3 = driver.findComponent(On().id("RichEditor_Test1_RichEditor3")).getOrThrow()
        richEditor3.click()
        driver.delayMs(500)
        @Expect(text.getText(), "text")

        richEditor3.click()
        richEditor3.click()
        driver.delayMs(500)
        @Expect(text.getText(), "text")

        let richEditor4 = driver.findComponent(On().id("RichEditor_Test1_RichEditor4")).getOrThrow()
        let inspector4 = getInspectorByKey("RichEditor_Test1_RichEditor4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let enableKeyboardOnFocus2 = attrs4.get("enableKeyboardOnFocus").getOrThrow().toString()
        @Expect(enableKeyboardOnFocus2, "\"false\"")//enablePreviewText

        richEditor4.click()
        driver.delayMs(500)
        @Expect(text.getText(), "text")//onEditingChange

        richEditor4.inputText("test")
        driver.delayMs(500)
        @Expect(text.getText(), "InputCallbackSuccess")//onDidIMEInput

        driver.pressBack()
        driver.delayMs(500)
        @Expect(text.getText(), "text")//onEditingChange


        let richEditor5 = driver.findComponent(On().id("RichEditor_Test1_RichEditor5")).getOrThrow()
        richEditor5.click()
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        @Expect(text.getText(), "text")

        let button2 = driver.findComponent(On().id("View_RichEditor_Test1_Button2")).getOrThrow()
        let button3 = driver.findComponent(On().id("View_RichEditor_Test1_Button3")).getOrThrow()

        button3.click()
        driver.delayMs(500)
        driver.click(600, 1600)
        driver.delayMs(500)
        driver.click(1200, 2500)
        driver.delayMs(500)
        @Expect(text.getText(), "true")

        button2.click()
        driver.delayMs(500)
        driver.click(600, 1600)
        driver.delayMs(500)
        driver.click(1200, 2500)
        driver.delayMs(500)
        @Expect(text.getText(), "InputCallbackSuccess")

        let inspector1 = getInspectorByKey("RichEditor_Test1_RichEditor1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()

        let placeholder1 = attrs1.get("placeholder").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "test richeditor3 placeholder1 ${placeholder1}")
        @Expect(placeholder1.contains("16.00fp"))
        @Expect(placeholder1.contains("FontWeight.Normal"))
        @Expect(placeholder1.contains("HarmonyOS Sans"))
        @Expect(placeholder1.contains("FontStyle.Normal"))
        @Expect(placeholder1.contains("#99000000"))

        let inspector2 = getInspectorByKey("RichEditor_Test1_RichEditor2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let placeholder2 = attrs2.get("placeholder").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "test richeditor3 placeholder2 ${placeholder2}")
        @Expect(placeholder2.contains("16.00fp"))

        let inspector3 = getInspectorByKey("RichEditor_Test1_RichEditor3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let placeholder3 = attrs3.get("placeholder").getOrThrow().toString()
        let enableKeyboardOnFocus1 = attrs3.get("enableKeyboardOnFocus").getOrThrow().toString()

        Hilog.info(1,"1","Cangjie-App", "test richeditor3 placeholder3 ${placeholder3}")
        @Expect(enableKeyboardOnFocus1, "\"true\"")
        @Expect(placeholder3.contains("20.00fp"))
        @Expect(placeholder3.contains("700"))
        @Expect(placeholder3.contains("unknownFamily"))
        @Expect(placeholder3.contains("FontStyle.Italic"))
        @Expect(placeholder3.contains("#FFFF0000"))
        driver.delayMs(500)
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel20, TestLevel0]
    func test_richeditor4() {
        ScrollTo("View_RichEditor2")
        let nextButton = driver.findComponent(On().id("next_component")).getOrThrow()
        nextButton.click()
        driver.delayMs(2000)

        let text1 = driver.findComponent(On().id("View_RichEditor_Test2_Text1")).getOrThrow()
        let text2 = driver.findComponent(On().id("View_RichEditor_Test2_Text2")).getOrThrow()
        let text3 = driver.findComponent(On().id("View_RichEditor_Test2_Text3")).getOrThrow()
        @Expect(text1.getText(), "1")
        @Expect(text2.getText(), "1")
        @Expect(text3.getText(), "0")

        let inspector1 = getInspectorByKey("View_RichEditor_Test2_RichEditor1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()

        let enableDataDetector = attrs1.get("enableDataDetector").getOrThrow().toString()
        @Expect(enableDataDetector, "\"true\"")
        let dataDetectorConfig1 = attrs1.get("dataDetectorConfig").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "test richeditor4 dataDetectorConfig1 ${dataDetectorConfig1}")
        @Expect(dataDetectorConfig1.contains("type\\\":3,\\\"color\\\":\\\"#FF000000\\\",\\\"style\\\":1"))

        let inspector2 = getInspectorByKey("View_RichEditor_Test2_RichEditor2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let dataDetectorConfig2 = attrs2.get("dataDetectorConfig").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "test richeditor4 dataDetectorConfig2 ${dataDetectorConfig2}")
        @Expect(dataDetectorConfig2.contains("type\\\":1,\\\"color\\\":\\\"#FF0A59F7\\\",\\\"style\\\":0"))

        let inspector3 = getInspectorByKey("View_RichEditor_Test2_RichEditor3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let dataDetectorConfig3 = attrs3.get("dataDetectorConfig").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-App", "test richeditor4 dataDetectorConfig3 ${dataDetectorConfig3}")
        @Expect(dataDetectorConfig3.contains("color\\\":\\\"#FF0A59F7"))
    }

    @TestCase
    @Tag[APILevel20, TestLevel0]
    func test_richeditor5() {
        ScrollTo("View_RichEditor2")
        let nextButton = driver.findComponent(On().id("next_component")).getOrThrow()
        nextButton.click()
        driver.delayMs(500)
        nextButton.click()
        driver.delayMs(500)

        let editMenuOptions = driver.findComponent(On().id("editMenuOptions")).getOrThrow()
        editMenuOptions.longClick()
        driver.pressBack()
        driver.delayMs(200)

        let richEditor2 = driver.findComponent(On().id("View_RichEditor_Test3_RichEditor2")).getOrThrow()
        let text2 = driver.findComponent(On().id("View_RichEditor_Test3_Text2")).getOrThrow()

        richEditor2.click()
        richEditor2.longClick()
        driver.delayMs(500)
        let selectAllButton1 = driver.findComponent(On().text("全选")).getOrThrow()
        selectAllButton1.click()
        driver.delayMs(500)
        let selectButton3 = driver.findComponent(On().text("剪切")).getOrThrow()
        selectButton3.click()
        driver.delayMs(500)
        @Expect(text2.getText(), "Cut")
    }


}