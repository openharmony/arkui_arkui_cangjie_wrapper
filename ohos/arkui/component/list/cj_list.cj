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

package ohos.arkui.component.list

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.scroll.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct CJVisibleListContentInfo {
    CJVisibleListContentInfo(
        let index: Int32,
        let itemGroupArea: Int32,
        let itemIndexInGroup: Int32
    ) {}
}

@C
struct LanesParams {
    LanesParams(
        let min: Float64,
        let minUnit: Int32,
        let max: Float64,
        let maxUnit: Int32,
        let gutter: Float64,
        let gutterUnit: Int32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkListCreate(space: Float64, unit: Int32, initialIndex: Int32, scroller: Int64): Unit

    func FfiOHOSAceFrameworkListSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkListSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkListSetDirection(direction: Int32): Unit

    func FfiOHOSAceFrameworkListSetDivider(params: DividerParams): Unit

    func FfiOHOSAceFrameworkListSetEditMode(flag: Bool): Unit

    func FfiOHOSAceFrameworkListSetScrollBar(barState: Int32): Unit

    func FfiOHOSAceFrameworkListScrollBarColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkListScrollBarWidth(value: Float64, valueUnit: Int32): Unit

    func FfiOHOSAceFrameworkListSetCachedCount(count: Int32): Unit

    func FfiOHOSAceFrameworkListSetEdgeEffect(edgeEffect: Int32): Unit

    func FfiOHOSAceFrameworkListSetEdgeEffectWithOption(edgeEffect: Int32, options: Bool): Unit

    func FfiOHOSAceFrameworkListSetChainAnimation(flag: Bool): Unit

    func FfiOHOSAceFrameworkListSetMultiSelectable(flag: Bool): Unit

    func FfiOHOSAceFrameworkListSetLanes(lanes: Int32): Unit

    func FfiOHOSAceFrameworkListSetLanesGutter(lanes: Int32, gutter: Float64, gutterUnit: Int32): Unit

    func FfiOHOSAceFrameworkListSetLanesByLengthConstrain(min: Float64, minUnit: Int32, max: Float64, maxUnit: Int32): Unit

    func FfiOHOSAceFrameworkListSetLanesGutterByLengthConstrain(lanesParams: LanesParams): Unit

    func FfiOHOSAceFrameworkListSetAlignListItem(align: Int32): Unit

    func FfiOHOSAceFrameworkListSetSticky(style: Int32): Unit

    func FfiOHOSAceFrameworkListSetFriction(value: Float64): Unit

    func FfiOHOSAceFrameworkListSetEnableScrollInteraction(flag: Bool): Unit

    func FfiOHOSAceFrameworkListSetContentStartOffset(startOffset: Float64): Unit

    func FfiOHOSAceFrameworkListSetContentEndOffset(endOffset: Float64): Unit

    func FfiOHOSAceFrameworkListSetScrollSnapAlign(align: Int32): Unit

    func FfiOHOSAceFrameworkListSetMaintainPosition(enabled: Bool): Unit

    func FfiOHOSAceFrameworkListSetOnScrollIndexCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetItemDeleteCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetNestedScroll(scrollForward: Int32, scrollBackward: Int32): Unit

    func FfiOHOSAceFrameworkListSetScrollIndexCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnScrollCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnScrollFrameBegin(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnReachStartCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnReachEndCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnScrollStartCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnScrollStopCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnScrollBeginCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnItemMoveCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnScrollVisibleContentChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnItemDragStartCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListOnItemDragStartWithBack(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnItemDragEnterCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnItemDragMoveCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnItemDragLeaveCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListSetOnItemDropCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkListScrollerCtor(): Int64

    func FfiOHOSAceFrameworkListScrollerGetItemRectInGroup(listScrollerId: Int64, index: Int32, indexInGroup: Int32): RectResultParams

    func FfiOHOSAceFrameworkListScrollerScrollToItemInGroup(listScrollerId: Int64, index: Int32, indexInGroup: Int32,
        smooth: Bool, align: Int32): Unit

    func FfiOHOSAceFrameworkListScrollerGetVisibleListContentInfo(listScrollerId: Int64, x: Float64, y: Float64): CJVisibleListContentInfo

    func FfiOHOSAceFrameworkListScrollerCloseAllSwipeActions(listScrollerId: Int64): Unit

    func FfiOHOSAceFrameworkListScrollerCloseAllSwipeActionsWithCallback(
        listScrollerId: Int64,
        onFinishCallback: Int64
    ): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class List <: ScrollableBase {
    static let spaceDefault: Int64 = 0
    static let initialIndexDefault: Int32 = 0
    static var scrollerIdDefault: Int64 = -1

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        space!: Int64 = spaceDefault,
        initialIndex!: Int32 = initialIndexDefault,
        scroller!: ?Scroller = Option<Scroller>.None,
        child!: () -> Unit
    ) {
        let scrollerID = match (scroller) {
            case Some(v) => v.getID()
            case _ => scrollerIdDefault
        }
        unsafe {
            FfiOHOSAceFrameworkListCreate(Float64(space), LENGTH_VP, initialIndex, scrollerID)
        }
        this.child = child
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkListSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkListSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func listDirection(value: Axis): This {
        unsafe {
            FfiOHOSAceFrameworkListSetDirection(value.getValue())
        }
        this
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
            FfiOHOSAceFrameworkListSetDivider(
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func edgeEffect(value: EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEdgeEffect(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func chainAnimation(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetChainAnimation(flag)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBar(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkListSetScrollBar(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkListScrollBarColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkListScrollBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkListSetCachedCount(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func multiSelectable(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetMultiSelectable(flag)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkListSetLanes(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(minLength!: Length, maxLength!: Length): This {
        var minLength_ = transAppResourceToLength(minLength)
        var maxLength_ = transAppResourceToLength(maxLength)
        unsafe {
            FfiOHOSAceFrameworkListSetLanesByLengthConstrain(
                minLength_.value,
                minLength_.unitType.getValue(),
                maxLength_.value,
                maxLength_.unitType.getValue()
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignListItem(value: ListItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkListSetAlignListItem(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sticky(value: StickyStyle): This {
        unsafe {
            FfiOHOSAceFrameworkListSetSticky(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: Float64): This {
        var friction: Float64 = 0.75
        if (value > 0.0) {
            friction = value
        }
        unsafe {
            FfiOHOSAceFrameworkListSetFriction(friction)
        }
        this
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEnableScrollInteraction(flag)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkListSetNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollIndex(callback: (Int32, Int32) -> Unit): This {
        let lambdaData = Callback2Param<Int32, Int32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkListSetScrollIndexCallback(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollFrameBegin(callback: (Float64, ScrollState) -> Float64): This {
        let wrapper = {
            offset: Float64, state: Int32 => callback(offset, ScrollState.parseValue(state))
        }
        let lambdaData = Callback2Param<Float64, Int32, Float64>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollFrameBegin(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkListSetOnReachStartCallback(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkListSetOnReachEndCallback(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollStartCallback(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStop(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollStopCallback(lambdaData.getID())
        }
        this
    }
}
