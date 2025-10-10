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
import std.convert.*
import std.math.abs
import ohos.ui_test.*

@Test
class CanvasDrawingUT11 {
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
        scrollBar.scrollSearch(On().id("CanvasDrawingIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testSearch() {
        scrollTo("ViewCanvas")

        let inspector = getInspectorByKey("MyCanvas")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1,"Cangjie-App", "aaaa: ${attrs.toString()}")

        let testWidth = attrs.get("width").getOrThrow().toString()
        @Expect(testWidth, "\"500.00vp\"")

        let testHeight = attrs.get("height").getOrThrow().toString()
        @Expect(testHeight, "\"300.00vp\"")

        let testBackgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(testBackgroundColor, "\"#FFFFFF00\"")

        let otherInspector = getInspectorByKey("Mytext")
        let otherJsonObject = JsonValue.fromStr(otherInspector).asObject()
        let otherContent = otherJsonObject.get("$attrs").getOrThrow().asObject()
        let finalContent = otherContent.get("content")
        let optionContent = finalContent.getOrThrow()
        let maxContent = optionContent.toString()
        @Expect(maxContent, "\"1\"")
    }


    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testCurves1() {
        scrollTo("ViewCurves")

        let button = driver.findComponent(On().id("normal_case1")).getOrThrow()
        button.click()
        var resultStr = driver.waitForComponent(On().id("case1"),1000).getOrThrow().getText()
        approxEquals(0.3, resultStr)
        resultStr = driver.findComponent(On().id("case5")).getOrThrow().getText()
        approxEquals(0.0, resultStr)
        resultStr = driver.findComponent(On().id("case10")).getOrThrow().getText()
        approxEquals(0.296779, resultStr)
        resultStr = driver.findComponent(On().id("case15")).getOrThrow().getText()
        approxEquals(0.134864, resultStr)
        resultStr = driver.findComponent(On().id("case20")).getOrThrow().getText()
        approxEquals(0.103251, resultStr)

        let button2 = driver.findComponent(On().id("normal_case2")).getOrThrow()
        button2.click()
        resultStr = driver.waitForComponent(On().id("case5"),1000).getOrThrow().getText()
        approxEquals(0.0, resultStr)
        resultStr = driver.findComponent(On().id("case10")).getOrThrow().getText()
        approxEquals(0.801992, resultStr)
        resultStr = driver.findComponent(On().id("case15")).getOrThrow().getText()
        approxEquals(0.775581, resultStr)
        resultStr = driver.findComponent(On().id("case20")).getOrThrow().getText()
        approxEquals(0.641802, resultStr)

        let button3 = driver.findComponent(On().id("edge_case1")).getOrThrow()
        button3.click()
        resultStr = driver.waitForComponent(On().id("case5"),1000).getOrThrow().getText()
        approxEquals(0.0, resultStr)
        resultStr = driver.findComponent(On().id("case10")).getOrThrow().getText()
        approxEquals(0.000295, resultStr)
        resultStr = driver.findComponent(On().id("case15")).getOrThrow().getText()
        approxEquals(0.000001, resultStr)
        resultStr = driver.findComponent(On().id("case20")).getOrThrow().getText()
        approxEquals(0.000001, resultStr)

        let button4 = driver.findComponent(On().id("edge_case2")).getOrThrow()
        button4.click()
        resultStr = driver.waitForComponent(On().id("case5"),1000).getOrThrow().getText()
        approxEquals(0.0, resultStr)
        resultStr = driver.findComponent(On().id("case10")).getOrThrow().getText()
        approxEquals(1.0, resultStr)
        resultStr = driver.findComponent(On().id("case16")).getOrThrow().getText()
        approxEquals(1.0, resultStr)
        resultStr = driver.findComponent(On().id("case19")).getOrThrow().getText()
        approxEquals(0.999997, resultStr)

        let button5 = driver.findComponent(On().id("edge_case3")).getOrThrow()
        button5.click()
        resultStr = driver.waitForComponent(On().id("case2"),1000).getOrThrow().getText()
        approxEquals(0.014641, resultStr)
        resultStr = driver.findComponent(On().id("case7")).getOrThrow().getText()
        approxEquals(0.0, resultStr)
        resultStr = driver.findComponent(On().id("case12")).getOrThrow().getText()
        approxEquals(0.000725, resultStr)
        resultStr = driver.findComponent(On().id("case17")).getOrThrow().getText()
        approxEquals(0.002869, resultStr)
        driver.delayMs(600)
    }

