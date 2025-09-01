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
class TextAndInput_UT_2 {
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
        scrollBar?.scrollSearch(On().id("TextAndInput_UT2"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_symbolGlyphCommonAttrs() {
        ScrollTo("View_SymbolGlyph")

        let inspector = getInspectorByKey("my_symbol")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, '"96.00fp"')

        let fontWeight = attrs.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight, '"100"')

        let effectStrategy = attrs.get("effectStrategy").getOrThrow().toString()
        @Expect(effectStrategy, '"SymbolEffectStrategy.SCALE"')

        let renderingStrategy0 = attrs.get("renderingStrategy").getOrThrow().toString()
        @Expect(renderingStrategy0, '"SymbolRenderingStrategy.MULTIPLE_OPACITY"')

        let inspector2 = getInspectorByKey("my_symbol2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let renderingStrategy = attrs2.get("renderingStrategy").getOrThrow().toString()
        @Expect(renderingStrategy, '"SymbolRenderingStrategy.MULTIPLE_COLOR"')

        let symbolEffect2 = attrs2.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect2, '"{\\"effectType\\":1,\\"scopeType\\":1,\\"commonSubType\\":1,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector3 = getInspectorByKey("my_symbol3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let symbolEffect3 = attrs3.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect3, '"{\\"effectType\\":2,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":1,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector4 = getInspectorByKey("my_symbol4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let symbolEffect4 = attrs4.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect4, '"{\\"effectType\\":3,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector5 = getInspectorByKey("my_symbol5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()

        let symbolEffect5 = attrs5.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect5, '"{\\"effectType\\":4,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector6 = getInspectorByKey("my_symbol6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()

        let symbolEffect6 = attrs6.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect6, '"{\\"effectType\\":5,\\"scopeType\\":0,\\"commonSubType\\":1,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector7 = getInspectorByKey("my_symbol7")
        let jsonObject7 = JsonValue.fromStr(inspector7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()

        let symbolEffect7 = attrs7.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect7, '"{\\"effectType\\":6,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector8 = getInspectorByKey("my_symbol8")
        let jsonObject8 = JsonValue.fromStr(inspector8).asObject()
        let attrs8 = jsonObject8.get("$attrs").getOrThrow().asObject()

        let symbolEffect8 = attrs8.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect8, '"{\\"effectType\\":7,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        //默认值
        let inspector9 = getInspectorByKey("my_symbol9")
        let jsonObject9 = JsonValue.fromStr(inspector9).asObject()
        let attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()

        let fontSize9 = attrs9.get("fontSize").getOrThrow().toString()
        @Expect(fontSize9, '"16.00fp"')

        let fontWeight9 = attrs9.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight9, '"FontWeight.Normal"')

        let effectStrategy9 = attrs9.get("effectStrategy").getOrThrow().toString()
        @Expect(effectStrategy9, '"SymbolEffectStrategy.NONE"')

        let renderingStrategy9 = attrs9.get("renderingStrategy").getOrThrow().toString()
        @Expect(renderingStrategy9, '"SymbolRenderingStrategy.SINGLE"')

        let symbolEffect9 = attrs9.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect9, '"{\\"effectType\\":0,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":0,\\"isTxtActive\\":false}"')

        let inspector10 = getInspectorByKey("my_symbol10")
        let jsonObject10 = JsonValue.fromStr(inspector10).asObject()
        let attrs10 = jsonObject10.get("$attrs").getOrThrow().asObject()

        let symbolEffect10 = attrs10.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect10, '"{\\"effectType\\":1,\\"scopeType\\":1,\\"commonSubType\\":1,\\"fillStyle\\":0,\\"isTxtActive\\":false,\\"triggerNum\\":0}"')

        let inspector11 = getInspectorByKey("my_symbol11")
        let jsonObject11 = JsonValue.fromStr(inspector11).asObject()
        let attrs11 = jsonObject11.get("$attrs").getOrThrow().asObject()

        let symbolEffect11 = attrs11.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect11, '"{\\"effectType\\":2,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":1,\\"isTxtActive\\":false,\\"triggerNum\\":-1}"')

        let effectStrategy11 = attrs11.get("effectStrategy").getOrThrow().toString()
        @Expect(effectStrategy11, '"SymbolEffectStrategy.SCALE"')

        let inspector12 = getInspectorByKey("my_symbol12")
        let jsonObject12 = JsonValue.fromStr(inspector12).asObject()
        let attrs12 = jsonObject12.get("$attrs").getOrThrow().asObject()

        let symbolEffect12 = attrs12.get("symbolEffect").getOrThrow().toString()
        @Expect(symbolEffect12, '"{\\"effectType\\":2,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":1,\\"isTxtActive\\":true,\\"isActive\\":true}"')

        let inspector13 = getInspectorByKey("my_symbol13")
        let jsonObject13 = JsonValue.fromStr(inspector13).asObject()
        let attrs13 = jsonObject13.get("$attrs").getOrThrow().asObject()
        let fontSize13 = attrs13.get("fontSize").getOrThrow().toString()
        @Expect(fontSize13, '"96.00fp"')

        let symbolEffect13 = attrs13.get("symbolEffect").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "symbolEffect13: ${symbolEffect13}")
        @Expect(symbolEffect13, '"{\\"effectType\\":2,\\"scopeType\\":0,\\"commonSubType\\":0,\\"fillStyle\\":0,\\"isTxtActive\\":true,\\"isActive\\":true}"')
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_symbolspn() {
        ScrollTo("View_SymbolSpan")
        let light = getInspectorByKey("light")
        let lightJsonObject = JsonValue.fromStr(light).asObject()
        let lightAttrs = lightJsonObject.get("$attrs").getOrThrow().asObject()
        let lightFontSize = lightAttrs.get("fontSize").getOrThrow().toString()
        let lightFontWeight = lightAttrs.get("fontWeight").getOrThrow().toString()
        let lightFontColor = lightAttrs.get("fontColor").getOrThrow().toString()
        let lightRenderingStrategy = lightAttrs.get("renderingStrategy").getOrThrow().toString()
        let lightEffectStrategy = lightAttrs.get("effectStrategy").getOrThrow().toString()
        @Expect(lightFontSize, "\"30.00fp\"")
        @Expect(lightFontWeight, "\"FontWeight.Lighter\"")
        @Expect(lightFontColor, "\"#FF000000\"")
        @Expect(lightRenderingStrategy, "\"SymbolRenderingStrategy.SINGLE\"")
        @Expect(lightEffectStrategy, "\"SymbolEffectStrategy.NONE\"")

        let normal = getInspectorByKey("normal")
        let normalJsonObject = JsonValue.fromStr(normal).asObject()
        let normalAttrs = normalJsonObject.get("$attrs").getOrThrow().asObject()
        let normalFontSize = normalAttrs.get("fontSize").getOrThrow().toString()
        let normalFontWeight = normalAttrs.get("fontWeight").getOrThrow().toString()
        @Expect(normalFontSize, "\"30.00fp\"")
        @Expect(normalFontWeight, "\"FontWeight.Normal\"")

        let bold = getInspectorByKey("bold")
        let boldJsonObject = JsonValue.fromStr(bold).asObject()
        let boldAttrs = boldJsonObject.get("$attrs").getOrThrow().asObject()
        let boldFontSize = boldAttrs.get("fontSize").getOrThrow().toString()
        let boldFontWeight = boldAttrs.get("fontWeight").getOrThrow().toString()
        @Expect(boldFontSize, "\"30.00fp\"")
        @Expect(boldFontWeight, "\"FontWeight.Bold\"")

        let single = getInspectorByKey("single")
        let singleJsonObject = JsonValue.fromStr(single).asObject()
        let singleAttrs = singleJsonObject.get("$attrs").getOrThrow().asObject()
        let singleFontWeight = singleAttrs.get("fontWeight").getOrThrow().toString()
        let singleFontColor = singleAttrs.get("fontColor").getOrThrow().toString()
        let singleRenderingStrategy = singleAttrs.get("renderingStrategy").getOrThrow().toString()
        @Expect(singleFontColor, "\"#FF000000\"")
        @Expect(singleFontWeight, "\"FontWeight.Medium\"")
        @Expect(singleRenderingStrategy, "\"SymbolRenderingStrategy.SINGLE\"")

        let multipleColor = getInspectorByKey("multipleColor")
        let multipleColorJsonObject = JsonValue.fromStr(multipleColor).asObject()
        let multipleColorAttrs = multipleColorJsonObject.get("$attrs").getOrThrow().asObject()
        let multipleColorFontWeight = multipleColorAttrs.get("fontWeight").getOrThrow().toString()
        let multipleColorFontColor = multipleColorAttrs.get("fontColor").getOrThrow().toString()
        let multipleColorRenderingStrategy = multipleColorAttrs.get("renderingStrategy").getOrThrow().toString()
        @Expect(multipleColorFontColor, "\"#FF000000\"")
        @Expect(multipleColorFontWeight, "\"FontWeight.Regular\"")
        @Expect(multipleColorRenderingStrategy, "\"SymbolRenderingStrategy.MULTIPLE_COLOR\"")

        let multipleOpacity = getInspectorByKey("multipleOpacity")
        let multipleOpacityJsonObject = JsonValue.fromStr(multipleOpacity).asObject()
        let multipleOpacityAttrs = multipleOpacityJsonObject.get("$attrs").getOrThrow().asObject()
        let multipleOpacityFontWeight = multipleOpacityAttrs.get("fontWeight").getOrThrow().toString()
        let multipleOpacityFontColor = multipleOpacityAttrs.get("fontColor").getOrThrow().toString()
        let multipleOpacityRenderingStrategy = multipleOpacityAttrs.get("renderingStrategy").getOrThrow().toString()
        @Expect(multipleOpacityFontColor, "\"#FF000000\"")
        @Expect(multipleOpacityFontWeight, "\"FontWeight.Bolder\"")
        @Expect(multipleOpacityRenderingStrategy, "\"SymbolRenderingStrategy.MULTIPLE_OPACITY\"")

        let noneStartegy = getInspectorByKey("noneStartegy")
        let noneStartegyJsonObject = JsonValue.fromStr(noneStartegy).asObject()
        let noneStartegyAttrs = noneStartegyJsonObject.get("$attrs").getOrThrow().asObject()
        let noneStartegyFontWeight = noneStartegyAttrs.get("fontWeight").getOrThrow().toString()
        let noneStartegyFontColor = noneStartegyAttrs.get("fontColor").getOrThrow().toString()
        let noneStartegyEffectStrategy = noneStartegyAttrs.get("effectStrategy").getOrThrow().toString()
        @Expect(noneStartegyFontColor, "\"#FF000000\"")
        @Expect(noneStartegyFontWeight, "\"FontWeight.Bold\"")
        @Expect(noneStartegyEffectStrategy, "\"SymbolEffectStrategy.NONE\"")

        let scaleStartegy = getInspectorByKey("scaleStartegy")
        let scaleStartegyJsonObject = JsonValue.fromStr(scaleStartegy).asObject()
        let scaleStartegyAttrs = scaleStartegyJsonObject.get("$attrs").getOrThrow().asObject()
        let scaleStartegyFontWeight = scaleStartegyAttrs.get("fontWeight").getOrThrow().toString()
        let scaleStartegyFontColor = scaleStartegyAttrs.get("fontColor").getOrThrow().toString()
        let scaleStartegyEffectStrategy = scaleStartegyAttrs.get("effectStrategy").getOrThrow().toString()
        @Expect(scaleStartegyFontColor, "\"#FF000000\"")
        @Expect(scaleStartegyFontWeight, "\"100\"")
        @Expect(scaleStartegyEffectStrategy, "\"SymbolEffectStrategy.SCALE\"")

        let hierarchical = getInspectorByKey("hierarchical")
        let hierarchicalJsonObject = JsonValue.fromStr(hierarchical).asObject()
        let hierarchicalAttrs = hierarchicalJsonObject.get("$attrs").getOrThrow().asObject()
        let hierarchicalFontWeight = hierarchicalAttrs.get("fontWeight").getOrThrow().toString()
        let hierarchicalFontColor = hierarchicalAttrs.get("fontColor").getOrThrow().toString()
        let hierarchicalEffectStrategy = hierarchicalAttrs.get("effectStrategy").getOrThrow().toString()
        @Expect(hierarchicalFontColor, "\"#FF000000\"")
        @Expect(hierarchicalFontWeight, "\"900\"")
        @Expect(hierarchicalEffectStrategy, "\"SymbolEffectStrategy.HIERARCHICAL\"")

        let default = getInspectorByKey("default")
        let defaultJsonObject = JsonValue.fromStr(default).asObject()
        let defaultAttrs = defaultJsonObject.get("$attrs").getOrThrow().asObject()
        let defaultFontSize = defaultAttrs.get("fontSize").getOrThrow().toString()
        let defaultFontColor = defaultAttrs.get("fontColor").getOrThrow().toString()
        let defaultFontWeight = defaultAttrs.get("fontWeight").getOrThrow().toString()
        let defaultRenderingStrategy = defaultAttrs.get("renderingStrategy").getOrThrow().toString()
        let defaultEffectStrategy = defaultAttrs.get("effectStrategy").getOrThrow().toString()
        @Expect(defaultFontSize, "\"16.00fp\"")
        @Expect(defaultFontColor, "\"#FF000000\"")
        @Expect(defaultFontWeight, "\"FontWeight.Normal\"")
        @Expect(defaultRenderingStrategy, "\"SymbolRenderingStrategy.SINGLE\"")
        @Expect(defaultEffectStrategy, "\"SymbolEffectStrategy.NONE\"")

        let defaultSingle = getInspectorByKey("defaultSingle")
        let defaultSingleJsonObject = JsonValue.fromStr(defaultSingle).asObject()
        let defaultSingleAttrs = defaultSingleJsonObject.get("$attrs").getOrThrow().asObject()
        let defaultSingleFontColor = defaultSingleAttrs.get("fontColor").getOrThrow().toString()
        @Expect(defaultSingleFontColor, "\"#FF000000\"")

        let defaultmultiple_color = getInspectorByKey("defaultmultiple_color")
        let defaultmultiple_colorJsonObject = JsonValue.fromStr(defaultmultiple_color).asObject()
        let defaultmultiple_colorAttrs = defaultmultiple_colorJsonObject.get("$attrs").getOrThrow().asObject()
        let defaultmultiple_colorFontColor = defaultmultiple_colorAttrs.get("fontColor").getOrThrow().toString()
        @Expect(defaultmultiple_colorFontColor, "\"#FF000000\"")

        let defaultmultiple_opacity = getInspectorByKey("defaultmultiple_opacity")
        let defaultmultiple_opacityJsonObject = JsonValue.fromStr(defaultmultiple_opacity).asObject()
        let defaultmultiple_opacityAttrs = defaultmultiple_opacityJsonObject.get("$attrs").getOrThrow().asObject()
        let defaultmultiple_opacityFontColor = defaultmultiple_opacityAttrs.get("fontColor").getOrThrow().toString()
        @Expect(defaultmultiple_opacityFontColor, "\"#FF000000\"")
    }
    // text unittest

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_text_content_controller_base() {
        ScrollTo("View_TextContentControllerBase")

        //SearchController
        let button_0 = driver.findComponent(On().id("GetSearch"))
        button_0?.click()
        let caretIndex = driver.waitForComponent(On().id("caretIndex"), 1000)?.getText()
        let caretX = driver.findComponent(On().id("caretX"))?.getText()
        let caretY = driver.findComponent(On().id("caretY"))?.getText()
        let x = driver.findComponent(On().id("x"))?.getText()
        let y = driver.findComponent(On().id("y"))?.getText()
        let width = driver.findComponent(On().id("width"))?.getText()
        let height = driver.findComponent(On().id("height"))?.getText()
        let linesnum = driver.findComponent(On().id("linesnum"))?.getText()
        @Expect(caretIndex, "11")
        @Expect(caretX, "291")
        @Expect(caretY, "34")
        @Expect(x, "0")
        @Expect(y, "34")
        @Expect(width, "294")
        @Expect(height, "61")
        @Expect(linesnum, "1")

        //TextInputController
        let button_1 = driver.findComponent(On().id("GetTextInput"))
        button_1?.click()
        let caretIndex1 = driver.waitForComponent(On().id("caretIndex"), 1000)?.getText()
        let caretX1 = driver.findComponent(On().id("caretX"))?.getText()
        let caretY1 = driver.findComponent(On().id("caretY"))?.getText()
        let x1 = driver.findComponent(On().id("x"))?.getText()
        let y1 = driver.findComponent(On().id("y"))?.getText()
        let width1 = driver.findComponent(On().id("width"))?.getText()
        let height1 = driver.findComponent(On().id("height"))?.getText()
        let linesnum1 = driver.findComponent(On().id("linesnum"))?.getText()
        @Expect(caretIndex1, "11")
        @Expect(caretX1, "343")
        @Expect(caretY1, "34")
        @Expect(x1, "52")
        @Expect(y1, "34")
        @Expect(width1, "294")
        @Expect(height1, "61")
        @Expect(linesnum1, "1")

        //TextAreaController
        let button_2 = driver.findComponent(On().id("GetTextArea"))
        button_2?.click()
        let caretIndex2 = driver.waitForComponent(On().id("caretIndex"), 1000)?.getText()
        let caretX2 = driver.findComponent(On().id("caretX"))?.getText()
        let caretY2 = driver.findComponent(On().id("caretY"))?.getText()
        let x2 = driver.findComponent(On().id("x"))?.getText()
        let y2 = driver.findComponent(On().id("y"))?.getText()
        let width2 = driver.findComponent(On().id("width"))?.getText()
        let height2 = driver.findComponent(On().id("height"))?.getText()
        let linesnum2 = driver.findComponent(On().id("linesnum"))?.getText()
        @Expect(caretIndex2, "11")
        @Expect(caretX2, "137")
        @Expect(caretY2, "148")
        @Expect(x2, "52")
        @Expect(y2, "26")
        @Expect(width2, "88")
        @Expect(height2, "183")
        @Expect(linesnum2, "3")
    }

    // TextArea
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_size() {
        ScrollTo("View_TextArea")
        let inspector = getInspectorByKey("component_2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let size = attrs.get("size").getOrThrow().toString()
        @Expect(size, "{\"width\":\"100.00vp\",\"height\":\"50.00vp\"}")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textAlign() {
        ScrollTo("View_TextArea")
        Hilog.error(1, "1", "Cangjie-Test", "==========")
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.error(1, "1", "Cangjie-Test", attrs.toString())
        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.error(1, "1", "Cangjie-Test", textAlign)
        @Expect(textAlign, "\"TextAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textArea() {
        ScrollTo("View_TextArea")
        let inspector = getInspectorByKey("component_3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let border = attrs.get("size").getOrThrow().toString()
        @Expect(border, "{\"width\":\"387.69vp\",\"height\":\"88.46vp\"}")

        let text2 = driver.findComponent(On().id("component_3"))?.getText()
        @Expect(text2, "border")

        let inspector5 = getInspectorByKey("component_5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let fontColor = attrs5.get("fontColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FF8A2BE2\"")

        let inspector6 = getInspectorByKey("component_6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        let fontSize = attrs6.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"60.00fp\"")

        let inspector7 = getInspectorByKey("component_7")
        let jsonObject7 = JsonValue.fromStr(inspector7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()
        let fontWeight = attrs7.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight, "\"900\"")

        let inspector8 = getInspectorByKey("component_8")
        let jsonObject8 = JsonValue.fromStr(inspector8).asObject()
        let attrs8 = jsonObject8.get("$attrs").getOrThrow().asObject()
        let fontStyle = attrs8.get("fontStyle").getOrThrow().toString()
        @Expect(fontStyle, "\"FontStyle.Italic\"")

        let inspector9 = getInspectorByKey("component_9")
        let jsonObject9 = JsonValue.fromStr(inspector9).asObject()
        let attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()
        let placeholderColor = attrs9.get("placeholderColor").getOrThrow().toString()
        @Expect(placeholderColor, "\"#FF8A2BE2\"")
        let placeholderFont = attrs9.get("placeholderFont").getOrThrow().toString().replace("\\", "")
        @Expect(attrs9.get("placeholderFont").getOrThrow().toString().replace("\\", "").contains('{"style":"FontStyle.Italic","size":"60.00vp","weight":"900","fontFamily":"Georgia"}'))

        let inspector11 = getInspectorByKey("component_11")
        let jsonObject11 = JsonValue.fromStr(inspector11).asObject()
        let attrs11 = jsonObject11.get("$attrs").getOrThrow().asObject()
        let caretcolor = attrs11.get("caretColor").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text caretColor:\t ${caretcolor}")
        @Expect(caretcolor, "\"#FFFF0000\"")
    }
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textArea_new() {
        ScrollTo("View_TextArea")
        let inspector12 = getInspectorByKey("component_12")
        let jsonObject12 = JsonValue.fromStr(inspector12).asObject()
        let attrs12 = jsonObject12.get("$attrs").getOrThrow().asObject()
        let lineHeight = attrs12.get("lineHeight").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text lineHeight:\t ${lineHeight}")
        @Expect(lineHeight, "\"60.00vp\"")

        let inspector13 = getInspectorByKey("component_13")
        let jsonObject13 = JsonValue.fromStr(inspector13).asObject()
        let attrs13 = jsonObject13.get("$attrs").getOrThrow().asObject()
        let lineSpacing = attrs13.get("lineSpacing").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text lineSpacing:\t ${lineSpacing}")
        @Expect(lineSpacing, "\"20.00vp\"")
        let letterSpacing = attrs13.get("letterSpacing").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text letterSpacing:\t ${letterSpacing}")
        @Expect(letterSpacing, "\"10.00vp\"")

        let inspector14 = getInspectorByKey("component_14")
        let jsonObject14 = JsonValue.fromStr(inspector14).asObject()
        let attrs14 = jsonObject14.get("$attrs").getOrThrow().asObject()
        let decoration = attrs14.get("decoration").getOrThrow().toString().replace("\\", "")
        Hilog.info(1, "1", "Cangjie-Test", "text decoration:\t ${decoration}")
        @Expect(decoration.contains('{"type":"TextDecorationType.LineThrough","color":"#FF008000","style":"TextDecorationStyle.WAVY"}'))

        let inspector15 = getInspectorByKey("component_15")
        let jsonObject15 = JsonValue.fromStr(inspector15).asObject()
        let attrs15 = jsonObject15.get("$attrs").getOrThrow().asObject()
        let wordBreak = attrs15.get("wordBreak").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text wordBreak:\t ${wordBreak}")
        @Expect(wordBreak, "\"normal\"")

        let inspector21 = getInspectorByKey("component_21")
        let jsonObject21 = JsonValue.fromStr(inspector21).asObject()
        let attrs21 = jsonObject21.get("$attrs").getOrThrow().asObject()
        let selectedBackgroundColor = attrs21.get("selectedBackgroundColor").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text selectedBackgroundColor:\t ${selectedBackgroundColor}")
        @Expect(selectedBackgroundColor, "\"#CCC0C0C0\"")

        let inspector22 = getInspectorByKey("component_22")
        let jsonObject22 = JsonValue.fromStr(inspector22).asObject()
        let attrs22 = jsonObject22.get("$attrs").getOrThrow().asObject()
        let caretStyle = attrs22.get("caretStyle").getOrThrow().toString().replace("\\", "")
        Hilog.info(1, "1", "Cangjie-Test", "text caretStyle:\t ${caretStyle}")
        @Expect(caretStyle, '"{\"color\":\"#FF000000\",\"width\":\"20.00vp\"}"')

        let inspector23 = getInspectorByKey("component_23")
        let jsonObject23 = JsonValue.fromStr(inspector23).asObject()
        let attrs23 = jsonObject23.get("$attrs").getOrThrow().asObject()
        let textIndent = attrs23.get("textIndent").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text textIndent:\t ${textIndent}")
        @Expect(textIndent, "\"20.00vp\"")

        let inspector25 = getInspectorByKey("component_25")
        let jsonObject25 = JsonValue.fromStr(inspector25).asObject()
        let attrs25 = jsonObject25.get("$attrs").getOrThrow().asObject()
        let enablePreviewText = attrs25.get("enablePreviewText").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text enablePreviewText:\t ${enablePreviewText}")
        @Expect(enablePreviewText, "false")

        let inspector26 = getInspectorByKey("component_26")
        let jsonObject26 = JsonValue.fromStr(inspector26).asObject()
        let attrs26 = jsonObject26.get("$attrs").getOrThrow().asObject()
        let barState = attrs26.get("barState").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text barState:\t ${barState}")
        @Expect(barState, "\"BarState.ON\"")
        let style = attrs26.get("style").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text style:\t ${style}")
        @Expect(style, "\"TextContentStyle.INLINE\"")

        let inspector28 = getInspectorByKey("component_28")
        let jsonObject28 = JsonValue.fromStr(inspector28).asObject()
        let attrs28 = jsonObject28.get("$attrs").getOrThrow().asObject()
        let maxLength = attrs28.get("maxLength").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text maxLength:\t ${maxLength}")
        @Expect(maxLength, "\"40\"")
        let showCounter = attrs28.get("showCounter").getOrThrow().toString().replace("\\", "")
        Hilog.info(1, "1", "Cangjie-Test", "text showCounter:\t ${showCounter}")
        @Expect(showCounter, '{"value":true,"options":{"thresholdPercentage":20,"highlightBorder":true}}')

        let inspector29 = getInspectorByKey("component_29")
        let jsonObject29 = JsonValue.fromStr(inspector29).asObject()
        let attrs29 = jsonObject29.get("$attrs").getOrThrow().asObject()
        let enableAutoFill = attrs29.get("enableAutoFill").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text enableAutoFill:\t ${enableAutoFill}")
        @Expect(enableAutoFill, "true")

        let inspector30 = getInspectorByKey("component_30")
        let jsonObject30 = JsonValue.fromStr(inspector30).asObject()
        let attrs30 = jsonObject30.get("$attrs").getOrThrow().asObject()
        let contentType = attrs30.get("contentType").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text contentType:\t ${contentType}")
        @Expect(contentType, "\"TextContentType.VISIBLE_PASSWORD\"")

        let inspector31 = getInspectorByKey("component_31")
        let jsonObject31 = JsonValue.fromStr(inspector31).asObject()
        let attrs31 = jsonObject31.get("$attrs").getOrThrow().asObject()
        let copyOption = attrs31.get("copyOption").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text copyOption:\t ${copyOption}")
        @Expect(copyOption, "\"CopyOptions.InApp\"")

        let inspector32 = getInspectorByKey("component_32")
        let jsonObject32 = JsonValue.fromStr(inspector32).asObject()
        let attrs32 = jsonObject32.get("$attrs").getOrThrow().asObject()
        let `type` = attrs32.get("type").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text `type`:\t ${`type`}")
        @Expect(`type`, "\"TextAreaType.NUMBER\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textArea_default() {
        ScrollTo("View_TextArea")
        let inspector = getInspectorByKey("component_default")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let lineSpacing = attrs.get("lineSpacing").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text lineSpacing:\t ${lineSpacing}")
        @Expect(lineSpacing, "\"0.00vp\"")
        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text decoration:\t ${decoration}")
        @Expect(decoration.contains("{\\\"type\\\":\\\"TextDecorationType.None\\\",\\\"color\\\":\\\"#FF000000\\\",\\\"style\\\":\\\"TextDecorationStyle.SOLID\\\"}"))
        let wordBreak = attrs.get("wordBreak").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text wordBreak:\t ${wordBreak}")
        @Expect(wordBreak, "\"break-word\"")
        let heightAdaptivePolicy = attrs.get("heightAdaptivePolicy").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text heightAdaptivePolicy:\t ${heightAdaptivePolicy}")
        @Expect(heightAdaptivePolicy, "\"TextHeightAdaptivePolicy.MAX_LINES_FIRST\"")
        let textIndent = attrs.get("textIndent").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text textIndent:\t ${textIndent}")
        @Expect(textIndent, "\"0.00vp\"")
        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text textOverflow:\t ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Clip\"")
        let enablePreviewText = attrs.get("enablePreviewText").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text enablePreviewText:\t ${enablePreviewText}")
        @Expect(enablePreviewText, "true")
        let style = attrs.get("style").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text style:\t ${style}")
        @Expect(style, "\"TextContentStyle.DEFAULT\"")
        let barState = attrs.get("barState").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text barState:\t ${barState}")
        @Expect(barState, "\"BarState.AUTO\"")
        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text maxLines:\t ${maxLines}")
        @Expect(maxLines, "\"INF\"")
        let `type` = attrs.get("type").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text `type`:\t ${`type`}")
        @Expect(`type`, "\"TextAreaType.NORMAL\"")
        let copyOption = attrs.get("copyOption").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text copyOption:\t ${copyOption}")
        @Expect(copyOption, "\"CopyOptions.Local\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textArea_inline() {
        ScrollTo("View_TextArea")
        let inspector = getInspectorByKey("component_inline")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "text maxLines:\t ${maxLines}")
        @Expect(maxLines, "\"3\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textarea_controller() {
        ScrollTo("View_TextArea")
        driver.longClick(633, 654)
        let text_start1 = driver.waitForComponent(On().id("text_1"), 1000)
        var start1 = text_start1?.getText()
        @Expect(start1, "start:5")
        let text_end1 = driver.findComponent(On().id("text_2"))
        var end1 = text_end1?.getText()
        @Expect(end1, "end:5")

        let button1 = driver.findComponent(On().id("stop_editing"))
        button1?.click()
        let text_start2 = driver.waitForComponent(On().id("text_1"), 1000)
        var start2 = text_start2?.getText()
        @Expect(start2, "start:5")
        let text_end2 = driver.findComponent(On().id("text_2"))
        var end2 = text_end2?.getText()
        @Expect(end2, "end:5")

        driver.click(633, 654)
        let button2 = driver.waitForComponent(On().id("setTextSelection"), 1000)
        button2?.click()
        let text_start3 = driver.waitForComponent(On().id("text_1"), 1000)
        var start3 = text_start3?.getText()
        @Expect(start3, "start:2")
        let text_end3 = driver.findComponent(On().id("text_2"))
        var end3 = text_end3?.getText()
        @Expect(end3, "end:2")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textclock() {
        ScrollTo("View_TextClock")
        let inspector = getInspectorByKey("Text_clock1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let format = attrs.get("format").getOrThrow().toString()
        @Expect(format, "\"aa hh:mm:ss\"")
        let margin = attrs.get("margin").getOrThrow().toString()
        @Expect(margin, "\"20.00vp\"")
        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fontSize, "\"30.00fp\"")
        let timeZoneOffset = attrs.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset, "\"-8.000000\"")
        let shadow = attrs.get("shadow").getOrThrow().toString()
        @Expect(shadow, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector2 = getInspectorByKey("Text_clock2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let format2 = attrs2.get("format").getOrThrow().toString()
        @Expect(format2, "\"aa hh:mm:ss\"")
        let fontColor2 = attrs2.get("fontColor").getOrThrow().toString()
        @Expect(fontColor2, "\"#FFFFFFFF\"")
        let shadow2 = attrs2.get("shadow").getOrThrow().toString()
        @Expect(shadow2, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector3 = getInspectorByKey("Text_clock3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let format3 = attrs3.get("format").getOrThrow().toString()
        @Expect(format3, "\"aa hh:mm:ss\"")
        let timeZoneOffset3 = attrs3.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset3, "\"12.000000\"")
        let shadow3 = attrs3.get("shadow").getOrThrow().toString()
        @Expect(shadow3, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let start = driver.findComponent(On().id("start"))
        start?.click()

        let stop = driver.waitForComponent(On().id("stop"), 1000)
        stop?.click()
        driver.delayMs(1000)

        let inspector4 = getInspectorByKey("Text_clock4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        let format4 = attrs4.get("format").getOrThrow().toString()
        @Expect(format4, "\"HH:mm:ss\"")
        let fontSize4 = attrs4.get("fontSize").getOrThrow().toString()
        @Expect(fontSize4, "\"20.00fp\"")
        let timeZoneOffset4 = attrs4.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset4, "\"1.000000\"")
        let shadow4 = attrs4.get("shadow").getOrThrow().toString()
        @Expect(shadow4, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector5 = getInspectorByKey("Text_clock5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let format5 = attrs5.get("format").getOrThrow().toString()
        @Expect(format5, "\"aa hh:mm:ss\"")
        let fontSize5 = attrs5.get("fontSize").getOrThrow().toString()
        @Expect(fontSize5, "\"21.00fp\"")
        let timeZoneOffset5 = attrs5.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset5, "\"1.000000\"")
        let shadow5 = attrs5.get("shadow").getOrThrow().toString()
        @Expect(shadow5, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector6 = getInspectorByKey("Text_clock6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        let format6 = attrs6.get("format").getOrThrow().toString()
        @Expect(format6, "\"HH:mm\"")
        let fontSize6 = attrs6.get("fontSize").getOrThrow().toString()
        @Expect(fontSize6, "\"25.00fp\"")
        let timeZoneOffset6 = attrs6.get("timeZoneOffset").getOrThrow().toString()
        @Expect(timeZoneOffset6, "\"-1.000000\"")
        let shadow6 = attrs6.get("shadow").getOrThrow().toString()
        @Expect(shadow6, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\",\"fill\":\"0\"}")

        let inspector7 = getInspectorByKey("Text_clock7")
        let jsonObject7 = JsonValue.fromStr(inspector7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()
        let fontColor7 = attrs7.get("fontColor").getOrThrow().toString()
        @Expect(fontColor7, "\"#FFFF0000\"")

        let inspector8 = getInspectorByKey("Text_clock8")
        let jsonObject8 = JsonValue.fromStr(inspector8).asObject()
        let attrs8 = jsonObject8.get("$attrs").getOrThrow().asObject()
        let fontColor8 = attrs8.get("fontColor").getOrThrow().toString()
        @Expect(fontColor8, "\"#FF000000\"")

        let inspector9 = getInspectorByKey("Text_clock9")
        let jsonObject9 = JsonValue.fromStr(inspector9).asObject()
        let attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()
        let fontColor9 = attrs9.get("fontColor").getOrThrow().toString()
        @Expect(fontColor9, "\"#FF000000\"")

        let inspector12 = getInspectorByKey("Text_clock12")
        let jsonObject12 = JsonValue.fromStr(inspector12).asObject()
        let attrs12 = jsonObject12.get("$attrs").getOrThrow().asObject()
        let fontWeight12 = attrs12.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight12, "\"FontWeight.Normal\"")

        let inspector13 = getInspectorByKey("Text_clock13")
        let jsonObject13 = JsonValue.fromStr(inspector13).asObject()
        let attrs13 = jsonObject13.get("$attrs").getOrThrow().asObject()
        let fontWeight13 = attrs13.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight13, "\"FontWeight.Normal\"")

        let inspector14 = getInspectorByKey("Text_clock14")
        let jsonObject14 = JsonValue.fromStr(inspector14).asObject()
        let attrs14 = jsonObject14.get("$attrs").getOrThrow().asObject()
        let fontWeight14 = attrs14.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight14, "\"FontWeight.Bold\"")

        let inspector15 = getInspectorByKey("Text_clock15")
        let jsonObject15 = JsonValue.fromStr(inspector15).asObject()
        let attrs15 = jsonObject15.get("$attrs").getOrThrow().asObject()
        let fontWeight15 = attrs15.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight15, "\"FontWeight.Bold\"")

        let inspector16 = getInspectorByKey("Text_clock16")
        let jsonObject16 = JsonValue.fromStr(inspector16).asObject()
        let attrs16 = jsonObject16.get("$attrs").getOrThrow().asObject()
        let fontWeight16 = attrs16.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight16, "\"FontWeight.Bolder\"")

        let inspector17 = getInspectorByKey("Text_clock17")
        let jsonObject17 = JsonValue.fromStr(inspector17).asObject()
        let attrs17 = jsonObject17.get("$attrs").getOrThrow().asObject()
        let fontWeight17 = attrs17.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight17, "\"FontWeight.Bolder\"")

        let inspector18 = getInspectorByKey("Text_clock18")
        let jsonObject18 = JsonValue.fromStr(inspector18).asObject()
        let attrs18 = jsonObject18.get("$attrs").getOrThrow().asObject()
        let fontWeight18 = attrs18.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight18, "\"FontWeight.Lighter\"")

        let inspector19 = getInspectorByKey("Text_clock19")
        let jsonObject19 = JsonValue.fromStr(inspector19).asObject()
        let attrs19 = jsonObject19.get("$attrs").getOrThrow().asObject()
        let fontWeight19 = attrs19.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight19, "\"FontWeight.Lighter\"")

        let inspector20 = getInspectorByKey("Text_clock20")
        let jsonObject20 = JsonValue.fromStr(inspector20).asObject()
        let attrs20 = jsonObject20.get("$attrs").getOrThrow().asObject()
        let fontWeight20 = attrs20.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight20, "\"FontWeight.Medium\"")

        let inspector21 = getInspectorByKey("Text_clock21")
        let jsonObject21 = JsonValue.fromStr(inspector21).asObject()
        let attrs21 = jsonObject21.get("$attrs").getOrThrow().asObject()
        let fontWeight21 = attrs21.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight21, "\"FontWeight.Medium\"")
        let fontFeature21 = attrs21.get("fontFeature").getOrThrow().toString()
        @Expect(fontFeature21, "\"\\\"ss01\\\" 0\"")

        let inspector22 = getInspectorByKey("Text_clock22")
        let jsonObject22 = JsonValue.fromStr(inspector22).asObject()
        let attrs22 = jsonObject22.get("$attrs").getOrThrow().asObject()
        let fontWeight22 = attrs22.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight22, "\"FontWeight.Regular\"")

        let inspector23 = getInspectorByKey("Text_clock23")
        let jsonObject23 = JsonValue.fromStr(inspector23).asObject()
        let attrs23 = jsonObject23.get("$attrs").getOrThrow().asObject()
        let fontWeight23 = attrs23.get("fontWeight").getOrThrow().toString()
        @Expect(fontWeight23, "\"FontWeight.Regular\"")
        let fontFamily23 = attrs23.get("fontFamily").getOrThrow().toString()
        @Expect(fontFamily23, "\"HarmonyOS Sans\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_component_1() {
        ScrollTo("View_TextInput")
        let inspector = getInspectorByKey("component_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "1", "Cangjie-Test", "textinput:\t ${attrs.getFields()}")

        let textinput = driver.waitForComponent(On().id("stopEditing"), 500)
        textinput?.click()
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        let text4 = driver.findComponent(On().id("Text3_showSubmitState"))
        @Expect(text4?.getText(), "stopEditing Success")

        let pColor = attrs.get("placeholderColor").getOrThrow().toString()
        @Expect(pColor, "\"#FF808080\"")
        let w = attrs.get("width").getOrThrow().toString()
        @Expect(w, "\"95.00%\"")
        let h = attrs.get("height").getOrThrow().toString()
        @Expect(h, "\"40.00vp\"")
        let m = attrs.get("margin").getOrThrow().toString()
        @Expect(m, "\"20.00vp\"")
        let fSize = attrs.get("fontSize").getOrThrow().toString()
        @Expect(fSize, "\"14.00fp\"")
        let fColor = attrs.get("fontColor").getOrThrow().toString()
        @Expect(fColor, "\"#FF000000\"")

        let testSetTextSelection = driver.findComponent(On().id("TextInput_setTextSelection"))
        testSetTextSelection?.inputText("testSetTextSelection")
        driver.delayMs(500)
        // 点击回车键
        driver.click(1200, 2500)
        driver.delayMs(500)
        let text3 = driver.findComponent(On().id("Text3_showSubmitState"))
        @Expect(text3?.getText(), "setTextSelection Success")
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.pressBack()
        ScrollTo("View_TextInput")

        let inspector2 = getInspectorByKey("component_2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let maxLength = attrs2.get("maxLength").getOrThrow().toString()
        Hilog.info(1, "1", "Cangjie-Test", "maxLength:\t ${maxLength}")
        @Expect(maxLength, "\"9\"")
    }
}
