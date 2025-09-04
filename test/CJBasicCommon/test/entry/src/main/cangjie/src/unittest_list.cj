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
    registerTestSuite("BasicCommon_UT_1") {BasicCommon_UT_1()}
    registerTestSuite("BasicCommon_UT_2") {BasicCommon_UT_2()}
    registerTestSuite("BasicCommon_UT_2_1") {BasicCommon_UT_2_1()}
    registerTestSuite("BasicCommon_UT_3") {BasicCommon_UT_3()}
    registerTestSuite("BasicCommon_UT_3_1") {BasicCommon_UT_3_1()}
    registerTestSuite("BasicCommon_UT_4") {BasicCommon_UT_4()}
    registerTestSuite("BasicCommon_UT_4_1") {BasicCommon_UT_4_1()}
    registerTestSuite("BasicCommon_NoPage_Case") {BasicCommon_NoPage_Case()}
    registerTestSuite("Component_UT_Drag_Event") {Component_UT_Drag_Event()}
}
let UT_views = ObservedArrayList<String>([
    "Index_UT1",
    "Index_UT2",
    "Index_UT3",
    "Index_UT4",
    "Hello_Cangjie",
//    "View_Gesture",
    "View_DragTest"
])
let UT1 = ObservedArrayList<String>([
    "View_Accessibility",
    "View_Animation",
    "View_Animator",
    "View_Appstorage",
    "View_Background",
    "View_Background2",
    "View_Background3",
    "View_Base",
    "View_BindContentCover",
    "View_BindSheet",
    "View_Border",
    "View_BorderImage",
//    "View_CallbackInvoke",
    "View_ClickEffect",
    "View_Component_Snapshot"
])
let UT2 = ObservedArrayList<String>([
    "View_Component_Utils",
    "View_Concurrency",
    "View_CursorControl",
    "View_CustomView",
    "View_DragControl",
    "View_Enablded",
    "View_Environment",
    "View_Flex_Layout",
    "View_Focus",
    "View_Font",
    "View_ForegroundColor",
    "View_GeometryTransition",
    "View_Interactable",
    "View_Layout_Constraints",
    "View_LocalStorage"
])
let UT3 = ObservedArrayList<String>([
    "View_Location",
    "View_MonopolizeEvents",
    "View_MotionBlur",
    "View_MotionPath",
    "View_Observable",
    "View_Observable_ArrayList",
    "View_OnChildTouchTest",
    "View_Opacity",
    "View_Outline",
    "View_Overlay",
    "View_PersistentStorage",
    "View_PixelRound",
    "View_Prop",
    "View_ResponseRegion",
    "View_Popup"
])
let UT4 = ObservedArrayList<String>([
//    "View_Reuse",
//    "View_Screenshot",
    "View_Size",
    "View_Subscriber",
    "View_Transition",
    "View_ViewBase",
    "View_Visibility",
    "View_Window_Enhance",
    "View_Window_Listener",
    "View_ZOrder",
    "View_Popup",
    "View_UiContext",
    "View_Enum",
    "View_Enum2"
])
