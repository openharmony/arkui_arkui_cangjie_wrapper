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
 * TC_109: @Watch Triggers @State Update
 * Test Scenario: @Watch listens to one @State, callback modifies another @State
 * Expected Result: State chain update is correct, UI refreshes sequentially
 */

@Entry
@Component
class ViewDrivenTC109 {
    @Watch[onSourceChanged] @State var sourceValue: Int64 = 0
    @State var derivedValue: Int64 = 0
    @State var watchCount: Int64 = 0

    // func onSourceChanged(newValue: Int64, oldValue: Int64): Unit {
    //     this.derivedValue = newValue * 2
    //     this.watchCount = this.watchCount + 1
    // }

    func onSourceChanged(): Unit {
        this.derivedValue = this.derivedValue * 2
        this.watchCount = this.watchCount + 1
    }
    func build(): Unit {
        Column() {
            Text("TC_109: @Watch Triggers @State Update")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Source Value: ${this.sourceValue}")
                .fontSize(16)
                .id("source_value_display")

            Text("Derived Value: ${this.derivedValue}")
                .fontSize(16)
                .id("derived_value_display")

            Text("Watch Count: ${this.watchCount}")
                .fontSize(16)
                .id("watch_count_display")

            Button("Increment Source")
                .id("increment_source_button")
                .onClick({ e => 
                    this.sourceValue = this.sourceValue + 1
                })

            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.sourceValue = 0
                    this.derivedValue = 0
                    this.watchCount = 0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

