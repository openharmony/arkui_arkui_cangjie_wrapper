/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * TC_086: @Observed Class Nesting
 * Test Scenario: @Observed class contains another @Observed class instance
 * Expected Result: Nested @Observed objects work correctly
 */

@Observed
class InnerObserved {
    @Publish var innerValue: String = ""
    @Publish var innerCount: Int64 = 0
}

@Observed
class OuterObserved {
    @Publish var outerValue: String = ""
    @Publish var inner: InnerObserved = InnerObserved()
}

@Entry
@Component
class ViewComplexTC086 {
    @State var nestedObserved: OuterObserved = OuterObserved(
        outerValue: "Outer",
        inner: InnerObserved(innerValue: "Inner", innerCount: 1)
    )

    func build(): Unit {
        Column() {
            Text("TC_086: @Observed Class Nesting")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Outer Value: ${this.nestedObserved.outerValue}")
                .id("outer_value_text")
            
            Text("Inner Value: ${this.nestedObserved.inner.innerValue}")
                .id("inner_value_text")
            
            Text("Inner Count: ${this.nestedObserved.inner.innerCount}")
                .id("inner_count_text")

            Button("Update Outer")
                .id("update_outer_button")
                .onClick({ e => this.nestedObserved.outerValue = "Updated Outer" })

            Button("Update Inner Value")
                .id("update_inner_value_button")
                .onClick({ e => this.nestedObserved.inner.innerValue = "Updated Inner" })

            Button("Update Inner Count")
                .id("update_inner_count_button")
                .onClick({ e => this.nestedObserved.inner.innerCount = this.nestedObserved.inner.innerCount + 1 })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

