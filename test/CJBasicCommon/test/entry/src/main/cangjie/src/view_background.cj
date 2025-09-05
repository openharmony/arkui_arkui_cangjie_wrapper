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

extend RefreshStatus {
    public func toString() {
        match (this) {
            case Inactive => "Inactive"
            case Drag => "Drag"
            case OverDrag => "OverDrag"
            case Refresh => "Refresh"
            case Done => "Done"
            case _ => "Done"
        }
    }
}

@Entry
@Component
class ViewBackground {
    let lengthType1: LengthType = LengthType.parse(2)
    let lengthType2: LengthType = LengthType.parse(3)
    let lengthType3: LengthType = LengthType.parse(4)
    let lengthType4: LengthType = LengthType.parse(5)

    func build() {
        Column() {
            Row().backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat).backgroundImagePosition(
                x: 10, y: 20).backgroundImageSize(width: 30, height: 40).id("my_background")
        }
    }
}
