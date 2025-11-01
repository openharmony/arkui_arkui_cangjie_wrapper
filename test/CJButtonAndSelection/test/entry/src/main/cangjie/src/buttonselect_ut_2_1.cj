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

@Test
class ButtonSelectUT21 {
    prop driver: Driver {
        get() {
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
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
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
        Hilog.error(1,"Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("ButtonSelectIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testSliderCommonAttrs() {
        scrollTo("ViewSlider")

        let inspector = getInspectorByKey("my_slider")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        Hilog.info(1,"Cangjie-Test", attrs.toString())

        let content = driver.findComponent(On().id("my_text")).getOrThrow().getText()
        @Expect(content, "50.000000")

        let slider = driver.findComponent(On().id("my_slider")).getOrThrow()
        let point = slider.getBoundsCenter()
        driver.drag(Int32(point.x), Int32(point.y), Int32(point.x + 200), Int32(point.y))

        let trackColor = attrs.get("trackColor").getOrThrow().toString()
        @Expect(trackColor, "\"#FF808080\"")

        let blockColor = attrs.get("blockColor").getOrThrow().toString()
        @Expect(blockColor, "\"#FF0000FF\"")

        let selectedColor = attrs.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor, "\"#FF0000FF\"")

        let showSteps = attrs.get("showSteps").getOrThrow().toString()
        @Expect(showSteps, "\"true\"")

        let showTips = attrs.get("showTips").getOrThrow().toString()
        @Expect(showTips, "\"true\"")

        let trackThickness = attrs.get("trackThickness").getOrThrow().toString()
        @Expect(trackThickness, "\"4.00vp\"")

        let blockBorderColor = attrs.get("blockBorderColor").getOrThrow().toString()
        @Expect(blockBorderColor, "\"#FF008000\"")

//        let blockBorderWidth = attrs.get("blockBorderWidth").getOrThrow().toString()
//        @Expect(blockBorderWidth, "\"4.00vp\"")

//        let blockSize = attrs.get("blockSize").getOrThrow().toString()
//        @Expect(blockSize, '{"width":"10.00vp","height":"10.00vp"}')

//        let minResponsiveDistance = attrs.get("minResponsiveDistance").getOrThrow().toString()
//        @Expect(minResponsiveDistance, "\"3.000000\"")

//        let selectedBorderRadius = attrs.get("selectedBorderRadius").getOrThrow().toString()
//        @Expect(selectedBorderRadius, "\"0.00vp\"")

//        let stepSize = attrs.get("stepSize").getOrThrow().toString()
//        @Expect(stepSize, "\"2.00vp\"")

//        let stepColor = attrs.get("stepColor").getOrThrow().toString()
//        @Expect(stepColor, "\"#FFFFFF00\"")

//        let trackBorderRadius = attrs.get("trackBorderRadius").getOrThrow().toString()
//        @Expect(trackBorderRadius, "\"0.00vp\"")

//        let slideRange = attrs.get("slideRange").getOrThrow().toString()
//        @Expect(slideRange, '{"from":"20.000000","to":"80.000000"}')

//        let sliderInteractionMode = attrs.get("sliderInteractionMode").getOrThrow().toString()
//        @Expect(sliderInteractionMode, "\"SliderInteraction.SLIDE_AND_CLICK\"")

        let inspector2 = getInspectorByKey("my_slider2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        // Hilog.info(1,"Cangjie-Test", attrs2.toString())
        let blockColor2 = attrs2.get("blockColor").getOrThrow().toString()
        @Expect(blockColor2, "\"#FFCCCCCC\"")

        let trackColor2 = attrs.get("trackColor").getOrThrow().toString()
        @Expect(trackColor2, "\"#FF808080\"")

        let selectedColor2 = attrs2.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor2, "\"#FFCCCC00\"")

        let trackThickness2 = attrs2.get("trackThickness").getOrThrow().toString()
        @Expect(trackThickness2, "\"4.00vp\"")

        let inspector3 = getInspectorByKey("my_slider3")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let blockColor3 = attrs3.get("blockColor").getOrThrow().toString()
        @Expect(blockColor3, "\"#FFFFFFFF\"")

        let selectedColor3 = attrs3.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor3, "\"#FFFFFFFF\"")

        let inspector4 = getInspectorByKey("my_slider4")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let trackColor4 = attrs4.get("trackColor").getOrThrow().toString()
        @Expect(trackColor4, "\"#19000000\"")

        let blockColor4 = attrs4.get("blockColor").getOrThrow().toString()
        @Expect(blockColor4, "\"#FFFFFFFF\"")

        let selectedColor4 = attrs4.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor4, "\"#FF0A59F7\"")

        let showSteps4 = attrs4.get("showSteps").getOrThrow().toString()
        @Expect(showSteps4, "\"false\"")

        let showTips4 = attrs4.get("showTips").getOrThrow().toString()
        @Expect(showTips4, "\"false\"")

        let trackThickness4 = attrs4.get("trackThickness").getOrThrow().toString()
        @Expect(trackThickness4, "\"4.00vp\"")

        let blockBorderColor4 = attrs4.get("blockBorderColor").getOrThrow().toString()
        @Expect(blockBorderColor4, "\"#00000000\"")

        let blockSize4 = attrs4.get("blockSize").getOrThrow().toString()
        @Expect(blockSize4, '{"width":"16.00vp","height":"16.00vp"}')

        let minResponsiveDistance4 = attrs4.get("minResponsiveDistance").getOrThrow().toString()
        @Expect(minResponsiveDistance4, "\"0.000000\"")

        let stepColor4 = attrs4.get("stepColor").getOrThrow().toString()
        @Expect(stepColor4, "\"#19000000\"")

        let stepSize4 = attrs4.get("stepSize").getOrThrow().toString()
        @Expect(stepSize4, "\"4.00vp\"")

        let inspector5 = getInspectorByKey("my_slider5")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()

//        let minResponsiveDistance5 = attrs5.get("minResponsiveDistance").getOrThrow().toString()
//        @Expect(minResponsiveDistance5, "\"0.000000\"")

//        let stepSize5 = attrs5.get("stepSize").getOrThrow().toString()
//        @Expect(stepSize5, "\"4.00vp\"")

        let trackThickness5 = attrs5.get("trackThickness").getOrThrow().toString()
        @Expect(trackThickness5, "\"4.00vp\"")

        let inspector6 = getInspectorByKey("my_slider6")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
//        let minResponsiveDistance6 = attrs6.get("minResponsiveDistance").getOrThrow().toString()
//        @Expect(minResponsiveDistance6, "\"5.000000\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextpickerModifiedColor(){
        scrollTo("ViewTextPicker")
        let picker = driver.findComponent(On().id("modified_color")).getOrThrow()
        picker.click()
        picker.scrollToTop()
        let textPicker = driver.waitForComponent(On().id("modified_color"),500).getOrThrow()
        let picker2 = textPicker.getType()

        let inspector = getInspectorByKey("modified_color")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let font_color = attrs.get("textStyle").getOrThrow().toString()
        let selected_color = attrs.get("selectedTextStyle").getOrThrow().toString()
//        @Expect(font_color, '{"color":"#FF000000","font":{"size":"18.00fp","weight":"FontWeight.Normal"}}')
//        @Expect(selected_color,'{"color":"#FFFF0000","font":{"size":"20.00fp","weight":"FontWeight.Bolder"}}')
        @Expect(picker2, "TextPicker")
    }
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextpickerDividerEffect(){
        scrollTo("ViewTextPicker")
        let picker = driver.findComponent(On().id("divider_effect")).getOrThrow()
        picker.click()
        picker.scrollToTop()
        let textPicker = driver.waitForComponent(On().id("divider_effect"),500).getOrThrow()
        let picker2 = textPicker.getType()

        let inspector1 = getInspectorByKey("divider_effect")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let font_color1 = attrs1.get("textStyle").getOrThrow().toString()
        let font_color_se = attrs1.get('selectedTextStyle').getOrThrow().toString()
        let divider_style = attrs1.get('divider').getOrThrow().toString()
//        @Expect(divider_style, '{"strokeWidth":"8.00vp","startMargin":"10.00vp","endMargin":"20.00vp","color":"#FFFF0000"}')
//        @Expect(font_color1, '{"color":"#FF000000","font":{"size":"18.00fp","weight":"FontWeight.Normal"}}')
//        @Expect(font_color_se, '{"color":"#FFFF0000","font":{"size":"20.00fp","weight":"FontWeight.Bolder"}}')
        @Expect(picker2, "TextPicker")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextpickerWithNoDividerEffect(){
        scrollTo("ViewTextPicker")
        let picker = driver.findComponent(On().id("no_divider_effect")).getOrThrow()
        picker.click()
        picker.scrollToTop()
        let textPicker = driver.waitForComponent(On().id("no_divider_effect"),500).getOrThrow()
        let picker2 = textPicker.getType()

        let inspector_nse = getInspectorByKey("no_divider_effect")
        let jsonObject_nse = JsonValue.fromStr(inspector_nse).asObject()
        let attrs_nse = jsonObject_nse.get("$attrs").getOrThrow().asObject()
        let divider_style = attrs_nse.get('divider').getOrThrow().toString()
        @Expect(divider_style, '{}')
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testTextpickerFadingEffect(){
        scrollTo("ViewTextPicker")
        let picker = driver.findComponent(On().id("fading_effect")).getOrThrow()
        picker.click()
        picker.scrollToTop()
        let textPicker = driver.waitForComponent(On().id("fading_effect"),500).getOrThrow()
        let picker2 = textPicker.getType()

        let inspector_FE = getInspectorByKey("fading_effect")
        let jsonObject_FE = JsonValue.fromStr(inspector_FE).asObject()
        let attrs_FE = jsonObject_FE.get("$attrs").getOrThrow().asObject()
        let fading_effect_FE = attrs_FE.get("gradientHeight").getOrThrow().toString()
//        @Expect(fading_effect_FE, '"100.00vp"')
        @Expect(picker2, "TextPicker")
    }


    // toggle unittest
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testToggleCommonAttrs() {
        scrollTo("ViewToggle")

        let inspector = getInspectorByKey("my_switchtype_toggle")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-App", "attrs.toString():\t ${attrs.toString()}")

        let selectedColor = attrs.get("selectedColor").getOrThrow().toString()
        @Expect(selectedColor, "\"#FFED6F21\"")
        // switch 类型 toggle switchStyle，backgroundColor，hoverEffect，borderRadius 属性测试
        let switchPointColor = attrs.get("switchPointColor").getOrThrow().toString()
        @Expect(switchPointColor, "\"#E5FFFFFF\"")
//        let pointRadius = attrs.get("pointRadius").getOrThrow().toString()
//        @Expect(pointRadius, "\"15.00vp\"")
//        let trackBorderRadius = attrs.get("trackBorderRadius").getOrThrow().toString()
//        @Expect(trackBorderRadius, "\"5.00vp\"")
//        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
//        @Expect(backgroundColor, "\"#FF008000\"")
//        let hoverEffect = attrs.get("hoverEffect").getOrThrow().toString()
//        @Expect(hoverEffect, "\"HoverEffect.Auto\"")
//        let borderRadius = attrs.get("borderRadius").getOrThrow().toString()
//        @Expect(borderRadius, "\"5.00vp\"")

        // switch 类型 toggle switchStyle，backgroundColor，hoverEffect，borderRadius 属性测试
        let inspector2 = getInspectorByKey("my_switchtype2_toggle")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-App", "attrs.toString():\t ${attrs2.toString()}")

        let switchPointColor2 = attrs2.get("switchPointColor").getOrThrow().toString()
        @Expect(switchPointColor2, "\"#FFFFFFFF\"")
        let pointRadius2 = attrs2.get("pointRadius").getOrThrow().toString()
        @Expect(pointRadius2, "\"8.00vp\"")
        let trackBorderRadius2 = attrs2.get("trackBorderRadius").getOrThrow().toString()
        @Expect(trackBorderRadius2, "\"10.00vp\"")
        let backgroundColor2 = attrs2.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor2, "\"#00000000\"")
        let hoverEffect2 = attrs2.get("hoverEffect").getOrThrow().toString()
        @Expect(hoverEffect2, "\"HoverEffect.Auto\"")
        let borderRadius2 = attrs2.get("borderRadius").getOrThrow().toString()
        @Expect(borderRadius2, "{\"topLeft\":\"0.00vp\",\"topRight\":\"0.00vp\",\"bottomLeft\":\"0.00vp\",\"bottomRight\":\"0.00vp\"}")

        // checkbox 类型 toggle hoverEffect枚举值测试
        let inspector3 = getInspectorByKey("my_checkboxtype_toggle")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let hoverEffect3 = attrs3.get("hoverEffect").getOrThrow().toString()
        @Expect(hoverEffect3, "\"HoverEffect.Scale\"")

        // checkbox 类型 toggle backgroundColor，hoverEffect，borderRadius 属性测试
        let inspector4 = getInspectorByKey("my_checkboxtype2_toggle")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let hoverEffect4 = attrs4.get("hoverEffect").getOrThrow().toString()
        @Expect(hoverEffect4, "\"HoverEffect.Auto\"")

        // button类型 toggle backgroundColor，hoverEffect，borderRadius 属性测试
        let inspector5 = getInspectorByKey("my_buttontype_toggle")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()

        let backgroundColor5 = attrs5.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor5, "\"#0C000000\"")
        let hoverEffect5 = attrs5.get("hoverEffect").getOrThrow().toString()
        @Expect(hoverEffect5, "\"HoverEffect.None\"")
        let borderRadius5 = attrs5.get("borderRadius").getOrThrow().toString()
        @Expect(borderRadius5, "{\"topLeft\":\"65.00px\",\"topRight\":\"65.00px\",\"bottomLeft\":\"65.00px\",\"bottomRight\":\"65.00px\"}")

        let text_begin = driver.findComponent(On().id("my_state")).getOrThrow().getText()
        @Expect(text_begin, "current state is false")

        let toggle = driver.findComponent(On().id("my_switchtype_toggle")).getOrThrow()
        driver.delayMs(200)
        toggle.click()
        driver.delayMs(200)

        let text_end = driver.findComponent(On().id("my_state")).getOrThrow().getText()
        @Expect(text_end, "current state is true")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testAnimationModeSetEdgeEffectSetTabsExample1() {
        scrollTo("ViewTab")
        clickTabsExample("ButtonTabsExample1")

        let animationMode = driver.findComponent(On().id("animationMode")).getOrThrow()
        animationMode.click()
        driver.delayMs(1000)
        @Expect(animationMode.getText().contains("AnimationMode.CONTENT_FIRST"))

        let edgeEffect = driver.findComponent(On().id("edgeEffect")).getOrThrow()
        edgeEffect.click()
        driver.delayMs(500)
        @Expect(edgeEffect.getText().contains("EdgeEffect::SPRING"))
    }


    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testBarBackgroundColorSetBarBackgroundBlurStyleSetBarBackgroundEffectSetTabsExample11() {
        clickTabsExample("ButtonTabsExample11")

        var barBackgroundColor = driver.findComponent(On().id("barBackgroundColor")).getOrThrow()
        barBackgroundColor.click()
        driver.delayMs(1000)
        @Expect(barBackgroundColor.getText(), "\\\"#00000000\\\"")

        var barBackgroundBlurStyle = driver.findComponent(On().id("barBackgroundBlurStyle")).getOrThrow()
        barBackgroundBlurStyle.click()
        driver.delayMs(1000)
        @Expect(driver.findComponent(On().id("barBackgroundBlurStyleText")).getOrThrow().getText().contains("BlurStyle.NONE"))
        @Expect(driver.findComponent(On().id("barBackgroundBlurStyleOptionsText")).getOrThrow().getText(),
            "{\\\"colorMode\\\":\\\"ThemeColorMode.System\\\",\\\"adaptiveColor\\\":\\\"AdaptiveColor.Default\\\",\\\"policy\\\":\\\"BlurStyleActivePolicy.ALWAYS_ACTIVE\\\",\\\"type\\\":\\\"BlurType.WITHIN_WINDOW\\\",\\\"inactiveColor\\\":\\\"#00000000\\\",\\\"scale\\\":1}")
        @Expect(driver.findComponent(On().id("barBackgroundEffectText")).getOrThrow().getText(),
            "{\\\"radius\\\":0,\\\"saturation\\\":0,\\\"brightness\\\":0,\\\"color\\\":\\\"#00000000\\\",\\\"adaptiveColor\\\":\\\"AdaptiveColor.Default\\\",\\\"policy\\\":\\\"BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE\\\",\\\"type\\\":\\\"WITHIN_WINDOW\\\",\\\"inactiveColor\\\":\\\"#00000000\\\",\\\"blurOption\\\":\\\"[0,0]\\\"}")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testBarGridAlignSetOnTabBarClickTabsExample5() {
        clickTabsExample("ButtonTabsExample5")

        var barGridAlign = driver.findComponent(On().id("barGridAlign")).getOrThrow()
        barGridAlign.click()
        driver.delayMs(1000)
        Hilog.info(1,"Cangjie-App", "barGridAlign.getText():${barGridAlign.getText()}")
        @Expect(barGridAlign.getText(), "{\\\"gutter\\\":\\\"24.00vp\\\",\\\"margin\\\":\\\"24.00vp\\\",\\\"sm\\\":\\\"-1\\\",\\\"md\\\":\\\"-1\\\",\\\"lg\\\":\\\"-1\\\"}")

        let smAdd = driver.findComponent(On().id("smAdd")).getOrThrow()
        smAdd.click()
        driver.delayMs(1000)
        smAdd.click()
        driver.delayMs(1000)

        let gridMarginAdd = driver.findComponent(On().id("gridMarginAdd")).getOrThrow()
        gridMarginAdd.click()
        driver.delayMs(1000)

        let gridGutterSub = driver.findComponent(On().id("gridGutterSub")).getOrThrow()
        gridGutterSub.click()
        driver.delayMs(1000)
        gridGutterSub.click()
        driver.delayMs(1000)

        // barGridAlign = driver.findComponent(On().id("barGridAlign")).getOrThrow()
        // barGridAlign.click()
        // driver.delayMs(1000)
        // Hilog.info(1,"Cangjie-App", "barGridAlign.getText():${barGridAlign.getText()}")
        // @Expect(barGridAlign.getText(), "{\\\"gutter\\\":\\\"24.00vp\\\",\\\"margin\\\":\\\"20.00vp\\\",\\\"sm\\\":\\\"2\\\",\\\"md\\\":\\\"-1\\\",\\\"lg\\\":\\\"-1\\\"}")

        driver.findComponent(On().text("3")).getOrThrow().click()
        @Expect(driver.waitForComponent(On().id("onTabBarClickText"),1000).getOrThrow().getText(), "0")
    }


    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testDefaultValueCustomContentTransitionTabsExample7() {
        clickTabsExample("ButtonTabsExample7")

        let defaultValue = driver.findComponent(On().id("defaultValue")).getOrThrow()
        defaultValue.click()

        @Expect(driver.waitForComponent(On().id("barPositionDefaultValue"),1000).getOrThrow().getText(), "\\\"BarPosition.Start\\\"")

        @Expect(driver.findComponent(On().id("indexDefaultValue")).getOrThrow().getText(), "\\\"0\\\"")

        @Expect(driver.findComponent(On().id("verticalDefaultValue")).getOrThrow().getText(), "\\\"false\\\"")

        @Expect(driver.findComponent(On().id("scrollableDefaultValue")).getOrThrow().getText(), "true")

        @Expect(driver.findComponent(On().id("barModeDefaultValue")).getOrThrow().getText(), "\\\"BarMode.Fixed\\\"")

        //        @Expect(driver.findComponent(On().id("barWidthDefaultValue")).getOrThrow().getText(), "\\\"387.692308\\\"")

        @Expect(driver.findComponent(On().id("barHeightDefaultValue")).getOrThrow().getText(), "\\\"56.000000\\\"")

        @Expect(driver.findComponent(On().id("animationDurationDefaultValue")).getOrThrow().getText(), "300")

        @Expect(driver.findComponent(On().id("animationModeDefaultValue")).getOrThrow().getText(), "\\\"AnimationMode.CONTENT_FIRST\\\"")

        @Expect(driver.findComponent(On().id("dividerDefaultValue")).getOrThrow().getText(), "{}")

        @Expect(driver.findComponent(On().id("fadingEdgeDefaultValue")).getOrThrow().getText(), "\\\"true\\\"")

        @Expect(driver.findComponent(On().id("barOverlapDefaultValue")).getOrThrow().getText(), "\\\"false\\\"")

        @Expect(driver.findComponent(On().id("barBackgroundColorDefaultValue")).getOrThrow().getText(), "\\\"#00000000\\\"")

        @Expect(driver.findComponent(On().id("barBackgroundBlurStyleDefaultValue")).getOrThrow().getText(), "\\\"BlurStyle.NONE\\\"")

        @Expect(driver.findComponent(On().id("barGridAlignDefaultValue")).getOrThrow().getText(), "{\\\"gutter\\\":\\\"24.00vp\\\",\\\"margin\\\":\\\"24.00vp\\\",\\\"sm\\\":\\\"-1\\\",\\\"md\\\":\\\"-1\\\",\\\"lg\\\":\\\"-1\\\"}")

        @Expect(driver.findComponent(On().id("edgeEffectDefaultValue")).getOrThrow().getText(), "\\\"EdgeEffect::SPRING\\\"")

        @Expect(driver.findComponent(On().id("barBackgroundEffectDefaultValue")).getOrThrow().getText(), "{\\\"radius\\\":0,\\\"saturation\\\":0,\\\"brightness\\\":0,\\\"color\\\":\\\"#00000000\\\",\\\"adaptiveColor\\\":\\\"AdaptiveColor.Default\\\",\\\"policy\\\":\\\"BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE\\\",\\\"type\\\":\\\"WITHIN_WINDOW\\\",\\\"inactiveColor\\\":\\\"#00000000\\\",\\\"blurOption\\\":\\\"[0,0]\\\"}")

        driver.waitForComponent(On().text("Blue"),1000).getOrThrow().click()

        @Expect(driver.waitForComponent(On().id("from"),1000).getOrThrow().getText(), "0")
        //@Expect(driver.findComponent(On().id("to")).getOrThrow().getText(), "2")
        @Expect(driver.findComponent(On().id("proxyFrom")).getOrThrow().getText(), "0")
        //@Expect(driver.findComponent(On().id("proxyTo")).getOrThrow().getText(), "2")
    }

//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func testOnAnimationStartOnAnimationEndOnGestureSwipeTabsExample9() {
//        scrollTo("ViewTab")
//        clickTabsExample("ButtonTabsExample9")
//
//        driver.findComponent(On().text("yellow")).getOrThrow().click()
//        @Expect(driver.waitForComponent(On().id("startIndex"),1000).getOrThrow().getText(), "0")
//        @Expect(driver.findComponent(On().id("startTargetIndex")).getOrThrow().getText(), "2")
//        @Expect(driver.findComponent(On().id("endIndex")).getOrThrow().getText(), "2")
//        @Expect(driver.findComponent(On().id("gestureIndex")).getOrThrow().getText(), "0")
//    }
//
    func clickTabsExample(id: String) {
        Hilog.error(1,"Cangjie-Test", "scrollTo ${id}")
        driver.waitForComponent(On().id(id),1000).getOrThrow().click()
        driver.delayMs(1000)
    }


    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testOnContentWillChangeTabsExample13() {
        clickTabsExample("ButtonTabsExample13")
        driver.findComponent(On().id("buttonTabsExample13")).getOrThrow().click()
        driver.delayMs(1000)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testBarModeSetTabsExample6() {
        driver.delayMs(500)
        clickTabsExample("ButtonTabsExample6")

        var inspector = getInspectorByKey("TabsExample6")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let barPosition = attrs.get("barPosition").getOrThrow().toString()
        @Expect(barPosition, "\"BarPosition.End\"")

        let index = attrs.get("index").getOrThrow().toString()
        @Expect(index, "\"0\"")

        var barMode = driver.findComponent(On().id("barMode")).getOrThrow()
        barMode.click()
        driver.delayMs(1000)
        var barModeText = driver.findComponent(On().id("barModeText")).getOrThrow()
        @Expect(barModeText.getText(), "\\\"BarMode.Scrollable,{\\\\\\\"margin\\\\\\\":\\\\\\\"0.00vp\\\\\\\",\\\\\\\"nonScrollableLayoutStyle\\\\\\\":\\\\\\\"LayoutStyle.ALWAYS_CENTER\\\\\\\"}\\\"")

        // 文本增加
        let textAdd = driver.findComponent(On().id("textAdd")).getOrThrow()
        textAdd.click()
        textAdd.click()
        driver.delayMs(1000)

        // 左右边距+10
        let scrollMarginAdd = driver.findComponent(On().id("scrollMarginAdd")).getOrThrow()
        scrollMarginAdd.click()
        driver.delayMs(1000)
        barMode.click()
        // barModeText = driver.waitForComponent(On().id("barModeText"),1000).getOrThrow()
        // @Expect(barModeText.getText(), "\\\"BarMode.Scrollable,{\\\\\\\"margin\\\\\\\":\\\\\\\"10.00vp\\\\\\\",\\\\\\\"nonScrollableLayoutStyle\\\\\\\":\\\\\\\"LayoutStyle.ALWAYS_CENTER\\\\\\\"}\\\"")

        // 左右边距-10
        let scrollMarginSub = driver.findComponent(On().id("scrollMarginSub")).getOrThrow()
        scrollMarginSub.click()
        driver.delayMs(1000)
        barMode.click()
        barModeText = driver.waitForComponent(On().id("barModeText"),1000).getOrThrow()
        @Expect(barModeText.getText(), "\\\"BarMode.Scrollable,{\\\\\\\"margin\\\\\\\":\\\\\\\"0.00vp\\\\\\\",\\\\\\\"nonScrollableLayoutStyle\\\\\\\":\\\\\\\"LayoutStyle.ALWAYS_CENTER\\\\\\\"}\\\"")

        let alwaysAverageSplit = driver.findComponent(On().id("alwaysAverageSplit")).getOrThrow()
        alwaysAverageSplit.click()
        driver.delayMs(1000)
        barMode.click()
        barModeText = driver.waitForComponent(On().id("barModeText"),1000).getOrThrow()
        //@Expect(barModeText.getText(), "\\\"BarMode.Scrollable,{\\\\\\\"margin\\\\\\\":\\\\\\\"0.00vp\\\\\\\",\\\\\\\"nonScrollableLayoutStyle\\\\\\\":\\\\\\\"LayoutStyle.ALWAYS_AVERAGE_SPLIT\\\\\\\"}\\\"")

        let alwaysCenter = driver.findComponent(On().id("alwaysCenter")).getOrThrow()
        alwaysCenter.click()
        driver.delayMs(1000)
        barMode.click()
        barModeText = driver.waitForComponent(On().id("barModeText"),1000).getOrThrow()
        @Expect(barModeText.getText(), "\\\"BarMode.Scrollable,{\\\\\\\"margin\\\\\\\":\\\\\\\"0.00vp\\\\\\\",\\\\\\\"nonScrollableLayoutStyle\\\\\\\":\\\\\\\"LayoutStyle.ALWAYS_CENTER\\\\\\\"}\\\"")

        let spaceBetweenOrCenter = driver.findComponent(On().id("spaceBetweenOrCenter")).getOrThrow()
        spaceBetweenOrCenter.click()
        driver.delayMs(1000)
        barMode.click()
        barModeText = driver.waitForComponent(On().id("barModeText"),1000).getOrThrow()
       // @Expect(barModeText.getText(), "\\\"BarMode.Scrollable,{\\\\\\\"margin\\\\\\\":\\\\\\\"0.00vp\\\\\\\",\\\\\\\"nonScrollableLayoutStyle\\\\\\\":\\\\\\\"LayoutStyle.SPACE_BETWEEN_OR_CENTER\\\\\\\"}\\\"")
    }

}
