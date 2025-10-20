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
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkListItemGroupCreate(header: Int64, footer: Int64, space: Float64, spaceUnit: Int32): Unit

    func FfiOHOSAceFrameworkListItemGroupCreate2(header: Int64, footer: Int64, space: Float64, spaceUnit: Int32,
        style: Int32): Unit

    func FfiOHOSAceFrameworkListItemGroupSetDivider(params: DividerParams): Unit
}

/**
 * Defines the list item group style.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemGroupStyle {
    /**
     * Show custom style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None |
    /**
     * Show default style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Card | 
    ...

    func getValue(): Int32 {
        match (this) {
            case None => 0
            case Card => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the item group attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListDividerOptions {
    /**
     * Set the line width of the dividing line.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: ?Length

    /**
     * Set the color of the dividing line.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor

    /**
     * Set the distance between the dividing line and the starting end of the side of the list.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var startMargin: ?Length

    /**
     * Set the distance between the dividing line and the end of the side of the list.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var endMargin: ?Length

    /**
     * ListDividerOptions constructor
     *
     * @param { ?Length } strokeWidth
     * @param { ?ResourceColor } color
     * @param { ?Length } startMargin
     * @param { ?Length } endMargin
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        strokeWidth!: ?Length,
        color!: ?ResourceColor = None,
        startMargin!: ?Length = None,
        endMargin!: ?Length = None
    ) {
        this.strokeWidth = strokeWidth ?? 0.vp
        this.color = color ?? 0x08000000
        this.startMargin = startMargin ?? 0.vp
        this.endMargin = endMargin ?? 0.vp
    }
}

/**
 * Defines ListItemGroup Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItemGroup <: CommonMethodComponent<ListItemGroup> & ListItemGroupAttribute {

    /**
     * Called when an interface is used.
     *
     * @param { ?CustomBuilder } header
     * @param { ?CustomBuilder } footer
     * @param { ?Length } space
     * @param { ?ListItemGroupStyle } style
     * @param { () -> Unit } child
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        header!: ?CustomBuilder = None,
        footer!: ?CustomBuilder = None,
        space!: ?Length = None,
        style!: ?ListItemGroupStyle = Option.None,
        child!: () -> Unit
    ) {
        let tmpSpace = space ?? 0.vp
        let tmpStyle = style ?? ListItemGroupStyle.None
        let headerLambda = Callback0Param<Unit>(header ?? {=>})
        let footerLambda = Callback0Param<Unit>(footer ?? {=>})

        unsafe {
            FfiOHOSAceFrameworkListItemGroupCreate2(headerLambda.getID(), footerLambda.getID(), tmpSpace.value,
                tmpSpace.unitType.getValue(), tmpStyle.getValue())
        }
        this.child = child
    }

    /**
     * Called when the ListItemGroup split line style is set.
     *
     * @param { Option<ListDividerOptions> } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(value: Option<ListDividerOptions>): This {
        match (value) {
            case Some(v) =>
                var strokeWidth_ = transAppResourceToLength(v.strokeWidth ?? 0.vp)
                var startMargin_ = transAppResourceToLength(v.startMargin ?? 0.vp)
                var endMargin_ = transAppResourceToLength(v.endMargin ?? 0.vp)
                unsafe {
                    FfiOHOSAceFrameworkListItemGroupSetDivider(
                        DividerParams(
                            strokeWidth_.value,
                            strokeWidth_.unitType.getValue(),
                            transAppResourceToResourceColor(v.color ?? 0x08000000),
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
