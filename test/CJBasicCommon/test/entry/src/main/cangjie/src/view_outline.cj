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

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewOutline {
    public func build() {
        Column() {
            Row(space: 30) {
                // 线段
                Text('DASHED')
                    .backgroundColor(Color.Red)
                    .width(120.vp)
                    .height(120.vp)
                    .textAlign(TextAlign.Center)
                    .fontSize(16)
                    .id("outline_properties")
                // 点线
                Text('DOTTED')
                    .backgroundColor(Color.Red)
                    .width(120.vp)
                    .height(120.vp)
                    .textAlign(TextAlign.Center)
                    .fontSize(16)
                .id("outline_test")
            }
                .width(300.vp)
                .height(150)

            Text('.outlineWidth/outlineColor/outlineRadius/outlineStyle')
                .backgroundColor(Color.Red)
                .fontSize(20.vp)
                .width(300.vp)
                .height(300.vp)
                .textAlign(TextAlign.Center)
                .id("outline_properties_2")
        }
            .height(700.vp)
            .width(380.vp)
            .borderWidth(1.vp)
    }
}