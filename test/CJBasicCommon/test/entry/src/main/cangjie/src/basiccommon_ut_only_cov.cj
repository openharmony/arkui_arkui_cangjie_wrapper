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
import ohos.arkui.shape.{RectShape, BaseShape}
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.ui_context.*
import std.math.MathExtension
import ohos.ark_interop.*
import ohos.ui_test.*
import std.collection.{ArrayList, HashMap}
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.PixelMapFormat
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.Size as UniqueImageSize
import ohos.display.Orientation as DisplayOrientation
import ohos.display.*
import ohos.callback_invoke.*
internal import kit.ArkUI.{isFoldable, getFoldStatus, getFoldDisplayMode, getCurrentFoldCreaseRegion, FoldCreaseRegion,
    getDefaultDisplaySync, getAllDisplays, DisplayState, DisplayOrientation as orientation, DisplayRect,
    WaterfallDisplayAreaRects, CutoutInfo, FoldDisplayMode}

import ohos.window.{Window, WindowStage, WindowCallbackType, WindowEventType, WindowStageEventType,
    Size, WindowStatusType, TitleButtonRect, SystemBarProperties, Orientation,createWindow,findWindow,WindowType,getLastWindow,shiftAppWindowFocus,
    AvoidAreaType,WindowProperties,ColorSpace, Configuration as WindowConfig, Rect as WindowRect, AvoidArea}

