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

let Direction_Prop_List: ArrayList<(String, Direction, String)> = ArrayList<(String, Direction, String)>(
    [
        ("Ltr", Direction.Ltr, "\"Direction.Ltr\""),
        ("Rtl", Direction.Rtl, "\"Direction.Rtl\""),
        ("Auto", Direction.Auto, "\"Direction.Auto\"")
    ]
)
let Colors = [Color(0x98FB98), Color(0x317aff), Color(0xFFD700), Color(0xFFE4E1), Color(0xAB82FF)]

@Entry
@Component
class View_Flex {
    func build() {
        Column() {
            Text("direction:Row")
            Row() {
                Flex(direction: FlexDirection.Row) { // 子组件在容器主轴上行布局
                    Text("flex 1").size(width: 20.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_1")
                    Text("flex 2").size(width: 20.percent, height: 200.px).backgroundColor(0xD2B48C).id("flex_2")
                    Text("flex 3").size(width: 20.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_3")
                    Text("flex 4").size(width: 20.percent, height: 200.px).backgroundColor(0xD2B48C).id("flex_4")
                }
            }.width(100.percent).backgroundColor(0xAFEEEE)

            Text("Wrap")
            Row() {
                Flex(wrap: FlexWrap.Wrap) { // 子组件多行布局
                    Text("flex 5").size(width: 50.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_5")
                    Text("flex 6").size(width: 50.percent, height: 200.px).backgroundColor(0xD2B48C).id("flex_6")
                    Text("flex 7").size(width: 50.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_7")
                }.size(width: 500.vp, height: 500.vp).id("my_flex_2")
            }.width(100.percent).backgroundColor(0xAFEEEE)

            Flex() {}
            Flex(direction: FlexDirection.RowReverse) {}
            Flex(direction: FlexDirection.ColumnReverse) {}
            Flex(wrap: FlexWrap.WrapReverse) {}

            Row() {
                Flex(
                    direction: FlexDirection.Row,
                    wrap: FlexWrap.NoWrap,
                    justifyContent: FlexAlign.Start,
                    alignItems: ItemAlign.Start,
                    alignContent: FlexAlign.Start,
                ) {
                    Text("flex 8").size(width: 50.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_8")
                    Text("flex 9").size(width: 50.percent, height: 200.px).backgroundColor(0xD2B48C).id("flex_9")
                    Text("flex 10").size(width: 50.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_10")
                }.size(width: 500.vp, height: 500.vp).id("my_flex_3")
            }.width(100.percent).backgroundColor(0xAFEEEE)

            Row() {
                Flex(
                    direction: FlexDirection.Row,
                    wrap: FlexWrap.Wrap,
                    justifyContent: FlexAlign.Start,
                    alignItems: ItemAlign.Start,
                    alignContent: FlexAlign.Start,
                ) {
                    Text("flex 11").size(width: 50.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_11")
                    Text("flex 12").size(width: 50.percent, height: 200.px).backgroundColor(0xD2B48C).id("flex_12")
                    Text("flex 13").size(width: 50.percent, height: 200.px).backgroundColor(0xF5DEB3).id("flex_13")
                }.size(width: 500.vp, height: 500.vp).id("my_flex_4")
            }.width(100.percent).backgroundColor(0xAFEEEE)

        //            LazyForEach(
        //                Direction_PropDataSource(Direction_Prop_List),
        //                itemGeneratorFunc: {
        //                    Direction_Prop: (String, Direction, String), idx: Int64 => Flex() {
        //                        Text("1").height(80.percent).width(80.percent).backgroundColor(Colors[1])
        //                    }.width(80.percent).height(100).backgroundColor(Colors[0]).id("Flex" + Direction_Prop[0]).direction(Direction_Prop[1])
        //                }
        //            )
        }.width(100.percent)
    }
}

class Direction_PropDataSource <: IDataSource<(String, Direction, String)> {
    public Direction_PropDataSource(let data_: ArrayList<(String, Direction, String)>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): (String, Direction, String) {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func notifyChange(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }
}
