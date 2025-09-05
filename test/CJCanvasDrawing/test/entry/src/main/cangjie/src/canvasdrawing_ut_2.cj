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
class CanvasDrawingUT2 {
    prop driver: Driver {
        get() {
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
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("CanvasDrawingIndex2"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLine1() {
        scrollTo("ViewLine")
        let inspector = getInspectorByKey("line_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"200.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"150.00vp\"")

        let startPoint = attrs.get("startPoint").getOrThrow().toString()
        @Expect(startPoint, "[0,0]")

        let endPoint = attrs.get("endPoint").getOrThrow().toString()
        @Expect(endPoint, "[50,100]")

        let stroke = attrs.get("stroke").getOrThrow().toString()
        @Expect(stroke, "\"#FF000000\"")

        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor, "\"#FFF5F5F5\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLine2() {
        scrollTo("ViewLine")
        let inspector = getInspectorByKey("line_2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"200.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"150.00vp\"")

        let startPoint = attrs.get("startPoint").getOrThrow().toString()
        @Expect(startPoint, "[50,50]")

        let endPoint = attrs.get("endPoint").getOrThrow().toString()
        @Expect(endPoint, "[150,150]")

        let stroke = attrs.get("stroke").getOrThrow().toString()
        @Expect(stroke, "\"#FFE4080A\"")

        let strokeOpacity = attrs.get("strokeOpacity").getOrThrow().toString()
        @Expect(strokeOpacity, "\"0.500000\"")

        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor, "\"#FFF5F5F5\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLine3() {
        scrollTo("ViewLine")
        let inspector = getInspectorByKey("line_3")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"200.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"150.00vp\"")

        let startPoint = attrs.get("startPoint").getOrThrow().toString()
        @Expect(startPoint, "[0,0]")

        let endPoint = attrs.get("endPoint").getOrThrow().toString()
        @Expect(endPoint, "[100,100]")

        let stroke = attrs.get("stroke").getOrThrow().toString()
        @Expect(stroke, "\"#FF000000\"")

        let strokeDashArray = attrs.get("strokeDashArray").getOrThrow().toString()
        @Expect(strokeDashArray,"[\"10.00vp\",\"3.00vp\"]")

        let strokeDashOffset = attrs.get("strokeDashOffset").getOrThrow().toString()
        @Expect(strokeDashOffset, "\"5.00vp\"")

        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor, "\"#FFF5F5F5\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLine4() {
        scrollTo("ViewLine")
        let inspector = getInspectorByKey("line_4")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let width = attrs.get("width").getOrThrow().toString()
        @Expect(width, "\"50.00vp\"")

        let height = attrs.get("height").getOrThrow().toString()
        @Expect(height, "\"50.00vp\"")

        let startPoint = attrs.get("startPoint").getOrThrow().toString()
        @Expect(startPoint, "[0,0]")

        let endPoint = attrs.get("endPoint").getOrThrow().toString()
        @Expect(endPoint, "[100,100]")

        let stroke = attrs.get("stroke").getOrThrow().toString()
        @Expect(stroke, "\"#FF000000\"")

        let strokeDashArray = attrs.get("strokeDashArray").getOrThrow().toString()
        @Expect(strokeDashArray,"[\"10.00vp\",\"3.00vp\"]")

        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        @Expect(backgroundColor, "\"#FFF5F5F5\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testPath() {
        scrollTo("ViewPath")

        var inspector = getInspectorByKey("path_1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let commands = attrs.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands: ${commands}")
        @Expect(commands, "\"\"")

        var path_2 = getInspectorByKey("path_2")
        var jsonObject2 = JsonValue.fromStr(path_2).asObject()
        var attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()

        let commands2 = attrs2.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands2: ${commands2}")
        @Expect(commands2, "\"\"")
        let width2 = attrs2.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width2: ${width2}")
        @Expect(width2, "\"600.00vp\"")
        let height2 = attrs2.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height2: ${height2}")
        @Expect(height2, "\"20.00vp\"")

        var path_3 = getInspectorByKey("path_3")
        var jsonObject3 = JsonValue.fromStr(path_3).asObject()
        var attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()

        let commands3 = attrs3.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands3: ${commands3}")
        @Expect(commands3, "\"\"")
        let width3 = attrs3.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width3: ${width3}")
        @Expect(width3, "\"600.00vp\"")
        let height3 = attrs3.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height3: ${height3}")
        @Expect(height3, "\"30.00vp\"")

        var path_4 = getInspectorByKey("path_4")
        var jsonObject4 = JsonValue.fromStr(path_4).asObject()
        var attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()

        let commands4 = attrs4.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands4: ${commands4}")
        @Expect(commands4, "\"\"")
        let width4 = attrs4.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width4: ${width4}")
        @Expect(width4, "\"600.00vp\"")
        let height4 = attrs4.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height4: ${height4}")
        @Expect(height4, "\"40.00vp\"")

        var path_5 = getInspectorByKey("path_5")
        var jsonObject5 = JsonValue.fromStr(path_5).asObject()
        var attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()

        let commands5 = attrs5.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands5: ${commands5}")
        @Expect(commands5, "\"M0 0 L600 0\"")

        var path_6 = getInspectorByKey("path_6")
        var jsonObject6 = JsonValue.fromStr(path_6).asObject()
        var attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()

        let commands6 = attrs6.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands6: ${commands6}")
        @Expect(commands6, "\"M0 0 L600 0\"")
        let width6 = attrs6.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width6: ${width6}")
        @Expect(width6, "\"600.00vp\"")
        let height6 = attrs6.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height6: ${height6}")
        @Expect(height6, "\"20.00vp\"")

        var path_7 = getInspectorByKey("path_7")
        var jsonObject7 = JsonValue.fromStr(path_7).asObject()
        var attrs7 = jsonObject7.get("$attrs").getOrThrow().asObject()

        let commands7 = attrs7.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands7: ${commands7}")
        @Expect(commands7, "\"M0 0 L600 0\"")
        let width7 = attrs7.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width7: ${width7}")
        @Expect(width7, "\"600.00vp\"")
        let height7 = attrs7.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height7: ${height7}")
        @Expect(height7, "\"30.00vp\"")

        var path_8 = getInspectorByKey("path_8")
        var jsonObject8 = JsonValue.fromStr(path_8).asObject()
        var attrs8 = jsonObject8.get("$attrs").getOrThrow().asObject()

        let commands8 = attrs8.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands8: ${commands8}")
        @Expect(commands8, "\"M0 0 L600 0\"")
        let width8 = attrs8.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width8: ${width8}")
        @Expect(width8, "\"600.00vp\"")
        let height8 = attrs8.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height8: ${height8}")
        @Expect(height8, "\"40.00vp\"")

        var path_9 = getInspectorByKey("path_9")
        var jsonObject9 = JsonValue.fromStr(path_9).asObject()
        var attrs9 = jsonObject9.get("$attrs").getOrThrow().asObject()

        let commands9 = attrs9.get("commands").getOrThrow().toString()
        Hilog.info(1,"1","1","commands9: ${commands9}")
        @Expect(commands9, "\"M0 0 L600 0\"")
        let width9 = attrs9.get("width").getOrThrow().toString()
        Hilog.info(1,"1","1","width9: ${width9}")
        @Expect(width9, "\"600.00vp\"")
        let height9 = attrs9.get("height").getOrThrow().toString()
        Hilog.info(1,"1","1","height9: ${height9}")
        @Expect(height9, "\"20.00vp\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testShape() {
        scrollTo("ViewShape")
        let ShapeView = driver.findComponent(On().id("RectTest"))
        ShapeView?.click()
        driver.delayMs(200)
        let inspector = getInspectorByKey("RectTest")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let fill = attrs.get("fill").getOrThrow().toString()
        let stroke = attrs.get("stroke").getOrThrow().toString()

        @Expect(fill,'"#FF317AF7"')
        @Expect(stroke,'"#FF000000"')
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testOffsetShape() {
        scrollTo("ViewShape")
        let GetSurfaceId = driver.findComponent(On().id("OffsetTest"))
        GetSurfaceId?.click()
        driver.delayMs(200)
        let inspector = getInspectorByKey("OffsetTest")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let offset = attrs.get("offset").getOrThrow().toString()
        let stroke = attrs.get("stroke").getOrThrow().toString()
        @Expect(offset,'{"x":"0.00vp","y":"60.00vp"}')
        @Expect(stroke,'"#FF000000"')
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testMiterShape() {
        scrollTo("ViewShape")
        let GetSurfaceId = driver.findComponent(On().id("PathTest"))
        GetSurfaceId?.click()
        driver.delayMs(200)
        let inspector = getInspectorByKey("PathTest")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let fill = attrs.get("fill").getOrThrow().toString()
        let stroke = attrs.get("stroke").getOrThrow().toString()
        let mit = attrs.get("strokeMiterLimit").getOrThrow().toString()
        @Expect(fill,"\"#FF317AF7\"")
        @Expect(stroke,"\"#FFEE8443\"")
        @Expect(mit,"\"5.000000\"")
    }

    @TestCase
     @Tag[APILevel12, TestLevel0]
    func testSizeLength() {
        scrollTo("ViewShape")
        let GetSurfaceId = driver.findComponent(On().id("SizeLengthTest"))
        GetSurfaceId?.click()
        driver.delayMs(200)
        let inspector = getInspectorByKey("SizeLengthTest")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let fill = attrs.get("fill").getOrThrow().toString()
        @Expect(fill,"\"#FF317AF7\"")
    }

    // shape clip
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testShapeClipAttrs1() {
        scrollTo("ViewShapeClip")

        let inspector = getInspectorByKey("test_row_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip, "\"true\"")

        let image1 = getInspectorByKey("image1")
        let jsonObject2 = JsonValue.fromStr(image1).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let clip2 = attrs2.get("clip").getOrThrow().toString()
        @Expect(clip2, "\"{\\\"shape\\\":\\\"Circle\\\"}\"")

        let image2 = getInspectorByKey("image2")
        let jsonObject3 = JsonValue.fromStr(image2).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let mask3 = attrs3.get("mask").getOrThrow().toString()
        @Expect(mask3, "{\"shape\":\"Rect\"}")

        let image3 = getInspectorByKey("image3")
        let jsonObject4 = JsonValue.fromStr(image3).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        let mask4 = attrs4.get("mask").getOrThrow().toString()
        @Expect(mask4, "{\"shape\":\"Circle\"}")
    }

    // 获取文本内容
    func getContent(id: String): String {
        let strJson = getInspectorByKey(id)
        let obj = JsonValue.fromStr(strJson).asObject()
        let attrsInfo = obj.get("$attrs").getOrThrow().asObject()
        return attrsInfo.get("content").getOrThrow().toString()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testCanvas3() {
        scrollTo("ViewCanvasRenderingContext2D")
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollToBottom(speed: 15000)
        driver.delayMs(3000)
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testCanvas2() {
        scrollTo("ViewCanvas2")

        var text = driver.findComponent(On().id("height_width1")).getOrThrow().getText()
        @Expect(text, "136.307692 109.230769")

        text = driver.findComponent(On().id("height_width2")).getOrThrow().getText()
        @Expect(text, "100.000000 100.000000")

        text = driver.findComponent(On().id("height_color")).getOrThrow().getText()
        @Expect(text, "325 255")

        text = driver.findComponent(On().id("size")).getOrThrow().getText()
        @Expect(text, "1.000000 1.000000 -0.500000 0.500000 10.000000 10.000000")

        text = driver.findComponent(On().id("size1")).getOrThrow().getText()
        @Expect(text, "0.800000 0.800000 0.400000 -0.400000 -12.000000 -4.000000")

        var compont1 = driver.findComponent(On().id("height_width1")).getOrThrow()
        var compont2 = driver.findComponent(On().id("size1")).getOrThrow()
        compont2.dragTo(compont1)

        text = driver.waitForComponent(On().id("size2"),1500).getOrThrow().getText()
        @Expect(text, "1.000000 1.000000 0.000000 0.000000 0.000000 0.000000")

        text = driver.findComponent(On().id("size3")).getOrThrow().getText()
        @Expect(text, "1.000000 1.000000 0.000000 0.000000 100.000000 100.000000")

        text = driver.findComponent(On().id("size4")).getOrThrow().getText()
        @Expect(text, "0.500000 0.500000 0.000000 0.000000 100.000000 100.000000")

        text = driver.findComponent(On().id("size5")).getOrThrow().getText()
        @Expect(text, "0.250230 0.250230 0.432880 -0.432880 99.084454 103.413255")

        compont1 = driver.findComponent(On().id("size5")).getOrThrow()
        compont2 = driver.findComponent(On().text("Click to set transform")).getOrThrow()
        compont2.dragTo(compont1)
    }
}
