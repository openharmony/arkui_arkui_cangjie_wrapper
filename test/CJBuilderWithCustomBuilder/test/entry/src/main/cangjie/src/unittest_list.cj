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

internal import ohos.business_exception.BusinessException
import std.collection.*

let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("BuilderUTBasic") {BuilderUTBasic()}
    registerTestSuite("BuilderUTParamBinding") {BuilderUTParamBinding()}
    registerTestSuite("BuilderUTTypeSafety") {BuilderUTTypeSafety()}
    registerTestSuite("BuilderUTCombination") {BuilderUTCombination()}
    registerTestSuite("BuilderUTPerformance") {BuilderUTPerformance()}
}

// Index pages for different test categories
let UT_views = [
    "BuilderIndexBasic",           // @Builder基础功能测试索引
    "BuilderIndexParamBinding",    // @Builder参数绑定测试索引
    "BuilderIndexTypeSafety",       // @Builder类型安全检查索引
    "BuilderIndexCombination",      // @Builder和@BuilderParam组合索引
    "BuilderIndexBoundary",         // 边界和异常场景索引
    "BuilderIndexPerformance"       // 性能和使用场景索引
]

// @Builder基础功能测试 (TC_B001-TC_B010)
let UT1 = [
    "ViewBuilderBindMenuBasic",  // TC_B001
    "ViewBuilderBindContextMenuBasic",  // TC_B002
    "ViewBuilderBindContentCoverBasic",  // TC_B003
    "ViewBuilderBindSheetBasic",  // TC_B004
    "ViewBuilderGaugeDescriptionBasic",  // TC_B005
    "ViewBuilderModifierCheck",  // TC_B007
    "ViewBuilderNavigationTitleBasic",  // TC_B008
    "ViewBuilderTextInputCustomKeyboardBasic"  // TC_B009
]

// @Builder参数绑定测试 (TC_B011-TC_B032)
let UT2 = [
    "ViewBuilderMultipleCustomBuilder",  // TC_B011
    "ViewBuilderListItemGroupHeaderFooter",  // TC_B012
    "ViewBuilderMenuItemGroupHeaderFooter",  // TC_B013
    "ViewBuilderDragItemInfoBuilder",  // TC_B014
    "ViewBuilderContextMenuOptionsPreview",  // TC_B015
    "ViewBuilderBindContentCover",  // TC_B016
    "ViewBuilderBindSheet",  // TC_B017
    "ViewBuilderGaugeDescription",  // TC_B018
    "ViewBuilderNavigationTitle",  // TC_B019
    "ViewBuilderTextInputCustomKeyboard",  // TC_B020
    "ViewBuilderTabContentTabBar",  // TC_B021
    "ViewBuilderBindMenu",  // TC_B022
    "ViewBuilderBindContextMenu",  // TC_B023
    "ViewBuilderRichEditorBindSelectionMenu",  // TC_B024
    "ViewBuilderListItemSwipeAction",  // TC_B025
    "ViewBuilderSimpleReference",  // TC_B026
    "ViewBuilderFunctionCall",  // TC_B027
    "ViewBuilderFunctionCallLimit",  // TC_B028
    "ViewBuilderLiteralConstantSkip",  // TC_B029
    "ViewBuilderGenerateResourceSkip",  // TC_B030
    "ViewBuilderAlreadyBoundSkip",  // TC_B031
    "ViewBuilderLambdaExpr",  // TC_B032
    "ViewBuilderCheckBoxIndicatorBuilder",  // CheckBox.init (indicatorBuilder)
    "ViewBuilderCustomPopupOptionsBuilder",  // CustomPopupOptions.init (builder)
    "ViewBuilderSheetOptionsTitle"  // SheetOptions.init (title)
]

// @Builder类型安全检查 (TC_B033-TC_B048)
let UT3 = [
    "ViewBuilderBindMenuTypeCheck",  // TC_B033
    "ViewBuilderBindContextMenuTypeCheck",  // TC_B034
    "ViewBuilderBindContentCoverTypeCheck",  // TC_B035
    "ViewBuilderBindSheetTypeCheck",  // TC_B036
    "ViewBuilderGaugeDescriptionTypeCheck",  // TC_B037
    "ViewBuilderGaugeDescriptionTypeCheckError",  // TC_B038
    "ViewBuilderNavigationTitleTypeCheck",  // TC_B039
    "ViewBuilderNavigationTitleTypeCheckError",  // TC_B040
    "ViewBuilderTextInputCustomKeyboardTypeCheck",  // TC_B041
    "ViewBuilderTextInputCustomKeyboardTypeCheckError",  // TC_B042
    "ViewBuilderTabContentTabBarTypeCheck",  // TC_B043
    "ViewBuilderTabContentTabBarTypeCheckError",  // TC_B044
    "ViewBuilderRichEditorBindSelectionMenuTypeCheck",  // TC_B045
    "ViewBuilderRichEditorBindSelectionMenuTypeCheckError",  // TC_B046
    "ViewBuilderListItemSwipeActionTypeCheck",  // TC_B047
    "ViewBuilderListItemSwipeActionTypeCheckError"  // TC_B048
]


// @Builder和@BuilderParam组合 (TC_B058-TC_B072)
let UT5 = [
    "ViewBuilderUsesStateVariable",  // TC_B058
    "ViewBuilderUsesIfCondition",  // TC_B064
    "ViewBuilderUsesForEach",  // TC_B066
    "ViewBuilderUsesBindMenu"  // TC_B070
]

// 边界和异常场景 (TC_B073-TC_B084)
let UT6 = [
    "ViewBuilderZeroParameters"  // TC_B073
]

// 性能和使用场景 (TC_B085-TC_B092)
let UT7 = [
    "ViewBuilderMultipleFunctions"  // TC_B085
]
