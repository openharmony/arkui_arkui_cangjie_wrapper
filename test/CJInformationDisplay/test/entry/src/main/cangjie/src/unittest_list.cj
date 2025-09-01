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

let _ = testsuites()

func testsuites(): Unit {
    registerTestSuite("InformationDisplay_UT2") {InformationDisplay_UT_2()}
    registerTestSuite("InformationDisplay_UT1") {InformationDisplay_UT_1()}
}

let UT_views = ObservedArrayList<String>(
    [
        "Index_UT1",
        "Index_UT2"
    ]
)
let UT1 = ObservedArrayList<String>(
    [
        "View_AlphabetIndexer",
        "View_Badge",
        "View_Blank",
        "View_Counter",
        "View_DataPanel",
        "View_Divider",
        "View_Gauge",
        "View_LoadingProgress",
        "View_PatternLock2"
    ]
)
let UT2 = ObservedArrayList<String>(
    [
        "View_Progress",
        "View_QRCode",
        "View_Relative_Container",
        "View_Relative_Container3",
        "View_Stack",
        "View_TextTimer2",
        "View_TextTimer",
        "View_Video",
        "View_Video2",
        "View_Web"
    ]
)
