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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BadgePosition {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RightTop
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | ...

    func getValue(): Int32 {
        match (this) {
            case RightTop => 0
            case Right => 1
            case Left => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BadgeStyle {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontSize: Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var badgeSize: Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var badgeColor: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fontWeight: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderColor: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidth: Float64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var borderWidthUnit: Int32

    public init(color!: ResourceColor = Color.WHITE, fontSize!: Int64 = 10, badgeSize!: Int64 = 16,
        badgeColor!: ResourceColor = Color.RED, fontWeight!: FontWeight = FontWeight.Normal,
        borderColor!: ResourceColor = Color.RED, borderWidth!: Length = 1.vp) {
        this.color = transAppResourceToResourceColor(color)
        this.fontSize = fontSize
        this.badgeSize = badgeSize
        this.badgeColor = transAppResourceToResourceColor(badgeColor)
        this.fontWeight = fontWeight.getValueInt()
        this.borderColor = transAppResourceToResourceColor(borderColor)

        var borderWidth_ = transAppResourceToLength(borderWidth)
        this.borderWidth = borderWidth_.value
        this.borderWidthUnit = borderWidth_.unitType.getValue()
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

foreign {
    func FfiOHOSAceFrameworkBadgeCreateV2(count: Int32, style: CJBadgeStyleV2, position: Int32, maxCount: Int32): Unit

    func FfiOHOSAceFrameworkBadgeCreateTextV2(value: CString, style: CJBadgeStyleV2, position: Int32): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
enum BadgeOptionMode {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    COUNT_MOD
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    STRING_MOD
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BadgeParams {
    var value: String = ""
    var count: Int32 = 0
    var style: BadgeStyle
    var position: BadgePosition
    var maxCount: Int32 = 0
    var mode: BadgeOptionMode

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(count!: Int32, style!: BadgeStyle, position!: BadgePosition = BadgePosition.RightTop,
        maxCount!: Int32 = 99) {
        this.mode = COUNT_MOD
        this.count = count
        this.style = style
        this.position = position
        this.maxCount = maxCount
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String, style!: BadgeStyle, position!: BadgePosition = BadgePosition.RightTop) {
        this.mode = STRING_MOD
        this.value = value
        this.style = style
        this.position = position
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Badge <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: BadgeParams, child: () -> Unit) {
        match (value.mode) {
            case COUNT_MOD => unsafe {
                FfiOHOSAceFrameworkBadgeCreateV2(
                    value.count,
                    CJBadgeStyleV2(value.style.color, Float64(value.style.fontSize), Float64(value.style.badgeSize),
                        value.style.badgeColor, value.style.fontWeight, value.style.borderColor,
                        value.style.borderWidth, value.style.borderWidthUnit),
                    value.position.getValue(),
                    value.maxCount
                )
            }
            case STRING_MOD => unsafe {
                let textValue = LibC.mallocCString(value.value)
                FfiOHOSAceFrameworkBadgeCreateTextV2(
                    textValue,
                    CJBadgeStyleV2(value.style.color, Float64(value.style.fontSize), Float64(value.style.badgeSize),
                        value.style.badgeColor, value.style.fontWeight, value.style.borderColor,
                        value.style.borderWidth, value.style.borderWidthUnit),
                    value.position.getValue()
                )
                LibC.free(textValue)
            }
        }
        this.child = child
    }
}
