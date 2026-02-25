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
class ViewColumnInit {
    func build() {
        Column() {
            Column(space: 10.vp) {
                Text("test")
            }.id("testColumnInitSpaceNormalValue1")
            
            Column(space: 5.px) {
                Text("test")
            }.id("testColumnInitSpaceNormalValue2")
            
            Column(space: 2.fp) {
                Text("test")
            }.id("testColumnInitSpaceNormalValue3")
            
            Column() {
                Text("Hello")
            }.id("testColumnInitChildNormalValue1")
            
            Column() {
                Image("icon.png")
            }.id("testColumnInitChildNormalValue2")
            
            Column(space: 10.vp) {
                Text("Hello")
            }.id("testColumnInitNormalValue1")
            
            Column(space: 5.px) {
                Image("icon.png")
            }.id("testColumnInitNormalValue2")
            
            Column(space: (-1).vp) {
                Text("test")
            }.id("testColumnInitSpaceExceptionValue1")
            
            Column(space: 1.percent) {
                Text("test")
            }.id("testColumnInitNormalValue3")
            
            Column(space: 0.vp) {
                Text("test")
            }.id("testColumnInitSpaceBoundaryValue1")
            
            Column(space: 0) {
                Text("test")
            }.id("testColumnInitSpaceBoundaryValue2")
            
            Column() {
                Text("test")
            }.id("testColumnInitNoCall")
            
            Column(space: Option.None) {
                Text("test")
            }.id("testColumnInitSpaceOptionNone")
        }
    }
}
