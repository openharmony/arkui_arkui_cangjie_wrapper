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

@Test
class CanvasUTContext2DAttrs {
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
    
    func hasComponent(id: String): Bool {
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollSearch(On().id(id))
        return driver.findComponent(On().id(id)).isSome()
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("CanvasDrawingBase"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
    }

    // Canvas init / onReady
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasInitOnReady1() {
        scrollTo("ViewCanvasInitOnReady")
        @Expect(hasComponent("canvasInitTrue"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasInitOnReady2() {
        @Expect(hasComponent("canvasInitFalse"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasInitOnReadyNone() {
        @Expect(hasComponent("canvasInitOnReadyNone"), true)
        driver.pressBack()
    }

    // fillStyle
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillStyleColor() {
        scrollTo("ViewCanvasContext2DFillStyle")
        @Expect(hasComponent("canvasContext2DFillStyleColor"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillStyleNone() {
        @Expect(hasComponent("canvasContext2DFillStyleNone"), true)
    }    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillStylePattern() {
        @Expect(hasComponent("canvasContext2DFillStylePattern"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillStyleGradient() {
        @Expect(hasComponent("canvasContext2DFillStyleGradient"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFillStyleGet() {
        @Expect(hasComponent("canvasContext2DFillStyleGet"), true)
        driver.pressBack()
    }

    // lineWidth
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineWidth() {
        scrollTo("ViewCanvasContext2DLineWidth")
        @Expect(hasComponent("canvasContext2DLineWidth"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineWidthNone() {
        @Expect(hasComponent("canvasContext2DLineWidthNone"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineWidthGet() {
        @Expect(hasComponent("canvasContext2DLineWidthGet"), true)
        driver.pressBack()
    }

    // strokeStyle
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStyleColor() {
        scrollTo("ViewCanvasContext2DStrokeStyle")
        @Expect(hasComponent("canvasContext2DStrokeStyleColor"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStyleUInt32() {
        @Expect(hasComponent("canvasContext2DStrokeStyleUInt32"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStyleResourceColor() {
        @Expect(hasComponent("canvasContext2DStrokeStyleResourceColor"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStyleGradient() {
        @Expect(hasComponent("canvasContext2DStrokeStyleGradient"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStylePattern() {
        @Expect(hasComponent("canvasContext2DStrokeStylePattern"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStyleOptionNone() {
        @Expect(hasComponent("canvasContext2DStrokeStyleNone"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DStrokeStyleGet() {
        @Expect(hasComponent("canvasContext2DStrokeStyleGet"), true)
        driver.pressBack()
    }

    // lineCap
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineCap() {
        scrollTo("ViewCanvasContext2DLineCap")
        @Expect(hasComponent("canvasContext2DLineCap"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineCapMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DLineCapExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineCapMutPropGet() {
        @Expect(hasComponent("canvasContext2DLineCapGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineCapMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DLineCapOptionNone"), true)
        driver.pressBack()
    }

    // lineJoin
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineJoin() {
        scrollTo("ViewCanvasContext2DLineJoin")
        @Expect(hasComponent("canvasContext2DLineJoin"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineJoin2() {
        @Expect(hasComponent("canvasContext2DLineJoin2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineJoinMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DLineJoinExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineJoinMutPropGet() {
        @Expect(hasComponent("canvasContext2DLineJoinGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineJoinMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DLineJoinOptionNone"), true)
        driver.pressBack()
    }

    // miterLimit
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DMiterLimit() {
        scrollTo("ViewCanvasContext2DMiterLimit")
        @Expect(hasComponent("canvasContext2DMiterLimit"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasMiterLimitMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DMiterLimitExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasMiterLimitMutPropExceptionValue2() {
        @Expect(hasComponent("canvasContext2DMiterLimitExceptionValue2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasMiterLimitMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DMiterLimitOptionNone"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasMiterLimitMutPropGet() {
        @Expect(hasComponent("canvasContext2DMiterLimitGet"), true)
        driver.pressBack()
    }

    // font
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFont() {
        scrollTo("ViewCanvasContext2DFont")
        @Expect(hasComponent("canvasContext2DFontNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFontNormal2() {
        @Expect(hasComponent("canvasContext2DFontNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasFontMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DFontExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasFontMutPropGet() {
        @Expect(hasComponent("canvasContext2DFontGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasFontMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DFontOptionNone"), true)
        driver.pressBack()
    }

    // textAlign
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTextAlign() {
        scrollTo("ViewCanvasContext2DTextAlign")
        @Expect(hasComponent("canvasContext2DTextAlign"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTextAlign2() {
        @Expect(hasComponent("canvasContext2DTextAlign2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasTextAlignMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DTextAlignExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasTextAlignMutPropGet() {
        @Expect(hasComponent("canvasContext2DTextAlignGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasTextAlignMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DTextAlignOptionNone"), true)
        driver.pressBack()
    }

    // textBaseline
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTextBaseline() {
        scrollTo("ViewCanvasContext2DTextBaseline")
        @Expect(hasComponent("canvasContext2DTextBaseline"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DTextBaselineNormal2() {
        @Expect(hasComponent("canvasContext2DTextBaselineNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasTextBaselineMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DTextBaselineExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasTextBaselineMutPropGet() {
        @Expect(hasComponent("canvasContext2DTextBaselineGet"), true)
    }   
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasTextBaselineMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DTextBaselineOptionNone"), true)
        driver.pressBack()
    }

    // globalAlpha
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGlobalAlpha() {
        scrollTo("ViewCanvasContext2DGlobalAlpha")
        @Expect(hasComponent("canvasContext2DGlobalAlpha"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalAlphaMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DGlobalAlphaExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalAlphaMutPropExceptionValue2() {
        @Expect(hasComponent("canvasContext2DGlobalAlphaExceptionValue2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalAlphaMutPropGet() {
        @Expect(hasComponent("canvasContext2DGlobalAlphaGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalAlphaMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DGlobalAlphaOptionNone"), true)
        driver.pressBack()
    }

    // lineDashOffset
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DLineDashOffset() {
        scrollTo("ViewCanvasContext2DLineDashOffset")
        @Expect(hasComponent("canvasContext2DLineDashOffset"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineDashOffsetMutPropBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DLineDashOffsetBoundaryValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineDashOffsetMutPropGet() {
        @Expect(hasComponent("canvasContext2DLineDashOffsetGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasLineDashOffsetMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DLineDashOffsetOptionNone"), true)
        driver.pressBack()
    }

    // globalCompositeOperation
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGlobalCompositeOperationNormal1() {
        scrollTo("ViewCanvasContext2DGlobalCompositeOperation")
        @Expect(hasComponent("canvasContext2DGlobalCompositeOperationNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGlobalCompositeOperationNormal2() {
        @Expect(hasComponent("canvasContext2DGlobalCompositeOperationNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DGlobalCompositeOperationNormal3() {
        @Expect(hasComponent("canvasContext2DGlobalCompositeOperationNormal3"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalCompositeOperationMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DGlobalCompositeOperationExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalCompositeOperationMutPropGet() {
        @Expect(hasComponent("canvasContext2DGlobalCompositeOperationGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasGlobalCompositeOperationMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DGlobalCompositeOperationOptionNone"), true)
        driver.pressBack()
    }

    // shadowBlur
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowBlur() {
        scrollTo("ViewCanvasContext2DShadowBlur")
        @Expect(hasComponent("canvasContext2DShadowBlur"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowBlurMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DShadowBlurExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowBlurMutPropBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DShadowBlurBoundaryValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowBlurMutPropGet() {
        @Expect(hasComponent("canvasContext2DShadowBlurGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowBlurMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DShadowBlurOptionNone"), true)
        driver.pressBack()
    }

    // shadowColor
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowColorNormal1() {
        scrollTo("ViewCanvasContext2DShadowColor")
        @Expect(hasComponent("canvasContext2DShadowColorNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowColorNormal2() {
        @Expect(hasComponent("canvasContext2DShadowColorNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowColorNormal3() {
        @Expect(hasComponent("canvasContext2DShadowColorNormal3"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowColorNormal4() {
        @Expect(hasComponent("canvasContext2DShadowColorNormal4"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowColorMutPropGet() {
        @Expect(hasComponent("canvasContext2DShadowColorGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowColorMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DShadowColorOptionNone"), true)
        driver.pressBack()
    }

    // shadowOffsetX
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowOffsetXNormal1() {
        scrollTo("ViewCanvasContext2DShadowOffsetX")
        @Expect(hasComponent("canvasContext2DShadowOffsetXNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowOffsetXNormal2() {
        @Expect(hasComponent("canvasContext2DShadowOffsetXNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowOffsetXMutPropGet() {
        @Expect(hasComponent("canvasContext2DShadowOffsetXGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowOffsetXMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DShadowOffsetXOptionNone"), true)
        driver.pressBack()
    }

    // shadowOffsetY
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowOffsetYNormal1() {
        scrollTo("ViewCanvasContext2DShadowOffsetY")
        @Expect(hasComponent("canvasContext2DShadowOffsetYNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DShadowOffsetYNormal2() {
        @Expect(hasComponent("canvasContext2DShadowOffsetYNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowOffsetYMutPropGet() {
        @Expect(hasComponent("canvasContext2DShadowOffsetYGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasShadowOffsetYMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DShadowOffsetYOptionNone"), true)
        driver.pressBack()
    }

    // imageSmoothingEnabled
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DImageSmoothingEnabledNormal1() {
        scrollTo("ViewCanvasContext2DImageSmoothingEnabled")
        @Expect(hasComponent("canvasContext2DImageSmoothingEnabledNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DImageSmoothingEnabledNormal2() {
        @Expect(hasComponent("canvasContext2DImageSmoothingEnabledNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasImageSmoothingEnabledMutPropGet() {
        @Expect(hasComponent("canvasContext2DImageSmoothingEnabledGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasImageSmoothingEnabledMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DImageSmoothingEnabledOptionNone"), true)
        driver.pressBack()
    }

    // imageSmoothingQuality
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DImageSmoothingQualityNormal1() {
        scrollTo("ViewCanvasContext2DImageSmoothingQuality")
        @Expect(hasComponent("canvasContext2DImageSmoothingQualityNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DImageSmoothingQualityNormal2() {
        @Expect(hasComponent("canvasContext2DImageSmoothingQualityNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasImageSmoothingQualityMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DImageSmoothingQualityExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasImageSmoothingQualityMutPropGet() {
        @Expect(hasComponent("canvasContext2DImageSmoothingQualityGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasImageSmoothingQualityMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DImageSmoothingQualityOptionNone"), true)
        driver.pressBack()
    }

    // direction
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDirectionNormal1() {
        scrollTo("ViewCanvasContext2DDirection")
        @Expect(hasComponent("canvasContext2DDirectionNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DDirectionNormal2() {
        @Expect(hasComponent("canvasContext2DDirectionNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasDirectionMutPropBoundaryValue1() {
        @Expect(hasComponent("canvasContext2DDirectionExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasDirectionMutPropGet() {
        @Expect(hasComponent("canvasContext2DDirectionGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasDirectionMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DDirectionOptionNone"), true)
        driver.pressBack()
    }

    // filter
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFilterNormal1() {
        scrollTo("ViewCanvasContext2DFilter")
        @Expect(hasComponent("canvasContext2DFilterNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContext2DFilterNormal2() {
        scrollTo("ViewCanvasContext2DFilter")
        @Expect(hasComponent("canvasContext2DFilterNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasFilterMutPropExceptionValue1() {
        @Expect(hasComponent("canvasContext2DFilterExceptionValue1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasFilterMutPropGet() {
        @Expect(hasComponent("canvasContext2DFilterGet"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCanvasCanvasFilterMutPropOptionNone() {
        @Expect(hasComponent("canvasContext2DFilterOptionNone"), true)
        driver.pressBack()
    }
}
