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
    registerTestSuite("ScrollSplit_UT1") {ScrollSplit_UT_1()}
    registerTestSuite("ScrollSplit_UT2") {ScrollSplit_UT_2()}
}
let UT_views = [
    "ScrollSplit_UT1",
    "ScrollSplit_UT2"
]
let UT1 = [
    "View_Column",
    "View_Flex",
    "View_Foreach",
    "View_Grid",
    "View_Grid2",
    "View_Grid_Col",
    "View_Grid_Item",
    "View_Grid_Row",
    "View_Ifelse",
    "View_Lazyforeach",
    "View_Lazyforeach_DataOptions",
    "View_List",
    "View_List2",
    "View_ListItem",
    "View_ListItemGroup"
]
let UT2 = [
    "View_PageTransition",
    "View_PageTransition2",
    "View_Refresh",
    "View_Row",
    "View_RowSplit",
    "View_Scroll",
    "View_Scroll_2",
    "View_Scrollbar",
    "View_SideBar",
    "View_SideBar_Default",
    "View_SideBar_Enhance",
    "View_SideBar_Init",
    "View_Swiper"
]