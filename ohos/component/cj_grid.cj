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

foreign {
    func FfiOHOSAceFrameworkGridCreate(): Unit

    func FfiOHOSAceFrameworkGridCreateScroller(scroller: Int64): Unit

    func FfiOHOSAceFrameworkGridColumnsTemplate(value: CString): Unit

    func FfiOHOSAceFrameworkGridRowsTemplate(value: CString): Unit

    func FfiOHOSAceFrameworkGridColumnsGapWithString(value: CString): Unit

    func FfiOHOSAceFrameworkGridColumnsGapWithNum(value: Int32): Unit

    func FfiOHOSAceFrameworkGridRowsGapWithString(value: CString): Unit

    func FfiOHOSAceFrameworkGridRowsGapWithNum(value: Int32): Unit

    func FfiOHOSAceFrameworkGridScrollBar(value: Int32): Unit

    func FfiOHOSAceFrameworkGridScrollBarColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkGridScrollBarWidth(value: Float64, valueUnit: Int32): Unit

    func FfiOHOSAceFrameworkGridCachedCount(cacheCount: Int32, show: Bool): Unit

    func FfiOHOSAceFrameworkGridEditMode(isEditMode: Bool): Unit

    func FfiOHOSAceFrameworkGridLayoutDirection(value: Int32): Unit

    func FfiOHOSAceFrameworkGridMaxCount(value: Int32): Unit

    func FfiOHOSAceFrameworkGridMinCount(value: Int32): Unit

    func FfiOHOSAceFrameworkGridCellLength(value: Int32): Unit

    func FfiOHOSAceFrameworkGridMultiSelectable(isSelectable: Bool): Unit

    func FfiOHOSAceFrameworkGridSupportAnimation(isSupportAnimation: Bool): Unit

    func FfiOHOSAceFrameworkGridEdgeEffect(value: Int32, isEnabled: Bool): Unit

    func FfiOHOSAceFrameworkGridEnableScrollInteraction(isEnable: Bool): Unit

    func FfiOHOSAceFrameworkGridNestedScroll(forward: Int32, backward: Int32): Unit

    func FfiOHOSAceFrameworkGridFriction(value: Float64): Unit

    func FfiOHOSAceFrameworkGridAlignItems(value: Int32): Unit

    func FfiOHOSAceFrameworkGridOnScrollIndex(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollIndex2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragStartWithBack(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragEnter(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragMove(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragLeave(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDrop(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollBarUpdate(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnReachStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnReachEnd(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollFrameBegin(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollStop(callback: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GridDirection {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Row
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Column
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ColumnReverse
    | ...

    func getValue(): Int32 {
        match (this) {
            case Row => 0
            case Column => 1
            case RowReverse => 2
            case ColumnReverse => 3
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
public enum GridItemAlignment {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    STRETCH
    | ...

    func getValue(): Int32 {
        match (this) {
            case DEFAULT => 0
            case STRETCH => 1
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
public class EdgeEffectOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public EdgeEffectOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let alwaysEnabled: Bool) {}
}

@C
struct CJItemDragInfo {
    CJItemDragInfo(
        let x: Float64,
        let y: Float64
    ) {}

    func parseToCJ(): ItemDragInfo {
        return ItemDragInfo(
            x,
            y
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ItemDragInfo {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public ItemDragInfo(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let x: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let y: Float64
    ) {}
}

/**
 * The position and length of the scroll bar.
 *
 * @since 14
 */
@C
public struct ComputedBarAttribute {
    public ComputedBarAttribute(
        public let totalOffset: Float64,
        public let totalLength: Float64
    ) {}
}

@C
public struct OffsetOption {
    public OffsetOption(public let offsetRemain: Float64) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridLayoutOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let regularSize: (Int32, Int32)

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let irregularIndexes: Option<Array<Int32>>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let onGetIrregularSizeByIndex: Option<(Int32) -> (Int32, Int32)>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let onGetRectByIndex: Option<(Int32) -> (Int32, Int32, Int32, Int32)>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        regularSize: (Int32, Int32),
        irregularIndexes!: Option<Array<Int32>> = Option.None,
        onGetIrregularSizeByIndex!: Option<(Int32) -> (Int32, Int32)> = Option.None,
        onGetRectByIndex!: Option<(Int32) -> (Int32, Int32, Int32, Int32)> = Option.None
    ) {
        this.regularSize = regularSize
        this.irregularIndexes = irregularIndexes
        this.onGetIrregularSizeByIndex = onGetIrregularSizeByIndex
        this.onGetRectByIndex = onGetRectByIndex
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Grid <: ScrollableBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkGridCreate()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller) {
        unsafe {
            FfiOHOSAceFrameworkGridCreateScroller(scroller.getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridCreate()
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridCreateScroller(scroller.getID())
        }
        this.child = child
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsTemplate(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkGridColumnsTemplate(unsafeValue)
            LibC.free(unsafeValue)
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
    public func rowsTemplate(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkGridRowsTemplate(unsafeValue)
            LibC.free(unsafeValue)
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
    public func columnsGap(value: Length): This {
        var value_ = transAppResourceToLength(value)
        var valueString: String = match (value_.unitType.getValue()) {
            case 0 => "${value_.value}px"
            case 1 => "${value_.value}vp"
            case 2 => "${value_.value}fp"
            case 3 => "${value_.value * 100.0}%"
            case 4 => "${value_.value}lpx"
            case _ => throw IllegalArgumentException("Unreachable")
        }

        unsafe {
            var unsafeValue = LibC.mallocCString(valueString)
            FfiOHOSAceFrameworkGridColumnsGapWithString(unsafeValue)
            LibC.free(unsafeValue)
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
    public func rowsGap(value: Length): This {
        var value_ = transAppResourceToLength(value)
        var valueString: String = match (value_.unitType.getValue()) {
            case 0 => "${value_.value}px"
            case 1 => "${value_.value}vp"
            case 2 => "${value_.value}fp"
            case 3 => "${value_.value * 100.0}%"
            case 4 => "${value_.value}lpx"
            case _ => throw IllegalArgumentException("Unreachable")
        }

        unsafe {
            var unsafeValue = LibC.mallocCString(valueString)
            FfiOHOSAceFrameworkGridRowsGapWithString(unsafeValue)
            LibC.free(unsafeValue)
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
    public func scrollBar(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBar(value.getValue())
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
            FfiOHOSAceFrameworkGridScrollBarColor(transAppResourceToResourceColor(color))
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
            FfiOHOSAceFrameworkGridScrollBarWidth(value_.value, value_.unitType.getValue())
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
    public func cachedCount(cacheCount: Int32): This {
        cachedCount(cacheCount, false)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(cacheCount: Int32, show: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridCachedCount(cacheCount, show)
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
    public func editMode(isEditMode: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridEditMode(isEditMode)
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
    public func layoutDirection(value: GridDirection): This {
        unsafe {
            FfiOHOSAceFrameworkGridLayoutDirection(value.getValue())
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
    public func maxCount(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridMaxCount(value)
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
    public func minCount(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridMinCount(value)
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
    public func cellLength(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridCellLength(value)
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
    public func multiSelectable(isSelectable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridMultiSelectable(isSelectable)
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
    public func supportAnimation(isSupportAnimation: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridSupportAnimation(isSupportAnimation)
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
    public func edgeEffect(value: EdgeEffect): This {
        unsafe {
            FfiOHOSAceFrameworkGridEdgeEffect(value.getValue(), false)
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
    public func edgeEffect(value: EdgeEffect, options: EdgeEffectOptions): This {
        unsafe {
            FfiOHOSAceFrameworkGridEdgeEffect(value.getValue(), options.alwaysEnabled)
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
    public func enableScrollInteraction(isEnable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridEnableScrollInteraction(isEnable)
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
    public func nestedScroll(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkGridNestedScroll(localScrollForward, localScrollBackward)
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
        unsafe {
            FfiOHOSAceFrameworkGridFriction(value)
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
    public func friction(value: Int32): This {
        friction(Float64(value))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignItems(alignment: GridItemAlignment): This {
        unsafe {
            FfiOHOSAceFrameworkGridAlignItems(alignment.getValue())
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
    public func onScrollIndex(callback: (UInt32) -> Unit): This {
        let lambdaData = Callback1Param<UInt32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollIndex(lambdaData.getID())
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
    public func onScrollIndex(callback: (UInt32, UInt32) -> Unit): This {
        let lambdaData = Callback2Param<UInt32, UInt32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollIndex2(lambdaData.getID())
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
            dragInfo: CJItemDragInfo, itemIndex: Int32 => callback(dragInfo.parseToCJ(), itemIndex)
        }
        let lambdaData = Callback2Param<CJItemDragInfo, Int32, Unit>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnItemDragStart(lambdaData.getID())
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
            dragInfo: CJItemDragInfo, itemIndex: Int32 =>
            let ret = callback(dragInfo.parseToCJ(), itemIndex)

            let wrapperBack = {
                => ret()
            }
            return CJDragItemInfo(builderId: Callback0Param<Unit>(wrapperBack).getID())
        }
        let lambdaData = Callback2Param<CJItemDragInfo, Int32, CJDragItemInfo>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnItemDragStartWithBack(lambdaData.getID())
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
            dragInfo: CJItemDragInfo => callback(dragInfo.parseToCJ())
        }
        let lambdaData = Callback1Param<CJItemDragInfo, Unit>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnItemDragEnter(lambdaData.getID())
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
            dragInfo: CJItemDragInfo, itemIndex: Int32, insertIndex: Int32 => callback(dragInfo.parseToCJ(), itemIndex,
                insertIndex)
        }
        let lambdaData = Callback3Param<CJItemDragInfo, Int32, Int32, Unit>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnItemDragMove(lambdaData.getID())
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
            dragInfo: CJItemDragInfo, itemIndex: Int32 => callback(dragInfo.parseToCJ(), itemIndex)
        }
        let lambdaData = Callback2Param<CJItemDragInfo, Int32, Unit>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnItemDragLeave(lambdaData.getID())
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
            dragInfo: CJItemDragInfo, itemIndex: Int32, insertIndex: Int32, isSuccess: Bool => callback(
                dragInfo.parseToCJ(), itemIndex, insertIndex, isSuccess)
        }
        let lambdaData = Callback4Param<CJItemDragInfo, Int32, Int32, Bool, Unit>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnItemDrop(lambdaData.getID())
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
    public func onScrollBarUpdate(callback: (Int32, Float64) -> ComputedBarAttribute): This {
        let wrapper = {
            index: Int32, offset: Float64 => callback(index, offset)
        }
        let lambdaData = Callback2Param<Int32, Float64, ComputedBarAttribute>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollBarUpdate(lambdaData.getID())
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
    public func onReachStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnReachStart(Callback0Param<Unit>(callback).getID())
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
    public func onReachEnd(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnReachEnd(Callback0Param<Unit>(callback).getID())
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
    public func onScrollFrameBegin(callback: (Float64, ScrollState) -> OffsetOption): This {
        let wrapper = {
            offset: Float64, scrollState: Int32 => callback(offset, ScrollState.parseValue(scrollState))
        }
        let lambdaData = Callback2Param<Float64, Int32, OffsetOption>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollFrameBegin(lambdaData.getID())
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
    public func onScrollStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollStart(Callback0Param<Unit>(callback).getID())
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
    public func onScrollStop(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollStop(Callback0Param<Unit>(callback).getID())
        }
        this
    }
}
