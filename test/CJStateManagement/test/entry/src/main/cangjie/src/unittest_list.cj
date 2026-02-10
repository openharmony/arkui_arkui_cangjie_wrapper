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
    registerTestSuite("StateManagementUTStorage") {StateManagementUTStorage()}
    registerTestSuite("StateManagementUTLocalStorage") {StateManagementUTLocalStorage()}
    registerTestSuite("StateManagementUTProvideConsume") {StateManagementUTProvideConsume()}
    registerTestSuite("StateManagementUTWatch") {StateManagementUTWatch()}
    registerTestSuite("StateManagementUTObservedPublish") {StateManagementUTObservedPublish()}
    registerTestSuite("StateManagementUTBuilder") {StateManagementUTBuilder()}
    registerTestSuite("StateManagementUTComplexTypes") {StateManagementUTComplexTypes()}
    registerTestSuite("StateManagementUTStateDriven") {StateManagementUTStateDriven()}
    registerTestSuite("StateManagementUTComponentUsage") {StateManagementUTComponentUsage()}
    registerTestSuite("StateManagementUTMultiMacro") {StateManagementUTMultiMacro()}
    registerTestSuite("StateManagementUTReusable") {StateManagementUTReusable()}
    registerTestSuite("StateManagementUTResource") {StateManagementUTResource()}
    registerTestSuite("StateManagementUTCustomDialog") {StateManagementUTCustomDialog()}
}

// Index pages for different macro categories
let UT_views = [
    "StateManagementIndexState",      // @State index
    "StateManagementIndexProp",       // @Prop index
    "StateManagementIndexLink",       // @Link index
    "StateManagementIndexStorage",    // @StorageLink/@StorageProp index
    "StateManagementIndexLocalStorage",  // @LocalStorageLink/@LocalStorageProp index
    "StateManagementIndexProvideConsume",  // @Provide/@Consume index
    "StateManagementIndexWatch",       // @Watch index
    "StateManagementIndexObservedPublish",  // @Observed/@Publish index
    "StateManagementIndexBuilder",      // @Builder/@BuilderParam index
    "StateManagementIndexComplexTypes",  // Complex types (TC_084-TC_092)
    "StateManagementIndexComponentUsage",  // Component usage (TC_093-TC_102)
    "StateManagementIndexStateDriven",  // State-driven updates (TC_103-TC_114)
    "StateManagementIndexMultiMacro",  // Multi-macro combination (TC_115-TC_123)
    "StateManagementIndexBoundary",  // Boundary scenarios (TC_124-TC_129, TC_142-TC_147)
    "StateManagementIndexReusable",  // @Reusable (TC_133-TC_136)
    "StateManagementIndexResource",  // Resource macros (TC_137-TC_139)
    "StateManagementIndexCustomDialog"  // @CustomDialog (TC_145-TC_147)
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

// @StorageLink/@StorageProp test pages (TC_069-TC_077)
let UT8 = [
    "ViewStorageTC069",
    "ViewStorageTC070",
    "ViewStorageTC071",
    "ViewStorageTC072",
    "ViewStorageTC073",
    "ViewStorageTC074",
    "ViewStorageTC075",
    "ViewStorageTC076",
    "ViewStorageTC077"
]

// @LocalStorageLink/@LocalStorageProp test pages (TC_078-TC_083)
let UT9 = [
    "ViewLocalStorageTC078",
    "ViewLocalStorageTC079",
    "ViewLocalStorageTC080",
    "ViewLocalStorageTC081",
    "ViewLocalStorageTC082",
    "ViewLocalStorageTC083"
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

// Complex types and custom types test pages (TC_084-TC_092)
let UT10 = [
    "ViewComplexTC084",
    "ViewComplexTC085",
    "ViewComplexTC086",
    "ViewComplexTC087",
    "ViewComplexTC088",
    "ViewComplexTC089",
    "ViewComplexTC090",
    "ViewComplexTC091",
    "ViewComplexTC092"
]

// State variable usage in components test pages (TC_093-TC_102)
let UT11 = [
    "ViewComponentTC093",
    "ViewComponentTC094",
    "ViewComponentTC095",
    "ViewComponentTC096",
    "ViewComponentTC097",
    "ViewComponentTC098",
    "ViewComponentTC099",
    "ViewComponentTC100",
    "ViewComponentTC101",
    "ViewComponentTC102"
]

// State-driven update scenarios test pages (TC_103-TC_114)
let UT12 = [
    "ViewDrivenTC103",
    "ViewDrivenTC104",
    "ViewDrivenTC105",
    "ViewDrivenTC106",
    "ViewDrivenTC107",
    "ViewDrivenTC108",
    "ViewDrivenTC109",
    "ViewDrivenTC110",
    "ViewDrivenTC111",
    "ViewDrivenTC112",
    "ViewDrivenTC113",
    "ViewDrivenTC114"
]

// Multi-macro combination test pages (TC_115-TC_123)
let UT13 = [
    "ViewMultiTC115",
    "ViewMultiTC116",
    "ViewMultiTC117",
    "ViewMultiTC118",
    "ViewMultiTC119",
    "ViewMultiTC120",
    "ViewMultiTC121",
    "ViewMultiTC122",
    "ViewMultiTC123"
]

// Boundary and exception scenarios test pages (TC_124-TC_129, TC_142-TC_147)
let UT14 = [
    "ViewBoundaryTC124",
    "ViewBoundaryTC125",
    "ViewBoundaryTC126",
    "ViewBoundaryTC127",
    "ViewBoundaryTC128",
    "ViewBoundaryTC129",
    "ViewBoundaryTC142",
    "ViewBoundaryTC143",
    "ViewBoundaryTC144",
    "ViewCustomDialogTC145",
    "ViewCustomDialogTC146",
    "ViewCustomDialogTC147"
]

// @Reusable test pages (TC_133-TC_136)
let UT15 = [
    "ViewReusableTC133",
    "ViewReusableTC134",
    "ViewReusableTC135",
    "ViewReusableTC136"
]

// Resource macro test pages (TC_137-TC_139)
let UT16 = [
    "ViewResourceTC137",
    "ViewResourceTC138",
    "ViewResourceTC139"
]

// @CustomDialog test pages (TC_145-TC_147)
let UT17 = [
    "ViewCustomDialogTC145",
    "ViewCustomDialogTC146",
    "ViewCustomDialogTC147"
]

