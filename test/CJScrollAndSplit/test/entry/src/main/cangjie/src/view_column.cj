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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class View_Column {
    func build() {
        Column {
            Text("space").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Column(space: 5) {
                Column().width(80.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(80.percent).height(30).backgroundColor(0x00FFFF)
            }.width(90.percent).height(100).border(width: 1.vp).id("my_col_1")

            Text("alignItems(Start)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Column {
                Column().width(50.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(50.percent).height(30).backgroundColor(0x00FFFF)
            }.alignItems(HorizontalAlign.Start).width(90.percent).border(width: 1.vp).id("my_col_2")

            Text("alignItems(End)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Column {
                Column().width(50.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(50.percent).height(30).backgroundColor(0x00FFFF)
            }.alignItems(HorizontalAlign.End).width(90.percent).border(width: 1.vp).id("my_col_3")

            Text("justifyContent(Center)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Column {
                Column().width(30.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(30.percent).height(30).backgroundColor(0x00FFFF)
            }.height(15.percent).border(width: 1.vp).justifyContent(FlexAlign.Center).id("my_col_4")

            Text("justifyContent(End)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Column {
                Column().width(30.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(30.percent).height(30).backgroundColor(0x00FFFF)
            }.height(15.percent).border(width: 1.vp).justifyContent(FlexAlign.End).id("my_col_5")

            Text("init test")
            Column(space: 6.vp) {
                Column().width(80.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(80.percent).height(30).backgroundColor(0x00FFFF)
            }.width(90.percent).height(100).border(width: 1.vp).id("my_col_6")

            Column(space: 7.vp).width(90.percent).height(100).border(width: 1.vp).id("my_col_7")

            Column(space: 8.0) {
                Column().width(80.percent).height(30).backgroundColor(0xAFEEEE)
                Column().width(80.percent).height(30).backgroundColor(0x00FFFF)
            }.width(90.percent).height(100).border(width: 1.vp).id("my_col_8")

            Column(space: 9.0).width(90.percent).height(100).border(width: 1.vp).id("my_col_9")

            Column(space: 10).width(90.percent).height(100).border(width: 1.vp).id("my_col_10")
        }.width(100.percent).padding(top: 5)
    }
}
