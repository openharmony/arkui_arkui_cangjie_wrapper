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
class ViewRowAlignItems {
    func build() {
        Column() {
            Row() {
                Text("test")
            }
            .alignItems(VerticalAlign.Top)
            .id("testRowAlignItemsNormalValue1")
            
            Row() {
                Text("test")
            }
            .alignItems(VerticalAlign.Center)
            .id("testRowAlignItemsNormalValue2")
            
            Row() {
                Text("test")
            }
            .alignItems(VerticalAlign.Bottom)
            .id("testRowAlignItemsNormalValue3")
            
            Row() {
                Text("test")
            }.id("testRowAlignItemsNoCall")
            
            Row() {
                Text("test")
            }
            .alignItems(Option.None)
            .id("testRowAlignItemsOptionNone")
        }
    }
}
