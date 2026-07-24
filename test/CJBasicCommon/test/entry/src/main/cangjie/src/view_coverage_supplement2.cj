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

/*
 * 覆盖率补充: cj_transitioneffect.cj / cj_view_typedef.cj / cj_class_common.cj
 * 策略: 构造 Options 对象后在 aboutToAppear 中将字段设为 None,
 * 通过 TransitionEffect / responseRegion / SheetOptions 触发 ?? 默认值分支
 */
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
class TestDataClassCoverage {
    var scaleOpts: ScaleOptions = ScaleOptions()
    var rotateOpts: RotateOptions = RotateOptions(45.0)

    var rectOpts: Rectangle = Rectangle()
    var rectNegWidthOpts: Rectangle = Rectangle(width: (-10.0).vp)
    var rectNegHeightOpts: Rectangle = Rectangle(height: (-10.0).vp)

    var shadowOpts: ShadowOptions = ShadowOptions(radius: 10.0)

    var esOpts: EdgeStyles = EdgeStyles()

    var brOpts: BorderRadiuses = BorderRadiuses()

    var cmOpts: ContextMenuOptions = ContextMenuOptions()

    @Builder
    func sheetBuilder() {
        Column() {
            Text("sheet content")
        }
    }

    protected func aboutToAppear() {
        scaleOpts.centerX = None
        scaleOpts.centerY = None
        scaleOpts.x = None
        scaleOpts.y = None
        scaleOpts.z = None

        rotateOpts.centerX = None
        rotateOpts.centerY = None
        rotateOpts.centerZ = None
        rotateOpts.angle = None
        rotateOpts.x = None
        rotateOpts.y = None
        rotateOpts.z = None
        rotateOpts.perspective = None

        rectOpts.x = None
        rectOpts.y = None
        rectOpts.height = None
        rectOpts.width = None

        shadowOpts.shadowType = None
        shadowOpts.offsetX = None
        shadowOpts.offsetY = None
        shadowOpts.radius = None
        shadowOpts.color = None
        shadowOpts.fill = None

        esOpts.top = None
        esOpts.right = None
        esOpts.bottom = None
        esOpts.left = None

        brOpts.topLeft = None
        brOpts.topRight = None
        brOpts.bottomLeft = None
        brOpts.bottomRight = None

        cmOpts.enableArrow = None
        cmOpts.placement = None
    }

    func build() {
        Column {
            Text("DataCovScale")
                .transition(TransitionEffect.scale(scaleOpts))
                .id("DataCovScale")

            Text("DataCovRotate")
                .transition(TransitionEffect.rotate(rotateOpts))
                .id("DataCovRotate")

            Text("DataCovRectNone")
                .responseRegion(rectOpts)
                .id("DataCovRectNone")

            Text("DataCovRectNegWidth")
                .responseRegion(rectNegWidthOpts)
                .id("DataCovRectNegWidth")

            Text("DataCovRectNegHeight")
                .responseRegion(rectNegHeightOpts)
                .id("DataCovRectNegHeight")

            Button("DataCovShadowSheet")
                .bindSheet(true, sheetBuilder, options: SheetOptions(shadow: shadowOpts))
                .id("DataCovShadowSheet")

            Button("DataCovBorderWidthSheet")
                .bindSheet(true, sheetBuilder,
                    options: SheetOptions(borderWidth: 10.vp, borderStyle: esOpts))
                .id("DataCovBorderWidthSheet")

            Button("DataCovBorderRadius")
                .onClick({ _ =>
                    let dialog = CustomDialogOptions(builder: { => }, cornerRadius: brOpts)
                    getUIContext().getPromptAction().openCustomDialog(dialog, { _ => })
                })
                .id("DataCovBorderRadius")

            Button("DataCovContextMenu")
                .bindContextMenu(builder: sheetBuilder, responseType: ResponseType.LongPress, options: cmOpts)
                .id("DataCovContextMenu")
        }
    }
}

/*
 * 覆盖率补充: cj_common_native.cj
 * CJAlignRuleOption struct init 的 ?? 默认值分支 + CTranslateOptions ?? 默认值
 */
@Component
class TestNativeStructCoverage {
    var leftParam: HorizontalAlignParam = HorizontalAlignParam("a1", HorizontalAlign.End)
    var rightParam: HorizontalAlignParam = HorizontalAlignParam("a2", HorizontalAlign.Start)
    var middleParam: HorizontalAlignParam = HorizontalAlignParam("a3", HorizontalAlign.Center)
    var topParam: VerticalAlignParam = VerticalAlignParam("a1", VerticalAlign.Top)
    var bottomParam: VerticalAlignParam = VerticalAlignParam("a2", VerticalAlign.Bottom)
    var centerParam: VerticalAlignParam = VerticalAlignParam("a3", VerticalAlign.Center)

    var alignOptsBiasNone: AlignRuleOption = AlignRuleOption(
        left: HorizontalAlignParam("a1", HorizontalAlign.End))

    var biasInstance: Bias = Bias()
    var alignOpts: AlignRuleOption = AlignRuleOption()
    var alignOptsMiddle: AlignRuleOption = AlignRuleOption()

    var translateOpts: TranslateOptions = TranslateOptions()

