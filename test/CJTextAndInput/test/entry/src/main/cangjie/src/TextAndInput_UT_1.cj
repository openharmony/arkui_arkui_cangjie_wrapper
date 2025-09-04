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
import ohos.business_exception.*

@Test
class TextAndInput_UT_1 {
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
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
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
        let scrollBar = driver.waitForComponent(On().id("scroller"),500)

        Hilog.error(1,"1","Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("TextAndInput_UT1"))?.click()
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
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanInit() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1,"1","Cangjie-Test", "test_imagespaninit started")
        driver.delayMs(500)

        //init(CJResource)
        var inspector = getInspectorByKey("imagespan_test_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var typeInfo = jsonObject.get("$type").getOrThrow().asString()
        var src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "src1: " + src + "\n" + "type1: " + typeInfo.toString())
        @Expect(src.contains("resource:///"))
        @Expect(typeInfo.toString(), "\"Image\"")

        //init(PixelMap)
        inspector = getInspectorByKey("imagespan_test_2")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        typeInfo = jsonObject.get("$type").getOrThrow().asString()
        src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "src2: " + src + "\n" + "type2: " + typeInfo.toString())
        @Expect(src, "\"\"")
        @Expect(typeInfo.toString(), "\"Image\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanColorfilter() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1,"1","Cangjie-Test", "test_imageSpanColorfilter started")
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
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanAlt() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1,"1","Cangjie-Test", "test_imageSpanAlt started")
        driver.delayMs(500)

        //alt(CJResource)
        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanObjectFit() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1,"1","Cangjie-Test", "test_imageSpanObjectfit started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var objectfit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "objectfit: " + objectfit)
        @Expect(objectfit, "\"ImageFit.Fill\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        objectfit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "objectfit: " + objectfit)
        @Expect(objectfit, "\"ImageFit.Fill\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanVerticalAlign() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1,"1","Cangjie-Test", "test_imageSpanVerticalAlign started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var verticalalign = attrs.get("verticalAlign").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "verticalalign: " + verticalalign)
        @Expect(verticalalign, "\"VerticalAlign.CENTER\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        verticalalign = attrs.get("verticalAlign").getOrThrow().toString()
        Hilog.info(1,"1","Cangjie-Test", "verticalalign: " + verticalalign)
        @Expect(verticalalign, "\"VerticalAlign.CENTER\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanEvent() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1,"1","Cangjie-Test", "test_imageSpanEvent started")

        let text_oncomplete = driver.waitForComponent(On().id("imagespan_width1"),2000)?.getText().toString()
        Hilog.info(1,"1","Cangjie-Test", "image_1_onComplete: " + text_oncomplete.getOrDefault({ => ""}))
        @Expect(text_oncomplete, "41.000000")

        let text_onerror = driver.findComponent(On().id("imagespan_width2"))?.getText().toString()
        Hilog.info(1,"1","Cangjie-Test", "image_1_onError: " + text_onerror.getOrDefault({ => ""}))
        @Expect(text_onerror, "41.000000")
    }

//    @TestCase
//    @Tag[APILevel12, TestLevel0]
//    func test_richeditor() {
//        ScrollTo("View_RichEditor")
//        let addTextSpan1 = driver.findComponent(On().id("addTextSpan1"))
//        addTextSpan1?.click()
//        let getInfo = driver.findComponent(On().id("getInfo"))
//        getInfo?.click()
//        let getCaretOffset = driver.findComponent(On().id("getCaretOffset"))
//        getCaretOffset?.click()
//        let addTextSpan2 = driver.findComponent(On().id("addTextSpan2"))
//        addTextSpan2?.click()
//        let RichEditor01DelSpans = driver.findComponent(On().id("RichEditor01DelSpans")).getOrThrow()
//        RichEditor01DelSpans?.click()
//        let setCaretOffset01 = driver.findComponent(On().id("setCaretOffset01"))
//        setCaretOffset01?.click()
//        let setCaretOffset02 = driver.findComponent(On().id("setCaretOffset02"))
//        setCaretOffset02?.click()
//        let addTextSpan3 = driver.findComponent(On().id("addTextSpan3"))
//        addTextSpan3?.click()
//        let addTextSpan4 = driver.findComponent(On().id("addTextSpan4"))
//        addTextSpan4?.click()
//        let getSpans = driver.findComponent(On().id("getSpans")).getOrThrow()
//        let spans = getSpans?.getType()
//        @Expect(spans, "Button")
//        let text = getSpans?.getText()
//        @Expect(text, "getSpans")
//    }
//
//    @TestCase
//    @Tag[APILevel12, TestLevel0]
//    func test_richeditor2() {
//        ScrollTo("View_RichEditor")
//        let richEditor = driver.findComponent(On().id("RichEditorKey")).getOrThrow()
//        Hilog.info(1,"1","Cangjie-Test", "test_richeditor2  richEditor.click 3000")
//        richEditor?.click()
//        driver.delayMs(1500)
//
//        // 输入法弹窗同意点
//        Hilog.info(1,"1","Cangjie-Test", "test_richeditor2  click.输入法弹窗同意点")
//        driver.click(966, 2502)
//        driver.delayMs(1200)
//        // 键盘布局同意点
//        driver.click(615, 2490)
//        driver.delayMs(600)
//
//        richEditor?.inputText("abcjiushi")
//        driver.delayMs(500)
//        richEditor?.clearText()
//        driver.delayMs(500)
//        richEditor?.inputText("success")
//        driver.delayMs(500)
//
//        richEditor?.longClick()
//        let menu: Component = driver.waitForComponent(On().text("全选"), 1000).getOrThrow()
//
//        menu.click()
//        let menu1: Component = driver.waitForComponent(On().text("复制"), 500).getOrThrow()
//        menu1.click()
//        driver.delayMs(500)
//
//        richEditor?.longClick()
//        let menu2: Component = driver.waitForComponent(On().text("粘贴"), 600).getOrThrow()
//        menu2.click()
//
//        let GET = driver.waitForComponent(On().id("getSpans"),500)
//        GET?.click()
//        let RichEditor01GetSpans = driver.findComponent(On().id("RichEditor01GetSpans")).getOrThrow()
//        RichEditor01GetSpans?.click()
//    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RichText_1() {
        ScrollTo("View_RichText")
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"1","Cangjie-Test", "richtext_attr:\t ${attrs.getFields()}")

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"500.00vp\"")
        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"400.00vp\"")
        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor, "\"#FFBDDB69\"")
        driver.delayMs(2000)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RichText_2() {
        driver.delayMs(1000)
        ScrollTo("View_RichText")
        let inspector = getInspectorByKey("component_2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let layoutWeight = attrs.get("layoutWeight").getOrThrow().toString()
        @Expect(layoutWeight, "1")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_spanCommonAttrs() {
        ScrollTo("View_Span")

        let spanComponent2 = driver.findComponent(On().id("spanComponent2"))
        spanComponent2?.click()
        spanComponent2?.click()
        driver.delayMs(200)
    }
}