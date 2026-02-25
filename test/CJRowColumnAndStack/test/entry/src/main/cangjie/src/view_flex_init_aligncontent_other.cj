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
class ViewFlexInitAlignContentOther {
    func build() {
        Scroll() {
            Column() {
                Flex(alignContent: FlexAlign.Start) {
                    Text("test")
                }.id("testFlexInitAlignContentNormalValue1")
                
                Flex(wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center) {
                    Text("test")
                }.id("testFlexInitAlignContentNormalValue2")
                
                Flex(wrap: FlexWrap.Wrap, alignContent: FlexAlign.End) {
                    Text("test")
                }.id("testFlexInitAlignContentNormalValue3")
                
                Flex(wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceBetween) {
                    Text("test")
                }.id("testFlexInitAlignContentNormalValue4")
                
                Flex(wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceAround) {
                    Text("test")
                }.id("testFlexInitAlignContentNormalValue5")
                
                Flex(wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceEvenly) {
                    Text("test")
                }.id("testFlexInitAlignContentNormalValue6")
                
                Flex(direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center, alignContent: FlexAlign.Center) {
                    Text("Hello")
                }.id("testFlexInitNormalValue1")
                
                Flex(direction: FlexDirection.Column, wrap: FlexWrap.NoWrap, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Stretch) {
                    Text("1")
                    Text("2")
                }.id("testFlexInitNormalValue2")
                
                Flex(direction: FlexDirection.Row, wrap: FlexWrap.WrapReverse, justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Baseline, alignContent: FlexAlign.SpaceAround) {
                    Column() {
                        Text("1")
                        Text("2")
                    }.id("testFlexInitNormalValue3")
                }.id("testFlexInitNormalValue3")
                
                Flex(alignContent: Option.None) {
                    Text("test")
                }.id("testFlexInitAlignContentOptionNone")
            }
        }
    }
}
