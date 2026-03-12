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
import ohos.arkui.component.button.{ButtonType, ButtonRole, ButtonStyleMode}
import ohos.arkui.component.badge.BadgePosition
import ohos.arkui.component.progress.ProgressStatus
import ohos.arkui.component.scroll.{ScrollAlign, ContentClipMode}
import ohos.arkui.component.common.{TransitionEdge, IndexerAlign, FlexDirection, FlexWrap, ToggleType, FontStyle, BarPosition, BarMode, ShadowType, HorizontalAlign, VerticalAlign, Direction, ScrollDirection, ScrollBarDirection, SliderStyle, BarState, Visibility, LineCapStyle, ImageRenderMode, EdgeEffect, LineJoinStyle, GestureMask, SwipeDirection, TextAlign, TextOverflow, WordBreak, BorderStyle, TextCase, ImageSize, TextDecorationType, ImageInterpolation, ModalTransition, SheetSize, SheetType, SheetMode, ScrollSizeMode}
import ohos.arkui.component.navigation.{LaunchMode, BarStyle}
import ohos.arkui.component.grid_row.{GridRowDirection, BreakpointsReference}
import ohos.arkui.component.list_item_group.ListItemGroupStyle
import ohos.arkui.component.alert_dialog.DialogButtonDirection
import ohos.arkui.component.rich_editor.{LeadingMarginType, LeadingMarginPlaceholder}
import ohos.multimedia.image.PixelMap
import ohos.arkui.ui_context.{RouterMode, ToastShowMode, HoverModeAreaType, KeyboardAvoidMode, AnimatorFill, AnimatorDirection}
import ohos.arkui.component.page_transition.{RouteType, SlideEffect}
import ohos.arkui.state_management.{ColorMode, LayoutDirection}
import ohos.base.LengthUnit
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.device_info.*
import ohos.business_exception.BusinessException
import ohos.hilog.Hilog

