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

import ohos.state_manage.*

foreign {
    func FfiOHOSAceFrameworkListItemCreate(): Unit

    func FfiOHOSAceFrameworkListItemCreateWithOptions(style: Int32): Unit

    func FfiOHOSAceFrameworkListItemSetBorderRaduis(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkListItemSetSticky(sticky: Int32): Unit

    func FfiOHOSAceFrameworkListItemSetEditable(flag: Bool): Unit

    func FfiOHOSAceFrameworkListItemSetSelectable(selectable: Bool): Unit

    func FfiOHOSAceFrameworkListItemSetSelected(flag: Bool): Unit

    func FfiOHOSAceFrameworkListItemSetSwipeAction(start: Int64, end: Int64, edgeEffect: Int32): Unit

    func FfiOHOSAceFrameworkListItemSetSwipeAction2(start: Int64, end: Int64, edgeEffect: Int32, offset: Int64): Unit

    func FfiOHOSAceFrameworkListItemSetOnSelect(callback: Int64): Unit

    func FfiOHOSAceFrameworkListItemLazyCreate(lambdaId: Int64, style: Int32): Unit

    func FfiOHOSAceFrameworkListItemDoDeepRender(elmId: Int32): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ListItemStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItemOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: ListItemStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(style!: ListItemStyle = ListItemStyle.NONE) {
        this.style = style
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItem <: ContainerBase {
    var deepRender_: () -> Unit
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(deepRender: () -> Unit) {
        this(deepRender, -1)
    }

    private init(deepRender: () -> Unit, style: Int32) {
        this.child = {=>}
        deepRender_ = deepRender
        let lambda = Callback1Param<Int32, Unit>({
            id => doDeepRender(Int64(id))
        })
        unsafe {
            FfiOHOSAceFrameworkListItemLazyCreate(lambda.getID(), style)
        }
    }

    func doDeepRender(elmId: Int64): Unit {
        // push listitem node to stack
        ViewStackProcessor.StartGetAccessRecordingFor(elmId)
        let lambda = Callback1Param<Int32, Unit>({
            id => doDeepRender(Int64(id))
        })
        unsafe {
            FfiOHOSAceFrameworkListItemLazyCreate(lambda.getID(), -1)
        }
        ViewStackProcessor.StopGetAccessRecording()
        deepRender_()
        pop()
    }

    private init() {
        this.child = {=>}
        this.deepRender_ = {=>}
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ListItemOptions, child: () -> Unit) {
        this(child, value.style.getValue())
    }

    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sticky(sticky: Sticky): This {
        unsafe {
            FfiOHOSAceFrameworkListItemSetSticky(sticky.getValue())
        }
        this
    }

    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func editable(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListItemSetEditable(flag)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectable(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListItemSetSelectable(flag)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListItemSetSelected(flag)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func swipeAction(
        start!: () -> Unit = {=>},
        end!: () -> Unit = {=>},
        edgeEffect!: SwipeEdgeEffect = SwipeEdgeEffect.Spring,
        onOffsetChange!: (Float64) -> Unit = {_: Float64 =>}
    ): This {
        let startLambda = Callback0Param<Unit>(start)
        let endLambda = Callback0Param<Unit>(end)
        let onOffsetLambda = Callback1Param<Float64, Unit>(onOffsetChange)

        unsafe {
            FfiOHOSAceFrameworkListItemSetSwipeAction2(startLambda.getID(), endLambda.getID(), edgeEffect.getValue(),
                onOffsetLambda.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkListItemSetOnSelect(lambdaData.getID())
        }
        this
    }
}
