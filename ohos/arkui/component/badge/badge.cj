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

package ohos.arkui.component.badge

import ohos.arkui.component.common.{CommonMethodComponent, FontWeight}
import ohos.arkui.component.util.{transAppResourceToLength, transAppResourceToResourceColor}
import ohos.base.{ResourceColor, Length, Color, LengthProp}
import ohos.labels.APILevel
import std.deriving.Derive
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkBadgeCreateV2(count: Int32, style: CJBadgeStyleV2, position: Int32, maxCount: Int32): Unit

    func FfiOHOSAceFrameworkBadgeCreateTextV2(value: CString, style: CJBadgeStyleV2, position: Int32): Unit
}

/**
 * Defines the badge position property.
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BadgePosition {
    /**
     * The badge is displayed in the upper right corner of the parent component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop |
    /**
     * The badge is vertically centered on the right of the parent component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right |
    /**
     * The badge is vertically centered on the left of the parent component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | ...

    func getValue(): Int32 {
        match (this) {
            case RightTop => 0
            case Right => 1
            case Left => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * BadgeStyle object
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BadgeStyle {
    /**
     * Font color.
     * @default Color.White
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor
    /**
     * Font size.
     * For the string type, only numeric string values with optional units.
     * The value must be greater than or equal to 0. If the value is less than 0, the default value is used.
     * Unit: fp
     *
     * <p><strong>NOTE</strong>:
     * <br>This parameter cannot be set in percentage.
     * </p>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: ?Length
    /**
     * Badge size.
     * For the string type, numeric string values with optional units.
     * The value must be greater than or equal to 0. If the value is less than 0, the default value is used.
     * Unit: vp
     *
     * <p><strong>NOTE</strong>:
     * <br>This parameter cannot be set in percentage.
     * <br>If it is set to an invalid value, the default value is used.
     * </p>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var badgeSize: ?Length
    /**
     * Badge color.
     * @default Color.Red
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var badgeColor: ?ResourceColor
    /**
     * Font weight of the text.
     * For the number type, the value ranges from 100 to 900, at an interval of 100. 
     * A larger value indicates a heavier font weight.  
     * For the string type, only strings that represent a number.
     * @default 400 or FontWeight.Normal
     *
     * <p><strong>NOTE</strong>:
     * <br>This parameter cannot be set in percentage.
     * </p>
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: ?FontWeight
    /**
     * Border color of the background.
     * @default Color.Red
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: ?ResourceColor
    /**
     * Border width of the background.
     * This parameter cannot be set in percentage.
     * @default 1.vp
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: ?Length

    /**
     * BadgeStyle constructor.
     *
     * @param { ?ResourceColor } color - Font color.
     * @param { ?Length } fontSize - Font size.
     * @param { ?Length } badgeSize - Badge size.
     * @param { ?ResourceColor } badgeColor - Badge color.
     * @param { ?FontWeight } fontWeight - Font weight of the text.
     * @param { ?ResourceColor } borderColor - Border color of the background.
     * @param { ?Length } borderWidth - Border width of the background.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(color!: ?ResourceColor = None, fontSize!: ?Length = None, badgeSize!: ?Length = None,
        badgeColor!: ?ResourceColor = None, fontWeight!: ?FontWeight = None,
        borderColor!: ?ResourceColor = None, borderWidth!: ?Length = None) {
        this.color = color ?? Color.White
        this.fontSize = fontSize ?? 10.fp
        this.badgeSize = badgeSize ?? 16.vp
        this.badgeColor = badgeColor ?? Color.Red
        this.fontWeight = fontWeight ?? FontWeight.Normal
        this.borderColor = borderColor ?? Color.Red
        var borderWidth_ = transAppResourceToLength(borderWidth ?? 1.vp)
        this.borderWidth = borderWidth_
    }
}

@C
struct CJBadgeStyleV2 {
    CJBadgeStyleV2(
        let color: UInt32,
        let fontSize: Float64,
        let badgeSize: Float64,
        let badgeColor: UInt32,
        let fontWeight: UInt32,
        let borderColor: UInt32,
        let borderWidth: Float64,
        let borderWidthUnit: Int32
    ) {}
}

/**
 * Defines Badge Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Badge <: CommonMethodComponent<Badge> & BadgeAttribute {
    /**
     * Creates a Badge component with a numeric count.
     * position: Set the display position of the prompt point.
     * maxCount: Maximum number of messages. If the number of messages exceeds the maximum, only maxCount+ is displayed.
     * count: Set the number of reminder messages.
     * style: You can set the style of the Badge component, including the text color, size, dot color, and size.
     *
     * @param { Int32 } count - Number of notifications.
     * @param { ?BadgeStyle } style - Style of the badge, including the font color, font size, badge color, and badge size.
     * @param { ?BadgePosition } position - Position to display the badge relative to the parent component.
     * @param { ?Int32 } maxCount - Maximum number of notifications.
     * @param { () -> Unit } child - The child component to be wrapped.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(count!: Int32, style!: ?BadgeStyle, position!: ?BadgePosition = None,
        maxCount!: ?Int32 = None, child!: () -> Unit) {
        let tmpStyle = style ?? BadgeStyle()
        let tmpPosition = position ?? BadgePosition.RightTop
        unsafe {
            FfiOHOSAceFrameworkBadgeCreateV2(
                count,
                CJBadgeStyleV2(transAppResourceToResourceColor(tmpStyle.color ?? Color.White), Float64((tmpStyle.fontSize ?? 10.fp).value), Float64((tmpStyle.badgeSize ?? 16.vp).value),
                    transAppResourceToResourceColor(tmpStyle.badgeColor ?? Color.Red), (tmpStyle.fontWeight ?? FontWeight.Normal).getValueInt(), transAppResourceToResourceColor((tmpStyle.borderColor ?? Color.Red)),
                    (tmpStyle.borderWidth ?? 1.vp).value, (tmpStyle.borderWidth ?? 1.vp).unitType.getValue()),
                tmpPosition.getValue(),
                maxCount ?? 99
            )
        }
        this.child = child
    }

    /**
     * Creates a Badge component with a text value.
     * value: Text string of the prompt content.
     * position: Set the display position of the prompt point.
     * style: You can set the style of the Badge component, including the text color, size, dot color, and size.
     *
     * @param { String } value - Prompt content.
     * @param { ?BadgeStyle } style - Style of the badge, including the font color, font size, badge color, and badge size.
     * @param { ?BadgePosition } position - Position to display the badge relative to the parent component.
     * @param { () -> Unit } child - The child component to be wrapped.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, style!: ?BadgeStyle, position!: ?BadgePosition = None, child!: () -> Unit) {
        let tmpValue = value
        let tmpStyle = style ?? BadgeStyle()
        let tmpPosition = position ?? BadgePosition.RightTop
        
        unsafe {
            try (textValue = LibC.mallocCString(tmpValue).asResource()) {
                FfiOHOSAceFrameworkBadgeCreateTextV2(
                    textValue.value,
                    CJBadgeStyleV2(transAppResourceToResourceColor(tmpStyle.color ?? Color.White), Float64((tmpStyle.fontSize ?? 10.fp).value), Float64((tmpStyle.badgeSize ?? 16.vp).value),
                        transAppResourceToResourceColor(tmpStyle.badgeColor ?? Color.Red), (tmpStyle.fontWeight ?? FontWeight.Normal).getValueInt(), transAppResourceToResourceColor(tmpStyle.borderColor ?? Color.Red),
                        (tmpStyle.borderWidth ?? 1.vp).value, (tmpStyle.borderWidth ?? 1.vp).unitType.getValue()),
                    tmpPosition.getValue()
                )
            }
        }
        this.child = child
    }
}
