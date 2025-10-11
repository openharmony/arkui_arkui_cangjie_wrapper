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

import ohos.arkui.component_utils.ComponentUtils

@Entry
@Component
class ViewComponentUtils {
    @State var message: String = "Hello Cangjie"
    @State var componentUtils_test: ComponentUtils = ComponentUtils()
    func build() {
        Row {
            Column {
                Button(message).onClick ({
                    evt => Hilog.info(1, "Cangjie-App", "Hello Cangjie")
                }).fontSize(40).height(80)
                .id("ButtonClick")
                Button("getRectangleById").onClick ({ e =>
                    // let info = ComponentUtils.getRectangleById("ButtonClick")
                }).fontSize(40).height(80).id("getRectangleById")
                Button("ccomponentInfo").onClick ({ e =>
                    let transform: Array<Float32> = [1.0, 0.5, 0.0, 0.0, 0.0]
                }).fontSize(50).height(100).id("ccomponentInfo")
            }.width(100.percent)
        }.height(100.percent)
    }
}