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

let _ = testsuites()

private func testsuites(): Unit {
    registerTestSuite("GridColUTGridRowInit") {GridColUTGridRowInit()}
    registerTestSuite("GridColUTGridRowInit2") {GridColUTGridRowInit2()}
    registerTestSuite("GridColUTGridRowProp") {GridColUTGridRowProp()}
    registerTestSuite("GridColUTGridRowEvent") {GridColUTGridRowEvent()}
    registerTestSuite("GridColUTGridColInit") {GridColUTGridColInit()}
    registerTestSuite("GridColUTGridColInit2") {GridColUTGridColInit2()}
    registerTestSuite("GridColUTGridColProp") {GridColUTGridColProp()}
    registerTestSuite("GridColUTRowSplit") {GridColUTRowSplit()}
}

let UT_views = [
    "GridColIndexGridRowInit",
    "GridColIndexGridRowProp",
    "GridColIndexGridRowEvent",
    "GridColIndexGridColInit",
    "GridColIndexGridColProp",
    "GridColIndexRowSplit"
]

let UT_GridRowInit = [
    "ViewGridRowInitInt32Part1",
    "ViewGridRowInitInt32Part2",
    "ViewGridRowInitInt32Part3",
    "ViewGridRowInitOptionsPart1",
    "ViewGridRowInitOptionsPart2",
    "ViewGridRowInitGutterOptionInt32Part1",
    "ViewGridRowInitGutterOptionInt32Part2",
    "ViewGridRowInitGutterOptionInt32Part3",
    "ViewGridRowInitGutterOptionOptionsPart1",
    "ViewGridRowInitGutterOptionOptionsPart2",
    "ViewGridRowInitGutterOptionOptionsPart3"
]

let UT_GridRowProp = [
    "ViewGridRowAlignItems1",
    "ViewGridRowAlignItems2",
    "ViewGridRowAlignItems"
]

let UT_GridRowEvent = [
    "ViewGridRowOnBreakpointChange1",
    "ViewGridRowOnBreakpointChange2",
    "ViewGridRowOnBreakpointChange"
]

let UT_GridColInit = [
    "ViewGridColInitInt32Part1",
    "ViewGridColInitInt32",
    "ViewGridColInitOptions",
    "ViewGridColInitOptionsPart1",
    "ViewGridColInitOptionsPart2"
]

let UT_GridColProp = [
    "ViewGridColSpanInt32",
    "ViewGridColSpanOptions",
    "ViewGridColGridColOffsetInt32",
    "ViewGridColGridColOffsetInt32Part2",
    "ViewGridColGridColOffsetOptions",
    "ViewGridColOrderInt32",
    "ViewGridColOrderInt32Part2",
    "ViewGridColOrderOptions"
]

let UT_RowSplit = [
    "ViewRowSplitInitPart1",
    "ViewRowSplitInit",
    "ViewRowSplitResizeable"
]
