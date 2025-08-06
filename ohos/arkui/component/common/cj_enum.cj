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

/**
 * indexer align property.
 *
 * @relation enum IndexerAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum IndexerAlign {
    /**
     * A dialog box is displayed on the right of the index bar.
     *
     * @relation enum Left
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * A dialog box is displayed on the left of the index bar.
     *
     * @relation enum Right
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | ...

    @!APILevel[
        21,
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

/**
 * Declare the type of input box
 *
 * @relation enum InputType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum InputType {
    /**
     * Basic input mode.
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Pure digital input mode.
     *
     * @relation Number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Number
    |
    /**
     * E-mail address input mode.
     *
     * <p><strong>NOTE</strong>:
     * <br>This mode accepts only digits, letters, underscores (_), dots (.),
     * and the following special characters: ! # $ % & ' " * + - / = ? ^ ` { | } ~ @ (which can only appear once)
     * </p>
     *
     * @relation Email
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Email
    |
    /**
     * Password entry mode.
     *
     * <p><strong>NOTE</strong>:
     * <br>An eye icon is used to show or hide the password.
     * <br>By default, the entered characters are temporarily shown before being obscured by dots;
     * they are directly obscured by dots since API version 12 on certain devices.
     * <br>The password input mode does not support underlines.
     * <br>If Password Vault is enabled, autofill is available for the username and password.
     * </p>
     *
     * @relation Password
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Password
    |
    /**
     * Phone number entry mode.
     *
     * @relation PhoneNumber
     */
    @!APILevel[
        21,
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

/**
 * Declare the type of soft keyboard.
 *
 * @relation enum EnterKeyType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EnterKeyType {
    /**
     * Go.
     *
     * @relation Go = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Go
    |
    /**
     * Search.
     *
     * @relation Search = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EntrySearch
    |
    /**
     * Send.
     *
     * @relation Send = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Send
    |
    /**
     * Next.
     *
     * @relation Next = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Next
    |
    /**
     * Done.
     *
     * @relation Done = 6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Done
    |
    /**
     * Showed as 'previous' pattern.
     *
     * @relation PREVIOUS = 7
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PREVIOUS
    |
    /**
     * Showed as 'new line' pattern.
     *
     * @relation NEW_LINE = 8
     */
    @!APILevel[
        21,
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

/**
 * FlexDirection enumeration description
 *
 * @relation enum FlexDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexDirection {
    /**
     * The main axis is consistent with the row direction as the layout mode.
     *
     * @relation Row
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Row
    |
    /**
     * The main axis is consistent with the column direction as the layout mode.
     *
     * @relation Column
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Column
    |
    /**
     * The layout is in the opposite direction to the Row direction.
     *
     * @relation RowReverse
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse
    |
    /**
     * Layout in the opposite direction to the column.
     *
     * @relation ColumnReverse
     */
    @!APILevel[
        21,
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

/**
 * FlexDirection enumeration description
 *
 * @relation enum FlexWrap
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexWrap {
    /**
     * The Flex container has a single row/column layout of elements, and children are allowed to go beyond the container.
     *
     * @relation NoWrap
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoWrap
    |
    /**
     * The elements of the Flex container are arranged in multiple rows or columns, and the sub-items are allowed to exceed the container.
     *
     * @relation Wrap
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Wrap
    |
    /**
     * The elements of the Flex container are arranged in reverse multiple rows/columns, and children are allowed to exceed the container.
     *
     * @relation WrapReverse
     */
    @!APILevel[
        21,
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

/**
 * FlexAlign enumeration description.
 *
 * @relation enum FlexAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexAlign {
    /**
     * The element is aligned at the head of the principal axis,
     * the first element is aligned with the head of the row, and subsequent elements are aligned with the previous one.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The elements are centered in the direction of the principal axis,
     * and the first element is the same distance from the beginning of the row as the last element is from the end of the row.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The element is aligned at the tail of the principal axis,
     * the last element is aligned at the end of the row, and the other elements are aligned with the next.
     *
     * @relation End
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * Elastic elements are evenly distributed in the direction of the Flex principal axis,
     * with the same distance between adjacent elements.
     * The first element aligns with the beginning of the line, and the last element aligns with the end of the line.
     *
     * @relation SpaceBetween
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceBetween
    |
    /**
     * Elastic elements are evenly distributed in the direction of the Flex principal axis,
     *  with the same distance between adjacent elements. Half the distance between adjacent elements as the distance between
     * the first element and the distance between the last element and the end of the row.
     *
     * @relation SpaceAround
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceAround
    |
    /**
     * Elements in the Flex axis direction are evenly spaced.
     * The spacing between adjacent elements, the spacing between the first element and the beginning of the row,
     * and the spacing between the last element and the end of the row are the same.
     *
     * @relation SpaceEvenly
     */
    @!APILevel[
        21,
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

/**
 * ItemAlign enumeration description
 *
 * @relation enum ItemAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ItemAlign {
    /**
     * Use the default configuration in the Flex container.
     *
     * @relation Auto
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * The element is in the Flex container with the cross-axis direction head aligned.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The element is centered in the Flex container with the cross axis direction aligned.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The element is bottom aligned in the Flex container with the cross axis direction.
     *
     * @relation End
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * Element In the Flex container, the cross-axis direction text baseline is aligned.
     *
     * @relation Stretch
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stretch
    |
    /**
     * Element In a Flex container, the fill is stretched across the axis and, when no dimension is set, to the container size.
     *
     * @relation Baseline
     */
    @!APILevel[
        21,
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

/**
 * Declare the type of status button
 *
 * @relation enum ToggleType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToggleType {
    /**
     * Checkbox
     *
     * @relation Checkbox
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CheckboxType
    |
    /**
     * Switch
     *
     * @relation Switch
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SwitchType
    |
    /**
     * Button
     *
     * @relation Button
     */
    @!APILevel[
        21,
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

/**
 * Text style
 *
 * @relation enum FontStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FontStyle {
    /**
     * Default style.
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Italic style.
     *
     * @relation Italic
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Italic
    | ...

    @!APILevel[
        21,
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

/**
 * Alignment enumeration description.
 *
 * @relation enum Alignment
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Alignment {
    /**
     * Top Start.
     *
     * @relation TopStart
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopStart
    |
    /**
     * The top is centered horizontally.
     *
     * @relation Top
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Top tail end.
     *
     * @relation TopEnd
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopEnd
    |
    /**
     * The starting end is centered longitudinally.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Center horizontal and vertical.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The tail end is centered longitudinally.
     *
     * @relation End
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * Bottom starting end.
     *
     * @relation BottomStart
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomStart
    |
    /**
     * The bottom is centered horizontally.
     *
     * @relation Bottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Bottom end.
     *
     * @relation BottomEnd
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomEnd
    | ...

    @!APILevel[
        21,
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

/**
 * HorizontalAlign enumeration description.
 *
 * @relation enum HorizontalAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum HorizontalAlign {
    /**
     * Aligns the start end in the language direction.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Center alignment. The default alignment mode is used.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Aligns the ends in the language direction.
     *
     * @relation End
     */
    @!APILevel[
        21,
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

/**
 * VerticalAlign enumeration description
 *
 * @relation enum VerticalAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum VerticalAlign {
    /**
     * Top alignment.
     *
     * @relation Top
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Center alignment. The default alignment mode is used.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Bottom alignment.
     *
     * @relation Bottom
     */
    @!APILevel[
        21,
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

/**
 * The font weight of the text
 *
 * @relation enum FontWeight
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FontWeight {
    /**
     * Normal font. Equivalent to a digital value of 400.
     *
     * @relation enum Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Bold. Equivalent to a numeric value of 700.
     *
     * @relation enum Bold
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bold
    |
    /**
     * Defines a value that is heavier than [Inherited Value].
     *
     * @relation enum Bolder
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bolder
    |
    /**
     * Defines a lighter value than [Inherited Value]..
     *
     * @relation enum Lighter
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lighter
    |
    /**
     * Defines a value that is more centered than [Inherited Value].
     *
     * @relation enum Medium
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    |
    /**
     * Defines a more general value than [Inherited Value].
     *
     * @relation enum Regular
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    |
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W100
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W200
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W300
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W400
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W500
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W600
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W700
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W800
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W900
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Declare the location of the bar chart.
 *
 * @relation enum BarPosition
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarPosition {
    /**
     * When the vertical attribute method is set to true, the tab is on the left of the container. When the vertical property method is set to false, the tab is at the top of the container.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * When the vertical attribute method is set to true, the tab is located on the right of the container. When the vertical property method is set to false, the tab is at the bottom of the container.
     *
     * @relation End
     */
    @!APILevel[
        21,
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

/**
 * Declare the graphic format of the bar chart.
 *
 * @relation enum BarMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarMode {
    /**
     * The width of each tab is determined by equally dividing the number of tabs by the bar width
     * (or bar height in the vertical layout).
     *
     * @relation Fixed = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fixed
    |
    /**
     * The width of each tab is determined by the actual layout. The tabs are scrollable in the following case:
     * In horizontal layout, the total width exceeds the tab bar width; in vertical layout,
     * the total height exceeds the tab bar height.
     *
     * @relation Scrollable = 0
     */
    @!APILevel[
        21,
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

/**
 * Define the type of shadow
 *
 * @relation enum ShadowType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowType {
    /**
     * Define a color type of shadow
     *
     * @relation enum COLOR
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COLOR
    |
    /**
     * Blur.
     *
     * @relation enum BLUR
     */
    @!APILevel[
        21,
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

/**
 * Type of text modifier.
 *
 * @relation enum TextDecorationType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextDecorationType {
    /**
     * Do not use text decorative lines.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Underline the words.
     *
     * @relation Underline
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Underline
    |
    /**
     * Text is in all uppercase.
     *
     * @relation Overline
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overline
    |
    /**
     * A modifier line that passes through the text.
     *
     * @relation LineThrough
     */
    @!APILevel[
        21,
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

/**
 * Alignment of text.
 *
 * @relation enum TextAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAlign {
    /**
     * The text is aligned in the same direction as the writing
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Center the text.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The text is aligned in the opposite direction of writing
     *
     * @relation End
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    @!APILevel[
        21,
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

/**
 * Declare how text overflows.
 *
 * @relation enum TextOverflow
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextOverflow {
    /**
     * When the text overflows its dimensions, the text will not be cropped.
     *
     * @relation Clip
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Clip
    |
    /**
     * If the text overflows its dimensions, the text that cannot be displayed shall be replaced by ellipsis.
     *
     * @relation Ellipsis
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ellipsis
    |
    /**
     * When the text overflows its dimensions, the text will not be cropped.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        21,
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

/**
 * Enum of word break
 *
 * @relation enum WordBreak
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WordBreak {
    /**
     * By default, CJK text can be wrapped between any 2 characters, and non-CJK text can only be wrapped in spaces.
     *
     * @relation NORMAL = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Non-CJK text be wrapped at any character
     *
     * @relation BREAK_ALL = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BreakAll
    |
    /**
     * Non-CJK text can be wrapped at any character
     * and if a complete word can be preserved in space breaks, the word must be kept on the line.
     *
     * @relation BREAK_WORD = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BreakWord
    | ...

    @!APILevel[
        21,
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

/**
 * ImageRepeat enumeration description
 *
 * @relation enum ImageRepeat
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageRepeat {
    /**
     * Do not draw the picture again.
     *
     * @relation NoRepeat
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoRepeat
    |
    /**
     * Repeat the drawing only on the horizontal axis.
     *
     * @relation X
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    X
    |
    /**
     * Repeat the drawing only on the vertical axis.
     *
     * @relation Y
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Y
    |
    /**
     * Draw the picture repeatedly on both axes.
     *
     * @relation XY
     */
    @!APILevel[
        21,
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

/**
 * ImageSize enumeration description
 *
 * @relation enum ImageRepeat
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSize {
    /**
     * Keep the aspect ratio to zoom out or zoom in so that the image is completely displayed within the display boundary.
     *
     * @relation Contain
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Contain
    |
    /**
     * Keep the aspect ratio to zoom in or out the image so that both sides of the image are greater than or equal to the display boundary.
     *
     * @relation Cover
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cover
    |
    /**
     * Keep the scale of the original image unchanged.
     *
     * @relation Auto
     */
    @!APILevel[
        21,
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

/**
 * enum Shadow style
 *
 * @relation enum ImageRepeat
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowStyle {
    /**
     * Defines the super small default shadow style.
     *
     * @relation OUTER_DEFAULT_XS
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_XS
    |
    /**
     * Defines the small default shadow style.
     *
     * @relation OUTER_DEFAULT_SM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_SM
    |
    /**
     * Medium shadow.
     *
     * @relation OUTER_DEFAULT_MD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_MD
    |
    /**
     * Large shadow.
     *
     * @relation OUTER_DEFAULT_LG
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_DEFAULT_LG
    |
    /**
     * Floating medium shadow.
     *
     * @relation OUTER_FLOATING_SM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OUTER_FLOATING_SM
    |
    /**
     * Floating medium shadow.
     *
     * @relation OUTER_FLOATING_MD
     */
    @!APILevel[
        21,
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

/**
 * Letter type in text
 *
 * @relation enum TextCase
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextCase {
    /**
     * The default is normal.
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * The text is all lowercase.
     *
     * @relation LowerCase
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LowerCase
    |
    /**
     * The text is all uppercase.
     *
     * @relation UpperCase
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    UpperCase
    | ...

    @!APILevel[
        21,
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

/**
 * Border Style
 *
 * @relation enum BorderStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BorderStyle {
    /**
     * Shows as a solid line.
     *
     * @relation Solid
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Solid
    |
    /**
     * Shows as a series of short square dashed lines.
     *
     * @relation Dashed
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dashed
    |
    /**
     * Displays as a series of dots with a radius of half the borderWidth.
     *
     * @relation Dotted
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dotted
    | ...

    @!APILevel[
        21,
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

/**
 * Image display mode.
 *
 * @relation enum ImageFit
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageFit {
    /**
     * Zoom in or out without maintaining the aspect ratio so that the image fills the display boundary.
     *
     * @relation Fill
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fill
    |
    /**
     * Keep the aspect ratio to zoom out or zoom in so that the image is completely displayed within the display boundary.
     *
     * @relation Contain
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Contain
    |
    /**
     * Keep the aspect ratio to zoom out or zoom in so that both sides of the image are greater than or equal to the display boundary.
     *
     * @relation Cover
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cover
    |
    /**
     * Adaptive display
     *
     * @relation Auto
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * Keep the original size and display it in the center.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Keep the aspect ratio displayed, and the image zooms out or remains unchanged.
     *
     * @relation ScaleDown
     */
    @!APILevel[
        21,
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

/**
 * Sets the horizontal layout of elements.
 *
 * @relation enum Direction
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Direction {
    /**
     * Elements are laid out from left to right.
     *
     * @relation Ltr
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ltr
    |
    /**
     * Elements are laid out from right to left.
     *
     * @relation Rtl
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rtl
    |
    /**
     * Use the default layout direction.
     *
     * @relation Auto
     */
    @!APILevel[
        21,
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

/**
 * Enumerates the scrolling directions.
 *
 * @relation enum ScrollDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollDirection {
    /**
     * Only vertical scrolling is supported.
     *
     * @relation Vertical
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Only horizontal scrolling is supported.
     *
     * @relation Horizontal
     */
    @!APILevel[
        21,
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

/**
 * Content scroll direction.
 *
 * @relation enum ScrollBarDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollBarDirection {
    /**
     * Vertical scrolling is supported.
     *
     * @relation Vertical
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Horizontal scrolling is supported.
     *
     * @relation Horizontal
     */
    @!APILevel[
        21,
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

/**
 * State triggered by the event.
 *
 * @relation enum SliderChangeMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderChangeMode {
    /**
     * The user touches or clicks the thumb.
     *
     * @relation Begin
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Begin
    |
    /**
     * The user is dragging the slider.
     *
     * @relation Moving
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Moving
    |
    /**
     * The user stops dragging the slider by lifting their finger or releasing the mouse device.
     * <p><strong>NOTE</strong>:
     * <br>The trigger occurs when an invalid value is restored to the default value, that is, when the value is set to
     * less than min or greater than max.
     * </p>
     *
     * @relation End
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * The user moves the thumb by touching or clicking the track.
     *
     * @relation Click
     */
    @!APILevel[
        21,
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

/**
 * Style of the slider thumb and track.
 *
 * @relation enum SliderStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderStyle {
    /**
     * The thumb is on the track.
     *
     * @relation OutSet
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OutSet
    |
    /**
     * The thumb is in the track.
     *
     * @relation InSet
     */
    @!APILevel[
        21,
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

/**
 * The interpolation effect of the image.
 *
 * @relation enum ImageInterpolation
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageInterpolation {
    /**
     * Do not use interpolated image data.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * High usage of interpolated image data may affect the speed of image rendering.
     *
     * @relation High
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    High
    |
    /**
     * Interpolated image data is used moderately.
     *
     * @relation Medium
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    |
    /**
     * Low usage of interpolated image data.
     *
     * @relation Low
     */
    @!APILevel[
        21,
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

/**
 * Used to set the status of the scroll bar.
 *
 * @relation enum BarState
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarState {
    /**
     * Not displayed.
     *
     * @relation Off
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Off
    |
    /**
     * On-demand display (displayed when you touch it and disappears after 2 seconds).
     *
     * @relation Auto
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * Resident display.
     *
     * @relation On
     */
    @!APILevel[
        21,
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

/**
 * Controls the display or hide of the current component
 *
 * @relation enum Visibility
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Visibility {
    /**
     * Resident display.
     *
     * @relation Visible
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Visible
    |
    /**
     * Hide, but participate in layout for placeholder.
     *
     * @relation Hidden
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hidden
    |
    /**
     * Hides but does not participate in layout and does not take place.
     *
     * @relation None
     */
    @!APILevel[
        21,
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
 * LineCapStyle enumeration description
 *
 * @relation enum LineCapStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineCapStyle {
    /**
     * The two ends of the dividing line are parallel lines.
     *
     * @relation Butt
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Butt
    |
    /**
     * The two ends of the dividing line are semicircles.
     *
     * @relation Round
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Round
    |
    /**
     * Extends half a circle at the end of the path with a width equal to half the line width and a height equal to the line width.
     *
     * @relation Square
     */
    @!APILevel[
        21,
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

/**
 * Type of progress bar
 *
 * @relation enum ProgressType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressType {
    /**
     * Linear progress bar style.
     *
     * @relation Linear = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    |
    /**
     * Ring progress bar.
     *
     * @relation Ring = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ring
    |
    /**
     * Eclipse progress bar.
     *
     * @relation Eclipse = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Eclipse
    |
    /**
     * ScaleRing progress bar.
     *
     * @relation ScaleRing = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScaleRing
    |
    /**
     * Capsule progress bar.
     *
     * @relation Capsule = 4
     */
    @!APILevel[
        21,
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

/**
 * Image Rendering Mode.
 *
 * @relation enum ImageRenderMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageRenderMode {
    /**
     * Render according to the original image, including colors.
     *
     * @relation Original
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Original
    |
    /**
     * Render the image as a template image, ignoring the color information of the image.
     *
     * @relation Template
     */
    @!APILevel[
        21,
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

/**
 * Route jump.
 *
 * @relation enum NavigationType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavigationType {
    /**
     * Jump to the next page.
     *
     * @relation Push
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    |
    /**
     * Replace page.
     *
     * @relation Replace
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Replace
    |
    /**
     * Return to the previous page.
     *
     * @relation Back
     */
    @!APILevel[
        21,
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

/**
 * Declare the size of the swiper on the spindle.
 *
 * @relation enum SwiperDisplayMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwiperDisplayMode {
    /**
     * Carousel map extension.
     *
     * @relation Stretch
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stretch
    |
    /**
     * The rotation chart is self linear.
     *
     * @relation AutoLinear
     */
    @!APILevel[
        21,
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

/**
 * Sets the animation playback mode. By default, the animation starts to play again after the playback is complete.
 *
 * @relation enum Curve
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Curve {
    /**
     * Indicates that the speed of the animation is the same from start to finish.
     *
     * @relation Linear
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    |
    /**
     * Indicates that the animation starts at a low speed, then accelerates, and then slows down before it ends, CubicBezier(0.25, 0.1, 0.25, 1.0).
     *
     * @relation Ease
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ease
    |
    /**
     * Indicates that the animation starts at a low speed, CubicBezier(0.42, 0.0, 1.0, 1.0).
     *
     * @relation EaseIn
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseIn
    |
    /**
     * Indicates that the animation ends at a low speed, CubicBezier(0.0, 0.0, 0.78, 1.0).
     *
     * @relation EaseOut
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseOut
    |
    /**
     * Indicates that the animation starts and ends at a slow speed, CubicBezier(0.42, 0.0, 0.78, 1.0).
     *
     * @relation EaseInOut
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseInOut
    |
    /**
     * Slow-in, fast-out
     *
     * @relation FastOutSlowIn
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FastOutSlowIn
    |
    /**
     * Linear Out Slow In
     *
     * @relation LinearOutSlowIn
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LinearOutSlowIn
    |
    /**
     * Fast Out Linear In.
     *
     * @relation FastOutLinearIn
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FastOutLinearIn
    |
    /**
     * Extreme Deceleration.
     *
     * @relation ExtremeDeceleration
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ExtremeDeceleration
    |
    /**
     * Sharp.
     *
     * @relation Sharp
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Sharp
    |
    /**
     * Rhythm.
     *
     * @relation Rhythm
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rhythm
    |
    /**
     * Smooth.
     *
     * @relation Smooth
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Smooth
    |
    /**
     * Damping curve, CubicBezier(0.2, 0.0, 0.2, 1.0).
     *
     * @relation Friction
     */
    @!APILevel[
        21,
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

/**
 * Sliding effect
 *
 * @relation enum EdgeEffect
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EdgeEffect {
    /**
     * Elastic physical action, sliding to the edge can continue to slide for a distance based on the initial speed or touch event, and spring back when released.
     *
     * @relation Spring
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Spring
    |
    /**
     * Fade.
     *
     * @relation Fade
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fade
    |
    /**
     * Sliding to the edge has no effect.
     *
     * @relation None
     */
    @!APILevel[
        21,
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

/**
 * Edge.
 *
 * @relation enum Edge
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Edge {
    /**
     * The top is centered horizontally.
     *
     * @relation Top
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Align the head of the cross axis direction.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The bottom is centered horizontally.
     *
     * @relation Bottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Align the head of the cross axis direction.
     *
     * @relation End
     */
    @!APILevel[
        21,
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
/**
 * Placement enumeration description
 *
 * @relation enum Placement
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Placement {
    /**
     * Left placement
     *
     * @relation Left
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Right placement
     *
     * @relation Right
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Top placement
     *
     * @relation Top
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Bottom placement
     *
     * @relation Bottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * TopLeft placement
     *
     * @relation TopLeft
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopLeft
    |
    /**
     * TopRight placement
     *
     * @relation TopRight
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopRight
    |
    /**
     * BottomLeft placement
     *
     * @relation BottomLeft
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomLeft
    |
    /**
     * BottomRight placement
     *
     * @relation BottomRight
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomRight
    |
    /**
     * LeftTop placement
     *
     * @relation LeftTop
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftTop
    |
    /**
     * LeftBottom placement
     *
     * @relation LeftBottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftBottom
    |
    /**
     * RightTop placement
     *
     * @relation RightTop
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    |
    /**
     * RightBottom placement
     *
     * @relation RightBottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightBottom
    | @!APILevel[
        21,
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
/**
 * Line Join Style
 *
 * @relation enum LineJoinStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineJoinStyle {
    /**
     * Connect path segments using bevels.
     *
     * @relation Miter
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Miter
    |
    /**
     * Connect path segments using sharp corners.
     *
     * @relation Round
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Round
    |
    /**
     * Connect path segments using fillets.
     *
     * @relation Bevel
     */
    @!APILevel[
        21,
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
/**
 * Describes the alignment mode for drawing text.
 *
 * @relation type CanvasTextAlign = "center" | "end" | "left" | "right" | "start"
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAlignStyle {
    /**
     * (Default) The text is left-aligned.
     *
     * @relation type CanvasTextAlign = "center" | "end" | "left" | "right" | "start"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * The text is right-aligned.
     *
     * @relation type CanvasTextAlign = "center" | "end" | "left" | "right" | "start"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * The text is centered.
     *
     * @relation type CanvasTextAlign = "center" | "end" | "left" | "right" | "start"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Justify
    |
    /**
     * Where the text snap line begins (Left alignment refers to the local from left to right,
     * and right alignment refers to the local from right to left)
     *
     * @relation type CanvasTextAlign = "center" | "end" | "left" | "right" | "start"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Where text aligns lines end (Left alignment refers to the local from left to right,
     * and right alignment refers to the local from right to left)
     *
     * @relation type CanvasTextAlign = "center" | "end" | "left" | "right" | "start"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    @!APILevel[
        21,
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
/**
 * Enumeration the type of text baseline.
 *
 * @relation enum TextBaseline
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextBaseline {
    /**
     * The alphabetic baseline, typically used for Latin-based scripts where the baseline aligns
     * with the base of lowercase letters.
     *
     * @relation ALPHABETIC
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alphabetic
    |
    /**
     * The ideographic baseline, commonly used for ideographic scripts such as Chinese, Japanese, and Korean,
     * where the baseline aligns with the center of characters.
     *
     * @relation IDEOGRAPHIC
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ideographic
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Middle
    | @!APILevel[
        21,
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
/**
 * Type of composition operation applied when drawing a new shape.
 *
 * @relation globalCompositeOperation: string
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CompositeOperation {
    /**
     * (Default) Draws a new drawing on top of an existing canvas context.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceOver
    |
    /**
     * The new drawing is drawn only where it overlaps the content of the existing canvas.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceAtop
    |
    /**
     * The new drawing is drawn only where the new drawing overlaps the target canvas.
     * Everything else is transparent.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceIn
    |
    /**
     * Draws a new drawing where it does not overlap with the existing canvas content.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceOut
    |
    /**
     * Draws a new graphic behind the existing canvas content.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationOver
    |
    /**
     * The existing canvas retains only the part that overlaps with the new drawing,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationAtop
    |
    /**
     * Existing canvas content remains where the new drawing overlaps the existing canvas content.
     * Everything else is transparent.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationIn
    |
    /**
     * Existing content remains where the new drawing does not overlap.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationOut
    |
    /**
     * The color of two overlapping shapes is determined by adding the color values.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lighter
    |
    /**
     * Only new graphics are displayed.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Copy
    |
    /**
     * In the image, those overlaps and other places outside of the normal drawing are transparent.
     */
    @!APILevel[
        21,
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

/**
 * Sets the image smoothness attribute.
 *
 * @relation type ImageSmoothingQuality = "high" | "low" | "medium"
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum QualityType {
    /**
     * (default)low
     *
     * @relation type ImageSmoothingQuality = "high" | "low" | "medium"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Low
    |
    /**
     * Medium
     *
     * @relation type ImageSmoothingQuality = "high" | "low" | "medium"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    |
    /**
     * height
     *
     * @relation type ImageSmoothingQuality = "high" | "low" | "medium"
     */
    @!APILevel[
        21,
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

/**
 * Creating an Object
 *
 * @relation enum GesturePriority
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GesturePriority {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Low
    | @!APILevel[
        21,
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

/**
 * Creating an Object
 *
 * @relation enum GestureMask
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureMask {
    /**
     * High-priority response to the current gesture.When the current gesture fails to be recognized, other gesture responses are triggered.For gestures with the same priority, responses are performed based on the recognition sequence.
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Ignore internal gestures and recognize the current gesture first.
     *
     * @relation IgnoreInternal
     */
    @!APILevel[
        21,
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

/**
 * Creating an Object
 *
 * @relation enum SwipeDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwipeDirection {
    /**
     * Sliding horizontally.
     *
     * @relation Horizontal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    |
    /**
     * Sliding Vertical
     *
     * @relation Vertical
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Sliding in all directions.
     *
     * @relation All
     */
    @!APILevel[
        21,
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

/**
 * Creating an Object
 *
 * @relation enum PanDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PanDirection {
    /**
     * Default.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Sliding left.
     *
     * @relation Left
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Sliding right.
     *
     * @relation Right
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Sliding horizontally.
     *
     * @relation Horizontal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    |
    /**
     * Sliding up.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    |
    /**
     * Sliding Down.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    |
    /**
     * Sliding Vertical
     *
     * @relation Vertical
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Sliding in all directions.
     *
     * @relation All
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    | @!APILevel[
        21,
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
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func |(right: PanDirection): PanDirection {
        Computed(this.getValue() | right.getValue())
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func &(right: PanDirection): PanDirection {
        Computed(this.getValue() & right.getValue())
    }
}

/**
 * Creating an Object
 *
 * @relation enum GestureMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureMode {
    /**
     * Sequential gesture recognition is performed in sequence according to the gesture registration sequence.
     *
     * @relation Sequence
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Sequence
    |
    /**
     * Simultaneous recognition. Registration gestures participate in recognition. Everything can be triggered.
     *
     * @relation Parallel
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Parallel
    |
    /**
     * Mutually exclusive recognition. Only one gesture is successfully recognized.
     *
     * @relation Exclusive
     */
    @!APILevel[
        21,
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
/**
 * Axis enumeration description.
 *
 * @relation enum Axis
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Axis {
    /**
     * Longitudinal arrangement
     *
     * @relation Vertical
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Horizontal arrangement.
     *
     * @relation Horizontal
     */
    @!APILevel[
        21,
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

/**
 * ResponseType for contextMenu
 *
 * @relation enum ResponseType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ResponseType {
    /**
     * Right click.
     *
     * @relation RightClick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightClick
    |
    /**
     * Long press.
     *
     * @relation LongPress
     */
    @!APILevel[
        21,
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

/**
 * Indicates the share option.
 *
 * @relation enum CopyOptions
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CopyOptions {
    /**
     * Not allow share.
     *
     * @relation None = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Share in app.
     *
     * @relation InApp = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    InApp
    |
    /**
     * Share in local device.
     *
     * @relation LocalDevice = 2
     */
    @!APILevel[
        21,
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

/**
 * Function Called by Touch
 *
 * @relation enum TouchType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TouchType {
    /**
     * Triggered when the finger is pressed.
     *
     * @relation Down
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    |
    /**
     * Triggered when the finger is raised.
     *
     * @relation Up
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    |
    /**
     * Triggered when the finger presses on the screen.
     *
     * @relation Move
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Move
    |
    /**
     * Triggers when the touch event cancels.
     *
     * @relation Cancel
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cancel
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Sets the sidebar style of showing
 *
 * @relation enum SideBarContainerType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SideBarContainerType {
    /**
     * The sidebar invisible
     *
     * @relation Embed
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Embed
    |
    /**
     * The sidebar visible
     *
     * @relation Overlay
     */
    @!APILevel[
        21,
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

/**
 * Sets the sidebar position of showing
 *
 * @relation enum SideBarPosition
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SideBarPosition {
    /**
     * The sidebar is on the Start of the container
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The sidebar is on the End of the container
     *
     * @relation End
     */
    @!APILevel[
        21,
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

/**
 * Defines the event source type.
 *
 * @relation enum SourceType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SourceType {
    /**
     * Unknown type.
     *
     * @relation Unknown
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * The mouse type.
     *
     * @relation Mouse
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mouse
    |
    /**
     * The touch screen type.
     *
     * @relation TouchScreen
     */
    @!APILevel[
        21,
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
        21,
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

/**
 * Function Called by Mouse
 *
 * @relation enum MouseButton
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MouseButton {
    /**
     * Mouse None Button.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Mouse Left Button.
     *
     * @relation Left
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Mouse Right Button.
     *
     * @relation Right
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Mouse Middle Button.
     *
     * @relation Middle
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Middle
    |
    /**
     * Mouse Back Button.
     *
     * @relation Back
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Back
    |
    /**
     * Mouse Forward Button.
     *
     * @relation Forward
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forward
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Function Called by Mouse
 *
 * @relation enum MouseAction
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MouseAction {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Triggered when the mouse is pressed.
     *
     * @relation Press
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Press
    |
    /**
     * Triggered when the mouse is released.
     *
     * @relation Release
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Release
    |
    /**
     * Triggered when the mouse is Moved.
     *
     * @relation Move
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Move
    |
    /**
     * Triggered when the mouse is Hovered.
     *
     * @relation Hover
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hover
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Type of the input device that triggers the current key.
 *
 * @relation enum KeySource
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeySource {
    /**
     * The input device type is unknown.
     *
     * @relation Unknown
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * Set Device Type to Keyboard.
     *
     * @relation Keyboard
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Keyboard
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Type of a key.
 *
 * @relation enum KeyType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeyType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * Press the key.
     *
     * @relation Down
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    |
    /**
     * The key is released.
     *
     * @relation Up
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Modifier key for hot key.
 *
 * @relation enum ModifierKey
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ModifierKey {
    /**
     * ctrl.
     *
     * @relation CTRL
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CTRL
    |
    /**
     * shift.
     *
     * @relation SHIFT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SHIFT
    |
    /**
     * alt.
     *
     * @relation ALT
     */
    @!APILevel[
        21,
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
        21,
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

/**
 * Function key for hot key.
 *
 * @relation enum FunctionKey
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FunctionKey {
    /**
     * Escape key.
     *
     * @relation ESC
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ESC
    |
    /**
     * F1 key.
     *
     * @relation F1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F1
    |
    /**
     * F2 key.
     *
     * @relation F2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F2
    |
    /**
     * F3 key.
     *
     * @relation F3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F3
    |
    /**
     * F4 key.
     *
     * @relation F4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F4
    |
    /**
     * F5 key.
     *
     * @relation F5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F5
    |
    /**
     * F6 key.
     *
     * @relation F6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F6
    |
    /**
     * F7 key.
     *
     * @relation F7
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F7
    |
    /**
     * F8 key.
     *
     * @relation F8
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F8
    |
    /**
     * F9 key.
     *
     * @relation F9
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F9
    |
    /**
     * F10 key.
     *
     * @relation F10
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F10
    |
    /**
     * F11 key.
     *
     * @relation F11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F11
    |
    /**
     * F12 key.
     *
     * @relation F12
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F12
    |
    /**
     * Tab key.
     *
     * @relation TAB
     */
    @!APILevel[
        21,
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

/**
 * DataPanelType enum
 *
 * @relation enum DataPanelType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DataPanelType {
    /**
     * Line Rainbow
     *
     * @relation Circle
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CircleType
    |
    /**
     * Line Type
     *
     * @relation Line
     */
    @!APILevel[
        21,
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

/**
 * ItemState
 *
 * @relation enum ItemState
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ItemState {
    /**
     * Default State
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Disabled State
     *
     * @relation Disabled
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Disabled
    |
    /**
     * Waiting State
     *
     * @relation Waiting
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Waiting
    |
    /**
     * Skip State
     *
     * @relation Skip
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Skip
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * The refresh status of the drop-down refresh.
 *
 * @relation enum RefreshStatus
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RefreshStatus {
    /**
     * The refresh status of the drop-down refresh.
     *
     * @relation Inactive
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inactive
    |
    /**
     * Drop down, but the drop-down distance is less than the refresh distance.
     *
     * @relation Drag
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Drag
    |
    /**
     * The pull-down exceeds the refresh distance.
     *
     * @relation OverDrag
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OverDrag
    |
    /**
     * After the pull-down, it rebounds to the refresh distance and enters the refresh state.
     *
     * @relation Refresh
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Refresh
    |
    /**
     * After refresh, return to the initial state.
     *
     * @relation Done
     */
    @!APILevel[
        21,
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

/**
 * Seek mode.
 *
 * @relation enum SeekMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SeekMode {
    /**
     * Sync to keyframes before the time point.
     *
     * @relation PreviousKeyframe
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PreviousKeyframe
    |
    /**
     * Sync to keyframes after the time point.
     *
     * @relation NextKeyframe
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NextKeyframe
    |
    /**
     * Sync to closest keyframes.
     *
     * @relation ClosestKeyframe
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ClosestKeyframe
    |
    /**
     * Seek to frames closest the time point.
     *
     * @relation Accurate
     */
    @!APILevel[
        21,
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

/**
 * playback speed.
 *
 * @relation enum PlaybackSpeed
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PlaybackSpeed {
    /**
     * 0.75x speed playback.
     *
     * @relation Speed_Forward_0_75_X
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_0_75_X
    |
    /**
     * 1.00x speed playback.
     *
     * @relation Speed_Forward_1_00_X
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_1_00_X
    |
    /**
     * 1.25x speed playback.
     *
     * @relation Speed_Forward_1_25_X
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_1_25_X
    |
    /**
     * 1.75x speed playback.
     *
     * @relation Speed_Forward_1_75_X
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Speed_Forward_1_75_X
    |
    /**
     * 2.00x speed playback.
     *
     * @relation Speed_Forward_2_00_X
     */
    @!APILevel[
        21,
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

/**
 * CheckboxGroup SelectStatus
 *
 * @relation enum SelectStatus
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SelectStatus {
    /**
     * All checkboxes are selected.
     *
     * @relation All
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    |
    /**
     * Part of the checkbox is selected.
     *
     * @relation Part
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Part
    |
    /**
     * None of the checkbox is selected.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Animation status.
 *
 * @relation enum AnimationStatus
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimationStatus {
    /**
     * Initial state of the animation.
     *
     * @relation Initial
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Initial
    |
    /**
     * The animation is playing.
     *
     * @relation Running
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Running
    |
    /**
     * The animation is paused.
     *
     * @relation Paused
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Paused
    |
    /**
     * The animation is stopped.
     *
     * @relation Stopped
     */
    @!APILevel[
        21,
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

/**
 * Sets the state before and after the animation starts.
 *
 * @relation enum FillMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FillMode {
    /**
     * Restores to the initial state after the playback is complete.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Retains the state at the end of the animation when the playback is complete.
     *
     * @relation Forwards
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forwards
    |
    /**
     * Applies the start attribute value for the period specified by animation-delay before the animation is displayed.
     *
     * @relation Backwards
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Backwards
    |
    /**
     * Both forward and backward fill modes are applied.
     *
     * @relation Both
     */
    @!APILevel[
        21,
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

/**
 * Sliding effect
 *
 * @relation enum SwipeEdgeEffect
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwipeEdgeEffect {
    /**
     * Elastic physical action, sliding to the edge can continue to slide for a distance based on the initial speed or touch event, and spring back when released.
     *
     * @relation Spring
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Spring
    |
    /**
     * Sliding to the edge has no effect.
     *
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        21,
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

/**
 * SharedTransitionEffectType enumeration description
 *
 * @relation enum SharedTransitionEffectType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SharedTransitionEffectType {
    /**
     * The location of the destination page element remains unchanged, and you can configure the transparency animation. Currently,
     * only the static effect configured for redirecting to the target page takes effect.
     *
     * @relation Static
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SharedEffectStatic
    |
    /**
     * Move the source page element to the destination page element location and scale it appropriately.
     *
     * @relation Exchange
     */
    @!APILevel[
        21,
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

/**
 * Declare scroll status
 *
 * @relation enum ScrollState
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollState {
    /**
     * Not activated.
     *
     * @relation Idle
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Idle
    |
    /**
     * Scrolling status.
     *
     * @relation Scrolling
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Scrolling
    |
    /**
     * Inertial scrolling state.
     *
     * @relation Fling
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fling
    | ...

    @!APILevel[
        21,
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
        21,
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

/**
 * Declare list item alignment status
 *
 * @relation enum ListItemAlign
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemAlign {
    /**
     * The list items are packed toward the start edge of the <em>List</em> component along the cross axis.
     *
     * @relation Start
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The list items are centered in the <em>List</em> component along the cross axis.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The list items are packed toward the end edge of the <em>List</em> component along the cross axis.
     *
     * @relation End
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    @!APILevel[
        21,
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

/**
 * Declare item group sticky style.
 *
 * @relation enum StickyStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum StickyStyle {
    /**
     * In the ListItemGroup component, the header is not pinned to the top,
     * and the footer is not pinned to the bottom.
     *
     * @relation None = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * In the ListItemGroup component, the header is pinned to the top,
     * and the footer is not pinned to the bottom.
     *
     * @relation Header = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Header
    |
    /**
     * In the <em>ListItemGroup</em> component, the footer is pinned to the bottom,
     * and the header is not pinned to the top.
     *
     * @relation Footer = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Footer
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Both
    | ...

    @!APILevel[
        21,
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

/**
 * Defines span type.
 *
 * @relation enum RichEditorSpanType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RichEditorSpanType {
    /**
     * Text,corresponding textSpan type.
     *
     * @relation TEXT = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TEXT
    |
    /**
     * Image,corresponding imageSpan type.
     *
     * @relation IMAGE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IMAGE
    |
    /**
     * Mixed,corresponding mixed span type.
     *
     * @relation MIXED = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIXED
    | ...

    @!APILevel[
        21,
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

/**
 * The alignment of ImageSpan
 *
 * @relation enum ImageSpanAlignment
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSpanAlignment {
    /**
     * Indicating that the top of the ImageSpan should be aligned with the top of the surrounding text.
     *
     * @relation TOP
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    |
    /**
     * Indicating that the center of the ImageSpan should be aligned with the center of the surrounding text.
     *
     * @relation CENTER
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    |
    /**
     * Indicating that the bottom of the ImageSpan should be aligned with the bottom of the surrounding text.
     *
     * @relation BOTTOM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    |
    /**
     * Indicating that the bottom of the ImageSpan should be aligned with the baseline of the surrounding text.
     *
     * @relation BASELINE
     */
    @!APILevel[
        21,
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

/**
 * Defines delete text direction.
 *
 * @relation enum RichEditorDeleteDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RichEditorDeleteDirection {
    /**
     * Delete backward.
     *
     * @relation BACKWARD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BACKWARD
    |
    /**
     * Delete forward.
     *
     * @relation FORWARD
     */
    @!APILevel[
        21,
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

/**
 * Defines delete text direction.
 *
 * @relation enum RichEditorDeleteDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SpanType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TEXT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IMAGE
    | ...
}

/**
 * The Web's behavior to load from HTTP or HTTPS. Defaults to MixedMode.None.
 *
 * @relation enum MixedMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MixMode {
    /**
     * Loose Mode: HTTP and HTTPS hybrid content can be loaded. This means that all insecure content can be loaded.
     *
     * @relation All = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    |
    /**
     * Compatibility Modes: HTTP and HTTPS hybrid content can be loaded in compatibility mode. This means that some insecure content may be loaded.
     *
     * @relation Compatible = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Compatible
    |
    /**
     * Strict Mode: HTTP and HTTPS hybrid content cannot be loaded.
     *
     * @relation None = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    @!APILevel[
        21,
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

enum WebType {
    SURFACE
    | TEXTURE
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SURFACE => 0
            case TEXTURE => 1
            case _ => 0
        }
    }
}

/**
 * Play Mode
 *
 * @relation enum PlayMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PlayMode {
    /**
     * The animation plays normally.
     *
     * @relation Normal
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * The animation plays backwards.
     *
     * @relation Reverse
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Reverse
    |
    /**
     * The animation plays forward on odd numbers (1, 3, 7...) and backward on even numbers (2, 4, 6...).
     *
     * @relation Alternate
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alternate
    |
    /**
     * The animation plays backwards on odd numbers (1, 3, 7...) and forwards on even numbers (2, 4, 6...)..
     *
     * @relation AlternateReverse
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AlternateReverse
    | ...

    @!APILevel[
        21,
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

/**
 * GradientDirection enumeration description
 *
 * @relation enum GradientDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GradientDirection {
    /**
     * Right to left.
     *
     * @relation Left
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * From the bottom up.
     *
     * @relation Top
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * From left to right.
     *
     * @relation Right
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * From the top down.
     *
     * @relation Bottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Top Left
     *
     * @relation LeftTop
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftTop
    |
    /**
     * Left Bottom
     *
     * @relation LeftBottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftBottom
    |
    /**
     * Right Top
     *
     * @relation RightTop
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    |
    /**
     * Right Bottom
     *
     * @relation RightBottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightBottom
    |
    /**
     * None
     *
     * @relation None
     */
    @!APILevel[
        21,
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

/**
 * Enum of RenderFit
 *
 * @relation enum RenderFit
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RenderFit {
    /**
     * Without scaling the content area, the content area is drawn in the center of the node.
     *
     * @relation CENTER = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    |
    /**
     * Without scaling the content area, the content area is drawn in the top center of the node.
     *
     * @relation TOP = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    |
    /**
     * Without scaling the content area, the content area is drawn in the bottom center of the node.
     *
     * @relation BOTTOM = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    |
    /**
     * Without scaling the content area, the content area is drawn in the left center of the node.
     *
     * @relation LEFT = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LEFT
    |
    /**
     * Without scaling the content area, the content area is drawn in the right center of the node.
     *
     * @relation RIGHT = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RIGHT
    |
    /**
     * Without scaling the content area, the content area is drawn in the top left of the node.
     *
     * @relation TOP_LEFT = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP_LEFT
    |
    /**
     * Without scaling the content area, the content area is drawn in the top right of the node.
     *
     * @relation TOP_RIGHT = 6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP_RIGHT
    |
    /**
     * Without scaling the content area, the content area is drawn in the bottom left of the node.
     *
     * @relation BOTTOM_LEFT = 7
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM_LEFT
    |
    /**
     * Without scaling the content area, the content area is drawn in the bottom right of the node.
     *
     * @relation BOTTOM_RIGHT = 8
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM_RIGHT
    |
    /**
     * Scale the length and width of the content area to the node size to fill the node.
     *
     * @relation RESIZE_FILL = 9
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_FILL
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is less than or equal to the corresponding side of the node, and the content after scaling
     * is centered.
     *
     * @relation RESIZE_CONTAIN = 10
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_CONTAIN
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is less than or equal to the corresponding side of the node. If the height of the scaled content
     * is less than or equal to the height of the node, the scaled content area is displayed at the top; otherwise,
     * the width of the scaled content is less than or equal to the width of the node, the scaled content area is
     * displayed at the left.
     *
     * @relation RESIZE_CONTAIN_TOP_LEFT = 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_CONTAIN_TOP_LEFT
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is less than or equal to the corresponding side of the node. If the height of the scaled content
     * is less than or equal to the height of the node, the scaled content area is displayed at the bottom; otherwise,
     * the width of the scaled content is less than or equal to the width of the node, the scaled content area is
     * displayed at the right.
     *
     * @relation RESIZE_CONTAIN_BOTTOM_RIGHT = 12
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_CONTAIN_BOTTOM_RIGHT
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is greater than or equal to the corresponding side of the node, and the content after scaling
     * displays the center area.
     *
     * @relation RESIZE_COVER = 13
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_COVER
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is greater than or equal to the corresponding side of the node. If the height of the scaled content
     * is greater than or equal to the height of the node, the scaled content area displays the top area; otherwise,
     * the width of the scaled content is greater than or equal to the width of the node, the scaled content area
     * displays the left area.
     *
     * @relation RESIZE_COVER_TOP_LEFT = 14
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RESIZE_COVER_TOP_LEFT
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is greater than or equal to the corresponding side of the node. If the height of the scaled content
     * is greater than or equal to the height of the node, the scaled content area displays the bottom area; otherwise,
     * the width of the scaled content is greater than or equal to the width of the node, the scaled content area
     * displays the right area.
     *
     * @relation RESIZE_COVER_BOTTOM_RIGHT = 15
     */
    @!APILevel[
        21,
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

/**
 * The alignment of dialog,
 *
 * @relation enum DialogAlignment
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogAlignment {
    /**
     * Vertical top alignment.
     *
     * @relation Top
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Align vertically to the center.
     *
     * @relation Center
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Vertical bottom alignment.
     *
     * @relation Bottom
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Default alignment.
     *
     * @relation Default
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Align the upper left corner.
     *
     * @relation TopStart
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopStart
    |
    /**
     * Align the upper right corner.
     *
     * @relation TopEnd
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopEnd
    |
    /**
     * Left center alignment.
     *
     * @relation CenterStart
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CenterStart
    |
    /**
     * Right center alignment.
     *
     * @relation CenterEnd
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CenterEnd
    |
    /**
     * Align the lower left corner.
     *
     * @relation BottomStart
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomStart
    |
    /**
     * Align the lower right corner.
     *
     * @relation BottomEnd
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomEnd
    | ...

    @!APILevel[
        21,
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

/**
 * Specifies the direction value of Barrier.
 *
 * @relation enum BarrierDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarrierDirection {
    /**
     * Barrier will be positioned to the far left of all referenced components.
     *
     * @relation LEFT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LEFT
    |
    /**
     * Barrier will be positioned to the far right of all referenced components.
     *
     * @relation RIGHT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RIGHT
    |
    /**
     * Barrier will be positioned to the top of all referenced components.
     *
     * @relation TOP
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    |
    /**
     * Barrier will be positioned to the bottom of all referenced components.
     *
     * @relation BOTTOM
     */
    @!APILevel[
        21,
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

/**
 * The types of expanded safe areas.
 *
 * @relation enum SafeAreaType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SafeAreaType {
    /**
     * Default non-safe area of the system, including the status bar and navigation bar.
     *
     * @relation SYSTEM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SYSTEM
    |
    /**
     * Non-safe area of the device like Notch or punch hole.
     *
     * @relation CUTOUT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CUTOUT
    |
    /**
     * Soft keyboard area.
     *
     * @relation KEYBOARD
     */
    @!APILevel[
        21,
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

/**
 * Enumerates the safe area edges.
 *
 * @relation enum SafeAreaEdge
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SafeAreaEdge {
    /**
     * Top edge.
     *
     * @relation TOP
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    |
    /**
     * Bottom edge of the safe area.
     *
     * @relation BOTTOM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BOTTOM
    |
    /**
     * Start edge.
     *
     * @relation START
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    |
    /**
     * End edge.
     *
     * @relation END
     */
    @!APILevel[
        21,
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

/**
 * Common enum of color strategy
 *
 * @relation enum ColoringStrategy
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ColoringStrategy {
    /**
     * Use the inverse color strategy. Gets the inverse of the background color. Only applies to foregroundColor.
     *
     * @relation INVERT = 'invert'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    INVERT
    | ...

    @!APILevel[
        21,
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

/**
 * Nested scroll nested mode
 *
 * @relation enum NestedScrollMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NestedScrollMode {
    /**
     * Only Self response scrolling.
     *
     * @relation SELF_ONLY
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SELF_ONLY
    |
    /**
     * Self priority response scrolling.
     *
     * @relation SELF_FIRST
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SELF_FIRST
    |
    /**
     * Parent scrollable component priority response scrolling.
     *
     * @relation PARENT_FIRST
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PARENT_FIRST
    |
    /**
     * Both self and parent scrollable component response scrolling.
     *
     * @relation PARALLEL
     */
    @!APILevel[
        21,
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

/**
 * enum Blur style
 *
 * @relation enum ForegroundBlurStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ForegroundBlurStyle {
    /**
     * No blur.
     *
     * @relation NONE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Thin material.
     *
     * @relation Thin
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thin
    |
    /**
     * Regular material.
     *
     * @relation Regular
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    |
    /**
     * Thick material.
     *
     * @relation Thick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thick
    |
    /**
     * Material that creates the minimum depth of field effect.
     *
     * @relation BACKGROUND_THIN
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundThin
    |
    /**
     * Material that creates a medium shallow depth of field effect.
     *
     * @relation BACKGROUND_REGULAR
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundRegular
    |
    /**
     * Material that creates a high shallow depth of field effect.
     *
     * @relation BACKGROUND_THICK
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundThick
    |
    /**
     * Material that creates the maximum depth of field effect.
     *
     * @relation BACKGROUND_ULTRA_THICK
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundUltraThick
    |
    /**
     * Component ultra-thin material.
     *
     * @relation COMPONENT_ULTRA_THIN = 8
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentUltraThin
    |
    /**
     * Defines the thin component material.
     *
     * @relation COMPONENT_THIN = 9
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentThin
    |
    /**
     * Defines the regular component material.
     *
     * @relation COMPONENT_REGULAR = 10
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentRegular
    |
    /**
     * Defines the thick component material.
     *
     * @relation COMPONENT_THICK = 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentThick
    |
    /**
     * Defines the ultra thick component material.
     *
     * @relation COMPONENT_ULTRA_THICK = 12
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentUltraThick
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case Thin => 1
            case Regular => 2
            case Thick => 3
            case BackgroundThin => 4
            case BackgroundRegular => 5
            case BackgroundThick => 6
            case BackgroundUltraThick => 7
            case ComponentUltraThin => 8
            case ComponentThin => 9
            case ComponentRegular => 10
            case ComponentThick => 11
            case ComponentUltraThick => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * enum color mode
 *
 * @relation enum ThemeColorMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ThemeColorMode {
    /**
     * Defines the mode which is follow up with system.
     *
     * @relation SYSTEM
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SYSTEM
    |
    /**
     * Defines the light mode.
     *
     * @relation LIGHT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LIGHT
    |
    /**
     * Defines the dark mode.
     *
     * @relation DARK
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DARK
    | ...

    @!APILevel[
        21,
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

/**
 * Defines adaptive color
 *
 * @relation enum AdaptiveColor
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AdaptiveColor {
    /**
     * Adaptive color mode is not used.
     * The default color is used as the mask color. Using a mode other than **DEFAULT** can be more time-consuming.
     *
     * @relation DEFAULT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    |
    /**
     * Adaptive color mode is used. The average color value of the color picking area is used as the mask color.
     *
     * @relation AVERAGE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AVERAGE
    | ...

    @!APILevel[
        21,
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

/**
 * Enum for Control Size.
 *
 * @relation enum ControlSize
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ControlSize {
    /**
     * The component size is small.
     *
     * @relation SMALL = 'small'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Small
    |
    /**
     * The component size is normal.
     *
     * @relation NORMAL = 'normal'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Small => 0
            case Normal => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Decide whether the width of select menu fit the trigger or content
 *
 * @relation enum OptionWidthMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum OptionWidthMode {
    /**
     * The menu width fit the content.
     *
     * @relation FIT_CONTENT = 'fit_content'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FIT_CONTENT
    |
    /**
     * The menu width fit the trigger.
     *
     * @relation FIT_TRIGGER = 'fit_trigger'
     */
    @!APILevel[
        21,
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

/**
 * The enum for arrow position in the select
 *
 * @relation enum ArrowPosition
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ArrowPosition {
    /**
     * The value of arrow position end
     *
     * @relation END = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    |
    /**
     * The value of arrow position start
     *
     * @relation START = 1
     */
    @!APILevel[
        21,
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

/**
 * The type of alignment between select and menu.
 *
 * @relation enum MenuAlignType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MenuAlignType {
    /**
     * The type of alignment between select and menu.
     *
     * @relation START
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    |
    /**
     * The value of menu align type center.
     *
     * @relation CENTER
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    |
    /**
     * The value of menu align type end.
     *
     * @relation END
     */
    @!APILevel[
        21,
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

/**
 * Enum type supplied to {@link darkMode} for setting the web dark mode.
 *
 * @relation enum WebDarkMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WebDarkMode {
    /**
     * Disable the web dark mode.
     *
     * @relation Off = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Off
    |
    /**
     * Enable the web dark mode.
     *
     * @relation On = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    On
    |
    /**
     * Make web dark mode follow the system.
     *
     * @relation Auto = 2
     */
    @!APILevel[
        21,
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

/**
 * Defines the event tool type.
 *
 * @relation enum SourceTool
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SourceTool {
    /**
     * Unknown type.
     *
     * @relation Unknown
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * The finger type.
     *
     * @relation Finger
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Finger
    |
    /**
     * The pen type.
     *
     * @relation Pen
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Pen
    |
    /**
     * The mouse type.
     *
     * @relation MOUSE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mouse
    |
    /**
     * The touchpad type.
     *
     * @relation TOUCHPAD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Touchpad
    |
    /**
     * The joystick type.
     *
     * @relation JOYSTICK
     */
    @!APILevel[
        21,
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
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Repetition {
    /**
     * The repeat method of image repetition.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    repeat
    |
    /**
     * The repeat-x method of image repetition.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    repeat_x
    |
    /**
     * The repeat-y method of image repetition.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    repeat_y
    |
    /**
     * The no-repeat method of image repetition.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    no_repeat
    |
    /**
     * The clamp method of image repetition.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    clamp
    |
    /**
     * The mirror method of image repetition.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    mirror
    | ...

    @!APILevel[
        21,
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

/**
 * The possible source of scroll event
 *
 * @relation enum ScrollSource
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollSource {
    /**
     * Drag events.
     *
     * @relation DRAG = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG
    |
    /**
     * Fling after the drag has ended with velocity.
     *
     * @relation enum FLING
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FLING
    |
    /**
     * Over scroll with EdgeEffect.Spring.
     *
     * @relation EDGE_EFFECT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EDGE_EFFECT
    |
    /**
     * Other user input except drag, such as mouse wheel, key event.
     *
     * @relation OTHER_USER_INPUT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OTHER_USER_INPUT
    |
    /**
     * Drag events of scroll bar.
     *
     * @relation SCROLL_BAR
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_BAR
    |
    /**
     * Fling after the drag on scroll bar has ended with velocity.
     *
     * @relation SCROLL_BAR_FLING
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLL_BAR_FLING
    |
    /**
     * Member methods of Scroller without animation.
     *
     * @relation SCROLLER
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCROLLER
    |
    /**
     * Member methods of Scroller with animation.
     *
     * @relation SCROLLER_ANIMATION
     */
    @!APILevel[
        21,
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

/**
 * Declare the type of input content
 *
 * @relation enum ContentType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentType {
    /**
     * User name content type.
     * Password Vault, when enabled, can automatically save and fill in usernames.
     *
     * @relation USER_NAME = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    USER_NAME
    |
    /**
     * Password content type.
     * Password Vault, when enabled, can automatically save and fill in passwords.
     *
     * @relation PASSWORD = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PASSWORD
    |
    /**
     * New password content type.
     * Password Vault, when enabled, can automatically generate a new password.
     *
     * @relation NEW_PASSWORD = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NEW_PASSWORD
    |
    /**
     * Full street address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in full street addresses.
     *
     * @relation FULL_STREET_ADDRESS = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FULL_STREET_ADDRESS
    |
    /**
     * House number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in house numbers.
     *
     * @relation HOUSE_NUMBER = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HOUSE_NUMBER
    |
    /**
     * District address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in districts and counties.
     *
     * @relation DISTRICT_ADDRESS = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DISTRICT_ADDRESS
    |
    /**
     * City address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in cities.
     *
     * @relation CITY_ADDRESS = 6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CITY_ADDRESS
    |
    /**
     * Province address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in provinces.
     *
     * @relation PROVINCE_ADDRESS = 7
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PROVINCE_ADDRESS
    |
    /**
     * Country address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in countries.
     *
     * @relation COUNTRY_ADDRESS = 8
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COUNTRY_ADDRESS
    |
    /**
     * Person full name content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in full names.
     *
     * @relation PERSON_FULL_NAME = 9
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PERSON_FULL_NAME
    |
    /**
     * Person last name content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in last names.
     *
     * @relation PERSON_LAST_NAME = 10
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PERSON_LAST_NAME
    |
    /**
     * Person first name content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in first names.
     *
     * @relation PERSON_FIRST_NAME = 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PERSON_FIRST_NAME
    |
    /**
     * Phone number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in phone numbers.
     *
     * @relation PHONE_NUMBER = 12
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_NUMBER
    |
    /**
     * Phone country code content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in country codes.
     *
     * @relation PHONE_COUNTRY_CODE = 13
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_COUNTRY_CODE
    |
    /**
     * Full phone number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in phone numbers with country codes.
     *
     * @relation FULL_PHONE_NUMBER = 14
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FULL_PHONE_NUMBER
    |
    /**
     * Email address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in email addresses.
     *
     * @relation EMAIL_ADDRESS = 15
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMAIL_ADDRESS
    |
    /**
     * Bank card number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in bank card numbers.
     *
     * @relation BANK_CARD_NUMBER = 16
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BANK_CARD_NUMBER
    |
    /**
     * ID card number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in ID card numbers.
     *
     * @relation ID_CARD_NUMBER = 17
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ID_CARD_NUMBER
    |
    /**
     * Nickname content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in nicknames.
     *
     * @relation NICKNAME = 23
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NICKNAME
    |
    /**
     * Detail info without street content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in address information without street addresses.
     *
     * @relation DETAIL_INFO_WITHOUT_STREET = 24
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DETAIL_INFO_WITHOUT_STREET
    |
    /**
     * Format address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in standard addresses.
     *
     * @relationFORMAT_ADDRESS = 25
     */
    @!APILevel[
        21,
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

/**
 * Declare the type of input content
 *
 * @relation enum GestureType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureTypes {
    /**
     * TapGesture.
     *
     * @relation TAP_GESTURE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TAP_GESTURE
    |
    /**
     * LongPressGesture.
     *
     * @relation LONG_PRESS_GESTURE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LONG_PRESS_GESTURE
    |
    /**
     * PanGesture.
     *
     * @relation PAN_GESTURE = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PAN_GESTURE
    |
    /**
     * PinchGesture.
     *
     * @relation PINCH_GESTURE = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PINCH_GESTURE
    |
    /**
     * SwipeGesture.
     *
     * @relation SWIPE_GESTURE = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SWIPE_GESTURE
    |
    /**
     * RotationGesture.
     *
     * @relation ROTATION_GESTURE = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ROTATION_GESTURE
    |
    /**
     * Drag.
     *
     * @relation DRAG = 6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DRAG
    |
    /**
     * Click.
     *
     * @relation CLICK = 7
     */
    @!APILevel[
        21,
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
 * Define the menu pop-up policy
 *
 * @relation enum MenuPolicy
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MenuPolicy {
    /**
     * Default value. The default logic of whether to pop up a menu depends on the scene.
     *
     * @relation DEFAULT = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * The menu is always hidden.
     *
     * @relation HIDE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hide
    |
    /**
     * The menu is always displayed.
     *
     * @relation SHOW = 2
     */
    @!APILevel[
        21,
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
 * Type of text decoration line style.
 *
 * @relation enum TextDecorationStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextDecorationStyle {
    /**
     * Solid line.
     *
     * @relation SOLID = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SOLID
    |
    /**
     * Double lines.
     *
     * @relation DOUBLE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DOUBLE
    |
    /**
     * Dotted lines.
     *
     * @relation DOTTED = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DOTTED
    |
    /**
     * Dashed line.
     *
     * @relation DASHED = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DASHED
    |
    /**
     * Wavy line.
     *
     * @relation WAVY = 4
     */
    @!APILevel[
        21,
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

/**
 * Enum of line break strategy
 *
 * @relation enum LineBreakStrategy
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineBreakStrategy {
    /**
     * By default. Display as many characters as possible on each line until no more characters
     * can be displayed on that line, and do not automatically add hyphens under this strategy
     *
     * @relation GREEDY = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    GREEDY
    |
    /**
     * High quality folding. Optimize the layout of the entire text's line breaks and automatically
     * add hyphens if necessary.
     *
     * @relation HIGH_QUALITY  = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HIGH_QUALITY
    |
    /**
     * Balanced folding. We will try our best to ensure that the width of each line in a paragraph
     * is the same, and if necessary, we will add conjunction
     *
     * @relation BALANCED  = 2
     */
    @!APILevel[
        21,
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
 * @relation enum TextContentStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextContentStyle {
    /**
     * Text content default style.
     *
     * @relation DEFAULT
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    |
    /**
     * Text content inline style.
     *
     * @relation INLINE
     */
    @!APILevel[
        21,
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
 * common enum of the checkbox shape
 *
 * @relation enum CheckBoxShape
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CheckBoxShape {
    /**
    * Circle.
    *
    * @relation CIRCLE = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CIRCLE
    |
    /**
    * Rounded Square.
    *
    * @relation ROUNDED_SQUARE = 1
    */
    @!APILevel[
        21,
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
 * Enum of text height adaptation
 *
 * @relation enum CheckBoxShape
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextHeightAdaptivePolicy {
    /**
    * Priority is given to using the maxLines attribute to adapt the text height.
    * If the layout size using the maxLines attribute exceeds the layout constraint, try reducing the font size to
    * display more text.
    *
    * @relation MAX_LINES_FIRST
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MAX_LINES_FIRST
    |
    /**
    * Priority is given to using the minFontSize attribute to adapt the text height.
    * If the text can be layout in a single line using the minFontSize property, try increasing the font size and using
    * the maximum possible font size.
    *
    * @relation MIN_FONT_SIZE_FIRST
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MIN_FONT_SIZE_FIRST
    |
    /**
    * Priority is given to using the layout constraint to adapt the text height.
    * If the layout size exceeds the layout constraint, try reducing the font size. If the layout size still exceeds
    * the layout constraint after reducing the font size to minFontSize, remove the lines that exceed the layout
    * constraint.
    *
    * @relation LAYOUT_CONSTRAINT_FIRST
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LAYOUT_CONSTRAINT_FIRST
    | ...

    @!APILevel[
        21,
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
 * ArrowPointPosition enumeration description
 *
 * @relation enum ArrowPointPosition
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ArrowPointPosition {
    /**
     * Target start position
     *
     * @relation START = 'Start'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    |
    /**
     * Target center position
     *
     * @relation CENTER = 'Center'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CENTER
    |
    /**
     * Target end position
     *
     * @relation END = 'End'
     */
    @!APILevel[
        21,
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

/**
 * Title height.
 *
 * @relation enum TitleHeight
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TitleHeight {
    /**
     * Title height when only main title is available.
     *
     * @relation MainOnly
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MainOnly
    |
    /**
     * Title height when main title and subtitle are both available.
     *
     * @relation MainWithSub
     */
    @!APILevel[
        21,
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
 * The Button Style of dialog,
 *
 * @relation enum DialogButtonStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogButtonStyle {
    /**
     * Default Style.
     *
     * @relation DEFAULT = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Highlight Style.
     *
     * @relation HIGHLIGHT = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Highlight
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Highlight => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the fold status.
 *
 * @relation enum FoldStatus
 */
@Derive[Equatable]
@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FoldStatus {
    /**
     * Fold Status Unknown.
     *
     * @relation FOLD_STATUS_UNKNOWN = 0
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_UNKNOWN
    |
    /**
     * Fold Status Expanded.
     *
     * @relation FOLD_STATUS_EXPANDED = 1
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_EXPANDED
    |
    /**
     * Fold Status Folded.
     *
     * @relation FOLD_STATUS_FOLDED = 2
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FOLD_STATUS_FOLDED
    |
    /**
     * Fold Status Half Folded.
     *
     * @relation FOLD_STATUS_HALF_FOLDED = 3
     */
    @!APILevel[
        21,
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
 * Enumerates the length metrics unit.
 *
 * @relation enum LengthMetricsUnit
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LengthMetricsUnit {
    /**
     * The default length metrics unit, in vp.
     *
     * @relation DEFAULT = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    |
    /**
     * The pixel length metrics unit.
     *
     * @relation PX = 1
     */
    @!APILevel[
        21,
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
 * Indicates the attribute of the current text direction.
 *
 * @relation type CanvasDirection = "inherit" | "ltr" | "rtl"
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CanvasDirection {
    /**
     * (Default) Inherit current Canvas component settings
     *
     * @relation type CanvasDirection = "inherit" | "ltr" | "rtl"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    inherit
    |
    /**
     * The text direction is left to right.
     *
     * @relation type CanvasDirection = "inherit" | "ltr" | "rtl"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ltr
    |
    /**
     * The text direction is from right to left.
     *
     * @relation type CanvasDirection = "inherit" | "ltr" | "rtl"
     */
    @!APILevel[
        21,
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
 * Filling style algorithm, which determines whether a point is within or outside the path. The following
 * two configurations are supported:
 *
 * @relation type CanvasFillRule = "evenodd" | "nonzero"
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CanvasFillRule {
    /**
     * odd and even round rule
     *
     * @relation type CanvasFillRule = "evenodd" | "nonzero"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    evenodd
    |
    /**
     * (Default) Non-zero Wrap Rules
     *
     * @relation type CanvasFillRule = "evenodd" | "nonzero"
     */
    @!APILevel[
        21,
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
 * Image format.
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageType {
    /**
     * Image format png.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    png
    |
    /**
     * Image format jpeg.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    jpeg
    |
    /**
     * Image format webp.
     */
    @!APILevel[
        21,
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

/**
 * Describe the types for expanding the safe area in layout.
 *
 * @relation enum LayoutSafeAreaType
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutSafeAreaType {
    /**
     * Default non-safe area of the system, including the status bar and navigation bar.
     *
     * @relation SYSTEM = 0
     */
    @!APILevel[
        21,
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

/**
 * Define the edges for expanding the safe area in layout.
 *
 * @relation enum LayoutSafeAreaEdge
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutSafeAreaEdge {
    /**
     * Top edge.
     *
     * @relation TOP = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TOP
    |
    /**
     * Bottom edge.
     *
     * @relation BOTTOM = 1
     */
    @!APILevel[
        21,
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

/**
 * Navigation title mode.
 *
 * @relation enum NavigationTitleMode
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavigationTitleMode {
    /**
     * When the content is more than one screen in a scrollable component, the
     * main title shrinks as the content scrolls down (the subtitle fades out
     * with its size remaining unchanged) and restores as the content scrolls
     * up to the top.
     * <br>**NOTE**
     * <br>The effect where the main title's size changes in response to content
     * scrolling is effective only when **title** is set to **ResourceStr** or
     * **NavigationCommonTitle**. If **title** is set to any other value type, the
     * main title changes in mere location when pulled down.
     * <br>For this effect to work when the content is less than one screen in a
     * scrollable component, set the **options** parameter of the scrollable
     * component's edgeEffect attribute to **true**. In the non-scrolling state, the
     * height of the title bar is the same as in **Full** mode; in the scrolling state,
     * the minimum height of the title bar is the same as in **Mini** mode.
     *
     * @relation Free = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Free
    |
    /**
     * The title is fixed at full mode.<br>Default value: If there is only a main
     * title, the title bar height is 112 vp; if there is both a main title and a
     * subtitle, the title bar height is 138 vp.
     *
     * @relation Full
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Full
    |
    /**
     * The title is fixed at mini mode. Default value: In versions earlier than API version 12,
     * If there is only a main title, the title bar height is 56 vp; if there are both a main title and a subtitle,
     * The title bar height is 82 vp. Since API version 12, the title bar height is 56 vp.
     *
     * @relation Mini
     */
    @!APILevel[
        21,
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
        21,
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

/**
 * Declare BarStyle enum.
 *
 * @relation enum BarStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarStyle {
    /**
     * In this mode, the title bar or toolbar is laid out above the content area.
     *
     * @relation STANDARD = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard
    |
    /**
     * In this mode, the title bar or toolbar is overlaid on top of the content area.
     *
     * @relation STACK = 1
     */
    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FinishCallbackType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Removed
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Logically
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Removed => 0
            case Logically => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * enum Blur style
 *
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 * @relation declare enum BlurStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BlurStyle {
    /**
     * Thin material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Thin
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thin
    |
    /**
     * Regular material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Regular
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    |
    /**
     * Thick material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation Thick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thick
    |
    /**
     * BackgroundThin material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation BackgroundThin
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundThin
    |
    /**
     * BackgroundRegular material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation BackgroundRegular
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundRegular
    |
    /**
     * BackgroundThick material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation BackgroundThick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundThick
    |
    /**
     * BackgroundUltraThick material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation BackgroundUltraThick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundUltraThick
    |
    /**
     * None material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation None
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * ComponentUltraThin material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation ComponentUltraThin
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentUltraThin
    |
    /**
     * ComponentThin material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation ComponentThin
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentThin
    |
    /**
     * ComponentRegular material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation ComponentRegular
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentRegular
    |
    /**
     * ComponentThick material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation ComponentThick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentThick
    |
    /**
     * ComponentUltraThick material.
     *
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @relation ComponentUltraThick
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentUltraThick
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Thin => 1
            case Regular => 2
            case Thick => 3
            case BackgroundThin => 4
            case BackgroundRegular => 5
            case BackgroundThick => 6
            case BackgroundUltraThick => 7
            case None => 0
            case ComponentUltraThin => 8
            case ComponentThin => 9
            case ComponentRegular => 10
            case ComponentThick => 11
            case ComponentUltraThick => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Dismiss reason type.
 *
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 * @relation declare enum DismissReason
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DismissReason {
    /**
    * Touching the Back button, swiping left or right on the screen, or pressing the Esc key.
    *
    * @syscap SystemCapability.ArkUI.ArkUI.Full
    * @relation PRESS_BACK = 0
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PressBack
    |
    /**
    * Touching the mask.
    *
    * @syscap SystemCapability.ArkUI.ArkUI.Full
    * @relation TOUCH_OUTSIDE = 1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TouchOutside
    |
    /**
    * Touching the Close button.
    *
    * @syscap SystemCapability.ArkUI.ArkUI.Full
    * @relation CLOSE_BUTTON = 2
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CloseButton
    |
    /**
    * Slide down
    * <p><strong>NOTE</strong>:
    * <br>This API is effective only in sheet transition.
    * </p>
    *
    * @syscap SystemCapability.ArkUI.ArkUI.Full
    * @relation SLIDE_DOWN = 3
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SlideDown
    | ...

    func toValue(): Int32 {
        match (this) {
            case PressBack => 0
            case TouchOutside => 1
            case CloseButton => 2
            case SlideDown => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func toEnum(value: Int32): DismissReason {
        if (value == 0) {
            return DismissReason.PressBack
        } else if (value == 1) {
            return DismissReason.TouchOutside
        } else if (value == 2) {
            return DismissReason.CloseButton
        } else if (value == 3) {
            return DismissReason.SlideDown
        } else {
            return DismissReason.PressBack
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextInputStyle {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    | @!APILevel[
        21,
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
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAreaType {
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORMAL
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NUMBER
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_NUMBER
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMAIL
    | @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NUMBER_DECIMAL
    | @!APILevel[
        21,
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
