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
class TextAndInput_UT_2_1 {
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
        scrollBar?.scrollSearch(On().id("TextAndInput_UT2"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_textinput_enhance() {
        ScrollTo("View_TextInput_Enhance")
        driver.delayMs(500)
        let inspectorDefault = getInspectorByKey("TextInputDefault")
        let jsonObjectDefault = JsonValue.fromStr(inspectorDefault).asObject()
        let attrsDefault = jsonObjectDefault.get("$attrs").getOrThrow().asObject()
        @Expect(attrsDefault.get("lineHeight").getOrThrow().toString(), '"0.00vp"')
        @Expect(attrsDefault.get("letterSpacing").getOrThrow().toString(), '"0.00px"')
        @Expect(attrsDefault.get("showError").getOrThrow().toString(), '"undefined"')
        @Expect(attrsDefault.get("maxFontSize").getOrThrow().toString(), '"0.00px"')
        @Expect(attrsDefault.get("minFontSize").getOrThrow().toString(), '"0.00px"')
        @Expect(attrsDefault.get("enableAutoFill").getOrThrow().toString(), 'true')
        @Expect(attrsDefault.get("type").getOrThrow().toString(), '"InputType.Normal"')
        @Expect(attrsDefault.get("contentType").getOrThrow().toString(), '"TextContentType.UNSPECIFIED"')
        @Expect(attrsDefault.get("selectAll").getOrThrow().toString(), 'false')
        @Expect(attrsDefault.get("caretPosition").getOrThrow().toString(), '"0"')
        @Expect(attrsDefault.get("textIndent").getOrThrow().toString(), '"0.00vp"')
        @Expect(attrsDefault.get("cancelButton").getOrThrow().toString().replace("\\", ""),
            '"{\"style\":2,\"icon\":\"{\"size\":\"0.00px\",\"src\":\"\",\"color\":\"#FF000000\"}\"}"')
        @Expect(attrsDefault.get("copyOption").getOrThrow().toString(), '"CopyOptions.Local"')
        @Expect(attrsDefault.get("decoration").getOrThrow().toString().replace("\\", ""),
            '"{\"type\":\"TextDecorationType.None\",\"color\":\"#FF000000\",\"style\":\"TextDecorationStyle.Solid\"}"')
        @Expect(attrsDefault.get("selectedBackgroundColor").getOrThrow().toString(), '"#330A59F7"')
        @Expect(attrsDefault.get("caretStyle").getOrThrow().toString().replace("\\", ""),
            '"{\"color\":\"#FF0A59F7\",\"width\":\"2.00vp\"}"')
        @Expect(attrsDefault.get("maxLength").getOrThrow().toString(), '"INF"')
        @Expect(attrsDefault.get("showUnderline").getOrThrow().toString(), 'false')
        @Expect(attrsDefault.get("underlineColor").getOrThrow().toString().replace("\\", ""),
            '"{\"normal\":\"#33000000\",\"typing\":\"#89000000\",\"error\":\"#FFE84026\",\"disable\":\"#14000000\"}"')
        @Expect(attrsDefault.get("showCounter").getOrThrow().toString().replace("\\", "").replace(" ", "").replace("\"", ""),
            '{value:false,options:{thresholdPercentage:-1,highlightBorder:true}}')
        @Expect(attrsDefault.get("showPasswordIcon").getOrThrow().toString(), 'true')
        @Expect(attrsDefault.get("showPassword").getOrThrow().toString(), 'false')
        @Expect(attrsDefault.get("passwordRules").getOrThrow().toString(), '""')
        @Expect(attrsDefault.get("style").getOrThrow().toString(), '"TextInputStyle.Default"')
        @Expect(attrsDefault.get("textOverflow").getOrThrow().toString(), '"TextOverflow.Clip"')
        @Expect(attrsDefault.get("wordBreak").getOrThrow().toString(), '"break-word"')
        @Expect(attrsDefault.get("maxLines").getOrThrow().toString(), '"1"')
        @Expect(attrsDefault.get("barState").getOrThrow().toString(), '"BarState.AUTO"')
        @Expect(attrsDefault.get("heightAdaptivePolicy").getOrThrow().toString(), '"TextHeightAdaptivePolicy.MaxLinesFirst"')
        @Expect(attrsDefault.get("passwordIcon").getOrThrow().toString().replace("\\", ""),
            '"{\"onIconSrc\":983328,\"offIconSrc\":983327}"')

        let inspectorNormal = getInspectorByKey("TextInputNormal")
        let jsonObjectNormal = JsonValue.fromStr(inspectorNormal).asObject()
        let attrsNormal = jsonObjectNormal.get("$attrs").getOrThrow().asObject()
        @Expect(attrsNormal.get("lineHeight").getOrThrow().toString(), '"30.00vp"')
        @Expect(attrsNormal.get("letterSpacing").getOrThrow().toString(), '"3.00vp"')
        @Expect(attrsNormal.get("maxFontSize").getOrThrow().toString(), '"20.00px"')
        @Expect(attrsNormal.get("minFontSize").getOrThrow().toString(), '"10.50px"')
        @Expect(attrsNormal.get("enableAutoFill").getOrThrow().toString(), 'false')
        @Expect(attrsNormal.get("type").getOrThrow().toString(), '"InputType.Normal"')
        @Expect(attrsNormal.get("contentType").getOrThrow().toString(), '"TextContentType.FormatAddress"')
        @Expect(attrsNormal.get("selectAll").getOrThrow().toString(), 'true')
        @Expect(attrsNormal.get("caretPosition").getOrThrow().toString(), '"3"')
        @Expect(attrsNormal.get("textIndent").getOrThrow().toString(), '"1.00vp"')
        let cancelButton = attrsNormal.get("cancelButton").getOrThrow().toString()
        @Expect(attrsNormal.get("copyOption").getOrThrow().toString(), '"CopyOptions.None"')
        let decoration = attrsNormal.get("decoration").getOrThrow().toString()
        @Expect(decoration.replace("\\", ""),
            '"{\"type\":\"TextDecorationType.Underline\",\"color\":\"#FF808080\",\"style\":\"TextDecorationStyle.Double\"}"')
        @Expect(attrsNormal.get("selectedBackgroundColor").getOrThrow().toString(), '"#FF008000"')
        let careStyle = attrsNormal.get("caretStyle").getOrThrow().toString()
        @Expect(careStyle.replace("\\", ""), '"{\"color\":\"#FF008000\",\"width\":\"3.00vp\"}"')
        @Expect(attrsNormal.get("maxLength").getOrThrow().toString(), '"10"')
        @Expect(attrsNormal.get("showUnderline").getOrThrow().toString(), 'true')
        let underline = attrsNormal.get("underlineColor").getOrThrow().toString()
        @Expect(underline.replace("\\", ""),
            '"{\"normal\":\"#FF008000\",\"typing\":\"#89000000\",\"error\":\"#FFE84026\",\"disable\":\"#14000000\"}"')
        let showCounter = attrsNormal.get("showCounter").getOrThrow().toString()
        @Expect(showCounter.replace("\\", "").replace(" ", "").replace("\"", ""),
            '{value:true,options:{thresholdPercentage:10,highlightBorder:true}}')

        let inspectorPassword = getInspectorByKey("TextInputPassword")
        let jsonObjectPassword = JsonValue.fromStr(inspectorPassword).asObject()
        let attrsPassword = jsonObjectPassword.get("$attrs").getOrThrow().asObject()
        @Expect(attrsPassword.get("type").getOrThrow().toString(), '"InputType.Password"')
        @Expect(attrsPassword.get("contentType").getOrThrow().toString(), '"TextContentType.NewPassword"')
        @Expect(attrsPassword.get("showPasswordIcon").getOrThrow().toString(), 'false')
        @Expect(attrsPassword.get("showPassword").getOrThrow().toString(), 'true')
        @Expect(attrsPassword.get("passwordRules").getOrThrow().toString(), '"begin:[lower],special:[yes],len:[maxlen:32,minlen:12]"')

        let inspectorPasswordIcon = getInspectorByKey("TextInputPasswordIcon")
        let jsonObjectPasswordIcon = JsonValue.fromStr(inspectorPasswordIcon).asObject()
        let attrsPasswordIcon = jsonObjectPasswordIcon.get("$attrs").getOrThrow().asObject()
        @Expect(attrsPasswordIcon.get("contentType").getOrThrow().toString(), '"TextContentType.VISIBLE_PASSWORD"')


        let inspectorInline = getInspectorByKey("TextInputInlineText")
        let jsonObjectInline = JsonValue.fromStr(inspectorInline).asObject()
        let attrsInline = jsonObjectInline.get("$attrs").getOrThrow().asObject()
        @Expect(attrsInline.get("style").getOrThrow().toString(), '"TextInputStyle.Inline"')
        @Expect(attrsInline.get("textOverflow").getOrThrow().toString(), '"TextOverflow.Ellipsis"')
        @Expect(attrsInline.get("wordBreak").getOrThrow().toString(), '"normal"')
        @Expect(attrsInline.get("barState").getOrThrow().toString(), '"BarState.ON"')
        @Expect(attrsInline.get("heightAdaptivePolicy").getOrThrow().toString(), '"TextHeightAdaptivePolicy.LayoutConstraintFirst"')

        let inspectorUnit = getInspectorByKey("TextInputUnit")
        let jsonObjectUnit = JsonValue.fromStr(inspectorUnit).asObject()
        let attrsInUnit = jsonObjectUnit.get("$attrs").getOrThrow().asObject()
        @Expect(attrsInUnit.get("underlineColor").getOrThrow().toString().replace("\\", ""),
            '"{\"normal\":\"#FF0000FF\",\"typing\":\"#FFFF0000\",\"error\":\"#FF000000\",\"disable\":\"#FF808080\"}"')
        @Expect(attrsInUnit.get("showUnderline").getOrThrow().toString(), "true")
        @Expect(attrsInUnit.get("showError").getOrThrow().toString(), '""')
        Hilog.info(1,"1","Cangjie-Test", "TextInput Enhance Finished")
    }

}
