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
    registerTestSuite("BasicCommonUTDragEvent") {BasicCommonUTDragEvent()}
}
let UT_views = ObservedArrayList<String>([
    "BasicCommonIndex1",
    "BasicCommonIndex2",
    "BasicCommonIndex3",
    "BasicCommonIndex4",
    "ViewHello",
    "ViewDragTest"
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
    "ViewBindSheet",
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
let UT4 = ObservedArrayList<String>([
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