    func approxEquals(expected: Float32, actualStr: String) {
        let actual = Float32.parse(actualStr)
        @Expect(abs(expected - actual) < 1e-4)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testEllipseCtor() {
        scrollTo("ViewEllipse")
        let ellipse_1 = driver.findComponent(On().id("ellipse_1")).getOrThrow().getType()
        @Expect(ellipse_1, "Ellipse")

        let ellipse_2 = driver.findComponent(On().id("ellipse_2")).getOrThrow().getType()
        @Expect(ellipse_2, "Ellipse")
        driver.delayMs(600)
    }


    // image unittest
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageCustomAttrs() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageCustomAttrs started")

        let inspector = getInspectorByKey("Image_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let typeInfo = jsonObject.get("$type").getOrThrow().asString()

        let alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "alt: " + alt)
        @Expect(alt.contains("resource:///"))

        let objectFit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "objectFit: " + objectFit)
        @Expect(objectFit, "\"ImageFit.None\"")

        let objectRepeat = attrs.get("objectRepeat").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "objectRepeat: " + objectRepeat)
        @Expect(objectRepeat, "\"ImageRepeat.XY\"")

        let interpolation = attrs.get("interpolation").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "interpolation: " + interpolation)
        @Expect(interpolation, "\"ImageInterpolation.High\"")

        let renderMode = attrs.get("renderMode").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "renderMode: " + renderMode)
        @Expect(renderMode, "\"ImageRenderMode.Template\"")

        let sourceSize = attrs.get("sourceSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "sourceSize: " + sourceSize)
        @Expect(sourceSize, "\"[260.00 x 260.00]\"")

        let syncLoad = attrs.get("syncLoad").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "syncLoad: " + syncLoad)
        @Expect(syncLoad, "\"true\"")

        let autoResize = attrs.get("autoResize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "autoResize: " + autoResize)
        @Expect(autoResize, "\"true\"")

        let matchTextDirection = attrs.get("matchTextDirection").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "matchTextDirection: " + matchTextDirection)
        @Expect(matchTextDirection, "\"true\"")

        let fitOriginalSize = attrs.get("fitOriginalSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fitOriginalSize: " + fitOriginalSize)
        @Expect(fitOriginalSize, "\"true\"")

