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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.common

import ohos.labels.APILevel
import std.deriving.Derive
import ohos.business_exception.BusinessException

/**
 * indexer align property.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum IndexerAlign {
    /**
     * A dialog box is displayed on the right of the index bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * A dialog box is displayed on the left of the index bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Right => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare the type of input box
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum InputType {
    /**
     * Basic input mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Pure digital input mode.
     *
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Password
    |
    /**
     * Phone number entry mode.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare the type of soft keyboard.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EnterKeyType {
    /**
     * Go.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Go |
    /**
     * Search.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Search |
    /**
     * Send.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Send |
    /**
     * Next.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Next |
    /**
     * Done.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Done |
    /**
     * Showed as 'previous' pattern.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Previous |
    /**
     * Showed as 'new line' pattern.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NewLine | ...

    protected func getValue(): Int32 {
        match (this) {
            case Go => 2
            case Search => 3
            case Send => 4
            case Next => 5
            case Done => 6
            case Previous => 7
            case NewLine => 8
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * FlexDirection enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexDirection {
    /**
     * The main axis is consistent with the row direction as the layout mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Row |
    /**
     * The main axis is consistent with the column direction as the layout mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Column |
    /**
     * The layout is in the opposite direction to the Row direction.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse |
    /**
     * Layout in the opposite direction to the column.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ColumnReverse |
    ...

    protected func getValue(): Int32 {
        match (this) {
            case Row => 0
            case Column => 1
            case RowReverse => 2
            case ColumnReverse => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * FlexDirection enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexWrap {
    /**
     * The Flex container has a single row/column layout of elements, and children are allowed to go beyond the container.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoWrap |
    /**
     * The elements of the Flex container are arranged in multiple rows or columns, and the sub-items are allowed to exceed the container.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Wrap |
    /**
     * The elements of the Flex container are arranged in reverse multiple rows/columns, and children are allowed to exceed the container.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WrapReverse |
    ...

    protected func getValue(): Int32 {
        match (this) {
            case NoWrap => 0
            case Wrap => 1
            case WrapReverse => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * FlexAlign enumeration description.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FlexAlign {
    /**
     * The element is aligned at the head of the principal axis,
     * the first element is aligned with the head of the row, and subsequent elements are aligned with the previous one.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start |
    /**
     * The elements are centered in the direction of the principal axis,
     * and the first element is the same distance from the beginning of the row as the last element is from the end of the row.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center |
    /**
     * The element is aligned at the tail of the principal axis,
     * the last element is aligned at the end of the row, and the other elements are aligned with the next.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End |
    /**
     * Elastic elements are evenly distributed in the direction of the Flex principal axis,
     * with the same distance between adjacent elements.
     * The first element aligns with the beginning of the line, and the last element aligns with the end of the line.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceBetween |
    /**
     * Elastic elements are evenly distributed in the direction of the Flex principal axis,
     *  with the same distance between adjacent elements. Half the distance between adjacent elements as the distance between
     * the first element and the distance between the last element and the end of the row.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceAround |
    /**
     * Elements in the Flex axis direction are evenly spaced.
     * The spacing between adjacent elements, the spacing between the first element and the beginning of the row,
     * and the spacing between the last element and the end of the row are the same.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpaceEvenly | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 1
            case Center => 2
            case End => 3
            case SpaceBetween => 4
            case SpaceAround => 5
            case SpaceEvenly => 6
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * ItemAlign enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ItemAlign {
    /**
     * Use the default configuration in the Flex container.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * The element is in the Flex container with the cross-axis direction head aligned.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The element is centered in the Flex container with the cross axis direction aligned.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The element is bottom aligned in the Flex container with the cross axis direction.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * Element In the Flex container, the cross-axis direction text baseline is aligned.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stretch
    |
    /**
     * Element In a Flex container, the fill is stretched across the axis and, when no dimension is set, to the container size.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare the type of status button
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToggleType {
    /**
     * Checkbox
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Checkbox |
    /**
     * Switch
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Switch |
    /**
     * Button
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Button |
    ...

    protected func getValue(): Int32 {
        match (this) {
            case Checkbox => 0
            case Switch => 1
            case Button => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Text style
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FontStyle {
    /**
     * Default style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Italic style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Italic
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Italic => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): FontStyle {
        match (value) {
            case 0 => Normal
            case 1 => Italic
            case _ => Normal
        }
    }

    protected static func parseFromString(value: String): FontStyle {
        match (value) {
            case "italic" => Normal
            case "normal" => Italic
            case _ => Normal
        }
    }
}

/**
 * Alignment enumeration description.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Alignment {
    /**
     * Top Start.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopStart
    |
    /**
     * The top is centered horizontally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Top tail end.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopEnd
    |
    /**
     * The starting end is centered longitudinally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Center horizontal and vertical.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The tail end is centered longitudinally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * Bottom starting end.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomStart
    |
    /**
     * The bottom is centered horizontally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Bottom end.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomEnd
    | ...

    protected func getValue(): Int32 {
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * HorizontalAlign enumeration description.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum HorizontalAlign {
    /**
     * Aligns the start end in the language direction.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Center alignment. The default alignment mode is used.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Aligns the ends in the language direction.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 1
            case Center => 2
            case End => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * VerticalAlign enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum VerticalAlign {
    /**
     * Top alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Center alignment. The default alignment mode is used.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Bottom alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Top => 1
            case Center => 2
            case Bottom => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The font weight of the text
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FontWeight {
    /**
     * Normal font. Equivalent to a digital value of 400.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Bold. Equivalent to a numeric value of 700.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bold
    |
    /**
     * Defines a value that is heavier than [Inherited Value].
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bolder
    |
    /**
     * Defines a lighter value than [Inherited Value]..
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lighter
    |
    /**
     * Defines a value that is more centered than [Inherited Value].
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    |
    /**
     * Defines a more general value than [Inherited Value].
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    |
    /**
     * Defines a FontWeight value W100.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W100
    |
    /**
     * Defines a FontWeight value W200.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W200
    |
    /**
     * Defines a FontWeight value W300.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W300
    |
    /**
     * Defines a FontWeight value W400.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W400
    |
    /**
     * Defines a FontWeight value W500.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W500
    |
    /**
     * Defines a FontWeight value W600.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W600
    |
    /**
     * Defines a FontWeight value W700.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W700
    |
    /**
     * Defines a FontWeight value W800.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W800
    |
    /**
     * Defines a FontWeight value W900.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    W900
    | ...

    protected func getValue(): String {
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected func getValueInt(): UInt32 {
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarPosition {
    /**
     * When the vertical attribute method is set to true, the tab is on the left of the container. When the vertical property method is set to false, the tab is at the top of the container.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start |
    /**
     * When the vertical attribute method is set to true, the tab is located on the right of the container. When the vertical property method is set to false, the tab is at the bottom of the container.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End |
    ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case End => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare the graphic format of the bar chart.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarMode {
    /**
     * The width of each tab is determined by equally dividing the number of tabs by the bar width
     * (or bar height in the vertical layout).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fixed
    |
    /**
     * The width of each tab is determined by the actual layout. The tabs are scrollable in the following case:
     * In horizontal layout, the total width exceeds the tab bar width; in vertical layout,
     * the total height exceeds the tab bar height.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Scrollable
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Fixed => 0
            case Scrollable => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Define the type of shadow
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowType {
    /**
     * Color.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Color |
    /**
     * Blur.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Blur |
    ...

    protected func getValue(): UInt32 {
        match (this) {
            case Color => 0
            case Blur => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Type of text modifier.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextDecorationType {
    /**
     * Do not use text decorative lines.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Underline the words.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Underline
    |
    /**
     * Text is in all uppercase.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overline
    |
    /**
     * A modifier line that passes through the text.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAlign {
    /**
     * The text is aligned in the same direction as the writing
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Center the text.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The text is aligned in the opposite direction of writing
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case Center => 1
            case End => 2
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextOverflow {
    /**
     * When the text overflows its dimensions, the text will not be cropped.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Clip
    |
    /**
     * If the text overflows its dimensions, the text that cannot be displayed shall be replaced by ellipsis.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ellipsis
    |
    /**
     * When the text overflows its dimensions, the text will not be cropped.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Clip => 0
            case Ellipsis => 1
            case None => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum of word break
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WordBreak {
    /**
     * By default, CJK text can be wrapped between any 2 characters, and non-CJK text can only be wrapped in spaces.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Non-CJK text be wrapped at any character
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BreakAll
    |
    /**
     * Non-CJK text can be wrapped at any character
     * and if a complete word can be preserved in space breaks, the word must be kept on the line.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BreakWord
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case BreakAll => 1
            case BreakWord => 2
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageRepeat {
    /**
     * Do not draw the picture again.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoRepeat
    |
    /**
     * Repeat the drawing only on the horizontal axis.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    X
    |
    /**
     * Repeat the drawing only on the vertical axis.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Y
    |
    /**
     * Draw the picture repeatedly on both axes.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * ImageSize enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSize {
    /**
     * Keep the aspect ratio to zoom out or zoom in so that the image is completely displayed within the display boundary.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Contain
    |
    /**
     * Keep the aspect ratio to zoom in or out the image so that both sides of the image are greater than or equal to the display boundary.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cover
    |
    /**
     * Keep the scale of the original image unchanged.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Contain => 0
            case Cover => 1
            case Auto => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * enum Shadow style
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ShadowStyle {
    /**
     * Defines the super small default shadow style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OuterDefaultXS
    |
    /**
     * Defines the small default shadow style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OuterDefaultSM
    |
    /**
     * Medium shadow.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OuterDefaultMD
    |
    /**
     * Large shadow.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OuterDefaultLG
    |
    /**
     * Floating medium shadow.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OuterFloatingSM
    |
    /**
     * Floating medium shadow.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OuterFloatingMD
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case OuterDefaultXS => 0
            case OuterDefaultSM => 1
            case OuterDefaultMD => 2
            case OuterDefaultLG => 3
            case OuterFloatingSM => 4
            case OuterFloatingMD => 5
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Letter type in text
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextCase {
    /**
     * The default is normal.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * The text is all lowercase.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LowerCase
    |
    /**
     * The text is all uppercase.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    UpperCase
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case LowerCase => 1
            case UpperCase => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Border Style
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BorderStyle {
    /**
     * Shows as a solid line.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Solid
    |
    /**
     * Shows as a series of short square dashed lines.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dashed
    |
    /**
     * Displays as a series of dots with a radius of half the borderWidth.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dotted
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Solid => 0
            case Dashed => 1
            case Dotted => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Image display mode.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageFit {
    /**
     * Zoom in or out without maintaining the aspect ratio so that the image fills the display boundary.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fill
    |
    /**
     * Keep the aspect ratio to zoom out or zoom in so that the image is completely displayed within the display boundary.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Contain
    |
    /**
     * Keep the aspect ratio to zoom out or zoom in so that both sides of the image are greater than or equal to the display boundary.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cover
    |
    /**
     * Adaptive display
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * Keep the original size and display it in the center.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Keep the aspect ratio displayed, and the image zooms out or remains unchanged.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Direction {
    /**
     * Elements are laid out from left to right.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ltr
    |
    /**
     * Elements are laid out from right to left.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rtl
    |
    /**
     * Use the default layout direction.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Ltr => 0
            case Rtl => 1
            case Auto => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enumerates the scrolling directions.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollDirection {
    /**
     * Only vertical scrolling is supported.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Only horizontal scrolling is supported.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Vertical => 0
            case Horizontal => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Content scroll direction.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollBarDirection {
    /**
     * Vertical scrolling is supported.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Horizontal scrolling is supported.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Vertical => 0
            case Horizontal => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * State triggered by the event.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderChangeMode {
    /**
     * The user touches or clicks the thumb.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Begin
    |
    /**
     * The user is dragging the slider.
     *
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * The user moves the thumb by touching or clicking the track.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SliderStyle {
    /**
     * The thumb is on the track.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OutSet
    |
    /**
     * The thumb is in the track.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    InSet
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case OutSet => 0
            case InSet => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The interpolation effect of the image.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageInterpolation {
    /**
     * Do not use interpolated image data.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * High usage of interpolated image data may affect the speed of image rendering.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    High
    |
    /**
     * Interpolated image data is used moderately.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    |
    /**
     * Low usage of interpolated image data.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Used to set the status of the scroll bar.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarState {
    /**
     * Not displayed.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Off
    |
    /**
     * On-demand display (displayed when you touch it and disappears after 2 seconds).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    |
    /**
     * Resident display.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    On
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Off => 0
            case Auto => 1
            case On => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Controls the display or hide of the current component
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Visibility {
    /**
     * Resident display.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Visible
    |
    /**
     * Hide, but participate in layout for placeholder.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hidden
    |
    /**
     * Hides but does not participate in layout and does not take place.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Visible => 0
            case Hidden => 1
            case None => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * LineCapStyle enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineCapStyle {
    /**
     * The two ends of the dividing line are parallel lines.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Butt
    |
    /**
     * The two ends of the dividing line are semicircles.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Round
    |
    /**
     * Extends half a circle at the end of the path with a width equal to half the line width and a height equal to the line width.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Square
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Butt => 0
            case Round => 1
            case Square => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Type of progress bar
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ProgressType {
    /**
     * Linear progress bar style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    |
    /**
     * Ring progress bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ring
    |
    /**
     * Eclipse progress bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Eclipse
    |
    /**
     * ScaleRing progress bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScaleRing
    |
    /**
     * Capsule progress bar.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Image Rendering Mode.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageRenderMode {
    /**
     * Render according to the original image, including colors.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Original
    |
    /**
     * Render the image as a template image, ignoring the color information of the image.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Template
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Original => 0
            case Template => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Route jump.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavigationType {
    /**
     * Jump to the next page.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    |
    /**
     * Replace page.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Replace
    |
    /**
     * Return to the previous page.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Back
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Push => 1
            case Replace => 2
            case Back => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare the size of the swiper on the spindle.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwiperDisplayMode {
    /**
     * Carousel map extension.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stretch
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Stretch => 0
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sets the animation playback mode. By default, the animation starts to play again after the playback is complete.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Curve {
    /**
     * Indicates that the speed of the animation is the same from start to finish.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Linear
    |
    /**
     * Indicates that the animation starts at a low speed, then accelerates, and then slows down before it ends, CubicBezier(0.25, 0.1, 0.25, 1.0).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ease
    |
    /**
     * Indicates that the animation starts at a low speed, CubicBezier(0.42, 0.0, 1.0, 1.0).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseIn
    |
    /**
     * Indicates that the animation ends at a low speed, CubicBezier(0.0, 0.0, 0.78, 1.0).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseOut
    |
    /**
     * Indicates that the animation starts and ends at a slow speed, CubicBezier(0.42, 0.0, 0.78, 1.0).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EaseInOut
    |
    /**
     * Slow-in, fast-out
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FastOutSlowIn
    |
    /**
     * Linear Out Slow In
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LinearOutSlowIn
    |
    /**
     * Fast Out Linear In.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FastOutLinearIn
    |
    /**
     * Extreme Deceleration.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ExtremeDeceleration
    |
    /**
     * Sharp.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Sharp
    |
    /**
     * Rhythm.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rhythm
    |
    /**
     * Smooth.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Smooth
    |
    /**
     * Damping curve, CubicBezier(0.2, 0.0, 0.2, 1.0).
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sliding effect
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EdgeEffect {
    /**
     * Elastic physical action, sliding to the edge can continue to slide for a distance based on the initial speed or touch event, and spring back when released.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Spring
    |
    /**
     * Fade.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fade
    |
    /**
     * Sliding to the edge has no effect.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Spring => 0
            case Fade => 1
            case None => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Edge.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Edge {
    /**
     * The top is centered horizontally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Align the head of the cross axis direction.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The bottom is centered horizontally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Align the head of the cross axis direction.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Placement {
    /**
     * Left placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Right placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Top placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Bottom placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * TopLeft placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopLeft
    |
    /**
     * TopRight placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopRight
    |
    /**
     * BottomLeft placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomLeft
    |
    /**
     * BottomRight placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomRight
    |
    /**
     * LeftTop placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftTop
    |
    /**
     * LeftBottom placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftBottom
    |
    /**
     * RightTop placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    |
    /**
     * RightBottom placement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightBottom
    |
    /**
     * None placement
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineJoinStyle {
    /**
     * Connect path segments using bevels.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Miter
    |
    /**
     * Connect path segments using sharp corners.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Round
    |
    /**
     * Connect path segments using fillets.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bevel
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Miter => 0
            case Round => 1
            case Bevel => 2
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
protected enum CanvasTextAlign {
    /**
     * (Default) The text is left-aligned.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * The text is right-aligned.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * The text is centered.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Where the text snap line begins (Left alignment refers to the local from left to right,
     * and right alignment refers to the local from right to left)
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Where text aligns lines end (Left alignment refers to the local from left to right,
     * and right alignment refers to the local from right to left)
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Right => 1
            case Center => 2
            case Start => 4
            case End => 5
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * the position of Corresponding enum in Native:
 * Path: /frameworks/core/components/common/properties/text_style.h
 * Identifier: TextBaseline
 */
