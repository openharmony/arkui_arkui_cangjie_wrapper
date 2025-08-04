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

package ohos.arkui.component.list_item_group

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkListItemGroupCreate(header: Int64, footer: Int64, space: Float64, spaceUnit: Int32): Unit

    func FfiOHOSAceFrameworkListItemGroupCreate2(header: Int64, footer: Int64, space: Float64, spaceUnit: Int32,
        style: Int32): Unit

    func FfiOHOSAceFrameworkListItemGroupSetDivider(params: DividerParams): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemGroupStyle {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CARD
    | ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case CARD => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItemGroupParams {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let header: () -> Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let footer: () -> Unit
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let space: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ListItemGroupStyle = ListItemGroupStyle.NONE

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        header!: () -> Unit = {=>},
        footer!: () -> Unit = {=>},
        space!: Length
    ) {
        this.header = header
        this.footer = footer
        this.space = space
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        header!: () -> Unit = {=>},
        footer!: () -> Unit = {=>}
    ) {
        this.header = header
        this.footer = footer
        this.space = 0.vp
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(header!: () -> Unit = {=>}, footer!: () -> Unit = {=>}, space!: Length, style!: ListItemGroupStyle) {
        this.header = header
        this.footer = footer
        this.space = transAppResourceToLength(space)
        this.style = style
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItemGroup <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ListItemGroupParams, child: () -> Unit) {
        let headerLambda = Callback0Param<Unit>(value.header)
        let footerLambda = Callback0Param<Unit>(value.footer)

        unsafe {
            FfiOHOSAceFrameworkListItemGroupCreate2(headerLambda.getID(), footerLambda.getID(), value.space.value,
                value.space.unitType.getValue(), value.style.getValue())
        }
        this.child = child
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(strokeWidth!: Length, color!: ResourceColor = Color.BLACK, startMargin!: Length = 0.vp,
        endMargin!: Length = 0.vp): This {
        var strokeWidth_ = transAppResourceToLength(strokeWidth)
        var startMargin_ = transAppResourceToLength(startMargin)
        var endMargin_ = transAppResourceToLength(endMargin)
        unsafe {
            FfiOHOSAceFrameworkListItemGroupSetDivider(
                DividerParams(
                    strokeWidth_.value,
                    strokeWidth_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    startMargin_.value,
                    startMargin_.unitType.getValue(),
                    endMargin_.value,
                    endMargin_.unitType.getValue(),
                )
            )
        }
        this
    }
}
