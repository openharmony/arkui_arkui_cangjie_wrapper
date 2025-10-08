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
    registerTestSuite("TitleMenuDialogUT1") {TitleMenuDialogUT1()}
    registerTestSuite("TitleMenuDialogUT11") {TitleMenuDialogUT11()}
    registerTestSuite("TitleMenuDialogUT2") {TitleMenuDialogUT2()}
    registerTestSuite("TitleMenuDialogUT21") {TitleMenuDialogUT21()}
}

let UT_views: ObservedArrayList<String> = ObservedArrayList<String>(
    [
        "TitleMenuDialogIndex1",
        "TitleMenuDialogIndex2"
    ]
)
let UT1 = ObservedArrayList<String>(
    [
        "ViewAccessibility",
        "ViewActionSheet",
        "ViewAlertDialog",
        "ViewDatePickerDialog",
        "ViewContextMenu",
        "ViewCustomDialog",
        "ViewCustomDialog2",
        "ViewDatePicker",
        "ViewMenu",
        "ViewMenuBindContextMenu",
        "ViewMenuBindMenu",
        "ViewMenucontrol",
        "ViewMenuItem"
    ]
)
let UT2 = ObservedArrayList<String>(
    [
        "ViewMenuItemGroup",
        "ViewPrompt",
        "ViewAccessibility",
        "ViewGlobal"
    ]
)
