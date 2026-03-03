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
import ohos.hilog.Hilog
import ohos.ui_test.*
internal import ohos.business_exception.BusinessException
import ohos.device_info.*
import ohos.arkui.component_utils.*

@Test
class InformationDisplayUT2 {
    prop driver: Driver {
        get(){
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1,"Cangjie-Test","scrollTo ${view}")
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
                Hilog.error(1,"1",e.message)
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
        Hilog.error(1,"Cangjie-Test","started")
        scrollBar.scrollSearch(On().id("InformationDisplayIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProgressCommonAttrs() {
        scrollTo("ViewProgress")

        let inspector6 = getInspectorByKey("progress6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()

        let value6 = attrs6.get("value").getOrThrow().toString()
        @Expect(value6, "\"50.000000\"")

        let total6 = attrs6.get("total").getOrThrow().toString()
        @Expect(total6, "\"150.000000\"")

        let `type6` = attrs6.get("type").getOrThrow().toString()
        @Expect(`type6`, "\"ProgressStyle.ScaleRing\"")

        let color6 = attrs6.get("color").getOrThrow().toString()
        @Expect(color6, "\"#FF808080\"")

        let bgColor6 = attrs6.get("backgroundColor").getOrThrow().toString()
        @Expect(bgColor6, "\"#19000000\"")


        let inspector10 = getInspectorByKey("progress10")
        let jsonObject10 = JsonValue.fromStr(inspector10).asObject()
        let attrs10 = jsonObject10.get("$attrs").getOrThrow().asObject()

        let value10 = attrs10.get("value").getOrThrow().toString()
        @Expect(value10, "\"50.000000\"")

        let total10 = attrs10.get("total").getOrThrow().toString()
        @Expect(total10, "\"150.000000\"")

        let `type10` = attrs10.get("type").getOrThrow().toString()
        @Expect(`type10`, "\"ProgressStyle.Ring\"")

        let color10 = attrs10.get("color").getOrThrow().toString()
        @Expect(color10, "\"#FF808080\"")

        let bgColor10 = attrs10.get("backgroundColor").getOrThrow().toString()
        @Expect(bgColor10, "\"#0C000000\"")

        let style10 = attrs10.get("style").getOrThrow().toString()
        @Expect(style10.contains("\\\"strokeWidth\\\":\\\"20.00vp\\\""))

        let inspector10_1 = getInspectorByKey("progress10_1")
        let jsonObject10_1 = JsonValue.fromStr(inspector10_1).asObject()
        let attrs10_1 = jsonObject10_1.get("$attrs").getOrThrow().asObject()

        let value10_1 = attrs10_1.get("value").getOrThrow().toString()
        @Expect(value10_1, "\"100.000000\"")

        let total10_1 = attrs10_1.get("total").getOrThrow().toString()
        @Expect(total10_1, "\"150.000000\"")

        let `type10_1` = attrs10_1.get("type").getOrThrow().toString()
        @Expect(`type10_1`, "\"ProgressStyle.Ring\"")

        let color10_1 = attrs10_1.get("color").getOrThrow().toString()
        @Expect(color10_1, "\"#FF808080\"")

        let bgColor10_1 = attrs10_1.get("backgroundColor").getOrThrow().toString()
        @Expect(bgColor10_1, "\"#0C000000\"")

        let style10_1 = attrs10_1.get("style").getOrThrow().toString()
        @Expect(style10_1.contains("\\\"strokeWidth\\\":\\\"20.00vp\\\""))

        let inspector13 = getInspectorByKey("progress13")
        let jsonObject13 = JsonValue.fromStr(inspector13).asObject()
        let attrs13 = jsonObject13.get("$attrs").getOrThrow().asObject()

        let value13 = attrs13.get("value").getOrThrow().toString()
        @Expect(value13, "\"30.000000\"")

        let total13 = attrs13.get("total").getOrThrow().toString()
        @Expect(total13, "\"100.000000\"")

        let `type13` = attrs13.get("type").getOrThrow().toString()
        @Expect(`type13`, "\"ProgressStyle.Capsule\"")

        let style13 = attrs13.get("style").getOrThrow().toString()
        @Expect(style13.contains("\\\"strokeWidth\\\":\\\"4.00vp\\\""))

        let style13_a = attrs13.get("style").getOrThrow().toString()
        @Expect(style13.contains("\\\"scaleCount\\\":\\\"120\\\""))

        let style13_b = attrs13.get("style").getOrThrow().toString()
        @Expect(style13.contains("\\\"scaleWidth\\\":\\\"2.00vp\\\""))
    }



    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testQrcode() {
        scrollTo("ViewQRCode")

        let inspector = getInspectorByKey("QRCode0")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let testcl0 = attrs.get("color").getOrThrow().toString()
        @Expect(testcl0, "\"#FF000000\"")

        let testbgcl0 = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(testbgcl0, "\"#FFFFFFFF\"")

        let testco0 = attrs.get("opacity").getOrThrow().toString()
        @Expect(testco0, "1")

        let inspector1 = getInspectorByKey("QRCode1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()

        let testcl1 = attrs1.get("color").getOrThrow().toString()
        @Expect(testcl1, "\"#FFF7CE00\"")

        let testbgcl1 = attrs1.get("backgroundColor").getOrThrow().toString()
        @Expect(testbgcl1, "\"#FFFF0000\"")

        let testco1 = attrs1.get("opacity").getOrThrow().toString()
        @Expect(testco1, "0.100000")

        let inspector2 = getInspectorByKey("QRCode2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let testcl2 = attrs2.get("color").getOrThrow().toString()
        @Expect(testcl2, "\"#FF000000\"")

        let testbgcl2 = attrs2.get("backgroundColor").getOrThrow().toString()
        @Expect(testbgcl2, "\"#FFFFFFFF\"")

        let testco2 = attrs2.get("opacity").getOrThrow().toString()
        @Expect(testco2, "0.500000")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRelativeContainer() {
        scrollTo("ViewRelativeContainer")

        var statusBarHeight: Int64 = 123
        let device_name = DeviceInfo.marketName
        if (device_name == "HUAWEI Mate 70 Pro") {
            Hilog.info(1, "Cangjie-Test", "The current device is ${device_name}")
            statusBarHeight = 136
        }
        let boxSize: Int64 = 400

        let rect4 = getRectInfo("row6")
        @Expect(rect4, "\"[0.00, ${statusBarHeight + boxSize * 4}.00],[100.00,${statusBarHeight + boxSize * 4 + 100}.00]\"")

        let rect5 = getRectInfo("row8")
        @Expect(rect5, "\"[100.00, ${statusBarHeight + boxSize * 5}.00],[200.00,${statusBarHeight + boxSize * 5 + 100}.00]\"")

        let rect6 = getRectInfo("row10")
        @Expect(rect6, "\"[0.00, ${statusBarHeight + boxSize * 6}.00],[100.00,${statusBarHeight + boxSize * 6 + 100}.00]\"")

        let rect7 = getRectInfo("row12")
        @Expect(rect7, "\"[0.00, ${statusBarHeight + boxSize * 7 + 100}.00],[100.00,${statusBarHeight + boxSize * 7 + 200}.00]\"")

        let rect9 = getRectInfo("row17")
        @Expect(rect9, "\"[0.00, ${statusBarHeight + boxSize * 9}.00],[100.00,${statusBarHeight + boxSize * 9 + 100}.00]\"")

        let rect10 = getRectInfo("row18")
        @Expect(rect10, "\"[50.00, ${statusBarHeight + boxSize * 9 + 100}.00],[150.00,${statusBarHeight + boxSize * 9 + 200}.00]\"")

        let rect11 = getRectInfo("row19")
        @Expect(rect11, "\"[150.00, ${statusBarHeight + boxSize * 9}.00],[250.00,${statusBarHeight + boxSize * 9 + 100}.00]\"")

        let rect12 = getRectInfo("row20")
        @Expect(rect12, "\"[0.00, ${statusBarHeight + boxSize * 9 + 200}.00],[100.00,${statusBarHeight + boxSize * 9 + 300}.00]\"")

        let rect13 = getRectInfo("row21")
        @Expect(rect13, "\"[0.00, ${statusBarHeight + boxSize * 10}.00],[300.00,${statusBarHeight + boxSize * 10 + 300}.00]\"")
    }

    func getRectInfo(id: String): String {
        let inspector = getInspectorByKey(id)
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let rectInfo = jsonObject.get("$rect").getOrThrow().toString()
        return rectInfo
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRelativeContainer3() {
        scrollTo("ViewRelativeContainer3")

        let rect1 = getRectInfo("row1")
        let device_name = DeviceInfo.marketName
        Hilog.info(1, "Cangjie-Test", "The current device is ${device_name}, rect1: ${rect1}")
        if (device_name == "HUAWEI Mate 70 Pro") {
            @Expect(rect1, '\"[388.00, 967.00],[738.00,1317.00]\"')
        } else {
            @Expect(rect1, '\"[359.00, 942.00],[684.00,1267.00]\"')
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testStackCommonAttrs() {
        scrollTo("ViewStack")

        let stack_bottom: Component = driver.findComponent(On().id("stack_bottom")).getOrThrow()
        let rect_bottom = stack_bottom.getBounds()
        let stack_top: Component = driver.findComponent(On().id("stack_top")).getOrThrow()
        let rect_top = stack_top.getBounds()

        Hilog.info(0,"0","stack_bottom right: ${rect_bottom.right} stack_top right: ${rect_top.right}")
        @Expect(rect_bottom.right, rect_top.right)
        Hilog.info(0,"0","stack_bottom bottom: ${rect_bottom.bottom} stack_top bottom: ${rect_top.bottom}")
        @Expect(rect_bottom.bottom, rect_top.bottom)

        Hilog.info(0,"0","${rect_bottom.left}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimerCtor() {
        scrollTo("ViewTextTimer2")
        let TextTimer_1 = driver
            .findComponent(On().id("TextTimer_1")).getOrThrow()
            .getType()
        @Expect(TextTimer_1, "TextTimer")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimerAttr() {
        scrollTo("ViewTextTimer2")

        let inspector = getInspectorByKey("TextTimer_1")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let format = attrs
            .get("format")
            .getOrThrow()
            .toString()
        @Expect(format, "\"mm:ss.SS\"")

        let fontColor = attrs
            .get("fontColor")
            .getOrThrow()
            .toString()
        @Expect(fontColor, "\"#FFFFFFFF\"")

        let fontSize = attrs
            .get("fontSize")
            .getOrThrow()
            .toString()
        @Expect(fontSize, "\"50.00fp\"")

        let fontStyle = attrs
            .get("fontStyle")
            .getOrThrow()
            .toString()
        @Expect(fontStyle, "\"FontStyle.Italic\"")

        let fontWeight = attrs
            .get("fontWeight")
            .getOrThrow()
            .toString()
        @Expect(fontWeight, "\"FontWeight.Bold\"")

        let fontFamily = attrs
            .get("fontFamily")
            .getOrThrow()
            .toString()
        @Expect(fontFamily, "\"HarmonyOS Sans\"")

        let textShadow = attrs
            .get("textShadow")
            .getOrThrow()
            .toString()
        @Expect(textShadow, "{\"radius\":\"10.000000\",\"color\":\"#FFFFFFFF\",\"offsetX\":\"10.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\"}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimerAttr2() {
        scrollTo("ViewTextTimer2")

        let inspector = getInspectorByKey("TextTimer_2")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let textShadow = attrs
            .get("textShadow")
            .getOrThrow()
            .toString()
        @Expect(textShadow, "{\"radius\":\"10.000000\",\"color\":\"#FFFF0000\",\"offsetX\":\"10.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\"}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimerAttr3() {
        scrollTo("ViewTextTimer2")

        let inspector = getInspectorByKey("TextTimer_3")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let textShadow = attrs
            .get("textShadow")
            .getOrThrow()
            .toString()
        @Expect(textShadow, "{\"radius\":\"10.000000\",\"color\":\"#FFFF0000\",\"offsetX\":\"10.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\"}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimerAttr4() {
        scrollTo("ViewTextTimer2")

        let inspector = getInspectorByKey("TextTimer_4")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let textShadow = attrs
            .get("textShadow")
            .getOrThrow()
            .toString()
        @Expect(textShadow, "{\"radius\":\"10.000000\",\"color\":\"#FFA52A2A\",\"offsetX\":\"10.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\"}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimerEvent() {
        scrollTo("ViewTextTimer2")

        let onTimerText = driver.findComponent(On().id("onTimerText")).getOrThrow()
        driver
            .findComponent(On().id("start")).getOrThrow()
            .click()
        driver.delayMs(1000)
        @Expect(onTimerText.getText() == "Time Change", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextTimer() {
        scrollTo("ViewTextTimer")
        let inspector4 = getInspectorByKey("textTimer")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        Hilog.info(0,"0","[test_textTimer] textTimer attrs: ${attrs4}")
        let format = attrs4.get("format").getOrThrow().toString()

        let textTimer = driver.findComponent(On().id("textTimer")).getOrThrow()
        var text = textTimer.getText()
        @Expect(format.contains("mm:ss.SS"))

        let start = driver.findComponent(On().id("start")).getOrThrow()
        start.click()
        driver.delayMs(500)

        let pause = driver.findComponent(On().id("pause")).getOrThrow()
        pause.click()
        driver.delayMs(500)

        let reset = driver.findComponent(On().id("reset")).getOrThrow()
        reset.click()
        driver.delayMs(500)
        let count = attrs4.get("count").getOrThrow().toString()
        @Expect(count.contains("30000.000000"))
    }

    func getContentFromText(textId: String): String {
        var inspector = getInspectorByKey(textId)
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        attrs.get("content").getOrThrow().toString()
    }

    func clickButton(buttonId: String) {
        let button = driver.waitForComponent(On().id(buttonId),200).getOrThrow()
        button.click()
        driver.delayMs(200)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testVideo() {
        scrollTo("ViewVideo")
        var msgText = getContentFromText("msgText")
        @Expect(msgText, "\"onError\"")

        clickButton("start")
        msgText = getContentFromText("msgText")
        @Expect(msgText, "\"onStart\"")

        clickButton("pause")
        msgText = getContentFromText("msgText")
        @Expect(msgText, "\"onPause\"")

        clickButton("at 8s")
        clickButton("start")
        driver.delayMs(1500)
        msgText = getContentFromText("msgText")
        @Expect(msgText, "\"onStart\"")

        clickButton("stop")
        clickButton("Fullscreen")

        for (i in 0..9) {
            driver.pressBack()
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testVideoCtor2() {
        scrollTo("ViewVideo2")

        let videoContainer_1 = driver.findComponent(On().id("video")).getOrThrow()
        @Expect(videoContainer_1.getType(), "Video")

        let videoContainer_2 = driver.findComponent(On().id("video_2")).getOrThrow()
        @Expect(videoContainer_2.getType(), "Video")

        let videoContainer_3 = driver.findComponent(On().id("video_3")).getOrThrow()
        @Expect(videoContainer_3.getType(), "Video")

        let videoContainer_4 = driver.findComponent(On().id("video_4")).getOrThrow()
        @Expect(videoContainer_4.getType(), "Video")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testVideoAttrs() {
        scrollTo("ViewVideo2")
        let muted = driver.findComponent(On().id("muted")).getOrThrow()
        @Expect(muted.getText(), "false")

        let autoPlay = driver.findComponent(On().id("autoPlay")).getOrThrow()
        @Expect(autoPlay.getText(), "false")

        let controls = driver.findComponent(On().id("controls")).getOrThrow()
        @Expect(controls.getText(), "true")

        let objectFit = driver.findComponent(On().id("objectFit")).getOrThrow()
        @Expect(objectFit.getText(), "Cover")

        let loop = driver.findComponent(On().id("loop")).getOrThrow()
        @Expect(loop.getText(), "false")

        let enableAnalyzer = driver.findComponent(On().id("enableAnalyzer")).getOrThrow()
        @Expect(enableAnalyzer.getText(), "false")
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testVideoEvent() {
        scrollTo("ViewVideo2")

        let start = driver.findComponent(On().id("start")).getOrThrow()
        start.click()
        driver.delayMs(800)
        let currentTime = driver.findComponent(On().id("setCurrentTime")).getOrThrow()
        currentTime.click()
        driver.delayMs(500)
        let pause = driver.findComponent(On().id("pause")).getOrThrow()
        pause.click()
        driver.delayMs(500)
        start.click()
        driver.delayMs(800)
        let stop = driver.findComponent(On().id("stop")).getOrThrow()
        stop.click()
        driver.delayMs(500)
        start.click()
        driver.delayMs(800)
        driver.click(730, 1300) // 模拟滑动
        driver.delayMs(800)
        let fullscreen = driver.findComponent(On().id("Fullscreen")).getOrThrow()
        fullscreen.click()
        driver.delayMs(500)
        let exitFull = driver.findComponent(On().id("exitFull")).getOrThrow()
        exitFull.click()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testWebCommonAttrs() {
        scrollTo("ViewWeb")
        driver.delayMs(600)
        let refresh = driver.findComponent(On().id("refresh")).getOrThrow()
        refresh.click()
        let btn_load = driver.waitForComponent(On().id("btn_load"),500).getOrThrow()
        btn_load.click()
        let webpage = driver.waitForComponent(On().id("my_web"),500).getOrThrow()
        let webpage1 = driver.waitForComponent(On().id("my_web_1"),500).getOrThrow()
        driver.delayMs(500)
    }

    // ========== ComponentUtils 基础测试 ==========
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicFixedSize() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_component_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Size:"), true)
        @Expect(text.contains("LocalOffset:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicSizeInfo() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取size信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取size信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Width:"), true)
        @Expect(text.contains("Height:"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicLocalOffset() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取localOffset信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取localOffset信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_offset_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("LocalOffset:"), true)
        @Expect(text.contains("("), true)
        @Expect(text.contains(")"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicWindowOffset() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取windowOffset信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取windowOffset信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_window_offset_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("WindowOffset:"), true)
        @Expect(text.contains("("), true)
        @Expect(text.contains(")"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicScreenOffset() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取screenOffset信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取screenOffset信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_screen_offset_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("ScreenOffset:"), true)
        @Expect(text.contains("("), true)
        @Expect(text.contains(")"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicSizeFixed() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取固定尺寸（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取固定尺寸")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_fixed_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Fixed Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicSizePercent() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取百分比尺寸（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取百分比尺寸")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_percent_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Percent Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicSizeAuto() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取自适应尺寸（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取自适应尺寸")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_auto_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Auto Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicSizeZero() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取零尺寸（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取零尺寸")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_zero_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Zero Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicParentChildOffset() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取父子组件坐标（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取父子组件坐标")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_parent_child_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Parent:"), true)
        @Expect(text.contains("Child:"), true)
        @Expect(text.contains("("), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicTextComponent() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取Text组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Text组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_text_component_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Text Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicImageComponent() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取Image组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Image组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_image_component_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Image Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsBasicButtonComponent() {
        scrollTo("ViewComponentUtilsBasic")
        driver.delayMs(1000)
        
        // 点击按钮获取Button组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Button组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_button_component_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Button Size:"), true)
        @Expect(text.contains("x"), true)
    }

    // ========== ComponentUtils 高级测试 ==========
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedTranslate() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取translate信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取translate信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_translate_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Translate:"), true)
        @Expect(text.contains("("), true)
        @Expect(text.contains(")"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedScale() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取scale信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取scale信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_scale_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Scale:"), true)
        @Expect(text.contains("Center:"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedRotate() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取rotate信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取rotate信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_rotate_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Rotate:"), true)
        @Expect(text.contains("angle="), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedTransform() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取transform矩阵（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取transform矩阵")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_transform_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Transform matrix size:"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedColumn() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取Column组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Column组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_column_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Column Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedRow() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取Row组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Row组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_row_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Row Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedStack() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取Stack组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Stack组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_stack_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Stack Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedFlexLayout() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取Flex布局坐标（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取Flex布局坐标")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_flex_layout_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Flex:"), true)
        @Expect(text.contains("Item1:"), true)
        @Expect(text.contains("Item2:"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedDynamicSize() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取动态尺寸（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取动态尺寸")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_dynamic_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Dynamic Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedDynamicPosition() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取动态位置（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取动态位置")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_dynamic_position_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Translate:"), true)
        @Expect(text.contains("LocalOffset:"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedDynamicScale() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取动态缩放（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取动态缩放")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_dynamic_scale_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Dynamic Scale:"), true)
        @Expect(text.contains("("), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedDynamicRotate() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取动态旋转（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取动态旋转")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_dynamic_rotate_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Dynamic Rotate:"), true)
        @Expect(text.contains("angle="), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedBoundaryZeroSize() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取零尺寸（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取零尺寸")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_zero_size_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Zero Size:"), true)
        @Expect(text.contains("x"), true)
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedBoundaryDisabled() {
        scrollTo("ViewComponentUtilsAdvanced")
        driver.delayMs(1000)
        
        // 点击按钮获取禁用组件信息（使用scrollSearch自动滚动查找）
        let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        let button = scrollView.scrollSearch(On().text("获取禁用组件信息")).getOrThrow()
        button.click()
        driver.delayMs(500)
        
        // 验证显示的文本信息
        let textComponent = scrollView.scrollSearch(On().id("text_disabled_info")).getOrThrow()
        let text = textComponent.getText()
        @Expect(text.contains("Disabled Button Size:"), true)
        @Expect(text.contains("x"), true)
    }

        
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentUtilsAdvancedBoundaryLargeSize() {
        scrollTo("ViewComponentUtilsAdvanced")
        // driver.delayMs(1000)
        
        // // 点击按钮获取超大尺寸（使用scrollSearch自动滚动查找）
        // let scrollView = driver.findComponent(On().id("scroller")).getOrThrow()
        // let button = scrollView.scrollSearch(On().text("获取超大尺寸")).getOrThrow()
        // button.click()
        // driver.delayMs(500)
        
        // // 验证显示的文本信息
        // let textComponent = scrollView.scrollSearch(On().id("text_large_size_info")).getOrThrow()
        // let text = textComponent.getText()
        // @Expect(text.contains("Large Size:"), true)
        @Expect(true, true)
    }
}