/**
 * Text baseline.
 *
 */
@Derive[Equatable]
protected enum CanvasTextBaseline {
    /**
     * (Default) The text baseline is the standard letter baseline.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alphabetic
    |
    /**
     * The text baseline is the ideographic baseline; If the character itself exceeds the alphabetic
     *    baseline, the ideographic baseline is at the bottom of the character itself.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ideographic
    |
    /**
     * The text baseline is at the top of the text block.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * The text baseline is at the bottom of the text block. The difference between the ideographic baseline
     *    and the ideographic baseline is that the ideographic baseline does not need to consider downlink letters.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * The text baseline is in the middle of the text block.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Middle
    |
    /**
     * The text baseline is a hanging baseline.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
protected enum GlobalCompositeOperation {
    /**
     * (Default) Draws a new drawing on top of an existing canvas context.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceOver
    |
    /**
     * The new drawing is drawn only where it overlaps the content of the existing canvas.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceAtop
    |
    /**
     * The new drawing is drawn only where the new drawing overlaps the target canvas.
     * Everything else is transparent.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceIn
    |
    /**
     * Draws a new drawing where it does not overlap with the existing canvas content.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SourceOut
    |
    /**
     * Draws a new graphic behind the existing canvas content.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationOver
    |
    /**
     * The existing canvas retains only the part that overlaps with the new drawing,
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationAtop
    |
    /**
     * Existing canvas content remains where the new drawing overlaps the existing canvas content.
     * Everything else is transparent.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationIn
    |
    /**
     * Existing content remains where the new drawing does not overlap.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DestinationOut
    |
    /**
     * The color of two overlapping shapes is determined by adding the color values.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lighter
    |
    /**
     * Only new graphics are displayed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Copy
    |
    /**
     * In the image, those overlaps and other places outside of the normal drawing are transparent.
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sets the image smoothness attribute.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSmoothingQuality {
    /**
     * (default)low
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Low
    |
    /**
     * Medium
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Medium
    |
    /**
     * height
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    High
    | ...

    protected func getValue(): String {
        match (this) {
            case Low => "low"
            case Medium => "medium"
            case High => "high"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Creating an Object
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureMask {
    /**
     * High-priority response to the current gesture.When the current gesture fails to be recognized, other gesture responses are triggered.For gestures with the same priority, responses are performed based on the recognition sequence.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Ignore internal gestures and recognize the current gesture first.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IgnoreInternal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case IgnoreInternal => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Creating an Object
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwipeDirection {
    /**
     * Sliding horizontally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    |
    /**
     * Sliding Vertical
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Sliding in all directions.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case Horizontal => 1
            case Vertical => 2
            case All => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Creating an Object
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PanDirection {
    /**
     * Default.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Sliding left.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Sliding right.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Sliding horizontally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    |
    /**
     * Sliding up.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    |
    /**
     * Sliding Down.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    |
    /**
     * Sliding Vertical
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Sliding in all directions.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    |
    /**
     * Supports logical AND and logical OR operations.
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    /**
     * Perform a logical OR(|) operation on PanDirection.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func |(right: PanDirection): PanDirection {
        Computed(this.getValue() | right.getValue())
    }

    /**
     * Perform a logical AND(&) operation on PanDirection.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public operator func &(right: PanDirection): PanDirection {
        Computed(this.getValue() & right.getValue())
    }
}

/**
 * Creating an Object
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GestureMode {
    /**
     * Sequential gesture recognition is performed in sequence according to the gesture registration sequence.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Sequence
    |
    /**
     * Simultaneous recognition. Registration gestures participate in recognition. Everything can be triggered.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Parallel
    |
    /**
     * Mutually exclusive recognition. Only one gesture is successfully recognized.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Exclusive
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Sequence => 0
            case Parallel => 1
            case Exclusive => 2
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Axis {
    /**
     * Longitudinal arrangement
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Vertical
    |
    /**
     * Horizontal arrangement.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Horizontal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Vertical => 0
            case Horizontal => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * ResponseType for contextMenu
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ResponseType {
    /**
     * Right click.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightClick
    |
    /**
     * Long press.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LongPress
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case RightClick => 0
            case LongPress => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Indicates the share option.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CopyOptions {
    /**
     * Not allow share.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Share in app.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    InApp
    |
    /**
     * Share in local device.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LocalDevice
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case InApp => 1
            case LocalDevice => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Function Called by Touch
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TouchType {
    /**
     * Triggered when the finger is pressed.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    |
    /**
     * Triggered when the finger is raised.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    |
    /**
     * Triggered when the finger presses on the screen.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Move
    |
    /**
     * Triggers when the touch event cancels.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cancel
    |
    /**
     * Unknown TouchType.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    | ...

    protected func getValue(): UInt8 {
        match (this) {
            case Down => 0
            case Up => 1
            case Move => 2
            case Cancel => 3
            case Unknown => 4
            case _ => throw BusinessException(100001, "Internal error.")
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sets the sidebar style of showing
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SideBarContainerType {
    /**
     * The sidebar invisible
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Embed
    |
    /**
     * The sidebar visible
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Overlay
    |
    /**
     * The sidebar AUTO
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Embed => 0
            case Overlay => 1
            case Auto => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sets the sidebar position of showing
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SideBarPosition {
    /**
     * The sidebar is on the Start of the container
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The sidebar is on the End of the container
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case End => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the event source type.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SourceType {
    /**
     * Unknown type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * The mouse type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mouse
    |
    /**
     * The touch screen type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TouchScreen
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Unknown => 0
            case Mouse => 1
            case TouchScreen => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): SourceType {
        match (value) {
            case 1 => Mouse
            case 2 => TouchScreen
            case _ => Unknown
        }
    }

}

/**
 * Function Called by Mouse
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MouseButton {
    /**
     * Mouse None Button.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Mouse Left Button.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Mouse Right Button.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Mouse Middle Button.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Middle
    |
    /**
     * Mouse Back Button.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Back
    |
    /**
     * Mouse Forward Button.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forward
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case Left => 1
            case Right => 2
            case Middle => 4
            case Back => 8
            case Forward => 16
            case _ => throw BusinessException(100001, "Internal error.")
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

}

/**
 * Function Called by Mouse
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MouseAction {
    /**
     * None MouseAction
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Triggered when the mouse is pressed.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Press
    |
    /**
     * Triggered when the mouse is released.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Release
    |
    /**
     * Triggered when the mouse is Moved.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Move
    |
    /**
     * Triggered when the mouse is Hovered.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hover
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case Press => 1
            case Release => 2
            case Move => 3
            case Hover => 6
            case _ => throw BusinessException(100001, "Internal error.")
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
}

/**
 * Type of the input device that triggers the current key.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeySource {
    /**
     * The input device type is unknown.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * Set Device Type to Keyboard.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Keyboard
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Unknown => 0
            case Keyboard => 4
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): KeySource {
        match (value) {
            case 4 => Keyboard
            case _ => Unknown
        }
    }
}

/**
 * Type of a key.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum KeyType {
    /**
     * Unknown KeyType.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * Press the key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Down
    |
    /**
     * The key is released.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Up
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Unknown => -1
            case Down => 0
            case Up => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): KeyType {
        match (value) {
            case 0 => Down
            case 1 => Up
            case _ => Unknown
        }
    }

}

/**
 * Modifier key for hot key.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ModifierKey {
    /**
     * ctrl.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ctrl
    |
    /**
     * shift.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Shift
    |
    /**
     * alt.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alt
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Ctrl => 0
            case Shift => 1
            case Alt => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Function key for hot key.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FunctionKey {
    /**
     * Escape key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Esc
    |
    /**
     * F1 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F1
    |
    /**
     * F2 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F2
    |
    /**
     * F3 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F3
    |
    /**
     * F4 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F4
    |
    /**
     * F5 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F5
    |
    /**
     * F6 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F6
    |
    /**
     * F7 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F7
    |
    /**
     * F8 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F8
    |
    /**
     * F9 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F9
    |
    /**
     * F10 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F10
    |
    /**
     * F11 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F11
    |
    /**
     * F12 key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    F12
    |
    /**
     * Tab key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Tab
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Esc => 0
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
            case Tab => 13
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * DataPanelType enum
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DataPanelType {
    /**
     * Line Rainbow
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Circle
    |
    /**
     * Line Type
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Line
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Circle => 0
            case Line => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * ItemState
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ItemState {
    /**
     * Default State
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Disabled State
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Disabled
    |
    /**
     * Waiting State
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Waiting
    |
    /**
     * Skip State
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Skip
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case Normal => 0
            case Disabled => 1
            case Waiting => 2
            case Skip => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The refresh status of the drop-down refresh.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RefreshStatus {
    /**
     * The refresh status of the drop-down refresh.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inactive
    |
    /**
     * Drop down, but the drop-down distance is less than the refresh distance.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Drag
    |
    /**
     * The pull-down exceeds the refresh distance.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OverDrag
    |
    /**
     * After the pull-down, it rebounds to the refresh distance and enters the refresh state.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Refresh
    |
    /**
     * After refresh, return to the initial state.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SeekMode {
    /**
     * Sync to keyframes before the time point.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PreviousKeyframe
    |
    /**
     * Sync to keyframes after the time point.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NextKeyframe
    |
    /**
     * Sync to closest keyframes.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ClosestKeyframe
    |
    /**
     * Seek to frames closest the time point.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * playback speed.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PlaybackSpeed {
    /**
     * 0.75x speed playback.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpeedForward075X
    |
    /**
     * 1.00x speed playback.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpeedForward100X
    |
    /**
     * 1.25x speed playback.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpeedForward125X
    |
    /**
     * 1.75x speed playback.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpeedForward175X
    |
    /**
     * 2.00x speed playback.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SpeedForward200X
    | ...

    protected func getValue(): Float64 {
        match (this) {
            case SpeedForward075X => 0.75
            case SpeedForward100X => 1.00
            case SpeedForward125X => 1.25
            case SpeedForward175X => 1.75
            case SpeedForward200X => 2.00
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * CheckboxGroup SelectStatus
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SelectStatus {
    /**
     * All checkboxes are selected.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    |
    /**
     * Part of the checkbox is selected.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Part
    |
    /**
     * None of the checkbox is selected.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case All => 0
            case Part => 1
            case None => 2
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AnimationStatus {
    /**
     * Initial state of the animation.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Initial
    |
    /**
     * The animation is playing.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Running
    |
    /**
     * The animation is paused.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Paused
    |
    /**
     * The animation is stopped.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sets the state before and after the animation starts.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FillMode {
    /**
     * Restores to the initial state after the playback is complete.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * Retains the state at the end of the animation when the playback is complete.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forwards
    |
    /**
     * Applies the start attribute value for the period specified by animation-delay before the animation is displayed.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Backwards
    |
    /**
     * Both forward and backward fill modes are applied.
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Sliding effect
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SwipeEdgeEffect {
    /**
     * Elastic physical action, sliding to the edge can continue to slide for a distance based on the initial speed or touch event, and spring back when released.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Spring
    |
    /**
     * Sliding to the edge has no effect.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Spring => 0
            case None => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * SharedTransitionEffectType enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SharedTransitionEffectType {
    /**
     * The location of the destination page element remains unchanged, and you can configure the transparency animation. Currently,
     * only the static effect configured for redirecting to the target page takes effect.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Static
    |
    /**
     * Move the source page element to the destination page element location and scale it appropriately.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Exchange
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Static => 0
            case Exchange => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare scroll status
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollState {
    /**
     * Not activated.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Idle
    |
    /**
     * Scrolling status.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Scrolling
    |
    /**
     * Inertial scrolling state.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fling
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Idle => 0
            case Scrolling => 1
            case Fling => 2
            case _ => throw BusinessException(100001, "Internal error.")
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
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemAlign {
    /**
     * The list items are packed toward the start edge of the <em>List</em> component along the cross axis.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The list items are centered in the <em>List</em> component along the cross axis.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The list items are packed toward the end edge of the <em>List</em> component along the cross axis.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case Center => 1
            case End => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare item group sticky style.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum StickyStyle {
    /**
     * In the ListItemGroup component, the header is not pinned to the top,
     * and the footer is not pinned to the bottom.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * In the ListItemGroup component, the header is pinned to the top,
     * and the footer is not pinned to the bottom.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Header
    |
    /**
     * In the <em>ListItemGroup</em> component, the footer is pinned to the bottom,
     * and the header is not pinned to the top.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Footer
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case None => 0
            case Header => 1
            case Footer => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines span type.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RichEditorSpanType {
    /**
     * Text,corresponding textSpan type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Text
    |
    /**
     * Image,corresponding imageSpan type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Image
    |
    /**
     * Mixed,corresponding mixed span type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mixed
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Text => 0
            case Image => 1
            case Mixed => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The alignment of ImageSpan
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageSpanAlignment {
    /**
     * Indicating that the top of the ImageSpan should be aligned with the top of the surrounding text.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Indicating that the center of the ImageSpan should be aligned with the center of the surrounding text.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Indicating that the bottom of the ImageSpan should be aligned with the bottom of the surrounding text.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Indicating that the bottom of the ImageSpan should be aligned with the baseline of the surrounding text.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Baseline
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Top => 0
            case Center => 1
            case Bottom => 2
            case Baseline => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): ImageSpanAlignment {
        match (value) {
            case 1 => Top
            case 2 => Center
            case 3 => Bottom
            case 4 => Baseline
            case _ => Baseline
        }
    }
}

/**
 * Defines delete text direction.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RichEditorDeleteDirection {
    /**
     * Delete backward.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Backward
    |
    /**
     * Delete forward.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Forward
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Backward => 0
            case Forward => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): RichEditorDeleteDirection {
        match (value) {
            case 0 => Backward
            case 1 => Forward
            case _ => Backward
        }
    }
}

/**
 * The Web's behavior to load from HTTP or HTTPS. Defaults to MixedMode.None.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MixedMode {
    /**
     * Loose Mode: HTTP and HTTPS hybrid content can be loaded. This means that all insecure content can be loaded.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    All
    |
    /**
     * Compatibility Modes: HTTP and HTTPS hybrid content can be loaded in compatibility mode. This means that some insecure content may be loaded.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Compatible
    |
    /**
     * Strict Mode: HTTP and HTTPS hybrid content cannot be loaded.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case All => 0
            case None => 2
            case Compatible => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Play Mode
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PlayMode {
    /**
     * The animation plays normally.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * The animation plays backwards.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Reverse
    |
    /**
     * The animation plays forward on odd numbers (1, 3, 7...) and backward on even numbers (2, 4, 6...).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Alternate
    |
    /**
     * The animation plays backwards on odd numbers (1, 3, 7...) and forwards on even numbers (2, 4, 6...)..
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AlternateReverse
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Reverse => 1
            case Alternate => 2
            case AlternateReverse => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * GradientDirection enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GradientDirection {
    /**
     * Right to left.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * From the bottom up.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * From left to right.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * From the top down.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Top Left
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftTop
    |
    /**
     * Left Bottom
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LeftBottom
    |
    /**
     * Right Top
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    |
    /**
     * Right Bottom
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightBottom
    |
    /**
     * None
     *
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum of RenderFit
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RenderFit {
    /**
     * Without scaling the content area, the content area is drawn in the center of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Without scaling the content area, the content area is drawn in the top center of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Without scaling the content area, the content area is drawn in the bottom center of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Without scaling the content area, the content area is drawn in the left center of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Without scaling the content area, the content area is drawn in the right center of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Without scaling the content area, the content area is drawn in the top left of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopLeft
    |
    /**
     * Without scaling the content area, the content area is drawn in the top right of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopRight
    |
    /**
     * Without scaling the content area, the content area is drawn in the bottom left of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomLeft
    |
    /**
     * Without scaling the content area, the content area is drawn in the bottom right of the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomRight
    |
    /**
     * Scale the length and width of the content area to the node size to fill the node.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeFill
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is less than or equal to the corresponding side of the node, and the content after scaling
     * is centered.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeContain
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is less than or equal to the corresponding side of the node. If the height of the scaled content
     * is less than or equal to the height of the node, the scaled content area is displayed at the top; otherwise,
     * the width of the scaled content is less than or equal to the width of the node, the scaled content area is
     * displayed at the left.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeContainTopLeft
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is less than or equal to the corresponding side of the node. If the height of the scaled content
     * is less than or equal to the height of the node, the scaled content area is displayed at the bottom; otherwise,
     * the width of the scaled content is less than or equal to the width of the node, the scaled content area is
     * displayed at the right.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeContainBottomRight
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is greater than or equal to the corresponding side of the node, and the content after scaling
     * displays the center area.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeCover
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is greater than or equal to the corresponding side of the node. If the height of the scaled content
     * is greater than or equal to the height of the node, the scaled content area displays the top area; otherwise,
     * the width of the scaled content is greater than or equal to the width of the node, the scaled content area
     * displays the left area.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeCoverTopLeft
    |
    /**
     * Scale the length or width of the content to the length or width of the node, ensuring that one side is equal,
     * the other side is greater than or equal to the corresponding side of the node. If the height of the scaled content
     * is greater than or equal to the height of the node, the scaled content area displays the bottom area; otherwise,
     * the width of the scaled content is greater than or equal to the width of the node, the scaled content area
     * displays the right area.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ResizeCoverBottomRight
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Center => 0
            case Top => 1
            case Bottom => 2
            case Left => 3
            case Right => 4
            case TopLeft => 5
            case TopRight => 6
            case BottomLeft => 7
            case BottomRight => 8
            case ResizeFill => 9
            case ResizeContain => 10
            case ResizeContainTopLeft => 11
            case ResizeContainBottomRight => 12
            case ResizeCover => 13
            case ResizeCoverTopLeft => 14
            case ResizeCoverBottomRight => 15
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The alignment of dialog,
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogAlignment {
    /**
     * Vertical top alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Align vertically to the center.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Vertical bottom alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Default alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Align the upper left corner.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopStart
    |
    /**
     * Align the upper right corner.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TopEnd
    |
    /**
     * Left center alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CenterStart
    |
    /**
     * Right center alignment.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CenterEnd
    |
    /**
     * Align the lower left corner.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomStart
    |
    /**
     * Align the lower right corner.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BottomEnd
    | ...

    protected func getValue(): Int32 {
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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Specifies the direction value of Barrier.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarrierDirection {
    /**
     * Barrier will be positioned to the far left of all referenced components.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    |
    /**
     * Barrier will be positioned to the far right of all referenced components.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    |
    /**
     * Barrier will be positioned to the top of all referenced components.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Barrier will be positioned to the bottom of all referenced components.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Left => 0
            case Right => 1
            case Top => 2
            case Bottom => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The types of expanded safe areas.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SafeAreaType {
    /**
     * Default non-safe area of the system, including the status bar and navigation bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    System
    |
    /**
     * Non-safe area of the device like Notch or punch hole.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Cutout
    |
    /**
     * Soft keyboard area.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Keyboard
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case System => 1
            case Cutout => 1 << 1
            case Keyboard => 1 << 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enumerates the safe area edges.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SafeAreaEdge {
    /**
     * Top edge.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * Bottom edge of the safe area.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     * Start edge.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * End edge.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): UInt32 {
        match (this) {
            case Top => 1
            case Bottom => 1 << 1
            case Start => 1 << 2
            case End => 1 << 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Common enum of color strategy
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ColoringStrategy {
    /**
     * Use the inverse color strategy. Gets the inverse of the background color. Only applies to foregroundColor.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Invert
    | ...

    protected func getValue(): String {
        match (this) {
            case Invert => "invert"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Nested scroll nested mode
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NestedScrollMode {
    /**
     * Only Self response scrolling.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SelfOnly
    |
    /**
     * Self priority response scrolling.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SelfFirst
    |
    /**
     * Parent scrollable component priority response scrolling.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ParentFirst
    |
    /**
     * Both self and parent scrollable component response scrolling.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Parallel
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case SelfOnly => 0
            case SelfFirst => 1
            case ParentFirst => 2
            case Parallel => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * enum color mode
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ThemeColorMode {
    /**
     * Defines the mode which is follow up with system.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    System
    |
    /**
     * Defines the light mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Light
    |
    /**
     * Defines the dark mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dark
    | ...

    func getValue(): Int32 {
        match (this) {
            case System => 0
            case Light => 1
            case Dark => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines adaptive color
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum AdaptiveColor {
    /**
     * Adaptive color mode is not used.
     * The default color is used as the mask color. Using a mode other than **DEFAULT** can be more time-consuming.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Adaptive color mode is used. The average color value of the color picking area is used as the mask color.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Average
    | ...

    func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Average => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum for Control Size.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ControlSize {
    /**
     * The component size is small.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Small
    |
    /**
     * The component size is normal.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Small => 0
            case Normal => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Decide whether the width of select menu fit the trigger or content
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum OptionWidthMode {
    /**
     * The menu width fit the content.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FitContent
    |
    /**
     * The menu width fit the trigger.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FitTrigger
    | ...

    protected func getValue(): String {
        match (this) {
            case FitContent => "fit_content"
            case FitTrigger => "fit_trigger"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The enum for arrow position in the select
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ArrowPosition {
    /**
     * The value of arrow position end
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * The value of arrow position start
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case End => 0
            case Start => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The type of alignment between select and menu.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MenuAlignType {
    /**
     * The type of alignment between select and menu.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The value of menu align type center.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * The value of menu align type end.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case Center => 1
            case End => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum type supplied to {@link darkMode} for setting the web dark mode.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WebDarkMode {
    /**
     * Disable the web dark mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Off
    |
    /**
     * Enable the web dark mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    On
    |
    /**
     * Make web dark mode follow the system.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Off => 0
            case On => 1
            case Auto => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the event tool type.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SourceTool {
    /**
     * Unknown type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Unknown
    |
    /**
     * The finger type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Finger
    |
    /**
     * The pen type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Pen
    |
    /**
     * The mouse type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mouse
    |
    /**
     * The touchpad type.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Touchpad
    |
    /**
     * The joystick type.
     *
     */
    @!APILevel[
        since: "22",
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
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum Repetition {
    /**
     * The repeat method of image repetition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Repeat
    |
    /**
     * The repeat-x method of image repetition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RepeatX
    |
    /**
     * The repeat-y method of image repetition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RepeatY
    |
    /**
     * The no-repeat method of image repetition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NoRepeat
    |
    /**
     * The clamp method of image repetition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Clamp
    |
    /**
     * The mirror method of image repetition.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Mirror
    | ...

    protected func toStringInner(): String{
        match (this) {
            case Repeat => "repeat"
            case RepeatX => "repeat-x"
            case RepeatY => "repeat-y"
            case NoRepeat => "no-repeat"
            case Clamp => "clamp"
            case Mirror => "mirror"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The possible source of scroll event
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ScrollSource {
    /**
     * Drag events.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Drag
    |
    /**
     * Fling after the drag has ended with velocity.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Fling
    |
    /**
     * Over scroll with EdgeEffect.Spring.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EdgeEffect
    |
    /**
     * Other user input except drag, such as mouse wheel, key event.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    OtherUserInput
    |
    /**
     * Drag events of scroll bar.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScrollBar
    |
    /**
     * Fling after the drag on scroll bar has ended with velocity.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScrollBarFling
    |
    /**
     * Member methods of Scroller without animation.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Scroller
    |
    /**
     * Member methods of Scroller with animation.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ScrollerAnimation
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Drag => 0
            case Fling => 1
            case EdgeEffect => 2
            case OtherUserInput => 3
            case ScrollBar => 4
            case ScrollBarFling => 5
            case Scroller => 6
            case ScrollerAnimation => 7
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): ScrollSource {
        match (value) {
            case 0 => Drag
            case 1 => Fling
            case 2 => EdgeEffect
            case 3 => OtherUserInput
            case 4 => ScrollBar
            case 5 => ScrollBarFling
            case 6 => Scroller
            case 7 => ScrollerAnimation
            case _ => Drag
        }
    }
}

/**
 * Declare the type of input content
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ContentType {
    /**
     * User name content type.
     * Password Vault, when enabled, can automatically save and fill in usernames.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    UserName
    |
    /**
     * Password content type.
     * Password Vault, when enabled, can automatically save and fill in passwords.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Password
    |
    /**
     * New password content type.
     * Password Vault, when enabled, can automatically generate a new password.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NewPassword
    |
    /**
     * Full street address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in full street addresses.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FullStreetAddress
    |
    /**
     * House number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in house numbers.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HouseNumber
    |
    /**
     * District address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in districts and counties.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DistrictAddress
    |
    /**
     * City address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in cities.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CityAddress
    |
    /**
     * Province address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in provinces.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ProvinceAddress
    |
    /**
     * Country address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in countries.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CountryAddress
    |
    /**
     * Person full name content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in full names.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PersonFullName
    |
    /**
     * Person last name content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in last names.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PersonLastName
    |
    /**
     * Person first name content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in first names.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PersonFirstName
    |
    /**
     * Phone number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in phone numbers.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PhoneNumber
    |
    /**
     * Phone country code content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in country codes.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PhoneCountryCode
    |
    /**
     * Full phone number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in phone numbers with country codes.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FullPhoneNumber
    |
    /**
     * Email address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in email addresses.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EmailAddress
    |
    /**
     * Bank card number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in bank card numbers.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BankCardNumber
    |
    /**
     * ID card number content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in ID card numbers.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    IdCardNumber
    |
    /**
     * Nickname content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in nicknames.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Nickname
    |
    /**
     * Detail info without street content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in address information without street addresses.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DetailInfoWithoutStreet
    |
    /**
     * Format address content type.
     * The scenario-based autofill feature, when enabled,
     * can automatically save and fill in standard addresses.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FormatAddress
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case UserName => 0
            case Password => 1
            case NewPassword => 2
            case FullStreetAddress => 3
            case HouseNumber => 4
            case DistrictAddress => 5
            case CityAddress => 6
            case ProvinceAddress => 7
            case CountryAddress => 8
            case PersonFullName => 9
            case PersonLastName => 10
            case PersonFirstName => 11
            case PhoneNumber => 12
            case PhoneCountryCode => 13
            case FullPhoneNumber => 14
            case EmailAddress => 15
            case BankCardNumber => 16
            case IdCardNumber => 17
            case Nickname => 23
            case DetailInfoWithoutStreet => 24
            case FormatAddress => 25
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Define the menu pop-up policy
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum MenuPolicy {
    /**
     * Default value. The default logic of whether to pop up a menu depends on the scene.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * The menu is always hidden.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Hide
    |
    /**
     * The menu is always displayed.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Show
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Hide => 1
            case Show => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Type of text decoration line style.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextDecorationStyle {
    /**
     * Solid line.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Solid
    |
    /**
     * Double lines.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Double
    |
    /**
     * Dotted lines.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dotted
    |
    /**
     * Dashed line.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dashed
    |
    /**
     * Wavy line.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Wavy
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Solid => 0
            case Double => 1
            case Dotted => 2
            case Dashed => 3
            case Wavy => 4
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum of line break strategy
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LineBreakStrategy {
    /**
     * By default. Display as many characters as possible on each line until no more characters
     * can be displayed on that line, and do not automatically add hyphens under this strategy
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Greedy
    |
    /**
     * High quality folding. Optimize the layout of the entire text's line breaks and automatically
     * add hyphens if necessary.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HighQuality
    |
    /**
     * Balanced folding. We will try our best to ensure that the width of each line in a paragraph
     * is the same, and if necessary, we will add conjunction
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Balanced
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Greedy => 0
            case HighQuality => 1
            case Balanced => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    protected static func parseValue(value: Int32): LineBreakStrategy {
        match (value) {
            case 0 => Greedy
            case 1 => HighQuality
            case 2 => Balanced
            case _ => Greedy
        }
    }
}

/**
 * Text content style.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextContentStyle {
    /**
     * Text content default style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Text content inline style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inline
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Inline => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * common enum of the checkbox shape
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CheckBoxShape {
    /**
     * Circle.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Circle
    |
    /**
     * Rounded Square.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RoundedSquare
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Circle => 0
            case RoundedSquare => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum of text height adaptation
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextHeightAdaptivePolicy {
    /**
     * Priority is given to using the maxLines attribute to adapt the text height.
     * If the layout size using the maxLines attribute exceeds the layout constraint, try reducing the font size to
     * display more text.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MaxLinesFirst
    |
    /**
     * Priority is given to using the minFontSize attribute to adapt the text height.
     * If the text can be layout in a single line using the minFontSize property, try increasing the font size and using
     * the maximum possible font size.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MinFontSizeFirst
    |
    /**
     * Priority is given to using the layout constraint to adapt the text height.
     * If the layout size exceeds the layout constraint, try reducing the font size. If the layout size still exceeds
     * the layout constraint after reducing the font size to minFontSize, remove the lines that exceed the layout
     * constraint.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LayoutConstraintFirst
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case MaxLinesFirst => 0
            case MinFontSizeFirst => 1
            case LayoutConstraintFirst => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * ArrowPointPosition enumeration description
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ArrowPointPosition {
    /**
     * Target start position
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * Target center position
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Center
    |
    /**
     * Target end position
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    protected func getValue(): String {
        match (this) {
            case Start => "Start"
            case Center => "Center"
            case End => "End"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Title height.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TitleHeight {
    /**
     * Title height when only main title is available.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MainOnly
    |
    /**
     * Title height when main title and subtitle are both available.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MainWithSub
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case MainOnly => 0
            case MainWithSub => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * The Button Style of dialog,
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DialogButtonStyle {
    /**
     * Default Style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Highlight Style.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Highlight
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Highlight => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enumerates the length metrics unit.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LengthMetricsUnit {
    /**
     * The default length metrics unit, in vp.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * The pixel length metrics unit.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Px
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Px => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Indicates the attribute of the current text direction.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CanvasDirection {
    /**
     * (Default) Inherit current Canvas component settings
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inherit
    |
    /**
     * The text direction is left to right.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ltr
    |
    /**
     * The text direction is from right to left.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rtl
    | ...

    protected func getValue(): String {
        match (this) {
            case Inherit => "inherit"
            case Ltr => "ltr"
            case Rtl => "rtl"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Filling style algorithm, which determines whether a point is within or outside the path. The following
 * two configurations are supported:
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum CanvasFillRule {
    /**
     * odd and even round rule
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EvenOdd
    |
    /**
     * (Default) Non-zero Wrap Rules
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NonZero
    | ...

    protected func getValue(): String {
        match (this) {
            case EvenOdd => "evenodd"
            case NonZero => "nonzero"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Image format.
 */
@Derive[Equatable]
protected enum ImageType {
    /**
     * Image format png.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Png
    |
    /**
     * Image format jpeg.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Jpeg
    |
    /**
     * Image format webp.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Webp
    | ...

    protected func getValue(): String {
        match (this) {
            case Png => "image/png"
            case Jpeg => "image/jpeg"
            case Webp => "image/webp"
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Enum for FinishCallbackType.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum FinishCallbackType {
    /**
     * The callback is invoked when the entire animation is removed once it has finished.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Removed
    |
    /**
     * The callback is invoked when the animation logically enters the falling state,
     * though it may still be in its long tail state.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Logically
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Removed => 0
            case Logically => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * enum Blur style
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BlurStyle {
    /**
     * Thin material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thin
    |
    /**
     * Regular material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Regular
    |
    /**
     * Thick material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Thick
    |
    /**
     * BackgroundThin material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundThin
    |
    /**
     * BackgroundRegular material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundRegular
    |
    /**
     * BackgroundThick material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundThick
    |
    /**
     * BackgroundUltraThick material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    BackgroundUltraThick
    |
    /**
     * None material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    |
    /**
     * ComponentUltraThin material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentUltraThin
    |
    /**
     * ComponentThin material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentThin
    |
    /**
     * ComponentRegular material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentRegular
    |
    /**
     * ComponentThick material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentThick
    |
    /**
     * ComponentUltraThick material.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentUltraThick
    | ...

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
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Dismiss reason type.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DismissReason {
    /**
     * Touching the Back button, swiping left or right on the screen, or pressing the Esc key.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PressBack
    |
    /**
     * Touching the mask.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TouchOutside
    |
    /**
     * Touching the Close button.
     *
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
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
            case _ => throw BusinessException(100001, "Internal error.")
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

/**
 * Text input style.
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextInputStyle {
    /**
     * Text input default style.
     * <p><strong>NOTE</strong>:
     * <br>The caret width is fixed at 1.5 vp,
     * and the caret height is subject to the background height and font size of the selected text.
     * </p>
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Default
    |
    /**
     * Text input inline style.
     * <br>The background height of the selected text is the same as the height of the text box.
     * <br>This style is used in scenarios where editing and non-editing states are obvious,
     * for example, renaming in the file list view.
     * <br>The showError attribute is not supported for this style.
     * <br>This style does not allow for text dragging and dropping.
     * </p>
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Inline
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Default => 0
            case Inline => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Declare the type of input box
 *
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAreaType {
    /**
     * Basic input mode.
     * The value can contain digits, letters, underscores (_), spaces, and special characters.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    |
    /**
     * Pure digital input mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Number
    |
    /**
     * Phone number entry mode.
     * In this mode, the following are allowed: digits, spaces, plus signs (+), hyphens (-), asterisks (*), and number signs (#).
     * the length is not limited.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PhoneNumber
    |
    /**
     * E-mail address input mode.
     * This mode accepts only digits, letters, underscores (_), dots (.),
     * and the following special characters: ! # $ % & ' * + - / = ? ^ ` { | } ~ @ (which can only appear once).
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Email
    |
    /**
     * Number decimal entry mode.
     * The value can contain digits and one decimal point.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NumberDecimal
    |
    /**
     * URL entry mode.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Url
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Normal => 0
            case Number => 2
            case PhoneNumber => 3
            case Email => 5
            case NumberDecimal => 12
            case Url => 13
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}
