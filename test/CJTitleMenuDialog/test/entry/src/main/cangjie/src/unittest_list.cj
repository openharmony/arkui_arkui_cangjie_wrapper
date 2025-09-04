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

let _ = testsuites()

private func testsuites(): Unit {
    registerTestSuite("TitleMenuDialog_UT_1") {TitleMenuDialog_UT_1()}
    registerTestSuite("TitleMenuDialog_UT_1_1") {TitleMenuDialog_UT_1_1()}
    registerTestSuite("TitleMenuDialog_UT_2") {TitleMenuDialog_UT_2()}
    registerTestSuite("TitleMenuDialog_UT_2_1") {TitleMenuDialog_UT_2_1()}
}

let UT_views: ObservedArrayList<String> = ObservedArrayList<String>(
    [
        "TitleMenuDialog_UT1",
        "TitleMenuDialog_UT2"
    ]
)
let UT1 = ObservedArrayList<String>(
    [
        "View_Accessibility",
        "View_ActionSheet",
        "View_AlertDialog",
        "View_DatePickerDialog",
        "View_ContextMenu",
        "View_CustomDialog",
        "View_CustomDialog2",
        "View_DatePicker",
        "View_Menu",
        "View_MenuBindContextMenu",
        "View_MenuBindMenu",
        "View_Menucontrol",
        "View_MenuItem"
    ]
)
let UT2 = ObservedArrayList<String>(
    [
        "View_MenuItemGroup",
        "View_Prompt",
        "View_Accessibility",
        "View_Global"
    ]
)
