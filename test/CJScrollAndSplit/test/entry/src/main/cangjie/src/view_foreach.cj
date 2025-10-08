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

@Entry
@Component
class ViewForeach {
    let simpleList: Array<String> = ["one", "two", "three"]
    let colorList: Array<Color> = [Color.Red, Color.Blue, Color.Green]

  func build(): Unit {
    Row() {
      Column() {
        ForEach(this.simpleList, itemGeneratorFunc: {item: String, _: Int64 =>
            Text(item).fontSize(50).id("my_text_${item}")
        })
        ForEach(this.colorList, itemGeneratorFunc: {colorItem: Color, idx: Int64 =>
            Text("color").fontSize(50).id("my_text_color_${idx}").backgroundColor(colorItem)
        })
      }
      .width(100.percent)
    }
    .backgroundColor(0xF1F3F5)
  }
}