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
class ViewBlankInitMinNormal {
    func build() {
        Column() {
            // 有效等价用例
            Blank(min: 10.vp).id("testBlankInitMinNormalValue1")
            Blank(min: 5.px).id("testBlankInitMinNormalValue2")
            Blank(min: 2.fp).id("testBlankInitMinNormalValue3")
            Blank(min: 10.lpx).id("testBlankInitMinNormalValue4")
            Blank(min: 10).id("testBlankInitMinNormalValue5")
            
            // 边界值用例
            Blank(min: 0).id("testBlankInitMinBoundaryValue1")
            Blank(min: 0.vp).id("testBlankInitMinBoundaryValue2")
            Blank(min: (-1).vp).id("testBlankInitMinBoundaryValue3")
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
