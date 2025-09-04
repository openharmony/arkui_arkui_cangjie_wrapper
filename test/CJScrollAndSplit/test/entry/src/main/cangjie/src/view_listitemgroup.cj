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
 * Created on 2024/7/4
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_ListItemGroup {
    @Builder
    func HeaderBuilder() {
        Row {
            Text("Header").fontSize(20.vp)
        }.width(100.percent).justifyContent(FlexAlign.Center).margin(top: 10.vp)
    }


    @Builder
    func HeaderBuilder2(text: String, size: Length, align: FlexAlign) {
        Row {
            Text(text).fontSize(size)
        }.width(100.percent).justifyContent(align).margin(top: 10.vp)
    }

    func build() {
        Column() {
            Column() {
                List(space: 20) {
                    ListItemGroup(
                        header: bind(this.HeaderBuilder, this),
                        footer: {=> Text("Footer 1")},
                        space: 10.vp
                    ) {
                        ListItem() {
                            Text("item 1-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 1-2")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 1-3")
                        }.width(90.percent).margin(5.percent)
                    }.id("list_item_group").borderRadius(10.vp).backgroundColor(Color.White).divider(ListDividerOptions(strokeWidth: 2.vp,
                        color: Color(0X808080), startMargin: 10.vp, endMargin: 10.vp))
                }
            }.height(25.percent)

            Column() {
                List(space: 20) {
                    ListItemGroup(
                        header: {=> bind(this.HeaderBuilder2, this)("Header", 20.vp, FlexAlign.Center)},
                        footer: {=> Text("Footer 2")},
                        space: 10) {
                        ListItem() {
                            Text("item 2-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 2-2")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 2-3")
                        }.width(90.percent).margin(5.percent)
                    }.id("list_item_group2").borderRadius(10.vp).backgroundColor(Color.White).divider(ListDividerOptions(strokeWidth: 2.vp,
                        color: @r(app.color.blue_23C452), startMargin: 10.vp, endMargin: 10.vp))
                }
            }.height(25.percent)

            Column() {
                List(space: 20) {
                    ListItemGroup(
                        header: bind(this.HeaderBuilder, this), footer: {=> Text("Footer 3")},
                        space: 8.5) {
                        ListItem() {
                            Text("item 3-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 3-2")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 3-3")
                        }.width(90.percent).margin(5.percent)
                    }.id("list_item_group3").borderRadius(10.vp).backgroundColor(Color.White).divider(
                        ListDividerOptions(strokeWidth: @r(app.string.control_Width), color: Color.Blue,
                        startMargin: @r(app.string.control_Width), endMargin: @r(app.string.control_Width)))
                }
            }.height(25.percent)

            Column() {
                List(space: 20) {
                    ListItemGroup(
                        space: 10.vp) {
                        ListItem() {
                            Text("item 4-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 4-2")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 4-3")
                        }.width(90.percent).margin(5.percent).swipeAction()
                    }.id("list_item_group4").borderRadius(10.vp).backgroundColor(Color.White).divider(
                        ListDividerOptions(strokeWidth: @r(app.string.control_Width), color: @r(app.color.blue_23C452),
                        startMargin: @r(app.string.control_Width), endMargin: @r(app.string.control_Width)))
                }
            }.height(25.percent)

            Column() {
                List(space: 20) {
                    ListItemGroup() {
                        ListItem() {
                            Text("item 5-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 5-2")
                        }.width(90.percent).margin(5.percent)
                    }
                }.listDirection(Axis.Vertical)
            }.height(25.percent)

            Column() {
                List(space: 20) {
                    ListItemGroup(space: 10.0) {
                        ListItem() {
                            Text("item 6-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 6-2")
                        }.width(90.percent).margin(5.percent).swipeAction()
                    }
                }.listDirection(Axis.Horizontal).chainAnimation(false).cachedCount(1)
            }.height(25.percent)

            Column() {
                List(space: 20) {
                    ListItemGroup(space: 3.vp, style: ListItemGroupStyle.Card) {
                        ListItem() {
                            Text("item 7-1")
                        }.width(90.percent).margin(5.percent)

                        ListItem() {
                            Text("item 7-2")
                        }.width(90.percent).margin(5.percent).swipeAction(edgeEffect: SwipeEdgeEffect.Spring)
                    }
                }.listDirection(Axis.Vertical).chainAnimation(false).cachedCount(1)
            }.height(25.percent)
        }.height(800.vp).backgroundColor(Color(0XD3D3D3))
    }
}
