/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ohos.device_info.*
import ohos.hilog.*
import std.convert.*

@Test
class CanvasUTContext2DImage {
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
                driver.delayMs(800)
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
    
    func getContent(id: String): String {
        let strJson = getInspectorByKey(id)
        let obj = JsonValue.fromStr(strJson).asObject()
        let attrsInfo = obj.get("$attrs").getOrThrow().asObject()
        return attrsInfo.get("content").getOrThrow().toString()
    }
    
    func getFloat64FromText(id: String): Float64 {
        let str = getContent(id)
        return Float64.parse(str.trimAscii().removePrefix('"').removeSuffix('"'))
    }
    
    func hasComponent(id: String): Bool {
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollSearch(On().id(id))
        return driver.findComponent(On().id(id)).isSome()
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("CanvasDrawingImage"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        // driver.pressBack()
    }

    // createPattern
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreatePatternNormal1() {
        scrollTo("ViewCanvasContext2DCreatePattern")
        @Expect(hasComponent("canvasContext2DCreatePatternNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreatePatternNormal2() {
        @Expect(hasComponent("canvasContext2DCreatePatternNormal2"), true)
        driver.pressBack()
    }

    // drawImage imagebitmap 2 parmas
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap2ParamsNormal1() {
        scrollTo("ViewCanvasContext2DDrawImageImageBitMap2Params")
        @Expect(hasComponent("canvasContext2DDrawImageNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap2ParamsNormal2() {
        @Expect(hasComponent("canvasContext2DDrawImageNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap2ParamsNone() {
        @Expect(hasComponent("canvasContext2DDrawImageNone"), true)
        driver.pressBack()
    }
    // drawImage imagebitmap 4 parmas 
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap4ParamsNormal1() {
        scrollTo("ViewCanvasContext2DDrawImageImageBitMap4Params")
        @Expect(hasComponent("canvasContext2DDrawImageNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap4ParamsNormal2() {
        @Expect(hasComponent("canvasContext2DDrawImageNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageIm0ageBitMap4ParamsException1() {
        @Expect(hasComponent("canvasContext2DDrawImageException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap4ParamsException2() {
        @Expect(hasComponent("canvasContext2DDrawImageException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap4ParamsNone() {
        @Expect(hasComponent("canvasContext2DDrawImageNone"), true)
        driver.pressBack()
    }
    
    // drawImage imagebitmap 6 parmas 
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap6ParamsNormal1() {
        scrollTo("ViewCanvasContext2DDrawImageImageBitMap6Params")
        @Expect(hasComponent("canvasContext2DDrawImageNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap6ParamsNormal2() {
        @Expect(hasComponent("canvasContext2DDrawImageNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap6ParamsException1() {
        @Expect(hasComponent("canvasContext2DDrawImageException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap6ParamsException2() {
        @Expect(hasComponent("canvasContext2DDrawImageException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImageImageBitMap6ParamsNone() {
        @Expect(hasComponent("canvasContext2DDrawImageNone"), true)
        driver.pressBack()
    }
    
    // drawImage pixelMap 2 parmas
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap2ParamsNormal1() {
        scrollTo("ViewCanvasContext2DDrawImagePixelMap2Params")
        @Expect(hasComponent("canvasContext2DDrawImageNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap2ParamsNormal2() {
        @Expect(hasComponent("canvasContext2DDrawImageNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap2ParamsNone() {
        @Expect(hasComponent("canvasContext2DDrawImageNone"), true)
        driver.pressBack()
    }
    // drawImage pixelMap 4 parmas 
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap4ParamsNormal1() {
        scrollTo("ViewCanvasContext2DDrawImagePixelMap4Params")
        @Expect(hasComponent("canvasContext2DDrawImageNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap4ParamsNormal2() {
        @Expect(hasComponent("canvasContext2DDrawImageNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap4ParamsException1() {
        @Expect(hasComponent("canvasContext2DDrawImageException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap4ParamsException2() {
        @Expect(hasComponent("canvasContext2DDrawImageException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap4ParamsNone() {
        @Expect(hasComponent("canvasContext2DDrawImageNone"), true)
        driver.pressBack()
    }
    
    // drawImage pixelMap 6 parmas 
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap6ParamsNormal1() {
        scrollTo("ViewCanvasContext2DDrawImagePixelMap6Params")
        @Expect(hasComponent("canvasContext2DDrawImageNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap6ParamsNormal2() {
        @Expect(hasComponent("canvasContext2DDrawImageNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap6ParamsException1() {
        @Expect(hasComponent("canvasContext2DDrawImageException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap6ParamsException2() {
        @Expect(hasComponent("canvasContext2DDrawImageException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDrawImagePixelMap6ParamsNone() {
        @Expect(hasComponent("canvasContext2DDrawImageNone"), true)
        driver.pressBack()
    }

    // getPixelMap
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetPixelMapNormal1() {
        scrollTo("ViewCanvasContext2DGetPixelMap")
        @Expect(hasComponent("canvasContext2DGetPixelMapNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetPixelMapNormal2() {
        @Expect(hasComponent("canvasContext2DGetPixelMapNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetPixelMapException1() {
        @Expect(hasComponent("canvasContext2DGetPixelMapException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetPixelMapException2() {
        @Expect(hasComponent("canvasContext2DGetPixelMapException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetPixelMapNone() {
        @Expect(hasComponent("canvasContext2DGetPixelMapNone"), true)
        driver.pressBack()
    }

    // transferFromImageBitmap
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTransferFromImageBitmap() {
        scrollTo("ViewCanvasContext2DTransferFromImageBitmap")
        @Expect(hasComponent("canvasContext2DTransferFromImageBitmap"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTransferFromImageBitmapNone() {
        @Expect(hasComponent("canvasContext2DTransferFromImageBitmapNone"), true)
        driver.pressBack()
    }

    // setPixelMap
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetPixelMap() {
        scrollTo("ViewCanvasContext2DSetPixelMap")
        @Expect(hasComponent("canvasContext2DSetPixelMap"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DSetPixelMapNone() {
        @Expect(hasComponent("canvasContext2DSetPixelMapNone"), true)
        driver.pressBack()
    }

    // width
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DWidth() {
        scrollTo("ViewCanvasContext2DWidth")
        let width = getContent("widthText")
        @Expect(width, "\"300.000000\"")
        driver.pressBack()
    }

    // height
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DHeight() {
        scrollTo("ViewCanvasContext2DHeight")
        let height = getContent("heightText")
        @Expect(width, "\"150.000000\"")
        driver.pressBack()
    }

    // createImageData
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateImageData() {
        scrollTo("ViewCanvasContext2DCreateImageData")
        @Expect(hasComponent("canvasContext2DCreateImageData"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateImageDataException() {
        @Expect(hasComponent("canvasContext2DCreateImageDataException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DCreateImageDataNone() {
        @Expect(hasComponent("canvasContext2DCreateImageDataNone"), true)
        driver.pressBack()
    }

    // getImageData
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetImageDataNormal1() {
        scrollTo("ViewCanvasContext2DGetImageData")
        @Expect(hasComponent("canvasContext2DGetImageDataNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetImageDataNormal2() {
        scrollTo("ViewCanvasContext2DGetImageData")
        @Expect(hasComponent("canvasContext2DGetImageDataNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetImageDataException1() {
        scrollTo("ViewCanvasContext2DGetImageData")
        @Expect(hasComponent("canvasContext2DGetImageDataException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetImageDataException2() {
        scrollTo("ViewCanvasContext2DGetImageData")
        @Expect(hasComponent("canvasContext2DGetImageDataException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGetImageDataNone() {
        scrollTo("ViewCanvasContext2DGetImageData")
        @Expect(hasComponent("canvasContext2DGetImageDataNone"), true)
        driver.pressBack()
    }

    // putImageData
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DPutImageDataNormal1() {
        scrollTo("ViewCanvasContext2DPutImageData")
        @Expect(hasComponent("canvasContext2DPutImageDataNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DPutImageDataNormal2() {
        @Expect(hasComponent("canvasContext2DPutImageDataNormal2"), true)
        driver.pressBack()
    }

    // toDataURL
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DToDataURLNormal1() {
        scrollTo("ViewCanvasContext2DToDataURL")
        @Expect(hasComponent("canvasContext2DToDataURLNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DToDataURLException1() {
        @Expect(hasComponent("canvasContext2DToDataURLException1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DToDataURLException2() {
        @Expect(hasComponent("canvasContext2DToDataURLException2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DToDataURLNone() {
        @Expect(hasComponent("canvasContext2DToDataURLNone"), true)
        driver.pressBack()
    }
}
