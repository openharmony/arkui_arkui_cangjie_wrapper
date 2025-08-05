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

package ohos.component

foreign func FFIOHOSAceFrameworkSetCursor(pointerStyle: Int32): Unit

foreign func FFIOHOSAceFrameworkRestoreDefault(): Unit

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CursorControl {
    private static let instance_ = CursorControl()
    static func getCursorController(): CursorControl {
        instance_
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setCursor(pointerStyle: PointerStyle): Unit {
        unsafe { FFIOHOSAceFrameworkSetCursor(pointerStyle.getValue()) }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func restoreDefault(): Unit {
        unsafe { FFIOHOSAceFrameworkRestoreDefault() }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PointerStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SOUTH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORTH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WEST_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORTH_SOUTH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORTH_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORTH_WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SOUTH_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SOUTH_WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORTH_EAST_SOUTH_WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORTH_WEST_SOUTH_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CROSS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CURSOR_COPY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CURSOR_FORBID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COLOR_SUCKER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HAND_GRABBING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HAND_OPEN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HAND_POINTING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HELP
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MOVE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_LEFT_RIGHT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_UP_DOWN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCREENSHOT_CHOOSE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCREENSHOT_CURSOR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TEXT_CURSOR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ZOOM_IN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ZOOM_OUT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_SOUTH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_NORTH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_NORTH_SOUTH
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_NORTH_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_NORTH_WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_SOUTH_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_SOUTH_WEST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIDDLE_BTN_NORTH_SOUTH_WEST_EAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HORIZONTAL_TEXT_CURSOR
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CURSOR_CROSS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CURSOR_CIRCLE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LOADING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RUNNING
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    static func parse(value: Int32): PointerStyle {
        match (value) {
            case 0 => DEFAULT
            case 1 => EAST
            case 2 => WEST
            case 3 => SOUTH
            case 4 => NORTH
            case 5 => WEST_EAST
            case 6 => NORTH_SOUTH
            case 7 => NORTH_EAST
            case 8 => NORTH_WEST
            case 9 => SOUTH_EAST
            case 10 => SOUTH_WEST
            case 11 => NORTH_EAST_SOUTH_WEST
            case 12 => NORTH_WEST_SOUTH_EAST
            case 13 => CROSS
            case 14 => CURSOR_COPY
            case 15 => CURSOR_FORBID
            case 19 => COLOR_SUCKER
            case 17 => HAND_GRABBING
            case 18 => HAND_OPEN
            case 19 => HAND_POINTING
            case 20 => HELP
            case 21 => MOVE
            case 22 => RESIZE_LEFT_RIGHT
            case 23 => RESIZE_UP_DOWN
            case 24 => SCREENSHOT_CHOOSE
            case 25 => SCREENSHOT_CURSOR
            case 26 => TEXT_CURSOR
            case 27 => ZOOM_IN
            case 28 => ZOOM_OUT
            case 29 => MIDDLE_BTN_EAST
            case 30 => MIDDLE_BTN_WEST
            case 31 => MIDDLE_BTN_SOUTH
            case 32 => MIDDLE_BTN_NORTH
            case 33 => MIDDLE_BTN_NORTH_SOUTH
            case 34 => MIDDLE_BTN_NORTH_EAST
            case 35 => MIDDLE_BTN_NORTH_WEST
            case 36 => MIDDLE_BTN_SOUTH_EAST
            case 37 => MIDDLE_BTN_SOUTH_WEST
            case 38 => MIDDLE_BTN_NORTH_SOUTH_WEST_EAST
            case 39 => HORIZONTAL_TEXT_CURSOR
            case 40 => CURSOR_CROSS
            case 41 => CURSOR_CIRCLE
            case 42 => LOADING
            case 43 => RUNNING
            case _ => throw IllegalArgumentException("No corresponding PointerStyle: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case EAST => 1
            case WEST => 2
            case SOUTH => 3
            case NORTH => 4
            case WEST_EAST => 5
            case NORTH_SOUTH => 6
            case NORTH_EAST => 7
            case NORTH_WEST => 8
            case SOUTH_EAST => 9
            case SOUTH_WEST => 10
            case NORTH_EAST_SOUTH_WEST => 11
            case NORTH_WEST_SOUTH_EAST => 12
            case CROSS => 13
            case CURSOR_COPY => 14
            case CURSOR_FORBID => 15
            case COLOR_SUCKER => 19
            case HAND_GRABBING => 17
            case HAND_OPEN => 18
            case HAND_POINTING => 19
            case HELP => 20
            case MOVE => 21
            case RESIZE_LEFT_RIGHT => 22
            case RESIZE_UP_DOWN => 23
            case SCREENSHOT_CHOOSE => 24
            case SCREENSHOT_CURSOR => 25
            case TEXT_CURSOR => 26
            case ZOOM_IN => 27
            case ZOOM_OUT => 28
            case MIDDLE_BTN_EAST => 29
            case MIDDLE_BTN_WEST => 30
            case MIDDLE_BTN_SOUTH => 31
            case MIDDLE_BTN_NORTH => 32
            case MIDDLE_BTN_NORTH_SOUTH => 33
            case MIDDLE_BTN_NORTH_EAST => 34
            case MIDDLE_BTN_NORTH_WEST => 35
            case MIDDLE_BTN_SOUTH_EAST => 36
            case MIDDLE_BTN_SOUTH_WEST => 37
            case MIDDLE_BTN_NORTH_SOUTH_WEST_EAST => 38
            case HORIZONTAL_TEXT_CURSOR => 39
            case CURSOR_CROSS => 40
            case CURSOR_CIRCLE => 41
            case LOADING => 42
            case RUNNING => 43
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
