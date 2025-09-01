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
import ohos.resource_manager.*
import ohos.measure.SizeOptions as MeasureSize
import ohos.measure.MeasureOptions
import ohos.measure.MeasureText

@Entry
@Component
class View_Measure {
    let textSize0: Float64 = MeasureText.measureText(
        MeasureOptions(
            textContent: "helloworld",
            fontSize: 10.px,
        )
    )
    let textSize1: Float64 = MeasureText.measureText(
        MeasureOptions(
            textContent: "helloworld",
            fontSize: 20.px,
            wordBreak: WordBreak.Normal
        )
    )
    let textSize2: MeasureSize = MeasureText.measureTextSize(
        MeasureOptions(
            textContent: "Hello World",
            constraintWidth: 100.px,
            lineHeight: 20.px,
            maxLines: 1,
            wordBreak: WordBreak.BreakAll
        )
    )

    let textSize3: MeasureSize = MeasureText.measureTextSize(
        MeasureOptions(
            textContent: "Hello World",
            constraintWidth: 100.px,
            fontSize: Option.None,
            lineHeight: 20.px,
            baselineOffset: Option.None,
            letterSpacing: 3.vp,
            textIndent: 3.vp,
            maxLines: 1,
            wordBreak: WordBreak.BreakAll
        )
    )

    let rate: Float64 = if (this.textSize0 > Float64(0)) {
        this.textSize1 / this.textSize0
    } else {
        Float64(1)
    }
    func build() {
        Column() {
            Text("hello world ${rate}").width(200.vp).height(30.vp).id("text1")
            Text("Hello World ${this.textSize2.width.value} ${this.textSize2.height.value}")
                .size(width: 100.vp, height: 20.vp)
                .id("text2")
        }.width(100.percent).height(100.percent)
    }
}
