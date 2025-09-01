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
class View_Background {
    let type1: String = SourceType.Unknown.toString()
    let type2: String = SourceType.Mouse.toString()
    let type3: String = SourceType.TouchScreen.toString()

    let status1: String = SelectStatus.All.toString()
    let status2: String = SelectStatus.Part.toString()
    let status3: String = SelectStatus.None.toString()

    let status11 = SelectStatus.All.getValue()
    let status12 = SelectStatus.Part.getValue()
    let status13 = SelectStatus.None.getValue()

    let effect = SwipeEdgeEffect.None.getValue()

    let touchType = TouchType.Cancel.getValue()
    let touchType2 = TouchType.Unknown.getValue()

    let mouseButton = MouseButton.Right.toString()
    let mouseButton2 = MouseButton.Middle.toString()
    let mouseButton3 = MouseButton.Back.toString()
    let mouseButton4 = MouseButton.Forward.toString()

    let mouseAction = MouseAction.Release.toString()
    let mouseAction2 = MouseAction.Hover.toString()
    let mouseAction3 = MouseAction.None.toString()

    let keySource = KeySource.Unknown.toString()
    let keySource2 = KeySource.Keyboard.toString()

    let keyType = KeyType.Unknown.toString()

    let ctrl = ModifierKey.CTRL.toString()
    let shift = ModifierKey.SHIFT.toString()
    let alt = ModifierKey.ALT.toString()

    let mode1 = MixMode.All.getValue()
    let mode2 = MixMode.Compatible.getValue()
    let mode3 = MixMode.None.getValue()

    let playMode = PlayMode.Normal.getValue()
    let playMode2 = PlayMode.Reverse.getValue()
    let playMode3 = PlayMode.Alternate.getValue()
    let playMode4 = PlayMode.AlternateReverse.getValue()

    let alignment = DialogAlignment.TopEnd.getValue()
    let alignment2 = DialogAlignment.CenterStart.getValue()
    let alignment3 = DialogAlignment.CenterEnd.getValue()
    let alignment4 = DialogAlignment.BottomStart.getValue()
    let alignment5 = DialogAlignment.BottomEnd.getValue()

    let lengthType1: LengthType = LengthType.parse(2)
    let lengthType2: LengthType = LengthType.parse(3)
    let lengthType3: LengthType = LengthType.parse(4)
    let lengthType4: LengthType = LengthType.parse(5)

    func build() {
        Column() {
            Row()
                .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                .backgroundImagePosition(x: 10, y: 20)
                .backgroundImageSize(width: 30, height: 40)
                .id("my_background")
        }
    }
}
