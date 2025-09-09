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
 * Created on 2024/6/24
 */
package ohos_app_cangjie_entry
 
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewRowSplit{
    func build() {
        Column() {
            Text("The split line can be dragged")
            RowSplit() {
                Text("row split 1").size(width: 25.percent, height: 200.px).backgroundColor(0xF5DEB3).id("row_split_1")
                Text("row split 2").size(width: 25.percent, height: 200.px).backgroundColor(0xD2B48C).id("row_split_2")
                Text("row split 3").size(width: 25.percent, height: 200.px).backgroundColor(0xF5DEB3).id("row_split_3")
                Text("row split 4").size(width: 25.percent, height: 200.px).backgroundColor(0xD2B48C).id("row_split_4")
            }
            .resizeable(true)
            .width(100.percent)
            .backgroundColor(0xAFEEEE)
        }
        .width(100.percent)
    }
}