//        let colorFilter = attrs.get("colorFilter").getOrThrow().toString()
//        Hilog.info(1,"Cangjie-Test", "colorFilter: " + colorFilter)
//        @Expect(colorFilter, "\"1.500000 0.000000 0.000000 0.000000 0.000000 " +
//                                "0.000000 0.500000 0.000000 0.000000 0.000000 " +
//                                "0.000000 0.000000 0.500000 0.000000 0.000000 " +
//                                "0.000000 0.000000 0.000000 1.000000 0.000000 \"")

        let copyOption = attrs.get("copyOption").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "copyOption: " + copyOption)
        @Expect(copyOption, "\"CopyOptions.None\"")

        let draggable = attrs.get("draggable").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "draggable: " + draggable)
        @Expect(draggable, "\"true\"")

        let border = attrs.get("borderRadius").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "border: " + border)
        @Expect(border, "\"4.00vp\"")

        let inspector3 = getInspectorByKey("Image_10")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let typeInfo3 = jsonObject3.get("$type").getOrThrow().asString()
        let tempmode2 = attrs3.get("dynamicRangeMode").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "tempmode2: " + tempmode2)
        @Expect(tempmode2, "\"STANDARD\"")
        driver.delayMs(1500)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageCustomAttrs2() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageCustomAttrs started")

        let inspector = getInspectorByKey("Image_None")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let interpolation = attrs.get("interpolation").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "interpolation: " + interpolation)
        @Expect(interpolation, "\"ImageInterpolation.None\"")

        let inspector2 = getInspectorByKey("Image_Medium")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let interpolation2 = attrs2.get("interpolation").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "interpolation: " + interpolation2)
        @Expect(interpolation2, "\"ImageInterpolation.Medium\"")

        let inspector3 = getInspectorByKey("Image_Low")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let interpolation3 = attrs3.get("interpolation").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "interpolation: " + interpolation3)
        @Expect(interpolation3, "\"ImageInterpolation.Low\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageInit() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageInit started")

        //init(AppResource)
        var inspector = getInspectorByKey("Image_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var typeInfo = jsonObject.get("$type").getOrThrow().asString()
        var src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "src1: " + src + "\n" + "type1: " + typeInfo.toString())
        @Expect(src.contains("resource:///"))
        @Expect(typeInfo.toString(), "\"Image\"")

        //init(String)
        inspector = getInspectorByKey("Image_3")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        typeInfo = jsonObject.get("$type").getOrThrow().asString()
        src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "src2: " + src + "\n" + "type2: " + typeInfo.toString())
        @Expect(src, "\"file:////fake/path/src\"")
        @Expect(typeInfo.toString(), "\"Image\"")

        //init(PixelMap)
        inspector = getInspectorByKey("Image_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        typeInfo = jsonObject.get("$type").getOrThrow().asString()
        src = attrs.get("src").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "src3: " + src + "\n" + "type3: " + typeInfo.toString())
        @Expect(src, "\"\"")
        @Expect(typeInfo.toString(), "\"Image\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageAlt() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageAlt started")

        //alt(AppResource)
        var inspector = getInspectorByKey("Image_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "alt1: " + alt)
        @Expect(alt.contains("resource:///"))

        //alt(String)
        inspector = getInspectorByKey("Image_3")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        alt = attrs.get("alt").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "alt2: " + alt)
        @Expect(alt, "\"file:////fake/path/alt\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageSourceSize() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageSourceSize started")

        //sourceSize(Length, Length)
        var inspector = getInspectorByKey("Image_2")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var sourceSize = attrs.get("sourceSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "sourceSize1: " + sourceSize)
        @Expect(sourceSize, "\"[260.00 x 260.00]\"")

        //sourceSize(Float64, Float64)
        inspector = getInspectorByKey("Image_6")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        sourceSize = attrs.get("sourceSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "sourceSize2: " + sourceSize)
        @Expect(sourceSize, "\"[260.00 x 260.00]\"")

        //sourceSize(Int64, Int64)
        inspector = getInspectorByKey("Image_7")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        sourceSize = attrs.get("sourceSize").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "sourceSize3: " + sourceSize)
        @Expect(sourceSize, "\"[260.00 x 260.00]\"")
    }

     @TestCase
     @Tag[APILevel19, TestLevel0]
    func testImageFillColor() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageFillColor started")
        //fillColor(Color)
        var inspector = getInspectorByKey("Image_2")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var fillColor = attrs.get("fillColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fillColor1: " + fillColor)
        @Expect(fillColor, "\"#FF0000FF\"")

        //fillColor(UInt32)
        inspector = getInspectorByKey("Image_6")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        fillColor = attrs.get("fillColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fillColor2: " + fillColor)
        @Expect(fillColor, "\"#FFFF00FF\"")

        // fillColor(AppResource)
        inspector = getInspectorByKey("Image_7")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        fillColor = attrs.get("fillColor").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "fillColor3: " + fillColor)
        @Expect(fillColor, "\"#FFFF0000\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageObjectFitFill() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageObjectFitFill started")

        var inspector = getInspectorByKey("Image_10")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        var objectFit = attrs.get("objectFit").getOrThrow().toString()
        Hilog.info(1,"Cangjie-Test", "objectFit: ${objectFit}")
        @Expect(objectFit, "\"ImageFit.Fill\"")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageEvent() {
        scrollTo("ViewImage")
        Hilog.error(1,"Cangjie-Test", "test_imageEvent started")
        let image_1_onComplete = driver.findComponent(On().id("image_1_onComplete")).getOrThrow().getText()
        Hilog.info(1,"Cangjie-Test", "image_1_onComplete: " + image_1_onComplete)
        @Expect(image_1_onComplete, "Some(144.000000), Some(144.000000), Some(650.000000), Some(325.000000), Some(1), Some(650.000000), Some(325.000000), Some(0.000000), Some(0.000000)")

        let image1 = driver.findComponent(On().id("Image_1")).getOrThrow()
        image1.click()
        let image_1_onClick = driver.waitForComponent(On().id("image_1_onClick"),1000).getOrThrow().getText()
        Hilog.info(1,"Cangjie-Test", "image_1_onClick: " + image_1_onClick)
        @Expect(image_1_onClick, "image1")

        let image_2_onFinish = driver.waitForComponent(On().id("image_2_onFinish"),1000).getOrThrow().getText()
        Hilog.info(1,"Cangjie-Test", "image_2_onFinish: " + image_2_onFinish)
        @Expect(image_2_onFinish, "Finished.")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testImageEffectComponent001() {
        scrollTo("ViewImageEffect")

        let Inspector = getInspectorByKey("blur")
        let obj = JsonValue.fromStr(Inspector).asObject()
        let aar = Inspector.split("useShadowBatching")
        for (i in aar) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_001] Inspector value:  ${i}")
        }
        let obj_borderStyle = obj.get("$attrs").getOrThrow().asObject().get("blur").getOrThrow().toString()
        @Expect(obj_borderStyle,"3")

        let backdropBlur = getInspectorByKey("backdropBlur")
        let obj1 = JsonValue.fromStr(backdropBlur).asObject()
        let aar1 = backdropBlur.split("useShadowBatching")
        for (i in aar1) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_002] Inspector value:  ${i}")
        }
        let obj_borderStyle1 = obj1.get("$attrs").getOrThrow().asObject().get("backdropBlur").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_002] borderStyle value: ${obj_borderStyle1}")
        @Expect(obj_borderStyle1,"3")

        let Inspector2 = getInspectorByKey("shadow")
        let obj2 = JsonValue.fromStr(Inspector2).asObject()
        let aar2 = Inspector2.split("useShadowBatching")
        for (i in aar2) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_003] Inspector value:  ${i}")
        }
        let obj_borderStyle2 = obj2.get("$attrs").getOrThrow().asObject().get("shadow").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_003] borderStyle value: ${obj_borderStyle2}")
        @Expect(obj_borderStyle2.contains("10"))

        let Inspector4 = getInspectorByKey("grayscale")
        let obj4 = JsonValue.fromStr(Inspector4).asObject()
        let aar4 = Inspector4.split("useShadowBatching")
        for (i in aar4) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_004] Inspector value:  ${i}")
        }
        let obj_borderStyle4 = obj4.get("$attrs").getOrThrow().asObject().get("grayscale").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_004] borderStyle value: ${obj_borderStyle4}")
        @Expect(obj_borderStyle4,"0.300000")

        let Inspector5 = getInspectorByKey("colorBlend")
        let obj5 = JsonValue.fromStr(Inspector5).asObject()
        let aar5 = Inspector5.split("useShadowBatching")
        for (i in aar5) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_005] Inspector value:  ${i}")
        }
        let obj_borderStyle5 = obj5.get("$attrs").getOrThrow().asObject().get("colorBlend").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_005] borderStyle value: ${obj_borderStyle5}")
        @Expect(obj_borderStyle5.contains("#FF008000"))

        let Inspector6 = getInspectorByKey("brightness")
        let obj6 = JsonValue.fromStr(Inspector6).asObject()
        let aar6 = Inspector6.split("useShadowBatching")
        for (i in aar6) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_006] Inspector value:  ${i}")
        }
        let obj_borderStyle6 = obj6.get("$attrs").getOrThrow().asObject().get("brightness").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_005] borderStyle value: ${obj_borderStyle6}")
        @Expect(obj_borderStyle6.contains("1.80000"))

        let Inspector7 = getInspectorByKey("saturate")
        let obj7 = JsonValue.fromStr(Inspector7).asObject()
        let aar7 = Inspector7.split("useShadowBatching")
        for (i in aar7) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_007] Inspector value:  ${i}")
        }
        let obj_borderStyle7 = obj7.get("$attrs").getOrThrow().asObject().get("saturate").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_007] borderStyle value: ${obj_borderStyle7}")
        @Expect(obj_borderStyle7.contains("2"))

        let Inspector8 = getInspectorByKey("contrast")
        let obj8 = JsonValue.fromStr(Inspector8).asObject()
        let aar8 = Inspector8.split("useShadowBatching")
        for (i in aar8) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_008] Inspector value:  ${i}")
        }
        let obj_borderStyle8 = obj8.get("$attrs").getOrThrow().asObject().get("contrast").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_008] borderStyle value: ${obj_borderStyle8}")
        @Expect(obj_borderStyle8,"2")

        let Inspector9 = getInspectorByKey("invert")
        let obj9 = JsonValue.fromStr(Inspector9).asObject()
        let aar9 = Inspector9.split("useShadowBatching")
        for (i in aar9) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_009] Inspector value:  ${i}")
        }
        let obj_borderStyle9 = obj9.get("$attrs").getOrThrow().asObject().get("invert").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_009] borderStyle value: ${obj_borderStyle9}")
        @Expect(obj_borderStyle9,"0.200000")

        let Inspector10 = getInspectorByKey("invert")
        let obj10 = JsonValue.fromStr(Inspector10).asObject()
        let aar10 = Inspector10.split("useShadowBatching")
        for (i in aar10) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_010] Inspector value:  ${i}")
        }
        let obj_borderStyle10 = obj10.get("$attrs").getOrThrow().asObject().get("invert").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_010] borderStyle value: ${obj_borderStyle10}")
        @Expect(obj_borderStyle10,"0.200000")

        let Inspector11 = getInspectorByKey("sepia")
        let obj11 = JsonValue.fromStr(Inspector11).asObject()
        let aar11 = Inspector11.split("useShadowBatching")
        for (i in aar11) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_011] Inspector value:  ${i}")
        }
        let obj_borderStyle11 = obj11.get("$attrs").getOrThrow().asObject().get("sepia").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_011] borderStyle value: ${obj_borderStyle11}")
        @Expect(obj_borderStyle11,"0.800000")

        let Inspector12 = getInspectorByKey("hueRotate")
        let obj12 = JsonValue.fromStr(Inspector12).asObject()
        let aar12 = Inspector12.split("useShadowBatching")
        for (i in aar12) {
            Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_012] Inspector value:  ${i}")
        }
        let obj_borderStyle12 = obj12.get("$attrs").getOrThrow().asObject().get("hueRotate").getOrThrow().toString()
        Hilog.info(1,"Cangjie-App", "[Test_ImageEffect_Component_012] borderStyle value: ${obj_borderStyle12}")
        @Expect(obj_borderStyle12,"90")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testViewImageEffect2001() {
        scrollTo("ViewImageEffect2")

        let Inspector = getInspectorByKey("test_pixelStretchEffect")
        let jsonObject = JsonValue.fromStr(Inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let pixelStretchEffect = attrs.get("pixelStretchEffect").getOrThrow().toString()
        @Expect(pixelStretchEffect, "{\"left\":\"0.00px\",\"right\":\"0.00px\",\"top\":\"0.00px\",\"bottom\":\"0.00px\"}")

        let Inspector2 = getInspectorByKey("test_blendMode")
        let jsonObject2 = JsonValue.fromStr(Inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let blendMode = attrs2.get("blendMode").getOrThrow().toString()
        @Expect(blendMode, "0")

        let Inspector3 = getInspectorByKey("test_renderGroup")
        let jsonObject3 = JsonValue.fromStr(Inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let renderGroup = attrs3.get("renderGroup").getOrThrow().toString()
        @Expect(renderGroup, "\"false\"")

        let Inspector4 = getInspectorByKey("test_lightUpEffect")
        let jsonObject4 = JsonValue.fromStr(Inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        let lightUpEffect = attrs4.get("lightUpEffect").getOrThrow().toString()
        @Expect(lightUpEffect, "0")

        let Inspector5 = getInspectorByKey("test_sphericalEffect")
        let jsonObject5 = JsonValue.fromStr(Inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let sphericalEffect = attrs5.get("sphericalEffect").getOrThrow().toString()
        @Expect(sphericalEffect, "0")

        let Inspector7 = getInspectorByKey("test_useShadowBatching")
        let jsonObject7 = JsonValue.fromStr(Inspector7).asObject()
        let attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()
        let useShadowBatching = attrs7.get("useShadowBatching").getOrThrow().toString()
        @Expect(useShadowBatching, "\"false\"")

        let Inspector9 = getInspectorByKey("test_invert")
        let jsonObject9 = JsonValue.fromStr(Inspector9).asObject()
        let attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()
        let invert = attrs9.get("invert").getOrThrow().toString()
        @Expect(invert, "{\"low\":0.2,\"high\":0.5,\"threshold\":0.3,\"thresholdRange\":0.2}")

        let Inspector11 = getInspectorByKey("test_invert2")
        let jsonObject11 = JsonValue.fromStr(Inspector11).asObject()
        let attrs11 = jsonObject11.get("$attrs").getOrThrow().asObject()
        let invert2 = attrs11.get("invert").getOrThrow().toString()
        @Expect(invert2, "1")
    }
}
