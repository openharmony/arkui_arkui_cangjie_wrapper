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

package ohos.arkui.component.list_item

import ohos.arkui.component.common.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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

/**
 * Defines ListItem Component.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListItem <: CommonMethodComponent<ListItem> & ListItemAttribute {
    var deepRender_: () -> Unit

    /**
     * Called when an interface is used.
     *
     * @param { () -> Unit } child
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        this(child, -1)
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

    /**
     * Called when judging whether it is selectable.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectable(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListItemSetSelectable(value ?? true)
        }
        this
    }

    /**
     * Sets the action item that appears when the list item slides in the cross axis direction of the list.
     *
     * @param { ?CustomBuilder } start
     * @param { ?CustomBuilder } end
     * @param { ?SwipeEdgeEffect } edgeEffect
     * @param { ?(Float64) -> Unit } onOffsetChange
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func swipeAction(
        start!: ?CustomBuilder = None,
        end!: ?CustomBuilder = None,
        edgeEffect!: ?SwipeEdgeEffect = Option.None,
        onOffsetChange!: ?(Float64) -> Unit = None
    ): This {
        let tmpEdgeEffect = edgeEffect ?? SwipeEdgeEffect.Spring
        let startLambda = Callback0Param<Unit>(start ?? {=>})
        let endLambda = Callback0Param<Unit>(end ?? {=>})
        let onOffsetLambda = Callback1Param<Float64, Unit>(onOffsetChange ?? {_: Float64 =>})

        unsafe {
            FfiOHOSAceFrameworkListItemSetSwipeAction2(startLambda.getID(), endLambda.getID(), tmpEdgeEffect.getValue(),
                onOffsetLambda.getID())
        }
        this
    }

    /**
     * Called when the listItem is selected.
     *
     * @param { ?(Bool) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSelect(event: ?(Bool) -> Unit): This {
        let tmpEvent = event ?? { res: Bool => }
        let lambdaData = Callback1Param<Bool, Unit>(tmpEvent)
        unsafe {
            FfiOHOSAceFrameworkListItemSetOnSelect(lambdaData.getID())
        }
        this
    }
}
