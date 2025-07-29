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

package ohos.arkui.component.common

import ohos.labels.APILevel
import std.deriving.Derive

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum IndexerAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Right => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum InputType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Number
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Email
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Password
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PhoneNumber
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Number => 1
            case Email => 2
            case Password => 3
            case PhoneNumber => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EnterKeyType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Go
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EntrySearch
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Send
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Next
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Done
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIOUS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NEW_LINE
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Go => 2
            case EntrySearch => 3
            case Send => 4
            case Next => 5
            case Done => 6
            case PREVIOUS => 7
            case NEW_LINE => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Row
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Column
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ColumnReverse
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Row => 0
            case Column => 1
            case RowReverse => 2
            case ColumnReverse => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexWrap {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoWrap
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Wrap
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WrapReverse
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case NoWrap => 0
            case Wrap => 1
            case WrapReverse => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceBetween
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceAround
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceEvenly
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 1
            case Center => 2
            case End => 3
            case SpaceBetween => 4
            case SpaceAround => 5
            case SpaceEvenly => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ItemAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stretch
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Baseline
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Auto => 0
            case Start => 1
            case Center => 2
            case End => 3
            case Stretch => 4
            case Baseline => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShapeType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CircleType
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Capsule => 1
            case CircleType => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToggleType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CheckboxType
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SwitchType
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ButtonType
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case CheckboxType => 0
            case SwitchType => 1
            case ButtonType => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FontStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Italic
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Italic => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): FontStyle {
        match (value) {
            case 0 => Normal
            case 1 => Italic
            case _ => Normal
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Alignment {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopStart
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopEnd
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomStart
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomEnd
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case TopStart => 0
            case Top => 1
            case TopEnd => 2
            case Start => 3
            case Center => 4
            case End => 5
            case BottomStart => 6
            case Bottom => 7
            case BottomEnd => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

// cpp: frameworks\core\components\common\layout
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum HorizontalAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 1
            case Center => 2
            case End => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum VerticalAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Top => 1
            case Center => 2
            case Bottom => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FontWeight {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bold
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bolder
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lighter
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W100
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W200
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W300
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W400
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W500
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W600
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W700
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W800
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W900
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): String {
        match (this) {
            case Normal => "normal"
            case Bold => "bold"
            case Bolder => "bolder"
            case Lighter => "lighter"
            case Medium => "medium"
            case Regular => "regular"
            case W100 => "100"
            case W200 => "200"
            case W300 => "300"
            case W400 => "400"
            case W500 => "500"
            case W600 => "600"
            case W700 => "700"
            case W800 => "800"
            case W900 => "900"
            case _ => "400"
        }
    }

    func toInt32(): Int32 {
        match (this) {
            case W100 => 0
            case W200 => 1
            case W300 => 2
            case W400 => 3
            case W500 => 4
            case W600 => 5
            case W700 => 6
            case W800 => 7
            case W900 => 8
            case Bold => 9
            case Normal => 10
            case Bolder => 11
            case Lighter => 12
            case Medium => 13
            case Regular => 14
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValueInt(): UInt32 {
        match (this) {
            case Bold => 0
            case Bolder => 1
            case Lighter => 2
            case Medium => 3
            case Regular => 4
            case W100 => 5
            case W200 => 6
            case W300 => 7
            case W400 => 8
            case W500 => 9
            case W600 => 10
            case W700 => 11
            case W800 => 12
            case W900 => 13
            case _ => 8
        }
    }

    protected static func parseValue(value: Int32): FontWeight {
        match (value) {
            case 0 => W100
            case 1 => W200
            case 2 => W300
            case 3 => W400
            case 4 => W500
            case 5 => W600
            case 6 => W700
            case 7 => W800
            case 8 => W900
            case 9 => Bold
            case 10 => Normal
            case 11 => Bolder
            case 12 => Lighter
            case 13 => Medium
            case 14 => Regular
            case _ => Normal
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarPosition {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case End => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fixed
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Scrollable
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Fixed => 0
            case Scrollable => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COLOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BLUR
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case COLOR => 0
            case BLUR => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextDecorationType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Underline
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overline
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LineThrough
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case Underline => 1
            case Overline => 2
            case LineThrough => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): TextDecorationType {
        match (value) {
            case 0 => None
            case 1 => Underline
            case 2 => Overline
            case 3 => LineThrough
            case _ => None
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Start => 0
            case Center => 1
            case End => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): TextAlign {
        match (value) {
            case 0 => Start
            case 1 => Center
            case 2 => End
            case _ => Start
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextOverflow {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Clip
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ellipsis
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Clip => 0
            case Ellipsis => 1
            case None => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WordBreak {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BreakAll
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BreakWord
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case BreakAll => 1
            case BreakWord => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): WordBreak {
        match (value) {
            case 0 => Normal
            case 1 => BreakAll
            case 2 => BreakWord
            case _ => Normal
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageRepeat {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoRepeat
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    X
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Y
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    XY
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case NoRepeat => 0
            case X => 1
            case Y => 2
            case XY => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/*
 * Reference from the ace_engine
 * File path: bridge/cj_frontend/cppview/view_abstract.h
 * Object name: RESOURCE_TYPE
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ResourceType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResColor
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Float
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    String
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Plural
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Boolean
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IntArray
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Integer
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Pattern
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    StrArray
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Media
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rawfile
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case ResColor => 10001
            case Float => 10002
            case String => 10003
            case Plural => 10004
            case Boolean => 10005
            case IntArray => 10006
            case Integer => 10007
            case Pattern => 10008
            case StrArray => 10009
            case Media => 20000 // resource is placed in the media folder
            case Rawfile => 30000 // resource is placed in the rawfile folder
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSize {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Contain
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cover
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Contain => 0
            case Cover => 1
            case Auto => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowStyle {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_XS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_SM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_MD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_LG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_FLOATING_SM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_FLOATING_MD
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case OUTER_DEFAULT_XS => 0
            case OUTER_DEFAULT_SM => 1
            case OUTER_DEFAULT_MD => 2
            case OUTER_DEFAULT_LG => 3
            case OUTER_FLOATING_SM => 4
            case OUTER_FLOATING_MD => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextCase {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LowerCase
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    UpperCase
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case LowerCase => 1
            case UpperCase => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BorderStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Solid
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dashed
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dotted
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Solid => 0
            case Dashed => 1
            case Dotted => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageFit {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fill
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Contain
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cover
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScaleDown
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Fill => 0
            case Contain => 1
            case Cover => 2
            case Auto => 3
            case None => 5
            case ScaleDown => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): ImageFit {
        match (value) {
            case 0 => Fill
            case 1 => Contain
            case 2 => Cover
            case 3 => Auto
            case 5 => None
            case 6 => ScaleDown
            case _ => Auto
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Direction {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ltr
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rtl
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Ltr => 0
            case Rtl => 1
            case Auto => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Vertical => 0
            case Horizontal => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollBarDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Vertical => 0
            case Horizontal => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderChangeMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Begin
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Moving
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Click
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Begin => 0
            case Moving => 1
            case End => 2
            case Click => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func setValue(value: Int32): SliderChangeMode {
        match (value) {
            case 0 => SliderChangeMode.Begin
            case 1 => SliderChangeMode.Moving
            case 2 => SliderChangeMode.End
            case _ => SliderChangeMode.Click
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OutSet
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    InSet
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case OutSet => 0
            case InSet => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

enum WindowBlurStyle {
    SmallLight
    | MediumLight
    | LargeLight
    | XLargeLight
    | SmallDark
    | MediumDark
    | LargeDark
    | XLargeDark
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SmallLight => 0
            case MediumLight => 1
            case LargeLight => 2
            case XLargeLight => 3
            case SmallDark => 4
            case MediumDark => 5
            case LargeDark => 6
            case XLargeDark => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageInterpolation {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    High
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Low
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case High => 1
            case Medium => 2
            case Low => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarState {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Off
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    On
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Off => 0
            case Auto => 1
            case On => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Visibility {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Visible
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hidden
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Visible => 0
            case Hidden => 1
            case None => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/properties/paint_state.h
 * Identifier: LineCapStyle
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineCapStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Butt
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Round
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Square
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Butt => 0
            case Round => 1
            case Square => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ring
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Eclipse
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScaleRing
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Linear => 0
            case Ring => 1
            case Eclipse => 2
            case ScaleRing => 3
            case Capsule => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageRenderMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Original
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Template
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Original => 0
            case Template => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavigationType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Replace
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Back
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Push => 1
            case Replace => 2
            case Back => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwiperDisplayMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stretch
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AutoLinear
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Stretch => 0
            case AutoLinear => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Curve {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ease
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseIn
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseOut
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseInOut
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FastOutSlowIn
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LinearOutSlowIn
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FastOutLinearIn
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ExtremeDeceleration
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Sharp
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rhythm
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Smooth
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Friction
    | ...

    protected func getValue(): String {
        match (this) {
            case Linear => "linear"
            case Ease => "ease"
            case EaseIn => "ease-in"
            case EaseOut => "ease-out"
            case EaseInOut => "ease-in-out"
            case FastOutSlowIn => "fast-out-slow-in"
            case LinearOutSlowIn => "linear-out-slow-in"
            case FastOutLinearIn => "fast-out-linear-in"
            case ExtremeDeceleration => "extreme-deceleration"
            case Sharp => "sharp"
            case Rhythm => "rhythm"
            case Smooth => "smooth"
            case Friction => "friction"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EdgeEffect {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Spring
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fade
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Spring => 0
            case Fade => 1
            case None => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Edge {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Top => 0
            case Start => 1
            case Bottom => 2
            case End => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func setValue(value: Int32): Edge {
        match (value) {
            case 0 => Edge.Top
            case 1 => Edge.Start
            case 2 => Edge.Bottom
            case 3 => Edge.End
            case _ => Edge.Top
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/properties/placement.h
 * Identifier: Placement
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Placement {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopLeft
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopRight
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomLeft
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomRight
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftTop
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftBottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightBottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Right => 1
            case Top => 2
            case Bottom => 3
            case TopLeft => 4
            case TopRight => 5
            case BottomLeft => 6
            case BottomRight => 7
            case LeftTop => 8
            case LeftBottom => 9
            case RightTop => 10
            case RightBottom => 11
            case None => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/properties/paint_state.h
 * Identifier: LineJoinStyle
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineJoinStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Miter
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Round
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bevel
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Miter => 0
            case Round => 1
            case Bevel => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/layout/constants.h
 * Identifier: TextAlign
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAlignStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Justify
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Right => 1
            case Center => 2
            case Justify => 3
            case Start => 4
            case End => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/properties/text_style.h
 * Identifier: TextBaseline
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextBaseline {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alphabetic
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ideographic
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Middle
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hanging
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Alphabetic => 0
            case Ideographic => 1
            case Top => 2
            case Bottom => 3
            case Middle => 4
            case Hanging => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/properties/paint_state.h
 * Identifier: CompositeOperation
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CompositeOperation {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceOver
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceAtop
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceIn
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceOut
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationOver
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationAtop
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationIn
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationOut
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lighter
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Copy
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Xor
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SourceOver => 0
            case SourceAtop => 1
            case SourceIn => 2
            case SourceOut => 3
            case DestinationOver => 4
            case DestinationAtop => 5
            case DestinationIn => 6
            case DestinationOut => 7
            case Lighter => 8
            case Copy => 9
            case Xor => 10
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum QualityType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Low
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    High
    | ...

    protected func getValue(): String {
        match (this) {
            case Low => "low"
            case Medium => "medium"
            case High => "high"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GesturePriority {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Low
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    High
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Low => 0
            case High => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

protected enum GesturePriorityInner {
    Low
    | High
    | Parallel
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Low => 0
            case High => 1
            case Parallel => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureMask {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IgnoreInternal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case IgnoreInternal => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwipeDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case Horizontal => 1
            case Vertical => 2
            case All => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PanDirection {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Computed(UInt32)
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case None => 0
            case Left => 1
            case Right => 2
            case Horizontal => 3
            case Up => 4
            case Down => 8
            case Vertical => 12
            case All => 15
            case Computed(value) => value
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func |(right: PanDirection): PanDirection {
        Computed(this.getValue() | right.getValue())
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func &(right: PanDirection): PanDirection {
        Computed(this.getValue() & right.getValue())
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Sequence
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Parallel
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Exclusive
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Sequence => 0
            case Parallel => 1
            case Exclusive => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/base/geometry/axis.h
 * Identifier: Axis
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Axis {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Vertical => 0
            case Horizontal => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ResponseType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightClick
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LongPress
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case RightClick => 0
            case LongPress => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CopyOptions {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    InApp
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LocalDevice
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case InApp => 1
            case LocalDevice => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TouchType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Move
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cancel
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Down => "Down"
            case Up => "Up"
            case Move => "Move"
            case Cancel => "Cancel"
            case Unknown => "Unknown"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): UInt8 {
        match (this) {
            case Down => 0
            case Up => 1
            case Move => 2
            case Cancel => 3
            case Unknown => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: UInt8): TouchType {
        match (value) {
            case 0 => Down
            case 1 => Up
            case 2 => Move
            case 3 => Cancel
            case _ => Unknown
        }
    }
}

enum DragComponent {
    DragCommon
    | DragText
    | DragImage
    | DragList
    | DragGrid
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case DragCommon => 0
            case DragText => 1
            case DragImage => 2
            case DragList => 3
            case DragGrid => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SideBarContainerType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Embed
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overlay
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Embed => 0
            case Overlay => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SideBarPosition {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case End => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SourceType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mouse
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TouchScreen
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Unknown => 0
            case Mouse => 1
            case TouchScreen => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): SourceType {
        match (value) {
            case 1 => Mouse
            case 2 => TouchScreen
            case _ => Unknown
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Unknown => "Unknown"
            case Mouse => "Mouse"
            case TouchScreen => "TouchScreen"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MouseButton {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Middle
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Back
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forward
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case None => 0
            case Left => 1
            case Right => 2
            case Middle => 4
            case Back => 8
            case Forward => 16
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): MouseButton {
        match (value) {
            case 1 => Left
            case 2 => Right
            case 4 => Middle
            case 8 => Back
            case 16 => Forward
            case _ => None
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case None => "None"
            case Left => "Left"
            case Right => "Right"
            case Middle => "Middle"
            case Back => "Back"
            case Forward => "Forward"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MouseAction {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Press
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Release
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Move
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hover
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case None => 0
            case Press => 1
            case Release => 2
            case Move => 3
            case Hover => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): MouseAction {
        match (value) {
            case 1 => Press
            case 2 => Release
            case 3 => Move
            case 6 => Hover
            case _ => None
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Press => "Press"
            case Release => "Release"
            case Move => "Move"
            case Hover => "Hover"
            case None => "None"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeySource {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Keyboard
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Unknown => 0
            case Keyboard => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): KeySource {
        match (value) {
            case 4 => Keyboard
            case _ => Unknown
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Unknown => "Unknown"
            case Keyboard => "Keyboard"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeyType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Unknown => -1
            case Down => 0
            case Up => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): KeyType {
        match (value) {
            case 0 => Down
            case 1 => Up
            case _ => Unknown
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Unknown => "Unknown"
            case Down => "Down"
            case Up => "Up"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ModifierKey {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CTRL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SHIFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ALT
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case CTRL => 0
            case SHIFT => 1
            case ALT => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case CTRL => "CTRL"
            case SHIFT => "SHIFT"
            case ALT => "ALT"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FunctionKey {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ESC
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F1
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F2
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F3
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F4
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F5
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F6
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F7
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F8
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F9
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F10
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F11
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F12
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TAB
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case ESC => 0
            case F1 => 1
            case F2 => 2
            case F3 => 3
            case F4 => 4
            case F5 => 5
            case F6 => 6
            case F7 => 7
            case F8 => 8
            case F9 => 9
            case F10 => 10
            case F11 => 11
            case F12 => 12
            case TAB => 13
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DataPanelType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CircleType
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LineType
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case CircleType => 0
            case LineType => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ItemState {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Disabled
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Waiting
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Skip
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case Normal => 0
            case Disabled => 1
            case Waiting => 2
            case Skip => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Normal => "Normal"
            case Disabled => "Disabled"
            case Waiting => "Waiting"
            case Skip => "Skip"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RefreshStatus {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inactive
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Drag
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OverDrag
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Refresh
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Done
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Inactive => 0
            case Drag => 1
            case OverDrag => 2
            case Refresh => 3
            case Done => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func toString(): String {
        match (this) {
            case Inactive => "Inactive"
            case Drag => "Drag"
            case OverDrag => "OverDrag"
            case Refresh => "Refresh"
            case Done => "Done"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): RefreshStatus {
        match (value) {
            case 0 => Inactive
            case 1 => Drag
            case 2 => OverDrag
            case 3 => Refresh
            case 4 => Done
            case _ => Inactive
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SeekMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PreviousKeyframe
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NextKeyframe
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ClosestKeyframe
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Accurate
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case PreviousKeyframe => 0
            case NextKeyframe => 1
            case ClosestKeyframe => 2
            case Accurate => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PlaybackSpeed {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_0_75_X
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_1_00_X
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_1_25_X
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_1_75_X
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_2_00_X
    | ...

    protected func getValue(): Float64 {
        match (this) {
            case Speed_Forward_0_75_X => 0.75
            case Speed_Forward_1_00_X => 1.00
            case Speed_Forward_1_25_X => 1.25
            case Speed_Forward_1_75_X => 1.75
            case Speed_Forward_2_00_X => 2.00
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SelectStatus {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Part
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case All => 0
            case Part => 1
            case None => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case All => "All"
            case Part => "Part"
            case None => "None"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): SelectStatus {
        match (value) {
            case 0 => All
            case 1 => Part
            case 2 => None
            case _ => None
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimationStatus {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Initial
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Running
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Paused
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stopped
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Initial => 0
            case Running => 1
            case Paused => 2
            case Stopped => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FillMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forwards
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Backwards
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Both
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case Forwards => 1
            case Backwards => 2
            case Both => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwipeEdgeEffect {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Spring
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Spring => 0
            case None => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SharedTransitionEffectType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SharedEffectStatic
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SharedEffectExchange
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SharedEffectStatic => 0
            case SharedEffectExchange => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollState {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Idle
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Scrolling
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fling
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Idle => 0
            case Scrolling => 1
            case Fling => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Idle => "Idle"
            case Scrolling => "Scrolling"
            case Fling => "Fling"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): ScrollState {
        match (value) {
            case 0 => Idle
            case 1 => Scrolling
            case 2 => Fling
            case _ => Idle
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemAlign {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Start => 0
            case Center => 1
            case End => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum StickyStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Header
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Footer
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Both
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case None => 0
            case Header => 1
            case Footer => 2
            case Both => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RichEditorSpanType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TEXT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IMAGE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIXED
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case TEXT => 0
            case IMAGE => 1
            case MIXED => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSpanAlignment {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BASELINE
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case TOP => 0
            case CENTER => 1
            case BOTTOM => 2
            case BASELINE => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): ImageSpanAlignment {
        match (value) {
            case 1 => TOP
            case 2 => CENTER
            case 3 => BOTTOM
            case 4 => BASELINE
            case _ => BASELINE
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RichEditorDeleteDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKWARD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FORWARD
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case BACKWARD => 0
            case FORWARD => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): RichEditorDeleteDirection {
        match (value) {
            case 0 => BACKWARD
            case 1 => FORWARD
            case _ => BACKWARD
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SpanType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TEXT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IMAGE
    | ...
}

// Not public enum, only for RichEditor component internal implementation.
protected enum MarginType {
    None
    | MarginLength
    | MarginPlaceholder
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case MarginLength => 1
            case MarginPlaceholder => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MixMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Compatible
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case All => 0
            case None => 1
            case Compatible => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}


@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PlayMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Reverse
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alternate
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AlternateReverse
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Reverse => 1
            case Alternate => 2
            case AlternateReverse => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GradientDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftTop
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftBottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightBottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Top => 1
            case Right => 2
            case Bottom => 3
            case LeftTop => 4
            case LeftBottom => 5
            case RightTop => 6
            case RightBottom => 7
            case None => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RenderFit {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LEFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RIGHT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP_LEFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP_RIGHT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM_LEFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM_RIGHT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_FILL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_CONTAIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_CONTAIN_TOP_LEFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_CONTAIN_BOTTOM_RIGHT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_COVER
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_COVER_TOP_LEFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_COVER_BOTTOM_RIGHT
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case CENTER => 0
            case TOP => 1
            case BOTTOM => 2
            case LEFT => 3
            case RIGHT => 4
            case TOP_LEFT => 5
            case TOP_RIGHT => 6
            case BOTTOM_LEFT => 7
            case BOTTOM_RIGHT => 8
            case RESIZE_FILL => 9
            case RESIZE_CONTAIN => 10
            case RESIZE_CONTAIN_TOP_LEFT => 11
            case RESIZE_CONTAIN_BOTTOM_RIGHT => 12
            case RESIZE_COVER => 13
            case RESIZE_COVER_TOP_LEFT => 14
            case RESIZE_COVER_BOTTOM_RIGHT => 15
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogAlignment {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopStart
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopEnd
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CenterStart
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CenterEnd
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomStart
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomEnd
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Top => 0
            case Center => 1
            case Bottom => 2
            case Default => 3
            case TopStart => 4
            case TopEnd => 5
            case CenterStart => 6
            case CenterEnd => 7
            case BottomStart => 8
            case BottomEnd => 9
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarrierDirection {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LEFT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RIGHT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case LEFT => 0
            case RIGHT => 1
            case TOP => 2
            case BOTTOM => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SafeAreaType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SYSTEM
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CUTOUT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    KEYBOARD
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case SYSTEM => 1
            case CUTOUT => 1 << 1
            case KEYBOARD => 1 << 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SafeAreaEdge {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case TOP => 1
            case BOTTOM => 1 << 1
            case START => 1 << 2
            case END => 1 << 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ColoringStrategy {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    INVERT
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): String {
        match (this) {
            case INVERT => "invert"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NestedScrollMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SELF_ONLY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SELF_FIRST
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PARENT_FIRST
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PARALLEL
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SELF_ONLY => 0
            case SELF_FIRST => 1
            case PARENT_FIRST => 2
            case PARALLEL => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ForegroundBlurStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    REGULAR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_REGULAR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_ULTRA_THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_ULTRA_THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_REGULAR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_ULTRA_THICK
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case THIN => 1
            case REGULAR => 2
            case THICK => 3
            case BACKGROUND_THIN => 4
            case BACKGROUND_REGULAR => 5
            case BACKGROUND_THICK => 6
            case BACKGROUND_ULTRA_THICK => 7
            case COMPONENT_ULTRA_THIN => 8
            case COMPONENT_THIN => 9
            case COMPONENT_REGULAR => 10
            case COMPONENT_THICK => 11
            case COMPONENT_ULTRA_THICK => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ThemeColorMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SYSTEM
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LIGHT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DARK
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SYSTEM => 0
            case LIGHT => 1
            case DARK => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AdaptiveColor {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AVERAGE
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case AVERAGE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ControlSize {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SMALL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORMAL
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SMALL => 0
            case NORMAL => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum OptionWidthMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FIT_CONTENT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FIT_TRIGGER
    | ...

    protected func getValue(): String {
        match (this) {
            case FIT_CONTENT => "fit_content"
            case FIT_TRIGGER => "fit_trigger"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ArrowPosition {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case END => 0
            case START => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MenuAlignType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case START => 0
            case CENTER => 1
            case END => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WebDarkMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Off
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    On
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Off => 0
            case On => 1
            case Auto => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SourceTool {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Finger
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Pen
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mouse
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Touchpad
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Joystick
    | ...

    protected static func parseValue(value: Int32): SourceTool {
        match (value) {
            case 0 => Unknown
            case 1 => Finger
            case 2 => Pen
            case 7 => Mouse
            case 9 => Touchpad
            case 10 => Joystick
            case _ => Unknown
        }
    }
}

/**
 * Repetition mode.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Repetition {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    repeat
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    repeat_x
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    repeat_y
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    no_repeat
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    clamp
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    mirror
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String{
        match (this) {
            case repeat => "repeat"
            case repeat_x => "repeat-x"
            case repeat_y => "repeat-y"
            case no_repeat => "no-repeat"
            case clamp => "clamp"
            case mirror => "mirror"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollSource {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FLING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EDGE_EFFECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OTHER_USER_INPUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_BAR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_BAR_FLING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLLER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLLER_ANIMATION
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case DRAG => 0
            case FLING => 1
            case EDGE_EFFECT => 2
            case OTHER_USER_INPUT => 3
            case SCROLL_BAR => 4
            case SCROLL_BAR_FLING => 5
            case SCROLLER => 6
            case SCROLLER_ANIMATION => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): ScrollSource {
        match (value) {
            case 0 => DRAG
            case 1 => FLING
            case 2 => EDGE_EFFECT
            case 3 => OTHER_USER_INPUT
            case 4 => SCROLL_BAR
            case 5 => SCROLL_BAR_FLING
            case 6 => SCROLLER
            case 7 => SCROLLER_ANIMATION
            case _ => DRAG
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentType {
    /**
     * User name content type.
     *
     * @since 14
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    USER_NAME
    |
        /**
         * Password content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PASSWORD
    |
        /**
         * New password content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NEW_PASSWORD
    |
        /**
         * Full street address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FULL_STREET_ADDRESS
    |
        /**
         * House number content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HOUSE_NUMBER
    |
        /**
         * District address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DISTRICT_ADDRESS
    |
        /**
         * City address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CITY_ADDRESS
    |
        /**
         * Province address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PROVINCE_ADDRESS
    |
        /**
         * Country address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COUNTRY_ADDRESS
    |
        /**
         * Person full name content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PERSON_FULL_NAME
    |
        /**
         * Person last name content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PERSON_LAST_NAME
    |
        /**
         * Person first name content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PERSON_FIRST_NAME
    |
        /**
         * Phone number content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_NUMBER
    |
        /**
         * Phone country code content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_COUNTRY_CODE
    |
        /**
         * Full phone number content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FULL_PHONE_NUMBER
    |
        /**
         * Email address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMAIL_ADDRESS
    |
        /**
         * Bank card number content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BANK_CARD_NUMBER
    |
        /**
         * ID card number content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ID_CARD_NUMBER
    |
        /**
         * Nickname content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NICKNAME
    |
        /**
         * Detail info without street content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DETAIL_INFO_WITHOUT_STREET
    |
        /**
         * Format address content type.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FORMAT_ADDRESS
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case USER_NAME => 0
            case PASSWORD => 1
            case NEW_PASSWORD => 2
            case FULL_STREET_ADDRESS => 3
            case HOUSE_NUMBER => 4
            case DISTRICT_ADDRESS => 5
            case CITY_ADDRESS => 6
            case PROVINCE_ADDRESS => 7
            case COUNTRY_ADDRESS => 8
            case PERSON_FULL_NAME => 9
            case PERSON_LAST_NAME => 10
            case PERSON_FIRST_NAME => 11
            case PHONE_NUMBER => 12
            case PHONE_COUNTRY_CODE => 13
            case FULL_PHONE_NUMBER => 14
            case EMAIL_ADDRESS => 15
            case BANK_CARD_NUMBER => 16
            case ID_CARD_NUMBER => 17
            case NICKNAME => 23
            case DETAIL_INFO_WITHOUT_STREET => 24
            case FORMAT_ADDRESS => 25
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureTypes {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TAP_GESTURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LONG_PRESS_GESTURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PAN_GESTURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PINCH_GESTURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SWIPE_GESTURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ROTATION_GESTURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CLICK
    | ...

    protected static func parseValue(value: Int32): GestureTypes {
        match (value) {
            case 0 => TAP_GESTURE
            case 1 => LONG_PRESS_GESTURE
            case 2 => PAN_GESTURE
            case 3 => PINCH_GESTURE
            case 4 => SWIPE_GESTURE
            case 5 => ROTATION_GESTURE
            case 6 => DRAG
            case 7 => CLICK
            case _ => TAP_GESTURE
        }
    }
}

/**
 * Define the menu pop-up policy.
 *
 * @since 12
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MenuPolicy {
    /**
     * Default value. The default logic of whether to pop up a menu depends on the scene.
     *
     * @since 12
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
        /**
         * Hide pop up menu.
         *
         * @since 12
         */
        @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hide
    |
        /**
         * Show pop up menu.
         *
         * @since 12
         */
        @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Show
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Hide => 1
            case Show => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Type of Text Decoration line Style.
 *
 * @since 12
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextDecorationStyle {
    /**
     * Solid line.
     *
     * @since 12
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SOLID
    |
        /**
         * Double lines.
         *
         * @since 12
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DOUBLE
    |
        /**
         * Dotted line.
         *
         * @since 12
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DOTTED
    |
        /**
         * Dashed line.
         *
         * @since 12
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DASHED
    |
        /**
         * Wavy line.
         *
         * @since 12
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WAVY
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SOLID => 0
            case DOUBLE => 1
            case DOTTED => 2
            case DASHED => 3
            case WAVY => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineBreakStrategy {
    /**
     * By default. Display as many characters as possible on each line until no more characters
     * can be displayed on that line, and do not automatically add hyphens under this strategy
     *
     * @since 14
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    GREEDY
    |
        /**
         * High quality folding. Optimize the layout of the entire text's line breaks and automatically
         * add hyphens if necessary.
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HIGH_QUALITY
    |
        /**
         * Balanced folding. We will try our best to ensure that the width of each line in a paragraph
         * is the same, and if necessary, we will add conjunction
         *
         * @since 14
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BALANCED
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case GREEDY => 0
            case HIGH_QUALITY => 1
            case BALANCED => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): LineBreakStrategy {
        match (value) {
            case 0 => GREEDY
            case 1 => HIGH_QUALITY
            case 2 => BALANCED
            case _ => GREEDY
        }
    }
}

/**
 * Text content style.
 *
 * @since 12
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextContentStyle {
    /**
     * Text content default style.
     *
     * @since 10
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    |
        /**
         * Text content inline style.
         *
         * @since 10
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    INLINE
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case INLINE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum of checkBox shape.
 *
 * @since 14
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CheckBoxShape {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CIRCLE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ROUNDED_SQUARE
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case CIRCLE => 0
            case ROUNDED_SQUARE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}


/**
 * Indicates the adaptive height mode of the label text.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextHeightAdaptivePolicy {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MAX_LINES_FIRST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIN_FONT_SIZE_FIRST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LAYOUT_CONSTRAINT_FIRST
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case MAX_LINES_FIRST => 0
            case MIN_FONT_SIZE_FIRST => 1
            case LAYOUT_CONSTRAINT_FIRST => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum of rrrow point position.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ArrowPointPosition {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    protected func getValue(): String {
        match (this) {
            case START => "Start"
            case CENTER => "Center"
            case END => "End"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TitleHeight {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MainOnly
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MainWithSub
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case MainOnly => 0
            case MainWithSub => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines style of button.
 *
 * @since 11
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogButtonStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HIGHLIGHT
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case HIGHLIGHT => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum of fold status.
 *
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FoldStatus {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_UNKNOWN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_EXPANDED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_FOLDED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_HALF_FOLDED
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case FOLD_STATUS_UNKNOWN => 0
            case FOLD_STATUS_EXPANDED => 1
            case FOLD_STATUS_FOLDED => 2
            case FOLD_STATUS_HALF_FOLDED => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Length attribute unit.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LengthMetricsUnit {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PX
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case PX => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Canvas direction.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CanvasDirection {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    inherit
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ltr
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    rtl
    | ...

    protected func getValue(): String {
        match (this) {
            case inherit => "inherit"
            case ltr => "ltr"
            case rtl => "rtl"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Canvas fill rule.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CanvasFillRule {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    evenodd
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    nonzero
    | ...

    protected func getValue(): String {
        match (this) {
            case evenodd => "evenodd"
            case nonzero => "nonzero"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Image type.
 *
 * @since 14
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    png
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    jpeg
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    webp
    | ...

    protected func getValue(): String {
        match (this) {
            case png => "image/png"
            case jpeg => "image/jpeg"
            case webp => "image/webp"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutSafeAreaType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SYSTEM | ...

    protected func getValue(): Int32 {
        match (this) {
            case SYSTEM => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutSafeAreaEdge {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case TOP => 0
            case BOTTOM => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavigationTitleMode {
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Free
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Full
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mini
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Free => 0
            case Full => 1
            case Mini => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parseValue(value: Int32): NavigationTitleMode {
        match (value) {
            case 0 => Free
            case 1 => Full
            case 2 => Mini
            case _ => Free
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case Free => "Free"
            case Full => "Full"
            case Mini => "Mini"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarStyle {
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stack
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case Stack => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FinishCallbackType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    REMOVED
    | @!APILevel[
        16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LOGICALLY
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case REMOVED => 0
            case LOGICALLY => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BlurStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thin
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thick
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_REGULAR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKGROUND_ULTRA_THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_ULTRA_THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_THIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_REGULAR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_THICK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COMPONENT_ULTRA_THICK
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Thin => 1
            case Regular => 2
            case Thick => 3
            case BACKGROUND_THIN => 4
            case BACKGROUND_REGULAR => 5
            case BACKGROUND_THICK => 6
            case BACKGROUND_ULTRA_THICK => 7
            case NONE => 0
            case COMPONENT_ULTRA_THIN => 8
            case COMPONENT_THIN => 9
            case COMPONENT_REGULAR => 10
            case COMPONENT_THICK => 11
            case COMPONENT_ULTRA_THICK => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DismissReason {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PRESS_BACK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOUCH_OUTSIDE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CLOSE_BUTTON
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SLIDE_DOWN
    | ...

    func toValue(): Int32 {
        match (this) {
            case PRESS_BACK => 0
            case TOUCH_OUTSIDE => 1
            case CLOSE_BUTTON => 2
            case SLIDE_DOWN => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func toEnum(value: Int32): DismissReason {
        if (value == 0) {
            return DismissReason.PRESS_BACK
        } else if (value == 1) {
            return DismissReason.TOUCH_OUTSIDE
        } else if (value == 2) {
            return DismissReason.CLOSE_BUTTON
        } else if (value == 3) {
            return DismissReason.SLIDE_DOWN
        } else {
            return DismissReason.PRESS_BACK
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextInputStyle {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inline
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Inline => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAreaType {
    @!APILevel[
        19,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORMAL
    | @!APILevel[
        19,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NUMBER
    | @!APILevel[
        19,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_NUMBER
    | @!APILevel[
        19,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMAIL
    | @!APILevel[
        19,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NUMBER_DECIMAL
    | @!APILevel[
        19,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    URL
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case NORMAL => 0
            case NUMBER => 2
            case PHONE_NUMBER => 3
            case EMAIL => 5
            case NUMBER_DECIMAL => 12
            case URL => 13
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
