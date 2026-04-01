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

/**
 * Created on 2024/6/13
 */
package ohos_app_cangjie_entry

internal import ohos.business_exception.BusinessException

let _ = testsuite()

func testsuite(): Unit{
    registerTestSuite("BasicCommonUT1") {BasicCommonUT1()}
    registerTestSuite("BasicCommonUT2") {BasicCommonUT2()}
    registerTestSuite("BasicCommonUT21") {BasicCommonUT21()}
    registerTestSuite("BasicCommonUT3") {BasicCommonUT3()}
    registerTestSuite("BasicCommonUT31") {BasicCommonUT31()}
    registerTestSuite("BasicCommonUT4") {BasicCommonUT4()}
    registerTestSuite("BasicCommonUT41") {BasicCommonUT41()}
    registerTestSuite("BasicCommonUTHello") {BasicCommonUTHello()}
    registerTestSuite("BasicCommonOnlyCov") {BasicCommonOnlyCov()}
    registerTestSuite("BasicCommonUTRequestFocus") {BasicCommonUTRequestFocus()}
    registerTestSuite("BasicCommonUTShadow") {BasicCommonUTShadow()}
    registerTestSuite("BasicCommonUTBindSheet") {BasicCommonUTBindSheet()}
}
let UT_views = ObservedArrayList<String>([
    "BasicCommonIndex1",
    "BasicCommonIndex2",
    "BasicCommonIndex3",
    "BasicCommonIndex4",
    "ViewHello",
    "BasicCommonBranchCov",
    "ViewRequestFocus"
])
let UT1 = ObservedArrayList<String>([
    "ViewAccessibility",
    "ViewAnimation",
    "ViewAnimator",
    "ViewAppstorage",
    "ViewBackground",
    "ViewBackground2",
    "ViewBackground3",
    "ViewBase",
    "ViewBindContentCover",
    "ViewBindSheetCover",
    "ViewBorder",
    "ViewBorderImage",
//    "ViewCallbackInvoke",
    "ViewClickEffect",
    "ViewComponentSnapshot"
])
let UT2 = ObservedArrayList<String>([
    "ViewComponentUtils",
    "ViewConcurrency",
    "ViewCursorControl",
    "ViewCustomView",
    "ViewDragControl",
    "ViewEnablded",
    "ViewEnvironment",
    "ViewFlexLayout",
    "ViewFocus",
    "ViewFont",
    "ViewForegroundColor",
    "ViewGeometryTransition",
    "ViewInteractable",
    "ViewLayoutConstraints",
    "ViewLocalStorage"
])
let UT3 = ObservedArrayList<String>([
    "ViewLocation",
    "ViewMonopolizeEvents",
    "ViewMotionBlur",
    "ViewMotionPath",
    "ViewObservable",
    "ViewObservableArrayList",
    "ViewOnChildTouchTest",
    "ViewOpacity",
    "ViewOutline",
    "ViewOverlay",
    "ViewPersistentStorage",
    "ViewPixelRound",
    "ViewProp",
    "ViewResponseRegion",
    "ViewPopup"
])
let shadowViewList = ObservedArrayList<String>([
    "ViewTextShadow",
    "ViewButtonShadow",
    "ViewImageShadow",
    "ViewBlankShadow",
    "ViewColumnShadow",
    "ViewRowShadow",
    "ViewStackShadow",
    "ViewDividerShadow",
    "ViewProgressShadow",
    "ViewLoadingProgressShadow",
    "ViewCheckboxShadow",
    "ViewRadioShadow",
    "ViewToggleShadow",
    "ViewSliderShadow",
    "ViewRatingShadow",
    "ViewSearchShadow",
    "ViewTextInputShadow",
    "ViewTextAreaShadow",
    "ViewFlexShadow",
    "ViewRichTextShadow",
    "ViewQRCodeShadow",
    "ViewCounterShadow",
    "ViewCanvasShadow",
    "ViewGaugeShadow",
    "ViewRefreshShadow",
    "ViewSwiperShadow",
    "ViewStepperShadow",
    "ViewScrollShadow",
    "ViewListShadow",
    "ViewGridShadow",
    "ViewCircleShadow",
    "ViewRectShadow",
    "ViewEllipseShadow",
    "ViewLineShadow",
    "ViewPathShadow",
    "ViewShapeShadow",
    "ViewSelectShadow",
    "ViewTabsShadow",
    "ViewTabContentShadow",
    "ViewAlphabetIndexerShadow",
    "ViewBadgeShadow",
    "ViewDataPanelShadow",
    "ViewListItemShadow",
    "ViewPatternLockShadow",
    "ViewRelativeContainerShadow",
    "ViewRowSplitShadow",
    "ViewDatePickerShadow",
    "ViewGridItemShadow",
    "ViewScrollBarShadow",
    "ViewStepperItemShadow",
    "ViewTextClockShadow",
    "ViewTextPickerShadow",
    "ViewTextTimerShadow",
    "ViewRichEditorShadow",
    "ViewVideoShadow",
    "ViewWebShadow",
    "ViewCheckboxGroupShadow",
    "ViewGridColShadow",
    "ViewGridRowShadow",
    "ViewListItemGroupShadow",
    "ViewMenuShadow",
    "ViewMenuItemShadow",
    "ViewMenuItemGroupShadow",
    "ViewNavDestinationShadow",
    "ViewNavigationShadow",
    "ViewSideBarContainerShadow",
    "ViewImageSpanShadow"
])

