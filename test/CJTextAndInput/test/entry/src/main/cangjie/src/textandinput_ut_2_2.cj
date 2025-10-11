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
import ohos.business_exception.*
import ohos.ui_test.*

@Test
class TextAndInputUT22 {
    prop driver: Driver {
        get(){
            OpenHarmonyTestRunner.driver
        }
    }
    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1,"Cangjie-Test", "scrollTo ${view}")
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
                Hilog.error(1,"Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.error(1,"Cangjie-Test", "started")
        scrollBar.scrollSearch(On().id("TextAndInputIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // text unittest
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextCommonAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let content = attrs.get("content").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "content = ${content}")
        @Expect(content, "\"Hello\"")

        let height = attrs.get("height").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "height = ${height}")
        @Expect(height, "\"100.00vp\"")

        let width = attrs.get("width").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "width = ${width}")
        @Expect(width, "\"100.00vp\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextFontAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontSize = ${fontSize}")
        @Expect(fontSize, "\"20.00fp\"")

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontColor = ${fontColor}")
        @Expect(fontColor, "\"#FFFF0000\"")

        let fontStyle = attrs.get("fontStyle").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontStyle = ${fontStyle}")
        @Expect(fontStyle, "\"FontStyle.Italic\"")

        let fontWeight = attrs.get("fontWeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontWeight = ${fontWeight}")
        @Expect(fontWeight, "\"900\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextAlignAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textAlign = ${textAlign}")
        @Expect(textAlign, "\"TextAlign.End\"")

        let baselineOffset = attrs.get("baselineOffset").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "baselineOffset = ${baselineOffset}")
        @Expect(baselineOffset, "\"10\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextDecorationAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration}")
        @Expect(decoration.contains("TextDecorationType.None"))
        @Expect(decoration.contains("#FFFF0000"))
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextFontSizeAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let minFontSize = attrs.get("minFontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "minFontSize = ${minFontSize}")
        @Expect(minFontSize, "\"10.00fp\"")

        let maxFontSize = attrs.get("maxFontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxFontSize = ${maxFontSize}")
        @Expect(maxFontSize, "\"30.00fp\"")

        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"1\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextOverFlowAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Ellipsis\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextTextCaseAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent7")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let textCase = attrs.get("textCase").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textCase = ${textCase}")
        @Expect(textCase, "\"TextCase.UpperCase\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextForegroundColorAttrs() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("textComponent8")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let foregroundColor = attrs.get("foregroundColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "foregroundColor = ${foregroundColor}")
        //这里Fail：#FF000000 非必现问题
        @Expect(foregroundColor, "\"#FF0000FF\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextFont() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextGivenFont")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let font = attrs.get("font").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "font = ${font}")
        //@Expect(font.replace("\\", ""), "\"{\"style\":\"FontStyle.Italic\",\"size\":\"15.00vp\",\"weight\":\"FontWeight.Bolder\",\"variableFontWeight\":\"0\",\"enableVariableFontWeight\":\"false\",\"family\":\"HarmonyOS Sans\"}\"")

        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration}")
        @Expect(decoration.replace("\\", ""), "\"{\"type\":\"TextDecorationType.LineThrough\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.DASHED\"}\"")

        let textCase = attrs.get("textCase").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textCase = ${textCase}")
        @Expect(textCase, "\"TextCase.UpperCase\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextDefaultValue() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextDefault1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let baselineOffset = attrs.get("baselineOffset").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "baselineOffset = ${baselineOffset}")
        @Expect(baselineOffset, "\"0\"")
        let copyOption = attrs.get("copyOption").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "copyOption = ${copyOption}")
        @Expect(copyOption, "\"CopyOptions.None\"")
        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration.replace("\\", "")}")
        @Expect(decoration.replace("\\", ""), "\"{\"type\":\"TextDecorationType.None\",\"color\":\"#FF000000\",\"style\":\"TextDecorationStyle.SOLID\"}\"")
        let ellipsisMode = attrs.get("ellipsisMode").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "ellipsisMode = ${ellipsisMode}")
        @Expect(ellipsisMode, "\"EllipsisMode.END\"")
        let enableDataDetector = attrs.get("enableDataDetector").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "enableDataDetector = ${enableDataDetector}")
        @Expect(enableDataDetector, "\"false\"")
        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontColor = ${fontColor}")
        @Expect(fontColor, "\"#CE000000\"")
        let fontFamily = attrs.get("fontFamily").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontFamily = ${fontFamily}")
        @Expect(fontFamily, "\"HarmonyOS Sans\"")
        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontSize = ${fontSize}")
        @Expect(fontSize, "\"16.00fp\"")
        let fontStyle = attrs.get("fontStyle").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontStyle = ${fontStyle}")
        @Expect(fontStyle, "\"FontStyle.Normal\"")
        let fontWeight = attrs.get("fontWeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontWeight = ${fontWeight}")
        @Expect(fontWeight, "\"FontWeight.Normal\"")
        let letterSpacing = attrs.get("letterSpacing").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "letterSpacing = ${letterSpacing}")
        @Expect(letterSpacing, "\"0.00px\"")
        let lineBreakStrategy = attrs.get("lineBreakStrategy").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "lineBreakStrategy = ${lineBreakStrategy}")
        @Expect(lineBreakStrategy, "\"greedy\"")
        let lineHeight = attrs.get("lineHeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "lineHeight = ${lineHeight}")
        @Expect(lineHeight, "\"0.00vp\"")
        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"4294967295\"")
        let maxFontScale = attrs.get("maxFontScale").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxFontScale = ${maxFontScale}")
        @Expect(maxFontScale, "\"3.200000\"")
        let minFontScale = attrs.get("minFontScale").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "minFontScale = ${minFontScale}")
        @Expect(minFontScale, "\"0.850000\"")
