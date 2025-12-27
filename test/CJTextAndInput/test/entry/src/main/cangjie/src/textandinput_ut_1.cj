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
import ohos.business_exception.*

protected func agreeXiaoYi(driver: Driver) {
    driver.delayMs(600)
    // 输入法弹窗同意点
    try{
        driver.findComponent(On().text("同意")).getOrThrow().click()
        Hilog.info(1,"Cangjie-Test", "[ViewSearch]: 输入法弹窗同意点 成功")
    }catch (e: Exception){
        Hilog.info(1,"Cangjie-Test", "[ViewSearch]: 输入法弹窗同意点 不存在")
    }
    driver.delayMs(1000)
    // 键盘布局同意点
    try{
        driver.findComponent(On().text("下一步")).getOrThrow().click()
        Hilog.info(1,"Cangjie-Test", "[ViewSearch]: 键盘布局同意点 成功")
    }catch (e: Exception){
        Hilog.info(1,"Cangjie-Test", "[ViewSearch]: 键盘布局同意点 不存在")
    }
    driver.delayMs(600)
}

@Test
class TextAndInputUT1 {
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
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
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
        let scrollBar = driver.waitForComponent(On().id("scroller"),500)

        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("TextAndInputIndex1"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    func click(buttonStr: String) {
        let button = driver.findComponent(On().text(buttonStr))
        button?.click()
        driver.delayMs(200)
        button?.click()
        driver.delayMs(200)
    }

    func scroll() {
        let scroll1 = driver.findComponent(On().id("Scroll1"))
        scroll1?.scrollToBottom(speed: 5000)
        driver.delayMs(100)
        scroll1?.scrollToTop(speed:5000)
        driver.delayMs(100)
        @Expect(scroll1?.getType(), "Scroll")
        let scroll2 = driver.findComponent(On().id("Scroll2"))
        scroll2?.scrollToBottom(speed:5000)
        driver.delayMs(100)
        scroll2?.scrollToTop(speed:5000)
        driver.delayMs(100)
        @Expect(scroll2?.getType(), "Scroll")
    }

    func scrollTabs() {
        let tbasBar = driver.findComponent(On().text("TabContent1-2"))
        tbasBar?.click()
        driver.delayMs(200)
        @Expect(tbasBar?.getType(), "Text")
        let tbasBar1 = driver.findComponent(On().text("TabContent1-3"))
        tbasBar1?.click()
        driver.delayMs(200)
        @Expect(tbasBar1?.getType(), "Text")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFont() {
        scrollTo("ViewFont")

        let button1 = driver.findComponent(On().id("registerFont1")).getOrThrow()
        button1.click()
        let check1 = driver.findComponent(On().id("message")).getOrThrow().getText()
        @Expect(check1, "1: Amiri")

        let button2 = driver.findComponent(On().id("registerFont2")).getOrThrow()
        button2.click()
        let check2 = driver.findComponent(On().id("message")).getOrThrow().getText()
        @Expect(check2, "1: SmileySans")

        let button3 = driver.findComponent(On().id("getFontByName-sysFontName")).getOrThrow()
        button3.click()
        let check3 = driver.findComponent(On().id("check")).getOrThrow().getText()
        @Expect(check3, "2: /system/fonts/HarmonyOS_Sans_Italic.ttf")

        let button4 = driver.findComponent(On().id("getFontByName-noSysFontName")).getOrThrow()
        button4.click()
        let check4 = driver.findComponent(On().id("check")).getOrThrow().getText()
        @Expect(check4, "2: no value")

        //let button5 = driver.findComponent(On().id("getUIFontConfig")).getOrThrow()
        //button5.click()
//        let message = driver.findComponent(On().id("message")).getOrThrow().getText()
//        @Expect(message, "1: /system/fonts/")

//        let message1 = driver.findComponent(On().id("message1")).getOrThrow().getText()
//        @Expect(message1, "3: HarmonyOS Sans")
//
//        let message2 = driver.findComponent(On().id("message2")).getOrThrow().getText()
//        @Expect(message2, "4: HarmonyOS-Sans")
//
//        let check5 = driver.findComponent(On().id("check2")).getOrThrow().getText()
//        @Expect(check5, "5: 0")
//
//        let message3 = driver.findComponent(On().id("message3")).getOrThrow().getText()
//        @Expect(message3, "6: 50")
//        let check6 = driver.findComponent(On().id("check3")).getOrThrow().getText()
//        @Expect(check6, "7: 100")
//
//        let message4 = driver.findComponent(On().id("message4")).getOrThrow().getText()
//        @Expect(message4, "8: ")
//
//        let message5 = driver.findComponent(On().id("message5")).getOrThrow().getText()
//        @Expect(message5, "9: und-Zsye")
//        let check7 = driver.findComponent(On().id("check5")).getOrThrow().getText()
//        @Expect(check7, "10: HMOS Color Emoji")

        let button6 = driver.findComponent(On().id("getFont")).getOrThrow()
        button6.click()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSpanInit() {
        scrollTo("ViewImageSpan")
        Hilog.error(1, "Cangjie-Test", "test_imagespaninit started")
        driver.delayMs(500)

        //init(CJResource)
        var inspector = getInspectorByKey("imagespan_test_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var typeInfo = jsonObject.get("$type").getOrThrow().asString()
        var src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "src1: " + src + "\n" + "type1: " + typeInfo.toString())
        @Expect(src.contains("resource:///"))
        @Expect(typeInfo.toString(), "\"Image\"")

        //init(PixelMap)
        inspector = getInspectorByKey("imagespan_test_2")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        typeInfo = jsonObject.get("$type").getOrThrow().asString()
        src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "src2: " + src + "\n" + "type2: " + typeInfo.toString())
        @Expect(src, "\"\"")
        @Expect(typeInfo.toString(), "\"Image\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSpanColorfilter() {
        scrollTo("ViewImageSpan")
        Hilog.error(1, "Cangjie-Test", "test_imageSpanColorfilter started")
        driver.delayMs(500)

        let value = "\"0.239000 0.000000 0.000000 0.000000 0.000000 " +
                                "0.000000 0.616000 0.000000 0.000000 0.000000 " +
                                "0.000000 0.000000 0.706000 0.000000 0.000000 " +
                               "0.000000 0.000000 0.000000 1.000000 0.000000 \""

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var colorFilter = attrs.get("colorFilter").getOrThrow().toString()
        @Expect(colorFilter, value)

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        colorFilter = attrs.get("colorFilter").getOrThrow().toString()
        @Expect(colorFilter, value)

    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSpanAlt() {
        scrollTo("ViewImageSpan")
        Hilog.error(1, "Cangjie-Test", "test_imageSpanAlt started")
        driver.delayMs(500)

        //alt(CJResource)
        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSpanObjectFit() {
        scrollTo("ViewImageSpan")
        Hilog.error(1, "Cangjie-Test", "test_imageSpanObjectfit started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var objectfit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "objectfit: " + objectfit)
        @Expect(objectfit, "\"ImageFit.Fill\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        objectfit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "objectfit: " + objectfit)
        @Expect(objectfit, "\"ImageFit.Fill\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSpanVerticalAlign() {
        scrollTo("ViewImageSpan")
        Hilog.error(1, "Cangjie-Test", "test_imageSpanVerticalAlign started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var verticalalign = attrs.get("verticalAlign").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "verticalalign: " + verticalalign)
        @Expect(verticalalign, "\"VerticalAlign.CENTER\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        verticalalign = attrs.get("verticalAlign").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "verticalalign: " + verticalalign)
        @Expect(verticalalign, "\"VerticalAlign.CENTER\"")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSpanEvent() {
        scrollTo("ViewImageSpan")
        Hilog.error(1, "Cangjie-Test", "test_imageSpanEvent started")

        let text_oncomplete = driver.waitForComponent(On().id("imagespan_width1"),2000)?.getText().toString()
        Hilog.info(1, "Cangjie-Test", "image_1_onComplete: " + text_oncomplete.getOrDefault({ => ""}))
        @Expect(text_oncomplete, "41.000000")

        let text_onerror = driver.findComponent(On().id("imagespan_width2"))?.getText().toString()
        Hilog.info(1, "Cangjie-Test", "image_1_onError: " + text_onerror.getOrDefault({ => ""}))
        @Expect(text_onerror, "41.000000")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSearch() {
        scrollTo("ViewSearch")

        let inspector = getInspectorByKey("searchComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let testWidth = attrs.get("width").getOrThrow().toString()
        @Expect(testWidth, "\"300.00vp\"")

        let testBackgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(testBackgroundColor, "\"#0C000000\"")

        let searchItem = driver.findComponent(On().id("searchComponent")).getOrThrow()
        searchItem.inputText("changeString")

        // 输入法弹窗同意点
        agreeXiaoYi(driver)


        // 光标位置为 3
        let button4 = driver.waitForComponent(On().id("caretPosition"),500).getOrThrow()
        button4.click()

        driver.delayMs(500)
        // CaretPosition
//        let inspector3 = getInspectorByKey("Search?Position")
//        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
//        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
//        let attrs3Text = attrs3.get("content").getOrThrow().toString()
//        @Expect(attrs3Text,'"caretPosition 3"')


        let button5 = driver.waitForComponent(On().id("setSelection"),500).getOrThrow()
        button5.click()

//        driver.delayMs(500)
//        let inspector4 = getInspectorByKey("Search?Selection")
//        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
//        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
//        let attrs4Text = attrs4.get("content").getOrThrow().toString()
//        @Expect(attrs4Text,'"Selection 6-12"')

        driver.delayMs(500)

        // 开始/停止编辑
        searchItem.click()

//        let inspector5 = getInspectorByKey("Search?Editing")
//        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
//        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
//        let attrs5Text = attrs5.get("content").getOrThrow().toString()
//        @Expect(attrs5Text,'"Editing true"')



        let button6 = driver.waitForComponent(On().id("stopEditing"),500).getOrThrow()
        button6.click()

        driver.delayMs(500)
        let inspector6 = getInspectorByKey("Search?Editing")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        let attrs6Text = attrs6.get("content").getOrThrow().toString()
        @Expect(attrs6Text,'"Editing false"')

        // 滚动 clearText好像没用到 clear
        searchItem.clearText()
        driver.delayMs(1000)
        searchItem.inputText("TextSelectionChange ContentScroll 012345678901234567890123456789")
        driver.delayMs(1000)

//        let otherInspector = getInspectorByKey("MyText")
//        let otherJsonObject = JsonValue.fromStr(otherInspector).asObject()
//        let otherContent = otherJsonObject.get("$attrs").getOrThrow().asObject()
//        let finalContent = otherContent.get("content")
//        let optionContent = finalContent.getOrThrow()
//        let maxContent = optionContent.toString()
        driver.delayMs(700)
        searchItem.clearText()
        driver.pressBack() // 否则执行完search testcase会闪退
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRicheditor() {
        scrollTo("ViewRichEditor")
        driver.delayMs(800)
        let addTextSpan1 = driver.findComponent(On().id("addTextSpan1")).getOrThrow()
        addTextSpan1.click()
        let getInfo = driver.findComponent(On().id("getInfo")).getOrThrow()
        getInfo.click()
        let getCaretOffset = driver.findComponent(On().id("getCaretOffset")).getOrThrow()
        getCaretOffset.click()
        let addTextSpan2 = driver.findComponent(On().id("addTextSpan2")).getOrThrow()
        addTextSpan2.click()
        let RichEditor01DelSpans = driver.findComponent(On().id("RichEditor01DelSpans")).getOrThrow()
        RichEditor01DelSpans.click()
        let setCaretOffset01 = driver.findComponent(On().id("setCaretOffset01")).getOrThrow()
        setCaretOffset01.click()
        let setCaretOffset02 = driver.findComponent(On().id("setCaretOffset02")).getOrThrow()
        setCaretOffset02.click()
        let addTextSpan3 = driver.findComponent(On().id("addTextSpan3")).getOrThrow()
        addTextSpan3.click()
        let addTextSpan4 = driver.findComponent(On().id("addTextSpan4")).getOrThrow()
        addTextSpan4.click()
        let getSpans = driver.findComponent(On().id("getSpans")).getOrThrow()
        let spans = getSpans.getType()
        @Expect(spans, "Button")
        let text = getSpans.getText()
        @Expect(text, "getSpans")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRicheditor2() {
        scrollTo("ViewRichEditor")
        driver.delayMs(800)
        let richEditor = driver.findComponent(On().id("RichEditorKey")).getOrThrow()
        Hilog.info(1,"Cangjie-Test", "test_richeditor2  richEditor.click 3000")
        richEditor.click()
        driver.delayMs(1500)

        // 获取输入框imageSpans
        let getImages = driver.waitForComponent(On().id("getSpans"),500).getOrThrow()
        getImages.click()

        // 输入法弹窗同意点
        Hilog.info(1,"Cangjie-Test", "test_richeditor2  click.输入法弹窗同意点")
        driver.click(966, 2502)
        driver.delayMs(1200)
        // 键盘布局同意点
        driver.click(615, 2490)
        richEditor.clearText()
        driver.delayMs(600)

        richEditor.inputText("abcjiushi")
        driver.delayMs(500)
        richEditor.clearText()

        // getSpan Test case: span size == 0
        let emptySpan = driver.waitForComponent(On().id("getEmptySpan"),500).getOrThrow()
        emptySpan.click()
        driver.delayMs(500)

        richEditor.inputText("success")
        driver.delayMs(500)

        richEditor.longClick()
        let menu: Component = driver.waitForComponent(On().text("全选"), 1000).getOrThrow()

        menu.click()
        let menu1: Component = driver.waitForComponent(On().text("复制"), 500).getOrThrow()
        menu1.click()
        driver.delayMs(500)

        richEditor.longClick()
        let menu2: Component = driver.waitForComponent(On().text("粘贴"), 600).getOrThrow()
        menu2.click()

        let GET = driver.waitForComponent(On().id("getSpans"),500).getOrThrow()
        GET.click()
        let RichEditor01GetSpans = driver.findComponent(On().id("RichEditor01GetSpans")).getOrThrow()
        RichEditor01GetSpans.click()
        driver.pressBack() // 需要多回退一次，否则执行完testcase会闪退
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRichText1() {
        scrollTo("ViewRichText")
        driver.delayMs(800)
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "richtext_attr:\t ${attrs.getFields()}")

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"500.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"400.00vp\"")
        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor, "\"#FFBDDB69\"")
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRichText2() {
        driver.delayMs(1000)
        scrollTo("ViewRichText")
        driver.delayMs(800)
        let inspector = getInspectorByKey("component_2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let layoutWeight = attrs.get("layoutWeight").getOrThrow().toString()
        @Expect(layoutWeight, "1")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSpanCommonAttrs() {
        scrollTo("ViewSpan")

        let spanComponent2 = driver.findComponent(On().id("spanComponent2"))
        spanComponent2?.click()
        spanComponent2?.click()
        driver.delayMs(200)
    }
}