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

let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("ButtonSelect_UT_1") {ButtonSelect_UT_1()}
    registerTestSuite("ButtonSelect_UT_2") {ButtonSelect_UT_2()}
}

let UT_views = [
    "Index_UT1",
    "Index_UT2"
]
let UT1 = [
    "View_CheckboxGroup",
    "View_Rating",
    "View_Router1",
    "View_Router2",
    "View_Select"
]
let UT2 = [
    "View_Stepper",
    "View_Tab",
    "View_TabContent",
    "View_TextPicker",
    "View_Toggle"
]