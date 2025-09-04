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
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class View_TextPicker {
    var select: UInt32 = 1
    @State
    var fruits: Array<String> = ["apple", "banana", "orange", "peach"]
    var fruitstypeA: Array<String> = ["apple", "banana", "orange", "peach"]
    var fruitstypeB: Array<String> = ["lemon", "plum", "lime", "kiwi"]
    var fruitstypeC: Array<String> = ["pineapple", "pear", "melon", "grapes"]
    var multitypes: Array<Array<String>> = [fruitstypeA, fruitstypeB, fruitstypeC]

    // 覆盖率 TextPickerResult
    let test = unsafe { LibC.mallocCString("CString in Cangjie code.") }
    let paramstest = "apple"
    var arraytest: Array<String> = ['']
    let ems = ""

    var iconstring: String = "iconstring"
    var iconAppresource: AppResource = @r(app.media.icon)
    var textstring: String = "textstring"
    var textAppresource: AppResource = @r(app.string.contentName)

    func build() {
        Flex(wrap: FlexWrap.Wrap) {
            TextPicker(range: this.fruits, selected: this.select)
                .canLoop(true)
                .defaultPickerItemHeight(25)
                .onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("TextPicker1")

            TextPicker(range: this.fruits, value: "banana")
                .canLoop(false)
                .defaultPickerItemHeight(25.0)
                .onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("textPicker")

            TextPicker(range: this.fruits)
                .canLoop(false)
                .defaultPickerItemHeight(15.0.vp)
                .onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("height_length")
            TextPicker(range: fruitstypeC, selected: 1, value: "pear")
                .canLoop(false)
                .defaultPickerItemHeight(15.0.vp)
                .onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("pickerop")

            //增加字体样式变更的场景
            TextPicker(range: this.fruitstypeB)
                .canLoop(true)
                .defaultPickerItemHeight(25.0)
                .onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("modified_color")
            //渐隐效果
            TextPicker(range: this.fruitstypeC)
                .canLoop(true)
                .defaultPickerItemHeight(25)
                .onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("fading_effect")

            TextPicker(range: ["string1"], value: "value").opacity(0.3)

            //分割线效果
            TextPicker(range: this.fruitstypeB).canLoop(true).defaultPickerItemHeight(25.0).onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })
                .id("divider_effect")

            //无分割线情况
            TextPicker(range: this.fruitstypeC).canLoop(true).defaultPickerItemHeight(25.0).onChange({
                    result, _ => logger("Picker item changed, value: ${result}")
                })

        }.width(100.percent).height(100.percent)
    }
}