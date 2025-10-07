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

package ohos.arkui.component.list_item_group

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkListItemGroupCreate(header: Int64, footer: Int64, space: Float64, spaceUnit: Int32): Unit

    func FfiOHOSAceFrameworkListItemGroupCreate2(header: Int64, footer: Int64, space: Float64, spaceUnit: Int32,
        style: Int32): Unit

    func FfiOHOSAceFrameworkListItemGroupSetDivider(params: DividerParams): Unit
}

/**
 * Defines the list item group style.
 *
 * @relation declare enum ListItemGroupStyle
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemGroupStyle {

    /**
     * Show custom style.
     *
     * @relation NONE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None |
    /**
     * Show default style.
     *
     * @relation CARD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Card | 
    ...

    func getValue(): Int32 {
        match (this) {
            case None => 0
            case Card => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the item group attribute functions.
 *
 * @relation declare class ListItemGroupAttribute extends CommonMethod<ListItemGroupAttribute>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListDividerOptions {

    /**
     * Set the line width of the dividing line.
     *
     * @type { Length }
     * @relation strokeWidth: Length
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    /**
     * Set the color of the dividing line.
     *
     * @type { ResourceColor }
     * @relation color?: ResourceColor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ResourceColor = Color(0X08000000)

    /**
     * Set the distance between the dividing line and the starting end of the side of the list.
     *
     * @type { Length }
     * @relation startMargin?: Length
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var startMargin: Length = 0.vp

    /**
     * Set the distance between the dividing line and the end of the side of the list.
     *
     * @type { Length }
     * @relation endMargin?: Length
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var endMargin: Length = 0.vp

    /**
     * ListDividerOptions constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        strokeWidth!: Length,
        color!: ResourceColor = Color.Black,
        startMargin!: Length = 0.vp,
        endMargin!: Length = 0.vp
    ) {
        this.strokeWidth = strokeWidth
        this.color = color
        this.startMargin = startMargin
        this.endMargin = endMargin
    }
}

/**
 * Defines ListItemGroup Component.
 *
 * @relation declare const ListItemGroup: ListItemGroupInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItemGroup <: ContainerBase {

    /**
     * Called when an interface is used.
     *
     * @param { CustomBuilder } header
     * @param { CustomBuilder } footer
     * @param { Length } space
     * @param { ListItemGroupStyle } style
     * @param { () -> Unit } child
     * @returns { This }
     * @relation (options?: ListItemGroupOptions): ListItemGroupAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        header!: CustomBuilder = {=>},
        footer!: CustomBuilder = {=>},
        space!: Length = 0.vp,
        style!: ListItemGroupStyle = ListItemGroupStyle.None,
        child!: () -> Unit
    ) {
        let headerLambda = Callback0Param<Unit>(header)
        let footerLambda = Callback0Param<Unit>(footer)

        unsafe {
            FfiOHOSAceFrameworkListItemGroupCreate2(headerLambda.getID(), footerLambda.getID(), space.value,
                space.unitType.getValue(), style.getValue())
        }
        this.child = child
    }

    /**
     * Called when the ListItemGroup split line style is set.
     *
     * @param { Option<ListDividerOptions> } value
     * @returns { This }
     * @relation divider(
                    value: ListDividerOptions | null,
                 ): ListItemGroupAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(value: Option<ListDividerOptions>): This {
        match (value) {
            case Some(v) =>
                var strokeWidth_ = transAppResourceToLength(v.strokeWidth)
                var startMargin_ = transAppResourceToLength(v.startMargin)
                var endMargin_ = transAppResourceToLength(v.endMargin)
                unsafe {
                    FfiOHOSAceFrameworkListItemGroupSetDivider(
                        DividerParams(
                            strokeWidth_.value,
                            strokeWidth_.unitType.getValue(),
                            transAppResourceToResourceColor(v.color),
                            startMargin_.value,
                            startMargin_.unitType.getValue(),
                            endMargin_.value,
                            endMargin_.unitType.getValue(),
                        )
                    )
                }
            case None => ()
        }
        this
    }
}