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

@Entry
@Component
class View_Row {
    func build() {
        Column(space: 5) {
            // 设置子组件水平方向的间距为5
            Text("space").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row(space: 5) {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.width(90.percent).height(107).border(width: 1.vp)

            // 设置子元素垂直方向对齐方式
            Text("alignItems(Bottom)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row() {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.alignItems(VerticalAlign.Bottom).width(90.percent).height(15.percent).border(width: 1.vp).id("row")

            Text("alignItems(Center)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row() {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.alignItems(VerticalAlign.Center).width(90.percent).height(15.percent).border(width: 1.vp)

            // 设置子元素水平方向对齐方式
            Text("justifyContent(End)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row() {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.height(15.percent).width(90.percent).border(width: 1.vp).justifyContent(FlexAlign.End)

            Text("justifyContent(Center)").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row() {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.width(90.percent).border(width: 1.vp).justifyContent(FlexAlign.Center)

            Text("length").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row(space: 6.vp) {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.width(90.percent).height(107).border(width: 1.vp)

            Text("float").fontSize(9).fontColor(0xCCCCCC).width(90.percent)
            Row(space: 7.0) {
                Row().width(30.percent).height(50).backgroundColor(0xAFEEEE)
                Row().width(30.percent).height(50).backgroundColor(0x00FFFF)
            }.width(90.percent).height(107).border(width: 1.vp)
        }.width(100.percent).padding(top: 5)
    }
}
