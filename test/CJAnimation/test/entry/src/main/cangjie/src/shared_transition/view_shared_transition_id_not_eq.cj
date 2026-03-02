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
package ohos_app_cangjie_entry.shared_transition

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*

@Entry
@Component
class ViewSharedTransitionIdNotEq {

    func build() {
        Column() {
            Text("ViewSharedTransitionIdNotEq")
                .id("idNotEqText")
            Image(@r(app.media.background))
                .width(100)
                .height(250)
                .sharedTransition(
                    "sharedImage1",
                    options: SharedTransitionOptions(duration: 1000, curve: Curve.Linear, delay: 1000)
                )
                .id("idNotEqImage")
            Row() {
                Button("back")
                    .onClick({ e => getUIContext().getRouter().back()})
                    .id("idNotEqBackButton")
            }.margin(top: 30)
        }
        .width(100.percent)
        .height(100.percent)
    }
}