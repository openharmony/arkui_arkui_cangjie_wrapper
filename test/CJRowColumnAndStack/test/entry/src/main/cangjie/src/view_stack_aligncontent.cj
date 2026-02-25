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
class ViewStackAlignContent {
    func build() {
        Column() {
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.TopStart)
            .id("testStackAlignContentNormalValue1")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.Top)
            .id("testStackAlignContentNormalValue2")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.TopEnd)
            .id("testStackAlignContentNormalValue3")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.Start)
            .id("testStackAlignContentNormalValue4")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.Center)
            .id("testStackAlignContentNormalValue5")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.End)
            .id("testStackAlignContentNormalValue6")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.BottomStart)
            .id("testStackAlignContentNormalValue7")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.Bottom)
            .id("testStackAlignContentNormalValue8")
            
            Stack() {
                Text("test")
            }
            .alignContent(Alignment.BottomEnd)
            .id("testStackAlignContentNormalValue9")
            
            Stack() {
                Text("test")
            }.id("testStackAlignContentNoCall")
            
            Stack() {
                Text("test")
            }
            .alignContent(Option.None)
            .id("testStackAlignContentOptionNone")
        }
    }
}
