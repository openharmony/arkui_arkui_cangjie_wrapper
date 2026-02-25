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
class ViewStackInit {
    func build() {
        Column() {
            Stack(alignContent: Alignment.TopStart) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue1")
            
            Stack(alignContent: Alignment.Top) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue2")
            
            Stack(alignContent: Alignment.TopEnd) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue3")
            
            Stack(alignContent: Alignment.Start) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue4")
            
            Stack(alignContent: Alignment.Center) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue5")
            
            Stack(alignContent: Alignment.End) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue6")
            
            Stack(alignContent: Alignment.BottomStart) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue7")
            
            Stack(alignContent: Alignment.Bottom) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue8")
            
            Stack(alignContent: Alignment.BottomEnd) {
                Text("test")
            }.id("testStackInitAlignContentNormalValue9")
            
            Stack() {
                Text("test")
            }.id("testStackInitChildNormalValue1")
            
            Stack() {
                Text("test")
            }.id("testStackInitChildNormalValue2")
            
            Stack(alignContent: Alignment.Center) {
                Text("test")
            }.id("testStackInitNormalValue1")
            
            Stack(alignContent: Alignment.TopStart) {
                Text("test")
            }.id("testStackInitNormalValue2")
            
            Stack(alignContent: Alignment.BottomEnd) {
                Text("test")
                Image("icon.png")
            }.id("testStackInitNormalValue3")
            
            Stack() {
                Text("test")
            }.id("testStackInitNoCall")
            
            Stack(alignContent: Option.None) {
                Text("test")
            }.id("testStackInitAlignContentOptionNone")
        }
    }
}
