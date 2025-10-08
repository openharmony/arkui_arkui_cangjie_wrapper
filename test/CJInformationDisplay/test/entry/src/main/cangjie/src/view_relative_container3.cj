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

@Entry
@Component
class ViewRelativeContainer3 {
    func build() {
        Row() {
            RelativeContainer() {
                Row() {
                    Text('row1')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOptions(
                        top: VerticalAlignment("__container__", VerticalAlign.Top),
                        bottom: VerticalAlignment("__container__", VerticalAlign.Bottom),
                        left: HorizontalAlignment("__container__", HorizontalAlign.Start),
                        right: HorizontalAlignment("__container__", HorizontalAlign.End),
                        center: VerticalAlignment("__container__", VerticalAlign.Center),
                        bias: Bias(vertical: 0.3, horizontal: 0.3),
                    )
                )
                .id("row1")
            }
            .width(300).height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
            RelativeContainer() {
                Row() {
                    Text('row2_1')
                }
                .justifyContent(FlexAlign.Center)
                .width(100)
                .height(100)
                .backgroundColor(0xa3cf62)
                .alignRules(
                    AlignRuleOptions(
                        top: VerticalAlignment("__container__", VerticalAlign.Top),
                        bottom: VerticalAlignment("__container__", VerticalAlign.Bottom),
                        left: HorizontalAlignment("__container__", HorizontalAlign.Start),
                        right: HorizontalAlignment("__container__", HorizontalAlign.End),
                        center: VerticalAlignment("__container__", VerticalAlign.Center),
                        bias: Bias(),
                    )
                )
                .id("row2_1")
            }
            .width(300).height(300)
            .margin(left: 50)
            .border(width: 2, color: 0x6699FF)
        }
        .height(100.percent)
    }
}