@Test
class InformationDisplayUT3 {
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
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar
                    .scrollSearch(On().id(view)).getOrThrow()
                    .click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "1", e.message)
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
        scrollBar.scrollSearch(On().id("InformationDisplayIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    /**
     * 打开分支覆盖触发页，使 onAppear 执行各枚举 == 比较，便于带覆盖率运行时覆盖 wrapper 内 @Derive[Equatable] 分支。
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testOpenViewCovEnumEquatableForBranchCoverage() {
        scrollTo("ViewCovEnumEquatable")
    }

    /**
     * 覆盖 ButtonType @Derive[Equatable] 生成的 16 个分支（4 变体 → 4×4=16 条分支，通过 16 次比较覆盖）。
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testButtonTypeEquatableBranches() {
        let a = ButtonType.Normal
        let b = ButtonType.Capsule
        let c = ButtonType.Circle
        let d = ButtonType.RoundedRectangle

        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")

        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    /**
     * 覆盖 ButtonRole @Derive[Equatable] 生成的 8 个分支（2 变体 → 4×2=8 条分支，通过 4 次比较覆盖）。
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testButtonRoleEquatableBranches() {
        let normal = ButtonRole.Normal
        let error = ButtonRole.Error

        @Expect((normal == normal).toString(), "true")
        @Expect((error == error).toString(), "true")
        @Expect((normal == error).toString(), "false")
        @Expect((error == normal).toString(), "false")
    }

    /**
     * 覆盖 ButtonStyleMode @Derive[Equatable] 生成的 12 个分支（3 变体 → 4×3=12 条分支，通过 9 次比较覆盖）。
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testButtonStyleModeEquatableBranches() {
        let normal = ButtonStyleMode.Normal
        let emphasized = ButtonStyleMode.Emphasized
        let textual = ButtonStyleMode.Textual

        @Expect((normal == normal).toString(), "true")
        @Expect((emphasized == emphasized).toString(), "true")
        @Expect((textual == textual).toString(), "true")

        @Expect((normal == emphasized).toString(), "false")
        @Expect((normal == textual).toString(), "false")
        @Expect((emphasized == normal).toString(), "false")
        @Expect((emphasized == textual).toString(), "false")
        @Expect((textual == normal).toString(), "false")
        @Expect((textual == emphasized).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBadgePositionEquatableBranches() {
        let a = BadgePosition.RightTop
        let b = BadgePosition.Right
        let c = BadgePosition.Left
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testProgressStatusEquatableBranches() {
        let a = ProgressStatus.Loading
        let b = ProgressStatus.Progressing
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testScrollAlignEquatableBranches() {
        let a = ScrollAlign.Start
        let b = ScrollAlign.Center
        let c = ScrollAlign.End
        let d = ScrollAlign.Auto
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testContentClipModeEquatableBranches() {
        let a = ContentClipMode.ContentOnly
        let b = ContentClipMode.Boundary
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTransitionEdgeEquatableBranches() {
        let a = TransitionEdge.Top
        let b = TransitionEdge.Bottom
        let c = TransitionEdge.Start
        let d = TransitionEdge.End
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testColorModeEquatableBranches() {
        let a = ColorMode.Light
        let b = ColorMode.Dark
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLayoutDirectionEquatableBranches() {
        let a = LayoutDirection.Ltr
        let b = LayoutDirection.Rtl
        let c = LayoutDirection.Auto
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLengthUnitEquatableBranches() {
        let a = LengthUnit.Px
        let b = LengthUnit.Vp
        let c = LengthUnit.Fp
        let d = LengthUnit.Percent
        let e = LengthUnit.Lpx
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((e == e).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((a == e).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((b == e).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((c == e).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
        @Expect((d == e).toString(), "false")
        @Expect((e == a).toString(), "false")
        @Expect((e == b).toString(), "false")
        @Expect((e == c).toString(), "false")
        @Expect((e == d).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLaunchModeEquatableBranches() {
        let a = LaunchMode.Standard
        let b = LaunchMode.MoveToTopSingleTon
        let c = LaunchMode.PopToSingleTon
        let d = LaunchMode.NewInstance
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBarStyleEquatableBranches() {
        let a = BarStyle.Standard
        let b = BarStyle.Stack
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGridRowDirectionEquatableBranches() {
        let a = GridRowDirection.Row
        let b = GridRowDirection.RowReverse
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBreakpointsReferenceEquatableBranches() {
        let a = BreakpointsReference.WindowSize
        let b = BreakpointsReference.ComponentSize
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testListItemGroupStyleEquatableBranches() {
        let a = ListItemGroupStyle.None
        let b = ListItemGroupStyle.Card
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRouterModeEquatableBranches() {
        let a = RouterMode.Standard
        let b = RouterMode.Single
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDialogButtonDirectionEquatableBranches() {
        let a = DialogButtonDirection.Auto
        let b = DialogButtonDirection.Horizontal
        let c = DialogButtonDirection.Vertical
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testToastShowModeEquatableBranches() {
        let a = ToastShowMode.Default
        let b = ToastShowMode.TopMost
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testHoverModeAreaTypeEquatableBranches() {
        let a = HoverModeAreaType.TopScreen
        let b = HoverModeAreaType.BottomScreen
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testKeyboardAvoidModeEquatableBranches() {
        let a = KeyboardAvoidMode.Default
        let b = KeyboardAvoidMode.None
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimatorFillEquatableBranches() {
        let a = AnimatorFill.None
        let b = AnimatorFill.Forwards
        let c = AnimatorFill.Backwards
        let d = AnimatorFill.Both
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testAnimatorDirectionEquatableBranches() {
        let a = AnimatorDirection.Normal
        let b = AnimatorDirection.Reverse
        let c = AnimatorDirection.Alternate
        let d = AnimatorDirection.AlternateReverse
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRouteTypeEquatableBranches() {
        let a = RouteType.None
        let b = RouteType.Push
        let c = RouteType.Pop
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSlideEffectEquatableBranches() {
        let a = SlideEffect.Left
        let b = SlideEffect.Right
        let c = SlideEffect.Top
        let d = SlideEffect.Bottom
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testIndexerAlignEquatableBranches() {
        let a = IndexerAlign.Left
        let b = IndexerAlign.Right
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexDirectionEquatableBranches() {
        let a = FlexDirection.Row
        let b = FlexDirection.Column
        let c = FlexDirection.RowReverse
        let d = FlexDirection.ColumnReverse
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFlexWrapEquatableBranches() {
        let a = FlexWrap.NoWrap
        let b = FlexWrap.Wrap
        let c = FlexWrap.WrapReverse
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testToggleTypeEquatableBranches() {
        let a = ToggleType.Checkbox
        let b = ToggleType.Switch
        let c = ToggleType.Button
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testFontStyleEquatableBranches() {
        let a = FontStyle.Normal
        let b = FontStyle.Italic
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBarPositionEquatableBranches() {
        let a = BarPosition.Start
        let b = BarPosition.End
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBarModeEquatableBranches() {
        let a = BarMode.Fixed
        let b = BarMode.Scrollable
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testShadowTypeEquatableBranches() {
        let a = ShadowType.Color
        let b = ShadowType.Blur
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testHorizontalAlignEquatableBranches() {
        let a = HorizontalAlign.Start
        let b = HorizontalAlign.Center
        let c = HorizontalAlign.End
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testVerticalAlignEquatableBranches() {
        let a = VerticalAlign.Top
        let b = VerticalAlign.Center
        let c = VerticalAlign.Bottom
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testDirectionEquatableBranches() {
        let a = Direction.Ltr
        let b = Direction.Rtl
        let c = Direction.Auto
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testScrollDirectionEquatableBranches() {
        let a = ScrollDirection.Vertical
        let b = ScrollDirection.Horizontal
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testScrollBarDirectionEquatableBranches() {
        let a = ScrollBarDirection.Vertical
        let b = ScrollBarDirection.Horizontal
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSliderStyleEquatableBranches() {
        let a = SliderStyle.OutSet
        let b = SliderStyle.InSet
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBarStateEquatableBranches() {
        let a = BarState.Off
        let b = BarState.Auto
        let c = BarState.On
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testVisibilityEquatableBranches() {
        let a = Visibility.Visible
        let b = Visibility.Hidden
        let c = Visibility.None
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLineCapStyleEquatableBranches() {
        let a = LineCapStyle.Butt
        let b = LineCapStyle.Round
        let c = LineCapStyle.Square
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageRenderModeEquatableBranches() {
        let a = ImageRenderMode.Original
        let b = ImageRenderMode.Template
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testEdgeEffectEquatableBranches() {
        let a = EdgeEffect.Spring
        let b = EdgeEffect.Fade
        let c = EdgeEffect.None
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLineJoinStyleEquatableBranches() {
        let a = LineJoinStyle.Miter
        let b = LineJoinStyle.Round
        let c = LineJoinStyle.Bevel
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testGestureMaskEquatableBranches() {
        let a = GestureMask.Normal
        let b = GestureMask.IgnoreInternal
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSwipeDirectionEquatableBranches() {
        let a = SwipeDirection.Horizontal
        let b = SwipeDirection.Vertical
        let c = SwipeDirection.All
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextAlignEquatableBranches() {
        let a = TextAlign.Start
        let b = TextAlign.Center
        let c = TextAlign.End
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextOverflowEquatableBranches() {
        let a = TextOverflow.Clip
        let b = TextOverflow.Ellipsis
        let c = TextOverflow.None
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testWordBreakEquatableBranches() {
        let a = WordBreak.Normal
        let b = WordBreak.BreakAll
        let c = WordBreak.BreakWord
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBorderStyleEquatableBranches() {
        let a = BorderStyle.Solid
        let b = BorderStyle.Dashed
        let c = BorderStyle.Dotted
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextCaseEquatableBranches() {
        let a = TextCase.Normal
        let b = TextCase.LowerCase
        let c = TextCase.UpperCase
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageSizeEquatableBranches() {
        let a = ImageSize.Contain
        let b = ImageSize.Cover
        let c = ImageSize.Auto
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextDecorationTypeEquatableBranches() {
        let a = TextDecorationType.None
        let b = TextDecorationType.Underline
        let c = TextDecorationType.Overline
        let d = TextDecorationType.LineThrough
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageInterpolationEquatableBranches() {
        let a = ImageInterpolation.None
        let b = ImageInterpolation.High
        let c = ImageInterpolation.Medium
        let d = ImageInterpolation.Low
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((d == d).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((a == d).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((b == d).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
        @Expect((c == d).toString(), "false")
        @Expect((d == a).toString(), "false")
        @Expect((d == b).toString(), "false")
        @Expect((d == c).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testModalTransitionEquatableBranches() {
        let a = ModalTransition.Default
        let b = ModalTransition.None
        let c = ModalTransition.Alpha
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSheetSizeEquatableBranches() {
        let a = SheetSize.Medium
        let b = SheetSize.Large
        let c = SheetSize.FitContent
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSheetTypeEquatableBranches() {
        let a = SheetType.Bottom
        let b = SheetType.Center
        let c = SheetType.Popup
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((c == c).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((a == c).toString(), "false")
        @Expect((b == a).toString(), "false")
        @Expect((b == c).toString(), "false")
        @Expect((c == a).toString(), "false")
        @Expect((c == b).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSheetModeEquatableBranches() {
        let a = SheetMode.Overlay
        let b = SheetMode.Embedded
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testScrollSizeModeEquatableBranches() {
        let a = ScrollSizeMode.FollowDetent
        let b = ScrollSizeMode.Continuous
        @Expect((a == a).toString(), "true")
        @Expect((b == b).toString(), "true")
        @Expect((a == b).toString(), "false")
        @Expect((b == a).toString(), "false")
    }
}
