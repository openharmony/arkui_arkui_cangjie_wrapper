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
class ViewRowInit {
    func build() {
        Column() {
            Row(space: 10.vp) {
                Text("test")
            }.id("testRowInitSpaceNormalValue1")
            
            Row(space: 5.px) {
                Text("test")
            }.id("testRowInitSpaceNormalValue2")
            
            Row(space: 2.fp) {
                Text("test")
            }.id("testRowInitSpaceNormalValue3")
            
            Row() {
                Text("test")
            }.id("testRowInitChildNormalValue1")
            
            Row() {
                Text("test")
            }.id("testRowInitChildNormalValue2")
            
            Row(space: 10.vp) {
                Text("test")
            }.id("testRowInitNormalValue1")
            
            Row(space: 5.px) {
                Image("icon.png")
            }.id("testRowInitNormalValue2")
            
            Row(space: (-1).vp) {
                Text("test")
            }.id("testRowInitSpaceExceptionValue1")
            
            Row(space: 1.percent) {
                Text("test")
            }.id("testRowInitSpaceExceptionValue2")
            
            Row(space: 0.vp) {
                Text("test")
            }.id("testRowInitSpaceBoundaryValue1")
            
            Row(space: 0) {
                Text("test")
            }.id("testRowInitSpaceBoundaryValue2")
            
            Row() {
                Text("test")
            }.id("testRowInitNoCall")
            
            Row(space: Option.None) {
                Text("test")
            }.id("testRowInitSpaceOptionNone")
        }
    }
}
