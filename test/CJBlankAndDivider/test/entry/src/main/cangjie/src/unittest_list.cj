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

/**
 * Created on 2026/01/31
 */
package ohos_app_cangjie_entry
let _ = testsuites()
private func testsuites():Unit{
    registerTestSuite("BlankAndDividerUTBlank") {BlankAndDividerUTBlank()}
    registerTestSuite("BlankAndDividerUTDivider") {BlankAndDividerUTDivider()}
}

let UT_views = [
    "BlankAndDivider4Blank",
    "BlankAndDivider4Divider"
]

// Blank测试用例列表
let UT1 = [
    "ViewBlankInitMinNormal",
    "ViewBlankInitMinSpecial",
    "ViewBlankColor"
]

// Divider测试用例列表
let UT2 = [
    "ViewDividerInit",
    "ViewDividerVerticalNormal",
    "ViewDividerVerticalSpecial",
    "ViewDividerColor",
    "ViewDividerStrokeWidth",
    "ViewDividerLineCap"
]
