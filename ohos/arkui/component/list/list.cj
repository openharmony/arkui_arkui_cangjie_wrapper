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
import ohos.arkui.component.list_item_group.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.scroll.*
import ohos.arkui.component.util.*
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

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class onScrollFrameBeginHandleResult {
    public var offsetRemain: ?Float64

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(offsetRemain!: ?Float64) {
        this.offsetRemain = offsetRemain ?? throw IllegalArgumentException("The type now is not supported.")
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
}

/**
 * Defines List Component.
 *
 * @relation declare const List: ListInterface
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class List <: ScrollableCommonMethodComponent<ListAttribute> & ListAttribute {

    /**
     * Called when interface data is called.
     *
     * @param { Int64 } space
     * @param { Int32 } initialIndex
     * @param { Scroller } scroller
     * @param { () -> Unit } child
     * @returns { This }
     * @relation (options?: ListOptions): ListAttribute
     */
    @!APILevel[
        21,
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

    protected override func widthInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkListSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected override func heightInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkListSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the direction in which the list items are arranged.
     *
     * @param { Axis } value
     * @returns { This }
     * @relation listDirection(value: Axis): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func listDirection(value: ?Axis): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetDirection(tmpValue.getValue())
        }
        this
    }

    /**
     * Sets the style of the divider for the list items. By default, there is no divider.
     *
     * @param { Length } strokeWidth
     * @param { ResourceColor } color
     * @param { Length } startMargin
     * @param { Length } endMargin
     * @returns { This }
     * @relation divider(
                    value: ListDividerOptions | null,
                ): ListAttribute;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(value: Option<ListDividerOptions>): This {
        match (value) {
            case Some(v) =>
                var strokeWidth_ = transAppResourceToLength(v.strokeWidth ?? throw IllegalArgumentException("The type now is not supported."))
                var startMargin_ = transAppResourceToLength(v.startMargin ?? 0.vp)
                var endMargin_ = transAppResourceToLength(v.endMargin ?? 0.vp)
                unsafe {
                    FfiOHOSAceFrameworkListSetDivider(
                        DividerParams(
                            strokeWidth_.value,
                            strokeWidth_.unitType.getValue(),
                            transAppResourceToResourceColor(v.color ?? Color.Black),
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
     * @param { EdgeEffect } value
     * @returns { This }
     * @relation edgeEffect(value: EdgeEffect, options?: EdgeEffectOptions): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func edgeEffect(value: ?EdgeEffect): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetEdgeEffect(tmpValue.getValue())
        }
        this
    }

    /**
     * Sets whether to enable chained animations, which provide a visually connected,
     * or "chained," effect when the list is scrolled or its top or bottom edge is dragged.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation chainAnimation(value: boolean): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func chainAnimation(value: ?Bool): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetChainAnimation(tmpValue)
        }
        this
    }

    /**
     * Called when the minimum number of list item caches is set for long list deferred loading.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation cachedCount(value: number): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(value: ?Int32): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetCachedCount(tmpValue)
        }
        this
    }

    /**
     * Sets whether to enable multiselect.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation multiSelectable(value: boolean): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func multiSelectable(value: ?Bool): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetMultiSelectable(tmpValue)
        }
        this
    }

    /**
     * Sets the number of columns or rows in the list. If the value is set to the gutter type, it indicates the gap between columns.
     * It takes effect when the number of columns is greater than 1.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation lanes(value: number | LengthConstrain, gutter?: Dimension): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(value: ?Int32): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetLanes(tmpValue)
        }
        this
    }

    /**
     * Sets the number of columns or rows in the list. If the value is set to the gutter type, it indicates the gap between columns.
     * It takes effect when the number of columns is greater than 1.
     *
     * @param { Length } minLength
     * @param { Length } maxLength
     * @returns { This }
     * @relation lanes(value: number | LengthConstrain, gutter?: Dimension): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(minLength!: ?Length, maxLength!: ?Length): This {
        let tmpMinLength = minLength ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpMaxLength = maxLength ?? throw IllegalArgumentException("The type now is not supported.")
        var minLength_ = transAppResourceToLength(tmpMinLength)
        var maxLength_ = transAppResourceToLength(tmpMaxLength)
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
     * @param { ListItemAlign } value
     * @returns { This }
     * @relation alignListItem(value: ListItemAlign): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignListItem(value: ?ListItemAlign): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkListSetAlignListItem(tmpValue.getValue())
        }
        this
    }

    /**
     * Sets whether to pin the header to the top or the footer to the bottom in the list item group.
     *
     * @param { StickyStyle } value
     * @returns { This }
     * @relation sticky(value: StickyStyle): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sticky(value: ?StickyStyle): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
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

    protected func scrollBarColorInner(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkListScrollBarColor(transAppResourceToResourceColor(color))
        }
        this
    }

    protected func scrollBarWidthInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkListScrollBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected func frictionInner(value: Float64): This {
        var friction: Float64 = 0.75
        if (value > 0.0) {
            friction = value
        }
        unsafe {
            FfiOHOSAceFrameworkListSetFriction(friction)
        }
        this
    }

    protected func frictionInner(value: AppResource): This {
        var realValue: Float64 = 0.0
        let t = Float64.tryParse(getResourceString(value))
        match (t) {
            case Some(n) => realValue = n
            case None => BaseLog.debug("AppResource type param of friction func convert to Float64 fail.");
        }
        frictionInner(realValue)
    }

    protected func enableScrollInteractionInner(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEnableScrollInteraction(value)
        }
        this
    }

    protected func nestedScrollInner(value: NestedScrollOptions): This {
        let localScrollForward = (value.scrollForward ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        let localScrollBackward = (value.scrollBackward ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        unsafe {
            FfiOHOSAceFrameworkListSetNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    /**
     * Triggered when a child component enters or leaves the list display area.
     *
     * @param { (Int32, Int32, Int32) -> Unit } event
     * @returns { This }
     * @relation onScrollIndex(event: (start: number, end: number, center: number) => void): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollIndex(event: ?(Int32, Int32, Int32) -> Unit): This {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        let lambdaData = Callback3Param<Int32, Int32, Int32, Unit>(tmpEvent);
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollIndexCallback(lambdaData.getID())
        }
        this
    }

    /**
     * Called when scrolling begin each frame.
     *
     * @param { (Float64, ScrollState) -> onScrollFrameBeginHandleResult } event
     * @returns { This }
     * @relation onScrollFrameBegin(event: OnScrollFrameBeginCallback): ListAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollFrameBegin(event: ?(Float64, ScrollState) -> onScrollFrameBeginHandleResult): This {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        let wrapper = { offset: Float64, state: Int32 =>
            let res = tmpEvent(offset, ScrollState.parseValue(state))
            res.offsetRemain ?? throw IllegalArgumentException("The type now is not supported.")
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
