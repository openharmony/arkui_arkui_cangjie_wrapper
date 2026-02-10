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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/**
 * TC_098: @State Variable Used in Flex
 * Test Scenario: Use @State variable to control Flex's layout properties
 * Expected Result: Flex layout is correct, automatically updates when state changes
 */
extend FlexDirection {
    func toString(): String {
        match (this) {
            case FlexDirection.Row => "Row"
            case FlexDirection.Column => "Column"
            case FlexDirection.RowReverse => "RowReverse"
            case FlexDirection.ColumnReverse => "ColumnReverse"
            case _ => "Unknown"
        }
    }
}

extend FlexAlign {
    func toString(): String {
        match (this) {
            case FlexAlign.Start => "Start"
            case FlexAlign.Center => "Center"
            case FlexAlign.End => "End"
            case FlexAlign.SpaceBetween => "SpaceBetween"
            case FlexAlign.SpaceAround => "SpaceAround"
            case FlexAlign.SpaceEvenly => "SpaceEvenly"
            case _ => "Unknown"
        }
    }
}

@Entry
@Component
class ViewComponentTC098 {
    @State var flexDirection: FlexDirection = FlexDirection.Row
    @State var justifyContent: FlexAlign = FlexAlign.Start
    @State var itemCount: Int64 = 3

    func build(): Unit {
        Column() {
            Text("TC_098: @State Variable Used in Flex")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Direction: ${this.flexDirection.toString()}, Justify: ${this.justifyContent.toString()}, Items: ${this.itemCount}")
                .fontSize(14)
                .id("flex_props_display")

            Flex(direction: this.flexDirection, justifyContent:this.justifyContent) {
                ForEach(
                    [0, 1, 2],
                    itemGeneratorFunc: { _: Int64, index: Int64 =>
                        Text("Item ${index}")
                            .fontSize(14)
                            .padding(10)
                            .backgroundColor(0xE8F4F8)
                            .id("flex_item_${index}")
                    }
                )
            }
            .width(100.percent)
            .height(100)
            .id("dynamic_flex")

            Button("Toggle Direction")
                .id("toggle_direction_button")
                .onClick({ e => 
                    if (this.flexDirection == FlexDirection.Row) {
                        this.flexDirection = FlexDirection.Column
                    } else {
                        this.flexDirection = FlexDirection.Row
                    }
                })

            Button("Change Justify")
                .id("change_justify_button")
                .onClick({ e => 
                    if (this.justifyContent == FlexAlign.Start) {
                        this.justifyContent = FlexAlign.Center
                    } else if (this.justifyContent == FlexAlign.Center) {
                        this.justifyContent = FlexAlign.End
                    } else {
                        this.justifyContent = FlexAlign.Start
                    }
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

