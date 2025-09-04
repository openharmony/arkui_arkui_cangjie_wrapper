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
 * Created on 2025/7/22
 */
package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.router.*
import ohos.ui_test.*
import std.collection.*

enum SpanType {
    TEXT
    |
    IMAGE
    | ...
}

@Entry
@Component
class View_Enum {
    func build() {
        Column(space: 10) {
            Row(space: 5) {
                EnumTypes()
                EnumSon()
            }
        }
    }
}

@Component
class EnumTypes {

    // SliderChangeMode
    var sliderChangemode1: SliderChangeMode = SliderChangeMode.Click

    // NavigationType
    var navigationType1: NavigationType = NavigationType.Push
    var navigationType2: NavigationType = NavigationType.Replace
    var navigationType3: NavigationType = NavigationType.Back

    // KeyType
    @State 
    var keyType1: String = ""
    @State 
    var keyType2: String = ""

    // RefreshStatus
    var refreshStatus1: RefreshStatus = RefreshStatus.Inactive
    var refreshStatus2: RefreshStatus = RefreshStatus.Done

    // RichEditorDeleteDirection
    var richEditorDeleteDirection1: RichEditorDeleteDirection = RichEditorDeleteDirection.Forward

    // SpanType
    var spanType1: RichEditorSpanType = RichEditorSpanType.Text
    var spanType2: RichEditorSpanType = RichEditorSpanType.Image

    func build() {
        Column{
            Text("APILevel17 Enum Types")

            Button("KeyTypeDown").onClick{ e =>
                keyType1 = "Down"
            }.id("keyTypeBtn1")
            Button("KeyTypeUp").onClick{ e =>
                keyType2 = "Up"
            }.id("keyTypeBtn2")
            Text(keyType1).id("keyType1")
            Text(keyType2).id("keyType2")

            Button("RichEditor1").onClick{ e =>
                var temp1 = RichEditorDeleteValue(1, richEditorDeleteDirection1, 1, ArrayList<RichEditorSpanResult>())
            }.id("richEditor1")
        }

    }
}

@Component
class EnumSon{
    @State
    var clickCount: Int32 = 0

    func build() {
        Column{
            Text("${clickCount}").id("enumClickCount")
            Button("resourceType").onClick{ e =>
                clickCount++
            }.id("resourceType")

            Button("sliderChangeMode").onClick{ e =>
                var t: SliderChangeMode = SliderChangeMode.Click
                clickCount++
            }.id("sliderChangeMode")

            Button("navigationType").onClick{ e =>
                var t: NavigationType = NavigationType.Push
                t = NavigationType.Replace
                t = NavigationType.Back
                clickCount++
            }.id("navigationType")

            Button("refreshStatus").onClick{ e =>
                var t: RefreshStatus = RefreshStatus.Inactive
                t = RefreshStatus.Done
                clickCount++
            }.id("refreshStatus")

            Button("richEditorDeleteDirection").onClick{ e =>
                var t: RichEditorDeleteDirection = RichEditorDeleteDirection.Forward
                clickCount++
            }.id("richEditorDeleteDirection")

            Button("spanType").onClick{ e =>
                var t: RichEditorSpanType = RichEditorSpanType.Text
                t = RichEditorSpanType.Image
                clickCount++
            }.id("spanType")
        }
    }
}