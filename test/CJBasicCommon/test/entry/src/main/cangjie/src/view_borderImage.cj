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

import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_BorderImage {
    func build() {
        Column {
            Text('test borderImage 1.').textAlign(TextAlign.Center).height(50).width(200).id("text1")

            Text('test borderImage 2.').textAlign(TextAlign.Center).height(50).width(200).id("text2")

            Text('test borderImage 3.').textAlign(TextAlign.Center).height(50).width(200).id("text3")

            // default
            Text('test borderImage 4.').textAlign(TextAlign.Center).height(50).width(200).id("text4")
        }.width(100.percent)
    }
}