@Test
class BasicCommonOnlyCov {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("BasicCommonBranchCov")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCommon() {
        scrollTo("ViewCovCommonModule")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testViewCovPersistentStorage() {
        scrollTo("ViewCovPersistentStorage")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovGridColOptionsDefault() {
        scrollTo("ViewCovGridColDefault")
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovActionSheetOffsetDefault() {
        scrollTo("ViewCovActionSheetDefault")
        for (i in 1..=5) {
            let btn = driver.findComponent(On().id("covShowActionSheet${i}")).getOrThrow()
            btn.click()
            driver.delayMs(1000)
            driver.pressBack()
            driver.delayMs(500)
        }
        for (i in 1..5) {
            try {
                let btn = driver.findComponent(On().id("covShowAlertDialog${i}")).getOrThrow()
                btn.click()
                driver.delayMs(1000)
                driver.pressBack()
                driver.delayMs(500)
            } catch (e: Exception) {
                driver.pressBack()
                driver.delayMs(500)
            }
        }
        try {
            let covAnimateTo = driver.findComponent(On().id("covAnimateTo")).getOrThrow()
            covAnimateTo.click()
            driver.delayMs(500)
        } catch (e: Exception) {}
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAlphabetIndexerDefault() {
        scrollTo("ViewCovAlphabetIndexerDefault")
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCustomViewLifecycle() {
        scrollTo("ViewCovCommonComponent2")
        driver.delayMs(500)

        let toggleBtn = driver.findComponent(On().id("CovToggleBtn"))
        toggleBtn?.click()
        driver.delayMs(500)

        let hiddenLabel = driver.findComponent(On().id("CovHiddenLabel"))

        toggleBtn?.click()
        driver.delayMs(500)

        let visibleLabel = driver.findComponent(On().id("CovVisibleLabel"))

        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testParseAnimateParamCoverage() {
        scrollTo("ViewCovCommonComponent")
    }


    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAsTThrowCommonComponent() {
        let fake = WrongTypeCommon()
        var caught = false
        try {
            fake.onClick({ _ => })
        } catch (e: BusinessException) {
            caught = true
        }
        try { fake.onAppear({ => }) } catch (e: BusinessException) {}
        try { fake.onDisAppear({ => }) } catch (e: BusinessException) {}
        try { fake.onTouch({ _ => }) } catch (e: BusinessException) {}
        try { fake.onHover({ _ => }) } catch (e: BusinessException) {}
        try { fake.onAreaChange({ _, _ => }) } catch (e: BusinessException) {}
        try { fake.onVisibleAreaChange([0.0, 1.0], { _, _ => }) } catch (e: BusinessException) {}
        try { fake.onMouse({ _ => }) } catch (e: BusinessException) {}
        try { fake.onKeyEvent({ _ => }) } catch (e: BusinessException) {}
        try { fake.onFocus({ => }) } catch (e: BusinessException) {}
        try { fake.onBlur({ => }) } catch (e: BusinessException) {}
        try { fake.width(10.vp) } catch (e: BusinessException) {}
        try { fake.height(10.vp) } catch (e: BusinessException) {}
        try { fake.size(width: 10.vp, height: 10.vp) } catch (e: BusinessException) {}
        try { fake.padding(5.vp) } catch (e: BusinessException) {}
        try { fake.margin(5.vp) } catch (e: BusinessException) {}
        try { fake.layoutWeight(1) } catch (e: BusinessException) {}
        try { fake.constraintSize(minWidth: 10.vp) } catch (e: BusinessException) {}
        try { fake.align(Alignment.Center) } catch (e: BusinessException) {}
        try { fake.direction(Direction.Ltr) } catch (e: BusinessException) {}
        try { fake.position(x: 10.vp, y: 10.vp) } catch (e: BusinessException) {}
        try { fake.markAnchor(x: 10.vp, y: 10.vp) } catch (e: BusinessException) {}
        try { fake.offset(x: 10.vp, y: 10.vp) } catch (e: BusinessException) {}
        try { fake.displayPriority(1) } catch (e: BusinessException) {}
        try { fake.flexBasis(10.vp) } catch (e: BusinessException) {}
        try { fake.flexGrow(1.0) } catch (e: BusinessException) {}
        try { fake.flexShrink(1.0) } catch (e: BusinessException) {}
        try { fake.alignSelf(ItemAlign.Auto) } catch (e: BusinessException) {}
        try { fake.zIndex(1) } catch (e: BusinessException) {}
        try { fake.opacity(0.5) } catch (e: BusinessException) {}
        try { fake.visibility(Visibility.Visible) } catch (e: BusinessException) {}
        try { fake.backgroundColor(Color.Red) } catch (e: BusinessException) {}
        try { fake.backgroundImage(@r(app.media.icon)) } catch (e: BusinessException) {}
        try { fake.foregroundColor(Color.Red) } catch (e: BusinessException) {}
        try { fake.enabled(true) } catch (e: BusinessException) {}
        try { fake.grayscale(0.5) } catch (e: BusinessException) {}
        try { fake.brightness(0.5) } catch (e: BusinessException) {}
        try { fake.saturate(0.5) } catch (e: BusinessException) {}
        try { fake.contrast(0.5) } catch (e: BusinessException) {}
        try { fake.invert(0.5) } catch (e: BusinessException) {}
        try { fake.sepia(0.5) } catch (e: BusinessException) {}
        try { fake.hueRotate(90.0) } catch (e: BusinessException) {}
        try { fake.blur(5.0) } catch (e: BusinessException) {}
        try { fake.backdropBlur(5.0) } catch (e: BusinessException) {}
        try { fake.shadow(radius: 10.0) } catch (e: BusinessException) {}
        try { fake.clip(true) } catch (e: BusinessException) {}
        try { fake.colorBlend(Color.Red) } catch (e: BusinessException) {}
        try { fake.scale(x: 1.0) } catch (e: BusinessException) {}
        try { fake.rotate(x: 0.0) } catch (e: BusinessException) {}
        try { fake.translate(x: 10.vp) } catch (e: BusinessException) {}
        if (!caught) {
            Hilog.info(1, "CovTest", "WARNING: onClick did not throw BusinessException")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAsTThrowCommonComponentMore() {
        let w = WrongTypeCommon()
        try { w.aspectRatio(1.0) } catch (e: BusinessException) {}
        try { w.responseRegion(Option<Rectangle>.None) } catch (e: BusinessException) {}
        try { w.responseRegion(Option<Array<Rectangle>>.None) } catch (e: BusinessException) {}
        try { w.border(width: 1.vp) } catch (e: BusinessException) {}
        try { w.borderWidth(Option<Length>.None) } catch (e: BusinessException) {}
        try { w.borderWidth(Option<EdgeWidths>.None) } catch (e: BusinessException) {}
        try { w.borderRadius(topLeft: 1.vp) } catch (e: BusinessException) {}
        try { w.borderRadius(Option<Length>.None) } catch (e: BusinessException) {}
        try { w.borderStyle(Option<BorderStyle>.None) } catch (e: BusinessException) {}
        try { w.foregroundBlurStyle(Option<BlurStyle>.None) } catch (e: BusinessException) {}
        try { w.foregroundBlurStyle(Option<BlurStyle>.None, Option<ForegroundBlurStyleOptions>.None) } catch (e: BusinessException) {}
        try { w.backgroundImageSize(Option<ImageSize>.None) } catch (e: BusinessException) {}
        try { w.backgroundImageSize(width: 1.vp) } catch (e: BusinessException) {}
        try { w.backgroundImagePosition(Option<Alignment>.None) } catch (e: BusinessException) {}
        try { w.backgroundImagePosition(x: 1.vp) } catch (e: BusinessException) {}
        try { w.sharedTransition("id") } catch (e: BusinessException) {}
        try { w.geometryTransition(Option<String>.None) } catch (e: BusinessException) {}
        try { w.clipShape(Option<BaseShape>.None) } catch (e: BusinessException) {}
        try { w.overlay(value: Option<String>.None) } catch (e: BusinessException) {}
        try { w.sweepGradient(Option<(Length, Length)>.None) } catch (e: BusinessException) {}
        try { w.radialGradient(Option<(Length, Length)>.None, Option<Length>.None, Option<Array<(ResourceColor, Float64)>>.None) } catch (e: BusinessException) {}
        try { w.key(Option<String>.None) } catch (e: BusinessException) {}
        try { w.renderFit(Option<RenderFit>.None) } catch (e: BusinessException) {}
        try { w.expandSafeArea() } catch (e: BusinessException) {}
        try { w.bindContentCover(Option<Bool>.None, Option<CustomBuilder>.None) } catch (e: BusinessException) {}
        try { w.animationStart(Option<AnimateParam>.None) } catch (e: BusinessException) {}
        try { w.animationEnd() } catch (e: BusinessException) {}
        try { w.transition(Option<TransitionEffect>.None) } catch (e: BusinessException) {}
        try { w.transition(Option<TransitionEffect>.None, Option<TransitionFinishCallback>.None) } catch (e: BusinessException) {}
        try { w.bindSheet(Option<Bool>.None, { => }) } catch (e: BusinessException) {}
        try { w.dragPreview("x") } catch (e: BusinessException) {}
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAsTThrowShapeComponent() {
        let fake = WrongTypeShape()
        try { fake.fill(Color.Red) } catch (e: BusinessException) {}
        try { fake.fillOpacity(0.5) } catch (e: BusinessException) {}
        try { fake.stroke(Color.Blue) } catch (e: BusinessException) {}
        try { fake.strokeDashArray([5.vp, 10.vp]) } catch (e: BusinessException) {}
        try { fake.strokeDashOffset(5.vp) } catch (e: BusinessException) {}
        try { fake.strokeLineCap(LineCapStyle.Round) } catch (e: BusinessException) {}
        try { fake.strokeLineJoin(LineJoinStyle.Round) } catch (e: BusinessException) {}
        try { fake.strokeMiterLimit(4.0) } catch (e: BusinessException) {}
        try { fake.strokeOpacity(0.5) } catch (e: BusinessException) {}
        try { fake.strokeWidth(2.vp) } catch (e: BusinessException) {}
        try { fake.antiAlias(true) } catch (e: BusinessException) {}
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAsTThrowScrollableComponent() {
        let fake = WrongTypeScroll()
        try { fake.scrollBar(BarState.Auto) } catch (e: BusinessException) {}
        try { fake.scrollBarColor(Color.Red) } catch (e: BusinessException) {}
        try { fake.scrollBarWidth(5.vp) } catch (e: BusinessException) {}
        try { fake.enableScrollInteraction(true) } catch (e: BusinessException) {}
        try { fake.friction(0.8) } catch (e: BusinessException) {}
        try { fake.onReachStart({ => }) } catch (e: BusinessException) {}
        try { fake.onReachEnd({ => }) } catch (e: BusinessException) {}
        try { fake.onScrollStart({ => }) } catch (e: BusinessException) {}
        try { fake.onScrollStop({ => }) } catch (e: BusinessException) {}
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAsTThrowScrollableMore() {
        let s = WrongTypeScroll()
        try { s.flingSpeedLimit(Option<Float64>.None) } catch (e: BusinessException) {}
        try { s.fadingEdge(Option<Bool>.None) } catch (e: BusinessException) {}
        try { s.fadingEdge(Option<Bool>.None, Option<FadingEdgeOptions>.None) } catch (e: BusinessException) {}
        try { s.clipContent(Option<ContentClipMode>.None) } catch (e: BusinessException) {}
        try { s.clipContent(Option<RectShape>.Some(RectShape(width: 10.vp, height: 10.vp))) } catch (e: BusinessException) {}
        try { s.onWillScroll(Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>.None) } catch (e: BusinessException) {}
        try { s.onWillScroll(Option<(Float64, ScrollState, ScrollSource) -> Unit>.None) } catch (e: BusinessException) {}
        try { s.onDidScroll(Option<OnScrollCallBack>.None) } catch (e: BusinessException) {}
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovRichEditorTextStyleDefault() {
        let ts = RichEditorTextStyle(fontColor: Color.Red, fontSize: 14.vp)
        ts.decoration = Option<TextDecorationOptions>.None
        ts.fontColor = Option<ResourceColor>.None
        ts.fontFamily = Option<ResourceStr>.None
        ts.fontSize = Option<Length>.None
        ts.fontStyle = Option<FontStyle>.None
        ts.fontWeight = Option<FontWeight>.None
        let controller = RichEditorController()
        try { controller.updateSpanStyle(start: 0, end: 1, textStyle: ts) } catch (e: Exception) { Hilog.info(1, "CovTest", "richEditorStyle default: ${e.message}") }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovRichEditorImageSpanStyleDefault() {
        let i = RichEditorImageSpanStyle()
        i.verticalAlign = Option<ImageSpanAlignment>.None
        i.objectFit = Option<ImageFit>.None
        i.size = Option<(Length, Length)>.None
        let controller = RichEditorController()
        let opts = RichEditorImageSpanOptions(imageStyle: i)
        try { let _ = controller.addImageSpan(value: "test.png", options: opts) } catch (e: Exception) { Hilog.info(1, "CovTest", "richEditorImgStyle default: ${e.message}"); }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovRichEditorParagraphStyleDefault() {
        let ps = RichEditorParagraphStyle(textAlign: TextAlign.Center)
        ps.textAlign = Option<TextAlign>.None
        ps.leadingMargin = Option<LeadingMarginType>.None
        let controller = RichEditorController()
        try { controller.updateParagraphStyle(start: 0, end: 1, style: ps) } catch (e: Exception) { Hilog.info(1, "CovTest", "richEditorParaStyle default: ${e.message}") }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovTransitionOptionsDefault() {
        let s = ScaleOptions(x: Float32(1.0), y: Float32(1.0), z: Float32(1.0), centerX: 50.percent, centerY: 50.percent)
        try { TransitionEffect.scale(s) } catch (e: Exception) { Hilog.info(1, "Cov", "scale caught") }

        let r = RotateOptions(Float32(0.0), x: Float32(1.0), y: Float32(1.0), z: Float32(1.0),
            centerX: 50.percent, centerY: 50.percent, centerZ: 0.vp, perspective: Float32(1.0))
        try { TransitionEffect.rotate(r) } catch (e: Exception) { Hilog.info(1, "Cov", "rotate caught") }

        let t = TranslateOptions(x: 1.vp, y: 1.vp, z: 1.vp)
        try { TransitionEffect.translate(t) } catch (e: Exception) { Hilog.info(1, "Cov", "translate caught") }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovCommonComponentMethodDefault() {
        let w = WrongTypeCommon()
        try { w.layoutWeight(Option<Int32>.None) } catch (e: Exception) {}
        try { w.align(Option<Alignment>.None) } catch (e: Exception) {}
        try { w.direction(Option<Direction>.None) } catch (e: Exception) {}
        try { w.displayPriority(Option<Int32>.None) } catch (e: Exception) {}
        try { w.flexGrow(Option<Float64>.None) } catch (e: Exception) {}
        try { w.flexShrink(Option<Float64>.None) } catch (e: Exception) {}
        try { w.alignSelf(Option<ItemAlign>.None) } catch (e: Exception) {}
        try { w.borderColor(Option<ResourceColor>.None) } catch (e: Exception) {}
        try { w.backgroundColor(Option<ResourceColor>.None) } catch (e: Exception) {}
        try { w.opacity(Option<Float64>.None) } catch (e: Exception) {}
        try { w.enabled(Option<Bool>.None) } catch (e: Exception) {}
        try { w.blur(Option<Float64>.None) } catch (e: Exception) {}
        try { w.colorBlend(Option<ResourceColor>.None) } catch (e: Exception) {}
        try { w.backdropBlur(Option<Float64>.None) } catch (e: Exception) {}
        try { w.brightness(Option<Float64>.None) } catch (e: Exception) {}
        try { w.saturate(Option<Float64>.None) } catch (e: Exception) {}
        try { w.contrast(Option<Float64>.None) } catch (e: Exception) {}
        try { w.sepia(Option<Float64>.None) } catch (e: Exception) {}
        try { w.hueRotate(Option<Float32>.None) } catch (e: Exception) {}
        try { w.zIndex(Option<Int32>.None) } catch (e: Exception) {}
        try { w.clip(Option<Bool>.None) } catch (e: Exception) {}
        try { w.focusable(Option<Bool>.None) } catch (e: Exception) {}
        try { w.tabIndex(Option<Int32>.None) } catch (e: Exception) {}
        try { w.defaultFocus(Option<Bool>.None) } catch (e: Exception) {}
        try { w.groupDefaultFocus(Option<Bool>.None) } catch (e: Exception) {}
        try { w.focusOnTouch(Option<Bool>.None) } catch (e: Exception) {}
        try { w.shadow(radius: Option<Float64>.None) } catch (e: Exception) {}
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovDateTimeOptionsDefault() {
        let _ = DateTimeOptions(locale: "zh-Hans-CN", dateStyle: "long", timeStyle: "long",
            hourCycle: "h11", timeZone: "", numberingSystem: "adlm", hour12: false,
            weekday: "long", era: "long", year: "numeric", month: "numeric", day: "numeric",
            hour: "numeric", minute: "numeric", second: "numeric", timeZoneName: "long",
            dayPeriod: "long", localeMatcher: "lookup", formatMatcher: "basic")
        let _ = DateTimeOptions()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovScrollAnimationOptionsDefault() {
        let _ = ScrollAnimationOptions()
        let _ = ScrollAnimationOptions(duration: 100.0, curve: Curve.Ease, canOverScroll: true)
        let _ = DataPanelShadowOptions()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAlignRuleOptionDefault() {
        let hParam = HorizontalAlignParam(Option<String>.None, Option<HorizontalAlign>.None)
        hParam.anchor = Option<String>.None
        hParam.align = Option<HorizontalAlign>.None
        let vParam = VerticalAlignParam(Option<String>.None, Option<VerticalAlign>.None)
        vParam.anchor = Option<String>.None
        vParam.align = Option<VerticalAlign>.None
        let opts = AlignRuleOption()
        opts.left = Option<HorizontalAlignParam>.Some(hParam)
        opts.right = Option<HorizontalAlignParam>.Some(hParam)
        opts.middle = Option<HorizontalAlignParam>.Some(hParam)
        opts.top = Option<VerticalAlignParam>.Some(vParam)
        opts.bottom = Option<VerticalAlignParam>.Some(vParam)
        opts.center = Option<VerticalAlignParam>.Some(vParam)
        opts.bias = Option<Bias>.None
        let w = WrongTypeCommon()
        try { w.alignRules(opts) } catch (e: Exception) { Hilog.info(1, "Cov", "alignRules caught") }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCovAsTThrowCommonMissing() {
        let w = WrongTypeCommon()

        try { w.padding(top: 5.vp, right: 5.vp, bottom: 5.vp, left: 5.vp) } catch (e: BusinessException) {}
        try { w.margin(top: 5.vp, right: 5.vp, bottom: 5.vp, left: 5.vp) } catch (e: BusinessException) {}
        try { w.foregroundColor(Option<ColoringStrategy>.Some(ColoringStrategy.Invert)) } catch (e: BusinessException) {}
        try { w.invert(low: 0.0, high: 1.0, threshold: 0.5, thresholdRange: 0.1) } catch (e: BusinessException) {}
        try { w.backgroundImagePosition(Option<Alignment>.Some(Alignment.Center)) } catch (e: BusinessException) {}

        try { w.maskShape(RectShape(width: 10.vp, height: 10.vp)) } catch (e: BusinessException) {}
        try { w.bindPopup(true, Option<PopupOptions>.Some(PopupOptions(message: "cov"))) } catch (e: BusinessException) {}
        try { w.bindPopup(true, Option<CustomPopupOptions>.Some(CustomPopupOptions(builder: { => }))) } catch (e: BusinessException) {}
        try { w.bindMenu(Option<Array<MenuElement>>.Some([MenuElement(value: "cov", action: { => })])) } catch (e: BusinessException) {}
        try { w.bindMenu(builder: Option<CustomBuilder>.Some({ => })) } catch (e: BusinessException) {}
        try { w.bindContextMenu(builder: Option<CustomBuilder>.Some({ => }), responseType: Option<ResponseType>.Some(ResponseType.LongPress)) } catch (e: BusinessException) {}
        try { w.linearGradient() } catch (e: BusinessException) {}
        try { w.id(Option<String>.Some("cov_id")) } catch (e: BusinessException) {}
        try { w.transition(Option<TransitionEffect>.None, Option<TransitionFinishCallback>.Some({ _: Bool => })) } catch (e: BusinessException) {}

        let wn = WrongTypeCommonNoThrow()
        try { wn.backgroundImage("cov", ImageRepeat.NoRepeat) } catch (e: BusinessException) {}
        try { wn.bindPopup(true, Option<PopupOptions>.Some(PopupOptions(message: "cov"))) } catch (e: BusinessException) {}
    }
}


class WrongType {}

class WrongTypeCommon <: CommonShapeMethodComponent<WrongType> {}

class WrongTypeShape <: CommonShapeMethodComponent<WrongType> {}

class WrongTypeCommonNoThrow <: CommonShapeMethodComponent<WrongType> {
    protected override func backgroundImageInner(src: ?ResourceStr, repeat: ?ImageRepeat): WrongType { WrongType() }
    protected override func bindPopupInner(show: ?Bool, popup: ?PopupOptions): WrongType { WrongType() }
}

class WrongTypeScroll <: ScrollableCommonMethodComponent<WrongType> {
    protected func scrollBarInner(barState: ?BarState): WrongType { WrongType() }
    protected func scrollBarColorInner(color: ?ResourceColor): WrongType { WrongType() }
    protected func scrollBarWidthInner(value: ?Length): WrongType { WrongType() }
    protected func nestedScrollInner(value: ?NestedScrollOptions): WrongType { WrongType() }
    protected func enableScrollInteractionInner(value: ?Bool): WrongType { WrongType() }
    protected func frictionInner(value: ?Float64): WrongType { WrongType() }
    protected func frictionInner(value: ?AppResource): WrongType { WrongType() }
    protected func onReachStartInner(event: ?() -> Unit): WrongType { WrongType() }
    protected func onReachEndInner(event: ?() -> Unit): WrongType { WrongType() }
    protected func onScrollStartInner(event: ?() -> Unit): WrongType { WrongType() }
    protected func onScrollStopInner(event: ?() -> Unit): WrongType { WrongType() }
}