//        let privacySensitive = attrs.get("privacySensitive").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "privacySensitive = ${privacySensitive}")
//        @Expect(privacySensitive, "false")
        let selection = attrs.get("selection").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "selection = ${selection}")
        @Expect(selection, "\"[-1,-1]\"")
        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textAlign = ${textAlign}")
        @Expect(textAlign, "\"TextAlign.Start\"")
        let textCase = attrs.get("textCase").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textCase = ${textCase}")
        @Expect(textCase, "\"TextCase.Normal\"")
        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Clip\"")
        let textSelectable = attrs.get("textSelectable").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textSelectable = ${textSelectable}")
        @Expect(textSelectable, "\"selectable-unfocusable\"")
        let textShadow = attrs.get("textShadow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textShadow = ${textShadow}")
        @Expect(textShadow, "{\"radius\":\"0.000000\",\"color\":\"#FF000000\",\"offsetX\":\"0.000000\",\"offsetY\":\"0.000000\",\"type\":\"0\"}")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextGivenSettingValue() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextGivenSetting")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let baselineOffset = attrs.get("baselineOffset").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "baselineOffset = ${baselineOffset}")
        @Expect(baselineOffset, "\"10\"")

//        let copyOption = attrs.get("copyOption").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "copyOption = ${copyOption}")
//        @Expect(copyOption, "\"CopyOptions.InApp\"")

        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration.replace("\\", "")}")
        @Expect(decoration.replace("\\", ""), "\"{\"type\":\"TextDecorationType.Underline\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.DOTTED\"}\"")

//        let ellipsisMode = attrs.get("ellipsisMode").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "ellipsisMode = ${ellipsisMode}")
//        @Expect(ellipsisMode, "\"EllipsisMode.CENTER\"")

        let fontColor = attrs.get("fontColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontColor = ${fontColor}")
        @Expect(fontColor, "\"#FFFF0000\"")

        let fontFamily = attrs.get("fontFamily").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontFamily = ${fontFamily}")
        @Expect(fontFamily, "\"HarmonyOS Sans\"")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontSize = ${fontSize}")
        @Expect(fontSize, "\"10.00fp\"")

        let fontStyle = attrs.get("fontStyle").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontStyle = ${fontStyle}")
        @Expect(fontStyle, "\"FontStyle.Italic\"")

        let fontWeight = attrs.get("fontWeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontWeight = ${fontWeight}")
        @Expect(fontWeight, "\"FontWeight.Bolder\"")