let bindSheetViewList = ObservedArrayList<String>([
    "ViewTextBindSheet",
    "ViewButtonBindSheet",
    "ViewImageBindSheet",
    "ViewBlankBindSheet",
    "ViewColumnBindSheet",
    "ViewRowBindSheet",
    "ViewStackBindSheet",
    "ViewDividerBindSheet",
    "ViewProgressBindSheet",
    "ViewLoadingProgressBindSheet",
    "ViewCheckboxBindSheet",
    "ViewRadioBindSheet",
    "ViewToggleBindSheet",
    "ViewSliderBindSheet",
    "ViewRatingBindSheet",
    "ViewSearchBindSheet",
    "ViewTextInputBindSheet",
    "ViewTextAreaBindSheet",
    "ViewFlexBindSheet",
    "ViewRichTextBindSheet",
    "ViewQRCodeBindSheet",
    "ViewCounterBindSheet",
    "ViewCanvasBindSheet",
    "ViewGaugeBindSheet",
    "ViewRefreshBindSheet",
    "ViewSwiperBindSheet",
    "ViewStepperBindSheet",
    "ViewScrollBindSheet",
    "ViewListBindSheet",
    "ViewGridBindSheet",
    "ViewCircleBindSheet",
    "ViewRectBindSheet",
    "ViewEllipseBindSheet",
    "ViewLineBindSheet",
    "ViewPathBindSheet",
    "ViewShapeBindSheet",
    "ViewSelectBindSheet",
    "ViewTabsBindSheet",
    "ViewTabContentBindSheet",
    "ViewAlphabetIndexerBindSheet",
    "ViewBadgeBindSheet",
    "ViewDataPanelBindSheet",
    "ViewListItemBindSheet",
    "ViewPatternLockBindSheet",
    "ViewRelativeContainerBindSheet",
    "ViewRowSplitBindSheet",
    "ViewDatePickerBindSheet",
    "ViewGridItemBindSheet",
    "ViewScrollBarBindSheet",
    "ViewStepperItemBindSheet",
    "ViewTextClockBindSheet",
    "ViewTextPickerBindSheet",
    "ViewTextTimerBindSheet",
    "ViewRichEditorBindSheet",
    "ViewVideoBindSheet",
    "ViewWebBindSheet",
    "ViewCheckboxGroupBindSheet",
    "ViewGridColBindSheet",
    "ViewGridRowBindSheet",
    "ViewListItemGroupBindSheet",
    "ViewMenuBindSheet",
    "ViewMenuItemBindSheet",
    "ViewMenuItemGroupBindSheet",
    "ViewNavDestinationBindSheet",
    "ViewNavigationBindSheet",
    "ViewSideBarContainerBindSheet",
    "ViewImageSpanBindSheet"
])
let UT4 = ObservedArrayList<String>([
    "ViewShadow",
    "ViewBindSheet",
//    "ViewReuse",
//    "ViewScreenshot",
    "ViewSize",
    "ViewSubscriber",
    "ViewTransition",
    "ViewViewBase",
    "ViewVisibility",
    "ViewWindowEnhance",
    "ViewWindowListener",
    "ViewZOrder",
    "ViewPopup",
    "ViewUiContext",
    "ViewEnum",
    "ViewEnum2"
])


let COVERAGE_VIEW = ObservedArrayList<String>([
    "ViewCovCommonModule",
    "ViewCovPersistentStorage",
    "ViewCovCommonComponent"
])