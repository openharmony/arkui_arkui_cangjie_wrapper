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
    registerTestSuite("StateManagementUTState") {StateManagementUTState()}
    registerTestSuite("StateManagementUTProp") {StateManagementUTProp()}
    registerTestSuite("StateManagementUTLink") {StateManagementUTLink()}
    // registerTestSuite("StateManagementUTProvideConsume") {StateManagementUTProvideConsume()}
    // registerTestSuite("StateManagementUTWatch") {StateManagementUTWatch()}
    // registerTestSuite("StateManagementUTObservedPublish") {StateManagementUTObservedPublish()}
    // registerTestSuite("StateManagementUTBuilder") {StateManagementUTBuilder()}
}

// Index pages for different macro categories
let UT_views = [
    "StateManagementIndexState",      // @State index
    "StateManagementIndexProp",       // @Prop index
    "StateManagementIndexLink",       // @Link index
    "StateManagementIndexProvideConsume",  // @Provide/@Consume index
    "StateManagementIndexWatch",       // @Watch index
    "StateManagementIndexObservedPublish",  // @Observed/@Publish index
    "StateManagementIndexBuilder"      // @Builder/@BuilderParam index
]

// @State test pages (TC_001-TC_014)
let UT1 = [
    "ViewStateTC001",
    "ViewStateTC002",
    "ViewStateTC003",
    "ViewStateTC004",
    "ViewStateTC005",
    "ViewStateTC006",
    "ViewStateTC007",
    "ViewStateTC008",
    "ViewStateTC009",
    "ViewStateTC010",
    "ViewStateTC011",
    "ViewStateTC012",
    "ViewStateTC013",
    "ViewStateTC014"
]

// @Prop test pages (TC_015-TC_024)
let UT2 = [
    "ViewPropTC015",
    "ViewPropTC016",
    "ViewPropTC017",
    "ViewPropTC018",
    "ViewPropTC019",
    "ViewPropTC020",
    "ViewPropTC021",
    "ViewPropTC022",
    "ViewPropTC023",
    "ViewPropTC024"
]

// @Link test pages (TC_025-TC_032)
let UT3 = [
    "ViewLinkTC025",
    "ViewLinkTC026",
    "ViewLinkTC027",
    "ViewLinkTC028",
    "ViewLinkTC029",
    "ViewLinkTC030",
    "ViewLinkTC031",
    "ViewLinkTC032"
]

// @Provide/@Consume test pages (TC_033-TC_041)
let UT4 = [
    "ViewProvideConsumeTC033",
    "ViewProvideConsumeTC034",
    "ViewProvideConsumeTC035",
    "ViewProvideConsumeTC036",
    "ViewProvideConsumeTC037",
    "ViewProvideConsumeTC038",
    "ViewProvideConsumeTC039",
    "ViewProvideConsumeTC040",
    "ViewProvideConsumeTC041"
]

// @Watch test pages (TC_040-TC_047)
let UT5 = [
    "ViewWatchTC040",
    "ViewWatchTC041",
    "ViewWatchTC042",
    "ViewWatchTC043",
    "ViewWatchTC044",
    "ViewWatchTC045",
    "ViewWatchTC046",
    "ViewWatchTC047"
]

// @Observed/@Publish test pages (TC_048-TC_057)
let UT6 = [
    "ViewObservedPublishTC048",
    "ViewObservedPublishTC049",
    "ViewObservedPublishTC050",
    "ViewObservedPublishTC051",
    "ViewObservedPublishTC052",
    "ViewObservedPublishTC053",
    "ViewObservedPublishTC054",
    "ViewObservedPublishTC055",
    "ViewObservedPublishTC056",
    "ViewObservedPublishTC057"
]

// @Builder/@BuilderParam test pages (TC_058-TC_077)
let UT7 = [
    "ViewBuilderTC058",
    "ViewBuilderTC059",
    "ViewBuilderTC060",
    "ViewBuilderTC061",
    "ViewBuilderTC062",
    "ViewBuilderTC063",
    "ViewBuilderTC064",
    "ViewBuilderTC065",
    "ViewBuilderTC066",
    "ViewBuilderTC067",
    "ViewBuilderTC068",
    "ViewBuilderTC069",
    "ViewBuilderTC070",
    "ViewBuilderTC071",
    "ViewBuilderTC072",
    "ViewBuilderTC073",
    "ViewBuilderTC074",
    "ViewBuilderTC075",
    "ViewBuilderTC076",
    "ViewBuilderTC077"
]

