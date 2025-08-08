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

@C
struct DividerParams {
    DividerParams(
        let width: Float64,
        let widthUnit: Int32,
        let color: UInt32,
        let startMargin: Float64,
        let startMarginUnit: Int32,
        let endMargin: Float64,
        let endMarginUnit: Int32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VisibleListContentInfo {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var index: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var itemGroupArea: ListItemGroupArea
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var itemIndexInGroup: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public VisibleListContentInfo(
        index!: Int32,
        itemGroupArea!: ListItemGroupArea = ListItemGroupArea.UNDEFINED,
        itemIndexInGroup!: Int32 = -1
    ) {
        this.index = index
        this.itemGroupArea = itemGroupArea
        this.itemIndexInGroup = itemIndexInGroup
    }
}

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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ListScroller <: BaseScroller {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkListScrollerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getItemRectInGroup(index: Int32, indexInGroup: Int32): RectResult {
        let rectResultParams = unsafe {
            FfiOHOSAceFrameworkListScrollerGetItemRectInGroup(this.getID(), index, indexInGroup)
        }
        let rectResult = RectResult(rectResultParams)
        return rectResult
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollToItemInGroup(index!: Int32, indexInGroup!: Int32, smooth!: Bool = false,
        align!: ScrollAlign = ScrollAlign.START): Unit {
        unsafe {
            FfiOHOSAceFrameworkListScrollerScrollToItemInGroup(this.getID(), index, indexInGroup, smooth,
                align.getValue())
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getVisibleListContentInfo(x: Float64, y: Float64): VisibleListContentInfo {
        let cjVisibleListContentInfo = unsafe {
            FfiOHOSAceFrameworkListScrollerGetVisibleListContentInfo(this.getID(), x, y)
        }
        let visibleListContentInfo = VisibleListContentInfo(
            index: cjVisibleListContentInfo.index,
            itemGroupArea: ListItemGroupArea.parseValue(cjVisibleListContentInfo.itemGroupArea),
            itemIndexInGroup: cjVisibleListContentInfo.itemIndexInGroup
        )
        return visibleListContentInfo
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeAllSwipeActions(): Unit {
        unsafe {
            FfiOHOSAceFrameworkListScrollerCloseAllSwipeActions(this.getID())
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeAllSwipeActions(onFinishCallback: () -> Unit): Unit {
        unsafe {
            FfiOHOSAceFrameworkListScrollerCloseAllSwipeActionsWithCallback(this.getID(),
                Callback0Param<Unit>(onFinishCallback).getID())
        }
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
public class List <: ScrollableBase {
    static let spaceDefault: Int64 = 0
    static let initialIndexDefault: Int32 = 0
    static var scrollerIdDefault: Int64 = -1

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        space!: Int64 = spaceDefault,
        initialIndex!: Int32 = initialIndexDefault,
        scrollerEx!: BaseScroller,
        child!: () -> Unit
    ) {
        unsafe {
            FfiOHOSAceFrameworkListCreate(Float64(space), LENGTH_VP, initialIndex, scrollerEx.getID())
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func editMode(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEditMode(flag)
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
    public func edgeEffect(value: EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEdgeEffect(value.getValue())
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
    public func edgeEffect(value: EdgeEffect, options: EdgeEffectOptions): This {
        unsafe {
            FfiOHOSAceFrameworkListSetEdgeEffectWithOption(value.getValue(), options.alwaysEnabled)
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
    public func chainAnimation(flag: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetChainAnimation(flag)
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
    public func scrollBar(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkListSetScrollBar(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(value: Int32, gutter!: Length): This {
        var gutter_ = transAppResourceToLength(gutter)
        unsafe {
            FfiOHOSAceFrameworkListSetLanesGutter(value, gutter_.value, gutter_.unitType.getValue())
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
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lanes(minLength!: Length, maxLength!: Length, gutter!: Length): This {
        var minLength_ = transAppResourceToLength(minLength)
        var maxLength_ = transAppResourceToLength(maxLength)
        var gutter_ = transAppResourceToLength(gutter)
        unsafe {
            FfiOHOSAceFrameworkListSetLanesGutterByLengthConstrain(
                LanesParams(
                    minLength_.value,
                    minLength_.unitType.getValue(),
                    maxLength_.value,
                    maxLength_.unitType.getValue(),
                    gutter_.value,
                    gutter_.unitType.getValue()
                )
            )
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
    public func alignListItem(value: ListItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkListSetAlignListItem(value.getValue())
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
    public func sticky(value: StickyStyle): This {
        unsafe {
            FfiOHOSAceFrameworkListSetSticky(value.getValue())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentStartOffset(startOffset: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkListSetContentStartOffset(startOffset)
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentStartOffset(startOffset: Int64): This {
        contentStartOffset(Float64(startOffset))
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentEndOffset(endOffset: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkListSetContentEndOffset(endOffset)
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentEndOffset(endOffset: Int64): This {
        contentEndOffset(Float64(endOffset))
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollSnapAlign(value: ScrollSnapAlign): This {
        unsafe {
            FfiOHOSAceFrameworkListSetScrollSnapAlign(value.getValue())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maintainVisibleContentPosition(enabled: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkListSetMaintainPosition(enabled)
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
    public func nestedScroll(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkListSetNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDelete(callback: (Int32) -> Bool): This {
        let lambdaData = Callback1Param<Int32, Bool>(callback)
        unsafe {
            FfiOHOSAceFrameworkListSetItemDeleteCallback(lambdaData.getID())
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
    public func onScrollIndex(callback: (Int32, Int32) -> Unit): This {
        let lambdaData = Callback2Param<Int32, Int32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkListSetScrollIndexCallback(lambdaData.getID())
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
    public func onScrollIndex(callback: (Int32, Int32, Int32) -> Unit): This {
        let lambdaData = Callback3Param<Int32, Int32, Int32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollIndexCallback(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScroll(callback: (Float64, ScrollState) -> Unit): This {
        let wrapper = {
            offset: Float64, state: Int32 => callback(offset, ScrollState.parseValue(state))
        }
        let lambdaData = Callback2Param<Float64, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollCallback(lambdaData.getID())
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemMove(callback: (start: Int32, end: Int32) -> Bool): This {
        let lambdaData = Callback2Param<Int32, Int32, Bool>(callback)
        unsafe {
            FfiOHOSAceFrameworkListSetOnItemMoveCallback(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollVisibleContentChange(callback: (VisibleListContentInfo, VisibleListContentInfo) -> Unit): This {
        let wrapper = {
            start: CJVisibleListContentInfo, end: CJVisibleListContentInfo => callback(
                VisibleListContentInfo(
                    index: start.index,
                    itemGroupArea: ListItemGroupArea.parseValue(start.itemGroupArea),
                    itemIndexInGroup: start.itemIndexInGroup
                ),
                VisibleListContentInfo(index: end.index, itemGroupArea: ListItemGroupArea.parseValue(end.itemGroupArea),
                    itemIndexInGroup: end.itemIndexInGroup)
            )
        }
        let lambdaData = Callback2Param<CJVisibleListContentInfo, CJVisibleListContentInfo, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnScrollVisibleContentChange(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDragStart(callback: (ItemDragInfo, Int32) -> Unit): This {
        let wrapper = {
            itemDragInfo: CJItemDragInfo, itemIndex: Int32 => callback(ItemDragInfo(itemDragInfo.x, itemDragInfo.y),
                itemIndex)
        }
        let lambdaData = Callback2Param<CJItemDragInfo, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnItemDragStartCallback(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDragStart(callback: (ItemDragInfo, Int32) -> (() -> Unit)): This {
        let wrapper = {
            itemDragInfo: CJItemDragInfo, itemIndex: Int32 =>
            let ret = callback(itemDragInfo.parseToCJ(), itemIndex)

            let wrapperBack = {
                => ret()
            }
            return CJDragItemInfo(builderId: Callback0Param<Unit>(wrapperBack).getID())
        }
        let lambdaData = Callback2Param<CJItemDragInfo, Int32, CJDragItemInfo>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkListOnItemDragStartWithBack(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDragEnter(callback: (ItemDragInfo) -> Unit): This {
        let wrapper = {
            itemDragInfo: CJItemDragInfo => callback(ItemDragInfo(itemDragInfo.x, itemDragInfo.y))
        }
        let lambdaData = Callback1Param<CJItemDragInfo, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnItemDragEnterCallback(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDragMove(callback: (ItemDragInfo, Int32, Int32) -> Unit): This {
        let wrapper = {
            itemDragInfo: CJItemDragInfo, itemIndex: Int32, insertIndex: Int32 => callback(
                ItemDragInfo(itemDragInfo.x, itemDragInfo.y), itemIndex, insertIndex)
        }
        let lambdaData = Callback3Param<CJItemDragInfo, Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnItemDragMoveCallback(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDragLeave(callback: (ItemDragInfo, Int32) -> Unit): This {
        let wrapper = {
            itemDragInfo: CJItemDragInfo, itemIndex: Int32 => callback(ItemDragInfo(itemDragInfo.x, itemDragInfo.y),
                itemIndex)
        }
        let lambdaData = Callback2Param<CJItemDragInfo, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnItemDragLeaveCallback(lambdaData.getID())
        }
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onItemDrop(callback: (ItemDragInfo, Int32, Int32, Bool) -> Unit): This {
        let wrapper = {
            itemDragInfo: CJItemDragInfo, itemIndex: Int32, insertIndex: Int32, isSuccess: Bool => callback(
                ItemDragInfo(itemDragInfo.x, itemDragInfo.y), itemIndex, insertIndex, isSuccess)
        }
        let lambdaData = Callback4Param<CJItemDragInfo, Int32, Int32, Bool, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkListSetOnItemDropCallback(lambdaData.getID())
        }
        this
    }
}