//        let letterSpacing = attrs.get("letterSpacing").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "letterSpacing = ${letterSpacing}")
//        @Expect(letterSpacing, "\"3.00vp\"")

//        let lineBreakStrategy = attrs.get("lineBreakStrategy").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "lineBreakStrategy = ${lineBreakStrategy}")
//        @Expect(lineBreakStrategy, "\"high-quality\"")

        let lineHeight = attrs.get("lineHeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "lineHeight = ${lineHeight}")
        @Expect(lineHeight, "\"40.00vp\"")

        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"1\"")

//        let maxFontScale = attrs.get("maxFontScale").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "maxFontScale = ${maxFontScale}")
//        @Expect(maxFontScale, "\"5.000000\"")

//        let minFontScale = attrs.get("minFontScale").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "minFontScale = ${minFontScale}")
//        @Expect(minFontScale, "\"0.500000\"")

        let selection = attrs.get("selection").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "selection = ${selection}")
    //        @Expect(selection, "\"10\"")
        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textAlign = ${textAlign}")
        @Expect(textAlign, "\"TextAlign.Center\"")

        let textCase = attrs.get("textCase").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textCase = ${textCase}")
        @Expect(textCase, "\"TextCase.LowerCase\"")

        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.None\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextResource() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextResource")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontSize = ${fontSize}")
        @Expect(fontSize, "\"16.00vp\"")

        let maxFontSize = attrs.get("maxFontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxFontSize = ${maxFontSize}")
        @Expect(maxFontSize, "\"16.00vp\"")

        let minFontSize = attrs.get("minFontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "minFontSize = ${minFontSize}")
        @Expect(minFontSize, "\"16.00vp\"")

        let fontFamily = attrs.get("fontFamily").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontFamily = ${fontFamily}")
        @Expect(fontFamily, "\"Arial\"")

        let lineHeight = attrs.get("lineHeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "lineHeight = ${lineHeight}")
        @Expect(lineHeight, "\"20.00vp\"")

        let baselineOffset = attrs.get("baselineOffset").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "baselineOffset = ${baselineOffset}")
        @Expect(baselineOffset, "\"20\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextDetectConfig() {
        scrollTo("ViewText")

        let inspector1 = getInspectorByKey("TextDetectConfig1")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject1.toString()}")

        let inspector2 = getInspectorByKey("TextDetectConfig2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject2.toString()}")

        let inspector3 = getInspectorByKey("TextDetectConfig3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject3.toString()}")

        let inspector4 = getInspectorByKey("TextDetectConfig4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject4.toString()}")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue1() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let baselineOffset = attrs.get("baselineOffset").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "baselineOffset = ${baselineOffset}")
        @Expect(baselineOffset, "\"0\"")
        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration}")
        @Expect(decoration.replace("\\", ""), "\"{\"type\":\"TextDecorationType.Overline\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.DOUBLE\"}\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue2() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"2\"")
        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Ellipsis\"")
//        let ellipsisMode = attrs.get("ellipsisMode").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "ellipsisMode = ${ellipsisMode}")
//        @Expect(ellipsisMode, "\"EllipsisMode.START\"")
        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration}")
        @Expect(decoration.replace("\\", ""), "\"{\"type\":\"TextDecorationType.Underline\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.WAVY\"}\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue3() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"2\"")
        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Ellipsis\"")
//        let ellipsisMode = attrs.get("ellipsisMode").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "ellipsisMode = ${ellipsisMode}")
//        @Expect(ellipsisMode, "\"EllipsisMode.CENTER\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue4() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontSize = ${fontSize}")
        @Expect(fontSize, "\"10.00%\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue5() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

//        let letterSpacing = attrs.get("letterSpacing").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "letterSpacing = ${letterSpacing}")
//        @Expect(letterSpacing, "\"-3.00vp\"")
        let decoration = attrs.get("decoration").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "decoration = ${decoration}")
        @Expect(decoration.replace("\\", ""), "\"{\"type\":\"TextDecorationType.None\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.SOLID\"}\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue6() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue6")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let lineHeight = attrs.get("lineHeight").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "lineHeight = ${lineHeight}")
        @Expect(lineHeight, "\"-10.00vp\"")
        let fontSize = attrs.get("fontSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fontSize = ${fontSize}")
        @Expect(fontSize, "\"20.00fp\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue11() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue11")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

