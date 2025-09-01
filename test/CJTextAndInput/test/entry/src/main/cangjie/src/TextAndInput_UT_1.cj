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
        get() {
            OpenHarmonyTestRunner.driver
        }
    }
    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "1", "Cangjie-Test", "ScrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "1", "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500)

        Hilog.error(1, "1", "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("TextAndInput_UT1"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_hyperlink() {
        ScrollTo("View_Hyperlink")

        let link1 = getInspectorByKey("default")
        let link1JsonObject = JsonValue.fromStr(link1).asObject()
        let link1Attrs = link1JsonObject.get("$attrs").getOrThrow().asObject()
        let link1Content = link1Attrs.get("content").getOrThrow().toString()
        let link1Address = link1Attrs.get("address").getOrThrow().toString()
        let link1Color = link1Attrs.get("color").getOrThrow().toString()
        @Expect(link1Content, "\"https://www.baidu.com/\"")
        @Expect(link1Address, "\"https://www.baidu.com/\"")
        @Expect(link1Color, "\"#FF0A59F7\"")

        let link2 = getInspectorByKey("contentString")
        let link2JsonObject = JsonValue.fromStr(link2).asObject()
        let link2Attrs = link2JsonObject.get("$attrs").getOrThrow().asObject()
        let link2Content = link2Attrs.get("content").getOrThrow().toString()
        let link2Address = link2Attrs.get("address").getOrThrow().toString()
        let link2Color = link2Attrs.get("color").getOrThrow().toString()
        @Expect(link2Content, "\"jump to cangjie\"")
        @Expect(link2Address, "\"https://www.baidu.com/\"")
        @Expect(link2Color, "\"#FF0A59F7\"")

        let link3 = getInspectorByKey("blueColor")
        let link3JsonObject = JsonValue.fromStr(link3).asObject()
        let link3Attrs = link3JsonObject.get("$attrs").getOrThrow().asObject()
        let link3Content = link3Attrs.get("content").getOrThrow().toString()
        let link3Address = link3Attrs.get("address").getOrThrow().toString()
        let link3Color = link3Attrs.get("color").getOrThrow().toString()
        @Expect(link3Content, "\"jump to cangjie\"")
        @Expect(link3Address, "\"https://www.baidu.com\"")
        @Expect(link3Color, "\"#FF008000\"")

        let link4 = getInspectorByKey("redColor")
        let link4JsonObject = JsonValue.fromStr(link4).asObject()
        let link4Attrs = link4JsonObject.get("$attrs").getOrThrow().asObject()
        let link4Content = link4Attrs.get("content").getOrThrow().toString()
        let link4Address = link4Attrs.get("address").getOrThrow().toString()
        let link4Color = link4Attrs.get("color").getOrThrow().toString()
        @Expect(link4Content, "\"eee\"")
        @Expect(link4Address, "\"https://www.baidu.com/\"")
        @Expect(link4Color, "\"#FFFF0000\"")

        let link5 = getInspectorByKey("bule2Color")
        let link5JsonObject = JsonValue.fromStr(link5).asObject()
        let link5Attrs = link5JsonObject.get("$attrs").getOrThrow().asObject()
        let link5Content = link5Attrs.get("content").getOrThrow().toString()
        let link5Address = link5Attrs.get("address").getOrThrow().toString()
        let link5Color = link5Attrs.get("color").getOrThrow().toString()
        @Expect(link5Content, "\"eee\"")
        @Expect(link5Address, "\"https://www.baidu.com\"")
        @Expect(link5Color, "\"#FF4ECF73\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_hyperlink2() {
        ScrollTo("View_Hyperlink2")
        let button_1 = driver.findComponent(On().id("hyperlink"))
        let hyperlink = button_1?.getType()
        @Expect(hyperlink, "Hyperlink")
    }
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanDefaultAttrs() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanDefaultAttrs started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        var objectFit = attrs.get("objectFit").getOrThrow().toString()
        @Expect(objectFit, "\"ImageFit.Cover\"")

        var verticalAlign = attrs.get("verticalAlign").getOrThrow().toString()
        @Expect(verticalAlign, "\"VerticalAlign.BOTTOM\"")

        var alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")

        var textBackgroundStyle = attrs.get("textBackgroundStyle").getOrThrow().toString()
        @Expect(textBackgroundStyle, "{\"color\":\"#00000000\",\"radius\":{\"topLeft\":\"0.00vp\",\"topRight\":\"0.00vp\",\"bottomLeft\":\"0.00vp\",\"bottomRight\":\"0.00vp\"}}")

        var colorfilter = attrs.get("colorFilter").getOrThrow().toString()
        @Expect(colorfilter, "\"\"")

        inspector = getInspectorByKey("imagespan_test_2")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        objectFit = attrs.get("objectFit").getOrThrow().toString()
        @Expect(objectFit, "\"ImageFit.Cover\"")

        verticalAlign = attrs.get("verticalAlign").getOrThrow().toString()
        @Expect(verticalAlign, "\"VerticalAlign.BOTTOM\"")

        alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")

        textBackgroundStyle = attrs.get("textBackgroundStyle").getOrThrow().toString()
        @Expect(textBackgroundStyle,  "{\"color\":\"#00000000\",\"radius\":{\"topLeft\":\"0.00vp\",\"topRight\":\"0.00vp\",\"bottomLeft\":\"0.00vp\",\"bottomRight\":\"0.00vp\"}}")

        colorfilter = attrs.get("colorFilter").getOrThrow().toString()
        @Expect(colorfilter, "\"\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanInit() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imagespaninit started")
        driver.delayMs(500)

        //init(CJResource)
        var inspector = getInspectorByKey("imagespan_test_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var typeInfo = jsonObject.get("$type").getOrThrow().asString()
        var src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "src1: " + src + "\n" + "type1: " + typeInfo.toString())
        @Expect(src.contains("resource:///"))
        @Expect(typeInfo.toString(), "\"Image\"")

        //init(PixelMap)
        inspector = getInspectorByKey("imagespan_test_2")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        typeInfo = jsonObject.get("$type").getOrThrow().asString()
        src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "src2: " + src + "\n" + "type2: " + typeInfo.toString())
        @Expect(src, "\"\"")
        @Expect(typeInfo.toString(), "\"Image\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanColorfilter() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanColorfilter started")
        driver.delayMs(500)

        let value = "\"0.239000 0.000000 0.000000 0.000000 0.000000 " + "0.000000 0.616000 0.000000 0.000000 0.000000 " +
            "0.000000 0.000000 0.706000 0.000000 0.000000 " + "0.000000 0.000000 0.000000 1.000000 0.000000 \""

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
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanAlt started")
        driver.delayMs(500)

        //alt(CJResource)
        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "alt: " + alt)
        @Expect(alt, "\"\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanObjectFit() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanObjectfit started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var objectfit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "objectfit: " + objectfit)
        @Expect(objectfit, "\"ImageFit.Fill\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        objectfit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "objectfit: " + objectfit)
        @Expect(objectfit, "\"ImageFit.Fill\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanVerticalAlign() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanVerticalAlign started")
        driver.delayMs(500)

        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var verticalalign = attrs.get("verticalAlign").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "verticalalign: " + verticalalign)
        @Expect(verticalalign, "\"VerticalAlign.CENTER\"")

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        verticalalign = attrs.get("verticalAlign").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "verticalalign: " + verticalalign)
        @Expect(verticalalign, "\"VerticalAlign.CENTER\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanTextBackGroundStyle() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanTextBackGronuStyle started")
        driver.delayMs(500)

        let value = "{\"color\":\"#FFFF0000\",\"radius\":\"5.00vp\"}"
        var inspector = getInspectorByKey("imagespan_test_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var textBackgroundStyle = attrs.get("textBackgroundStyle").getOrThrow().toString()
        @Expect(textBackgroundStyle,value)

        inspector = getInspectorByKey("imagespan_test_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        textBackgroundStyle = attrs.get("textBackgroundStyle").getOrThrow().toString()
        @Expect(textBackgroundStyle,value)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_imageSpanEvent() {
        ScrollTo("View_ImageSpan")
        Hilog.error(1, "1", "Cangjie-Test", "test_imageSpanEvent started")

        let text_oncomplete = driver.waitForComponent(On().id("imagespan_width1"), 2000)?.getText().toString()
        Hilog.info(1, "1", "Cangjie-Test", "image_1_onComplete: " + text_oncomplete.getOrDefault({=> ""}))
        @Expect(text_oncomplete, "41.000000")

        let text_onerror = driver.findComponent(On().id("imagespan_width2"))?.getText().toString()
        Hilog.info(1, "1", "Cangjie-Test", "image_1_onError: " + text_onerror.getOrDefault({=> ""}))
        @Expect(text_onerror, "41.000000")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_measuretext() {
        ScrollTo("View_Measure")
        let Text1 = driver.findComponent(On().id("text1"))
        let text1 = Text1?.getText()
        @Expect(text1, "hello world 2.000000")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_measuretextSize() {
        ScrollTo("View_Measure")
        let Text2 = driver.findComponent(On().id("text2"))
        let text2 = Text2?.getText()
        @Expect(text2, "Hello World 100.000000 20.000000")
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
        scroll1?.scrollToTop(speed: 5000)
        driver.delayMs(100)
        @Expect(scroll1?.getType(), "Scroll")
        let scroll2 = driver.findComponent(On().id("Scroll2"))
        scroll2?.scrollToBottom(speed: 5000)
        driver.delayMs(100)
        scroll2?.scrollToTop(speed: 5000)
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
    func test_richeditor() {
        ScrollTo("View_RichEditor")
        let addTextSpan1 = driver.findComponent(On().id("addTextSpan1"))
        addTextSpan1?.click()
        let getInfo = driver.findComponent(On().id("getInfo"))
        getInfo?.click()
        let getCaretOffset = driver.findComponent(On().id("getCaretOffset"))
        getCaretOffset?.click()
        let addTextSpan2 = driver.findComponent(On().id("addTextSpan2"))
        addTextSpan2?.click()
        let RichEditor01DelSpans = driver.findComponent(On().id("RichEditor01DelSpans"))
        RichEditor01DelSpans?.click()
        let setCaretOffset01 = driver.findComponent(On().id("setCaretOffset01"))
        setCaretOffset01?.click()
        let setCaretOffset02 = driver.findComponent(On().id("setCaretOffset02"))
        setCaretOffset02?.click()
        let addTextSpan3 = driver.findComponent(On().id("addTextSpan3"))
        addTextSpan3?.click()
        let addTextSpan4 = driver.findComponent(On().id("addTextSpan4"))
        addTextSpan4?.click()
        let getSpans = driver.findComponent(On().id("getSpans"))
        let spans = getSpans?.getType()
        @Expect(spans, "Button")
        let text = getSpans?.getText()
        @Expect(text, "getSpans")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_richeditor2() {
        ScrollTo("View_RichEditor")
        let richEditor = driver.findComponent(On().id("RichEditorKey"))
        Hilog.info(1, "1", "Cangjie-Test", "test_richeditor2  richEditor.click 3000")
        richEditor?.click()
        driver.delayMs(1500)

        // 输入法弹窗同意点
        Hilog.info(1, "1", "Cangjie-Test", "test_richeditor2  click.输入法弹窗同意点")
        driver.click(966, 2502)
        driver.delayMs(1200)
        // 键盘布局同意点
        driver.click(615, 2490)
        driver.delayMs(600)

        richEditor?.inputText("abcjiushi")
        driver.delayMs(500)
        richEditor?.clearText()
        driver.delayMs(500)
        richEditor?.inputText("success")
        driver.delayMs(500)

        richEditor?.longClick()
        let menu: Component = driver.waitForComponent(On().text("全选"), 1000).getOrThrow()

        menu.click()
        let menu1: Component = driver.waitForComponent(On().text("复制"), 500).getOrThrow()
        menu1.click()
        driver.delayMs(500)

        richEditor?.longClick()
        let menu2: Component = driver.waitForComponent(On().text("粘贴"), 600).getOrThrow()
        menu2.click()

        let GET = driver.waitForComponent(On().id("getSpans"), 500)
        GET?.click()
        let RichEditor01GetSpans = driver.findComponent(On().id("RichEditor01GetSpans"))
        RichEditor01GetSpans?.click()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RichText_1() {
        ScrollTo("View_RichText")
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "1", "Cangjie-Test", "richtext_attr:\t ${attrs.getFields()}")

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
    func test_search_enhance() {
        ScrollTo("View_Search_Enhance")
        // 默认值测试
        let inspector = getInspectorByKey("SearchDefault")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrsDefault = jsonObject.get("$attrs").getOrThrow().asObject()
        let maxFontSize = attrsDefault.get("maxFontSize").getOrThrow().toString()
        @Expect(maxFontSize, "\"0.00px\"")
        let minFontSize = attrsDefault.get("minFontSize").getOrThrow().toString()
        @Expect(minFontSize, "\"0.00px\"")
        let enablePreviewText = attrsDefault.get("enablePreviewText").getOrThrow().toString()
        @Expect(enablePreviewText, "true")
        let decoration = attrsDefault.get("decoration").getOrThrow().toString().replace("\\", "")
        @Expect(decoration, '"{\"type\":\"TextDecorationType.None\",\"color\":\"#FF000000\",\"style\":\"TextDecorationStyle.SOLID\"}"')
        let typeValue = attrsDefault.get("type").getOrThrow().toString()
        @Expect(typeValue, "\"SearchType.NORMAL\"")
        let textAligin = attrsDefault.get("align").getOrThrow().toString()
        @Expect(textAligin, '"Alignment.Center"')
        let fontColor = attrsDefault.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, '"#E5000000"')
        @Expect(attrsDefault.get("caretStyle").getOrThrow().toString().replace("\\", ""),
            '{\"color\":\"#FF0A59F7\",\"width\":\"2.00vp\"}')
        @Expect(attrsDefault.get("cancelButton").getOrThrow().toString().replace("\\", ""),
            '{"style":"CancelButtonStyle.INPUT","icon":{"size":"52.00px","color":"[#99000000,]","src":983126}}')
        @Expect(attrsDefault.get("textIndent").getOrThrow().toString(), '"0.00vp"')
        let searchIcon = attrsDefault.get("searchIcon").getOrThrow().toString().replace("\\", "")
        @Expect(searchIcon, '{"size":"52.00px","color":"[#99000000,]","src":983081}')
        @Expect(attrsDefault.get("lineHeight").getOrThrow().toString(), '"0.00vp"')
        @Expect(attrsDefault.get("letterSpacing").getOrThrow().toString(), '"0.00px"')
        @Expect(attrsDefault.get("selectedBackgroundColor").getOrThrow().toString(), '"#FF000000"')
        @Expect(attrsDefault.get("inputFilter").getOrThrow().toString(), '""')
        @Expect(attrsDefault.get("maxLength").getOrThrow().toString(), '"INF"')

        // 非默认值场景
        let inspector1 = getInspectorByKey("Search1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        for (attr in attrs1.asObject().getFields().keys()) {
            Hilog.info(1, "1", "Cangjie-Test", "ty test ${attr}: ${attrs1.asObject().getFields().get(attr)}")
        }
        @Expect(attrs1.get("maxFontSize").getOrThrow().toString(), "\"40.00vp\"")
        @Expect(attrs1.get("minFontSize").getOrThrow().toString(), "\"4.00vp\"")
        @Expect(attrs1.get("enablePreviewText").getOrThrow().toString(), "false")
        let decoration1 = attrs1.get("decoration").getOrThrow().toString().replace("\\", "")
        @Expect(decoration1, '"{\"type\":\"TextDecorationType.Overline\",\"color\":\"#FF0000FF\",\"style\":\"TextDecorationStyle.DOUBLE\"}"')
        @Expect(attrs1.get("type").getOrThrow().toString(), "\"SearchType.NUMBER\"")
        @Expect(attrs1.get("align").getOrThrow().toString(), '"Alignment.Center"')
        @Expect(attrs1.get("fontColor").getOrThrow().toString(), '"#FF0000FF"')
        @Expect(attrs1.get("caretStyle").getOrThrow().toString().replace("\\", ""),
            '{"color":"#FF008000","width":"5.00vp"}')
        @Expect(attrs1.get("textIndent").getOrThrow().toString(), '"30.00vp"')
        @Expect(attrs1.get("lineHeight").getOrThrow().toString(), '"30.00vp"')
        @Expect(attrs1.get("letterSpacing").getOrThrow().toString(), '"3.00vp"')
        @Expect(attrs1.get("selectedBackgroundColor").getOrThrow().toString(), '"#5FC0C0C0"')
        @Expect(attrs1.get("inputFilter").getOrThrow().toString(), '"[A-Za-z0-9]"')
        @Expect(attrs1.get("maxLength").getOrThrow().toString(), '"30"')
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_spanCommonAttrs() {
        ScrollTo("View_Span")

        let inspector = getInspectorByKey("spanComponent")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let decoration = attrs.get("decoration").getOrThrow().toString()
        @Expect(decoration.contains("TextDecorationType.None"))

        let textCase = attrs.get("textCase").getOrThrow().toString()
        @Expect(textCase, "\"TextCase.Normal\"")

        let letterSpacing = attrs.get("letterSpacing").getOrThrow().toString()
        @Expect(letterSpacing, "\"1.00vp\"")

        let lineHeight = attrs.get("lineHeight").getOrThrow().toString()
        @Expect(lineHeight, "\"10.00vp\"")

        let textBackgroundStyle = attrs.get("textBackgroundStyle").getOrThrow().toString()
        @Expect(textBackgroundStyle.contains("#FFFF0000"))

        let baselineOffset = attrs.get("baselineOffset").getOrThrow().toString()
        @Expect(baselineOffset, "\"10.00vp\"")

        let textShadow = attrs.get("textShadow").getOrThrow().toString()
        @Expect(textShadow.contains("FF000000"))
        @Expect(textShadow.contains("3.0"))

        let font = attrs.get("font").getOrThrow().toString()
        @Expect(font.contains("FontStyle.Italic"))
        @Expect(font.contains("FontWeight.Bolder"))

        let spanComponent2 = driver.findComponent(On().id("spanComponent2"))
        spanComponent2?.click()
        spanComponent2?.click()
        driver.delayMs(200)
    }
}
