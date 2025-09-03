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

///**
// * Created on 2024/6/28
// */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.*

@Entry
@Component
class View_Search {
    @State
    var changeValue: String = ""
    @State
    var submitValue: String = ""
    @State
    var copyValue: String = ""
    @State
    var cutValue: String = ""
    @State
    var pasteValue: String = ""
    @State
    var isEditing: Bool = false
    @State
    var caretPosition: Int32 = 0
    @State
    var caretPositionEnd: Int32 = 0
    @State
    var offsetX: Float32 = 0.0
    @State
    var offsetY: Float32 = 0.0

    let controller = SearchController()
    func build() {
        Flex(direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center) {
            Text(submitValue)
            Text(changeValue).key("MyText")
            // 设置光标位置
            Button("caretposition  3").onClick({
                evt => controller.caretPosition(3)
            }).id("caretPosition")

            // 测试文本选中
            Search(value: "", placeholder: "Type to search", controller: controller)
                .searchButton("SearchBtn")
                .width(
                300.00.vp)
                .height(35)
//                .backgroundColor(0xDDDDDD)
                .placeholderColor(0x000000)
                .placeholderFont(weight: FontWeight.W100, family: "serif", style: FontStyle.Normal)
                .textFont(weight: FontWeight.W100,family: "serif", style: FontStyle.Normal)
                .borderWidth(5)
                .borderColor(0xAFEEEE)
                .borderStyle(BorderStyle.Dashed)
                .borderRadius(10)
                .copyOption(CopyOptions.None)
                .onSubmit({
                value => submitValue = value
                }).onChange({
                    value => changeValue = value
                }).onCopy({
                    value => copyValue = value
                }).onCut({
                    value => cutValue = value
                }).onPaste({
                    value => pasteValue = value
                }).margin(top: 30).id("searchComponent").border(width: 2.px)
                Text("Editing ${this.isEditing}").id("Search?Editing")
                Text("caretPosition ${this.caretPosition}").id("Search?Position")
                Text("Selection ${this.caretPosition}-${this.caretPositionEnd}").id("Search?Selection")
                Text("ContentScroll ${this.offsetX} - ${this.offsetY}").id("Search?onContentScroll")
                Search(value: "", icon: @r(app.media.startIcon))
                    .placeholderFont(size: 5.percent)
                    .textFont(size: 5.percent)
//            Search(value: "", placeholder: "Type to search").width(300.00.vp).height(35).placeholderFont(
//                size: 10.percent, weight: FontWeight.W100, family: "serif", style: FontStyle.Normal).textFont(
//                size: 10.percent, weight: FontWeight.W100, family: "serif", style: FontStyle.Normal).copyOption(CopyOptions.LocalDevice)
        }
    }
}
