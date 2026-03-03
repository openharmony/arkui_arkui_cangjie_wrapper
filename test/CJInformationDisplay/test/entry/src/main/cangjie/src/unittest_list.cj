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

func testsuites(): Unit {
    registerTestSuite("InformationDisplayUT1") {InformationDisplayUT1()}
    registerTestSuite("InformationDisplayUT2") {InformationDisplayUT2()}
}
let UT_views = ObservedArrayList<String>([
    "InformationDisplayIndex1",
    "InformationDisplayIndex2"
])
let UT1 = ObservedArrayList<String>([
    "ViewAlphabetIndexer",
    "ViewBadge",
    "ViewBlank",
    "ViewCounter",
    "ViewDataPanel",
    "ViewDivider",
    "ViewGauge",
    "ViewLoadingProgress",
    "ViewPatternLock2"
])
let UT2 = ObservedArrayList<String>([
    "ViewProgress",
    "ViewQRCode",
    "ViewRelativeContainer",
    "ViewRelativeContainer3",
    "ViewStack",
    "ViewTextTimer2",
    "ViewTextTimer",
    "ViewVideo",
    "ViewVideo2",
    "ViewWeb",
    "ViewComponentUtilsBasic",
    "ViewComponentUtilsAdvanced"
])
