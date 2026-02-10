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

@Entry
@Component
class ViewDividerStrokeWidth {
    func build() {
        Column() {
            // 有效等价用例
            Divider().strokeWidth(10.px).id("testDividerStrokeWidthNormalValue1")
            Divider().strokeWidth(5.vp).id("testDividerStrokeWidthNormalValue2")
            Divider().strokeWidth(2.fp).id("testDividerStrokeWidthNormalValue3")
            Divider().strokeWidth(10.lpx).id("testDividerStrokeWidthNormalValue4")
            Divider().strokeWidth(2).id("testDividerStrokeWidthNormalValue5")
            
            // 边界值用例
            Divider().strokeWidth(0).id("testDividerStrokeWidthBoundaryValue1")
            Divider().strokeWidth(0.vp).id("testDividerStrokeWidthBoundaryValue2")
            Divider().strokeWidth(0.px).id("testDividerStrokeWidthBoundaryValue3")
            
            // 特殊值用例
            Divider().id("testDividerStrokeWidthNoCall")
            Divider().strokeWidth(Option<Length>.None).id("testDividerStrokeWidthOptionNone")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
