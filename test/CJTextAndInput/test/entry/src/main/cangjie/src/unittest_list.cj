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
private func testsuites():Unit{
    registerTestSuite("TextAndInput_UT_1") {TextAndInput_UT_1()}
    registerTestSuite("TextAndInput_UT_1_1") {TextAndInput_UT_1_1()}
    registerTestSuite("TextAndInput_UT_2") {TextAndInput_UT_2()}
    registerTestSuite("TextAndInput_UT_2_1") {TextAndInput_UT_2_1()}
    registerTestSuite("TextAndInput_UT_2_2") {TextAndInput_UT_2_2()}
}

let UT_views = [
    "TextAndInput_UT1",
    "TextAndInput_UT2"
]
let UT1 = [
    "View_Font",
    "View_ImageSpan",
    "View_RichEditor",
    "View_RichEditor2",
    "View_RichText",
    "View_Search",
    "View_Span"
]
let UT2 = [
    "View_Text",
    "View_TextContentControllerBase",
    "View_TextArea",
    "View_TextClock",
    "View_TextInput",
    "View_TextInput_Enhance"
]
