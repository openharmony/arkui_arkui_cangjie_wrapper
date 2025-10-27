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

package ohos.arkui.component.list

import ohos.arkui.component.common.*
import ohos.arkui.component.list_item_group.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.scroll.*
import ohos.arkui.component.util.*
import ohos.arkui.shape.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.resource.*
import std.convert.*

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

/**
 * The data returned by the event handler when onScrollFrameBegin.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OnScrollFrameBeginHandlerResult {
    /**
     * Actual scroll offset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetRemain: ?Float64

    /**
     * Constructor.
     *
     * @param { ?Float64 } offsetRemain - Actual scroll offset.
     * @returns { OnScrollFrameBeginHandlerResult }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetRemain!: ?Float64) {
        this.offsetRemain = offsetRemain ?? 0.0
    }
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

    func FfiOHOSAceFrameworkScrollableBaseClipMode(clip: Int32): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines List Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class List <: ScrollableCommonMethodComponent<List> & ListAttribute {

    /**
     * Defines the constructor of List.
     *
     * @param { ?Int64 } space - The space between items.
     * @param { ?Int32 } initialIndex - The initial index of the list.
     * @param { ?Scroller } scroller - The scroller instance.
     * @param { () -> Unit } child - The child component builder.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        space!: ?Int64 = None,
        initialIndex!: ?Int32 = None,
        scroller!: ?Scroller = Option<Scroller>.None,
        child!: () -> Unit
    ) {
        let scrollerID = match (scroller) {
            case Some(v) => v.getID()
            case _ => -1
        }
        unsafe {
            FfiOHOSAceFrameworkListCreate(Float64(space ?? 0), LENGTH_VP, initialIndex ?? 0, scrollerID)
        }
        this.child = child
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkListSetWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkListSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    /**
     * Sets the direction in which the list items are arranged.
     *
     * @param { ?Axis } value - The axis direction.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func listDirection(value: ?Axis): This {
        unsafe {
            FfiOHOSAceFrameworkListSetDirection((value ?? Axis.Vertical).getValue())
        }
        this
    }

    /**
     * Sets the style of the divider for the list items. By default, there is no divider.
     *
     * @param { Option<ListDividerOptions> } value - The divider options.
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
                    FfiOHOSAceFrameworkListSetDivider(
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

    /**
     * Sets the effect used when the scroll boundary is reached.
     *
     * @param { ?EdgeEffect } value - The edge effect style.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func edgeEffect(value: ?EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEdgeEffect((value ?? EdgeEffect.Spring).getValue())
        }
        this
    }

    /**
     * Sets whether to enable chained animations, which provide a visually connected,
     * or "chained," effect when the list is scrolled or its top or bottom edge is dragged.
     *
     * @param { ?Bool } value - Whether to enable chained animations.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func chainAnimation(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetChainAnimation(value ?? false)
        }
        this
    }

    /**
     * Called when the minimum number of list item caches is set for long list deferred loading.
     *
     * @param { ?Int32 } value - The cached count value.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkListSetCachedCount(value ?? 1)
        }
        this
    }

    /**
     * Sets whether to enable multiselect.
     *
     * @param { ?Bool } value - Whether to enable multiselect.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func multiSelectable(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetMultiSelectable(value ?? false)
        }
        this
    }

    /**
     * Sets the number of columns or rows in the list. If the value is set to the gutter type, it indicates the gap between columns.
     * It takes effect when the number of columns is greater than 1.
     *
     * @param { ?Int32 } value - The lanes count.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkListSetLanes(value ?? 1)
        }
        this
    }

    /**
     * Sets the number of columns or rows in the list. If the value is set to the gutter type, it indicates the gap between columns.
     * It takes effect when the number of columns is greater than 1.
     *
     * @param { ?Length } minLength - The minimum length of lanes.
     * @param { ?Length } maxLength - The maximum length of lanes.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(minLength!: ?Length, maxLength!: ?Length): This {
        var flag = false
        if (minLength.isNone() || maxLength.isNone()) {
            unsafe {
                FfiOHOSAceFrameworkListSetLanes(1)
            }
        }
        var minLength_ = transAppResourceToLength(minLength ?? (-1.0).vp)
        var maxLength_ = transAppResourceToLength(maxLength ?? (-1.0).vp)
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

    /**
     * Alignment mode of list items along the cross axis when the cross-axis width of the list is greater
     * than the cross-axis width of list items multiplied by the value of lanes.
     *
     * @param { ?ListItemAlign } value - The alignment mode.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignListItem(value: ?ListItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkListSetAlignListItem((value ?? ListItemAlign.Start).getValue())
        }
        this
    }

    /**
     * Sets whether to pin the header to the top or the footer to the bottom in the list item group.
     *
     * @param { ?StickyStyle } value - The sticky style.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sticky(value: ?StickyStyle): This {
        let tmpValue = value ?? StickyStyle.None
        unsafe {
            FfiOHOSAceFrameworkListSetSticky(tmpValue.getValue())
        }
        this
    }

    protected func scrollBarInner(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkListSetScrollBar(value.getValue())
        }
        this
    }

    protected func scrollBarColorInner(color: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkListScrollBarColor(transAppResourceToResourceColor(color ?? 0x66182431))
        }
        this
    }

    protected func scrollBarWidthInner(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 4.vp)
        unsafe {
            FfiOHOSAceFrameworkListScrollBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected func frictionInner(value: ?Float64): This {
        let tmpValue = value ?? -1.0
        var friction: Float64 = 0.75
        if (tmpValue > 0.0) {
            friction = tmpValue
        }
        unsafe {
            FfiOHOSAceFrameworkListSetFriction(friction)
        }
        this
    }

    protected func clipContentInner(clip: ?ContentClipMode): This {
        unsafe {
            FfiOHOSAceFrameworkScrollableBaseClipMode((clip ?? ContentClipMode.ContentOnly).getValue())
        }
        this
    }

    protected func frictionInner(value: ?AppResource): This {
        var realValue: Float64 = 0.0
        match (value) {
            case Some(v) => 
                let t = Float64.tryParse(getResourceString(v))
                match (t) {
                    case Some(n) => realValue = n
                    case None => BaseLog.debug("AppResource type param of friction func convert to Float64 fail.");
                }
            case None => realValue = -1.0
        }
        frictionInner(realValue)
    }

    protected func enableScrollInteractionInner(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEnableScrollInteraction(value ?? true)
        }
        this
    }

    protected func nestedScrollInner(value: ?NestedScrollOptions): This {
        let tmpValue = value ?? NestedScrollOptions(NestedScrollMode.SelfOnly, NestedScrollMode.SelfOnly)
        let localScrollForward = (tmpValue.scrollForward ?? NestedScrollMode.SelfOnly).getValue()
        let localScrollBackward = (tmpValue.scrollBackward ?? NestedScrollMode.SelfOnly).getValue()
        unsafe {
            FfiOHOSAceFrameworkListSetNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    /**
     * Triggered when a child component enters or leaves the list display area.
     *
     * @param { ?(Int32, Int32, Int32) -> Unit } event - The scroll index event handler.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollIndex(event: ?(Int32, Int32, Int32) -> Unit): This {
        let tmpEvent = event ?? { _, _, _ => }
        let lambdaData = Callback3Param<Int32, Int32, Int32, Unit>(tmpEvent);
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollIndexCallback(lambdaData.getID())
        }
        this
    }

    /**
     * Called when scrolling begin each frame.
     *
     * @param { ?(Float64, ScrollState) -> OnScrollFrameBeginHandlerResult } event - The scroll frame begin event handler.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollFrameBegin(event: ?(Float64, ScrollState) -> OnScrollFrameBeginHandlerResult): This {
        let tmpEvent = event ?? { _, _ => OnScrollFrameBeginHandlerResult(offsetRemain: 0.0) }
        let wrapper = { offset: Float64, state: Int32 =>
            let res = tmpEvent(offset, ScrollState.parseValue(state))
            res.offsetRemain ?? 0.0
        }
        let lambdaData = Callback2Param<Float64, Int32, Float64>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollFrameBegin(lambdaData.getID())
        }
        this
    }

    protected func onReachStartInner(event: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(event)
        unsafe {
            FfiOHOSAceFrameworkListSetOnReachStartCallback(lambdaData.getID())
        }
        this
    }

    protected func onReachEndInner(event: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(event)
        unsafe {
            FfiOHOSAceFrameworkListSetOnReachEndCallback(lambdaData.getID())
        }
        this
    }

    protected func onScrollStartInner(event: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(event)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollStartCallback(lambdaData.getID())
        }
        this
    }

    protected func onScrollStopInner(event: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(event)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollStopCallback(lambdaData.getID())
        }
        this
    }
}
