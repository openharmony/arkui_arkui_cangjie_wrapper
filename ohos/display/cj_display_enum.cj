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

package ohos.display

import ohos.base.*
import ohos.labels.*

/**
 * Enum for cause of disconnect.
 *
 * @relation enum Orientation
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum Orientation {
    /**
    * Indicate that the display content is in portrait mode.
    *
    * @relation PORTRAIT = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    Portrait
    |
    /**
    * Indicate that the display content is in landscape mode.
    *
    * @relation LANDSCAPE = 1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    Landscape
    |
    /**
    * Indicate that the display content is in the opposite direction of the portrait mode.
    *
    * @relation PORTRAIT_INVERTED = 2
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    PortraitInverted
    |
    /**
    * Indicate that the display content is in the opposite direction of the landscape mode.
    *
    * @relation LANDSCAPE_INVERTED = 3
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LandscapeInverted
    | ...

    static func parse(val: UInt32) {
        match (val) {
            case 0 => Portrait
            case 1 => Landscape
            case 2 => PortraitInverted
            case 3 => LandscapeInverted
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the display states.
 *
 * @relation export enum DisplayState
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum DisplayState {
    /**
    * Unknown.
    *
    * @relation STATE_UNKNOWN = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateUnknown
    |
    /**
    * Screen off.
    *
    * @relation STATE_OFF = 1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateOff
    |
    /**
    * Screen on
    *
    * @relation STATE_ON = 2
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateOn
    |
    /**
    * Doze, but it will update for some important system messages.
    *
    * @relation STATE_DOZE = 3
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateDoze
    |
    /**
    * Doze and not update.
    *
    * @relation STATE_DOZE_SUSPEND = 4
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateDozeSuspend
    |
    /**
    * VR node.
    *
    * @relation STATE_VR = 5
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateVr
    |
    /**
    * Screen on and not update.
    *
    * @relation STATE_ON_SUSPEND = 6
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    StateOnSuspend
    | ...

    static func parse(val: UInt32) {
        match (val) {
            case 0 => StateUnknown
            case 1 => StateOff
            case 2 => StateOn
            case 3 => StateDoze
            case 4 => StateDozeSuspend
            case 5 => StateVr
            case 6 => StateOnSuspend
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
* Enumerates the fold status.
*
* @relation export enum FoldStatus
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public enum FoldStatus {
    /**
    * Fold Status Unknown.
    *
    * @relation FOLD_STATUS_UNKNOWN = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldStatusUnknown
    |
    /**
    * Fold Status Expanded.
    *
    * @relation FOLD_STATUS_EXPANDED = 1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldStatusExpanded
    |
    /**
    * Fold Status Folded. For dual-fold axis devices, the first fold axis is folded, and the second fold axis is folded.
    *
    * @relation FOLD_STATUS_FOLDED = 2
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldStatusFolded
    |
    /**
    * Fold Status Half Folded.
    *
    * @relation FOLD_STATUS_HALF_FOLDED = 3
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldStatusHalfFolded
    | ...

    static func parse(val: UInt32) {
        match (val) {
            case 0 => FoldStatusUnknown
            case 1 => FoldStatusExpanded
            case 2 => FoldStatusFolded
            case 3 => FoldStatusHalfFolded
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
* Enumerates the fold display mode.
*
* @relation export enum FoldDisplayMode
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public enum FoldDisplayMode {
    /**
    * Unknown Display.
    *
    * @relation FOLD_DISPLAY_MODE_UNKNOWN = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldDisplayModeUnknown
    |
    /**
    * Full Display.
    *
    * @relation FOLD_DISPLAY_MODE_FULL = 1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldDisplayModeFull
    |
    /**
    * Main Display.
    *
    * @relation FOLD_DISPLAY_MODE_MAIN= 2
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldDisplayModeMain
    |
    /**
    * Sub Display.
    *
    * @relation FOLD_DISPLAY_MODE_SUB= 3
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldDisplayModeSub
    |
    /**
    * Coordination Display.
    *
    * @relation FOLD_DISPLAY_MODE_COORDINATION
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FoldDisplayModeCoordination
    | ...

    func getValue(): UInt32 {
        match (this) {
            case FoldDisplayModeUnknown => 0
            case FoldDisplayModeFull => 1
            case FoldDisplayModeMain => 2
            case FoldDisplayModeSub => 3
            case FoldDisplayModeCoordination => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => FoldDisplayModeUnknown
            case 1 => FoldDisplayModeFull
            case 2 => FoldDisplayModeMain
            case 3 => FoldDisplayModeSub
            case 4 => FoldDisplayModeCoordination
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}


/**
* Enumerates of listening event
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public enum ListenerType {
    /**
    * add type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeAdd
    |
    /**
    * remove type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeRemove
    |
    /**
    * change type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeChange
    |
    /**
    * foldStatusChange type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeFoldStatusChange
    |
    /**
    * foldAngleChange type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeFoldAngleChange
    |
    /**
    * captureStatusChange type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeCaptureStatusChange
    |
    /**
    * foldDisplayModeChange type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeFoldDisplayModeChange
    |
    /**
    * availableAreaChange type the event of display change
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    ListnerTypeAvailableAreaChange
    | ...

    func getValue(): String {
        return match (this) {
            case ListnerTypeAdd => "add"
            case ListnerTypeRemove => "remove"
            case ListnerTypeChange => "change"
            case ListnerTypeFoldStatusChange => "foldStatusChange"
            case ListnerTypeFoldAngleChange => "foldAngleChange"
            case ListnerTypeCaptureStatusChange => "captureStatusChange"
            case ListnerTypeFoldDisplayModeChange => "foldDisplayModeChange"
            case ListnerTypeAvailableAreaChange => "availableAreaChange"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