    protected func aboutToAppear() {
        leftParam.anchor = None
        leftParam.align = None
        rightParam.anchor = None
        rightParam.align = None
        middleParam.anchor = None
        middleParam.align = None
        topParam.anchor = None
        topParam.align = None
        bottomParam.anchor = None
        bottomParam.align = None
        centerParam.anchor = None
        centerParam.align = None

        alignOptsBiasNone.bias = None
        alignOptsBiasNone.left = Some(leftParam)

        biasInstance.horizontal = None
        biasInstance.vertical = None
        alignOpts.left = Some(leftParam)
        alignOpts.right = Some(rightParam)
        alignOpts.top = Some(topParam)
        alignOpts.bottom = Some(bottomParam)
        alignOpts.bias = Some(biasInstance)

        alignOptsMiddle.middle = Some(middleParam)
        alignOptsMiddle.center = Some(centerParam)
        alignOptsMiddle.bias = Some(biasInstance)

        translateOpts.x = None
        translateOpts.y = None
        translateOpts.z = None
    }

    func build() {
        Column {
            Text("NativeCovAlignRules")
                .alignRules(alignOpts)
                .id("NativeCovAlignRules")

            Text("NativeCovAlignRulesMC")
                .alignRules(alignOptsMiddle)
                .id("NativeCovAlignRulesMC")

            Text("NativeCovBiasNone")
                .alignRules(alignOptsBiasNone)
                .id("NativeCovBiasNone")

            Text("NativeCovTranslate")
                .transition(TransitionEffect.translate(translateOpts))
                .id("NativeCovTranslate")
        }
    }
}

/*
 * 覆盖率补充: custom_view.cj
 * CustomView 生命周期方法中的 if 分支:
 * initialRenderView (for/if), purgeDeletedElmtIds, observeRecycleComponentCreation,
 * updateDirtyElements, aboutToBeDeletedInternal, markLazyForEachProcess,
 * notifyRead, traverseChildDoRecycleOrReuse, removeChildById
 */
@Reusable
@Component
class ReusableCovItem {
    @State var label: String = ""

    func build() {
        Text(label).fontSize(16).padding(5)
    }
}

@Component
class TestCustomViewCoverage {
    @State var showItems: Bool = true
    @State var toggleCount: Int32 = 0
    let data: Array<String> = ["A", "B", "C", "D", "E"]

    func build() {
        Column {
            Button("CovToggle")
                .onClick({ _ =>
                    showItems = !showItems
                    toggleCount = toggleCount + 1
                })
                .id("CovToggleBtn")

            if (showItems) {
                Text("CovVisible").id("CovVisibleLabel")
            } else {
                Text("CovHidden").id("CovHiddenLabel")
            }

            ForEach(
                data,
                itemGeneratorFunc: { item: String, _: Int64 =>
                    ReusableCovItem(label: item)
                }
            )
        }
    }
}

/*
 * 覆盖率补充: common_component.cj (aspectRatio/maskShape/bindContentCover/dragPreview)
 *              cj_nav_destination.cj (NavDestination ?? defaults)
 *              cj_page_transition.cj (PageTransitionEnter/Exit ?? defaults)
 */
@Component
class TestRemainingCoverage {
    var ptEnter: PageTransitionEnter = PageTransitionEnter()
    var ptExit: PageTransitionExit = PageTransitionExit()

    var canvasSettings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var canvasCtx: CanvasRenderingContext2D = CanvasRenderingContext2D(canvasSettings)

    protected func aboutToAppear() {
        ptEnter.translate()
        ptEnter.scale()
        ptEnter.onEnter(Option<PageTransitionCallback>.None)

        ptExit.translate()
        ptExit.scale()
        ptExit.onExit(Option<PageTransitionCallback>.None)
        ()
    }

    func build() {
        Column {
            Text("RemCovAspectRatioPos")
                .aspectRatio(1.0)
                .id("RemCovAspectRatioPos")

            Text("RemCovAspectRatioZero")
                .aspectRatio(0.0)
                .id("RemCovAspectRatioZero")

            Text("RemCovMaskShape")
                .maskShape(RectShape())
                .id("RemCovMaskShape")

            Text("RemCovContentCover")
                .bindContentCover(Option<Bool>.None, Option<CustomBuilder>.None)
                .id("RemCovContentCover")

            Text("RemCovDragPreview")
                .dragPreview("test")
                .id("RemCovDragPreview")

            NavDestination() {
                Text("RemCovNavDest")
            }
            .onBackPressed(Option<(() -> Bool)>.None)
            .onReady(Option<Callback<NavDestinationContext, Unit>>.None)
            .hideTitleBar(Option<Bool>.None)
            .title(Option<ResourceStr>.None)
            .backgroundColor(Option<ResourceColor>.None)
            .id("RemCovNavDestination")

            Text("RemCovResourceRef")
                .width(@r(app.string.content_opacity))
                .id("RemCovResourceRef")

            Canvas(canvasCtx)
            .onReady({ =>
                canvasCtx.font = "14vp sans-serif"
                canvasCtx.font = "14px sans-serif"

                let _ = getUIContext().vp2px(10.0.vp)
                let _ = getUIContext().px2vp(10.0.px)
                let _ = getUIContext().fp2px(10.0.fp)
                let _ = getUIContext().lpx2px(10.0.lpx)
            })
            .id("RemCovCanvas")
        }
    }
}