//        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
//        @Expect(textOverflow, "\"TextOverflow.Marquee\"")
        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"2\"")
//        let copyOption = attrs.get("copyOption").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "copyOption = ${copyOption}")
//        @Expect(copyOption, "\"CopyOptions.Local\"")
        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textAlign = ${textAlign}")
        @Expect(textAlign, "\"TextAlign.Start\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextBoundaryValue12() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextBoundaryValue12")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

//        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
//        @Expect(textOverflow, "\"TextOverflow.Marquee\"")
        let textAlign = attrs.get("textAlign").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textAlign = ${textAlign}")
        @Expect(textAlign, "\"TextAlign.End\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextCombine1() {
        scrollTo("ViewText")

        let inspector = getInspectorByKey("TextCombine1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")

        let textOverflow = attrs.get("textOverflow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "textOverflow = ${textOverflow}")
        @Expect(textOverflow, "\"TextOverflow.Ellipsis\"")
        let maxLines = attrs.get("maxLines").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "maxLines = ${maxLines}")
        @Expect(maxLines, "\"1\"")
//        let ellipsisMode = attrs.get("ellipsisMode").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "ellipsisMode = ${ellipsisMode}")
//        @Expect(ellipsisMode, "\"EllipsisMode.CENTER\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextHeightAdaptivePolicy() {
        scrollTo("ViewText")

        let inspector1 = getInspectorByKey("TextCombine2")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject1.toString()}")

//        let heightAdaptivePolicy1 = attrs1.get("heightAdaptivePolicy").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "heightAdaptivePolicy1 = ${heightAdaptivePolicy1}")
//        @Expect(heightAdaptivePolicy1, "\"TextHeightAdaptivePolicy.MAX_LINES_FIRST\"")

        let inspector2 = getInspectorByKey("TextCombine3")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject2.toString()}")

//        let heightAdaptivePolicy2 = attrs2.get("heightAdaptivePolicy").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "heightAdaptivePolicy2 = ${heightAdaptivePolicy2}")
//        @Expect(heightAdaptivePolicy2, "\"TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST\"")

        let inspector3 = getInspectorByKey("TextCombine4")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
//        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
//        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject3.toString()}")
//
//        let heightAdaptivePolicy3 = attrs3.get("heightAdaptivePolicy").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "heightAdaptivePolicy3 = ${heightAdaptivePolicy3}")
//        @Expect(heightAdaptivePolicy3, "\"TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextCombine2() {
        scrollTo("ViewText")
        let inspector = getInspectorByKey("TextCombine5")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject.toString()}")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextCombine7() {
        scrollTo("ViewText")

        let inspector1 = getInspectorByKey("TextCombine10")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject1.toString()}")

//        let wordBreak1 = attrs1.get("wordBreak").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "wordBreak1 = ${wordBreak1}")
//        @Expect(wordBreak1, "\"normal\"")

        let inspector2 = getInspectorByKey("TextCombine11")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject2.toString()}")

//        let wordBreak2 = attrs2.get("wordBreak").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "wordBreak2 = ${wordBreak2}")
//        @Expect(wordBreak2, "\"break-word\"")

        let inspector3 = getInspectorByKey("TextCombine12")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-Test", "textInfo: ${jsonObject3.toString()}")

//        let wordBreak3 = attrs3.get("wordBreak").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "wordBreak3 = ${wordBreak3}")
//        @Expect(wordBreak3, "\"break-all\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextEditMenuOptions() {
        scrollTo("ViewText")

        driver.swipe(500,1000,500,500,speed:10000)
    }

}
