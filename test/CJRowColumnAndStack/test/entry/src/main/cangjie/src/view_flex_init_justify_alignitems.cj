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
class ViewFlexInitJustifyAlignItems {
    func build() {
        Scroll() {
            Column() {
                Flex(justifyContent: FlexAlign.Start) {
                    Text("test")
                }.id("testFlexInitJustifyContentNormalValue1")
                
                Flex(justifyContent: FlexAlign.Center) {
                    Text("test")
                }.id("testFlexInitJustifyContentNormalValue2")
                
                Flex(justifyContent: FlexAlign.End) {
                    Text("test")
                }.id("testFlexInitJustifyContentNormalValue3")
                
                Flex(justifyContent: FlexAlign.SpaceBetween) {
                    Text("test")
                }.id("testFlexInitJustifyContentNormalValue4")
                
                Flex(justifyContent: FlexAlign.SpaceAround) {
                    Text("test")
                }.id("testFlexInitJustifyContentNormalValue5")
                
                Flex(justifyContent: FlexAlign.SpaceEvenly) {
                    Text("test")
                }.id("testFlexInitJustifyContentNormalValue6")
                
                Flex(alignItems: ItemAlign.Auto) {
                    Text("test")
                }.id("testFlexInitAlignItemsNormalValue1")
                
                Flex(alignItems: ItemAlign.Start) {
                    Text("test")
                }.id("testFlexInitAlignItemsNormalValue2")
                
                Flex(alignItems: ItemAlign.Center) {
                    Text("test")
                }.id("testFlexInitAlignItemsNormalValue3")
                
                Flex(alignItems: ItemAlign.End) {
                    Text("test")
                }.id("testFlexInitAlignItemsNormalValue4")
                
                Flex(alignItems: ItemAlign.Stretch) {
                    Text("test")
                }.id("testFlexInitAlignItemsNormalValue5")
                
                Flex(alignItems: ItemAlign.Baseline) {
                    Text("test")
                }.id("testFlexInitAlignItemsNormalValue6")
                
                Flex(justifyContent: Option.None) {
                    Text("test")
                }.id("testFlexInitJustifyContentOptionNone")
                
                Flex(alignItems: Option.None) {
                    Text("test")
                }.id("testFlexInitAlignItemsOptionNone")
            }
        }
    }
}
