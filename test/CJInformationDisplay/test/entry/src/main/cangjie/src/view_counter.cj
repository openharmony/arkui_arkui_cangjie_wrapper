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
 * Created on 2024/11/26
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewCounter {
    @State
    var value1: Int64 = 0
    @State
    var value2: Int64 = 0
    @State
    var value3: Int64 = 0
    @State
    var value4: Int64 = 0
    func build() {
        Column {
            Counter() {Text(this.value1.toString()).id("text1")}.margin(30.0).height(10.percent).onInc {
                this.value1++
            }.onDec {
                this.value1--
            }.id("counter1")

            Counter() {Text(this.value2.toString()).id("text2")}.margin(30.0).height(10.percent).onInc {
                this.value2++
            }.onDec {
                this.value2--
            }.enableDec(false).enableInc(false).id("counter2")

            Counter() {Text(this.value3.toString()).id("text3")}.margin(30.0).height(10.percent).onInc {
                this.value3++
            }.onDec {
                this.value3--
            }.enableDec(true).enableInc(true).id("counter3")

            Counter() {Text(this.value4.toString()).id("text4")}.margin(30.0).height(10.percent).onInc {
                this.value4++
            }.onDec {
                this.value4--
            }.enableDec(false).enableInc(true).id("counter4")
        }
    }
}