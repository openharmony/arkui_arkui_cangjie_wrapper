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
import std.collection.{ ArrayList, HashMap }

let showString: String = "Hello World"

@Entry
@Component
class ViewLocation{
    func build(){
        Column(){
            Button(ButtonOptions()){
                Text(showString)
            }
            .align(Alignment.Top)
            .position(x: 10,y: 15)
            .id("my_location_inner")
        }
         .markAnchor(x: 25, y: 25)
         .offset(x: 15,y: 12)
         .id("my_location")

    }
}
