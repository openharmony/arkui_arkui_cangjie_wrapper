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
    func FfiOHOSAceFrameworkWaterFlowSetColumnsTemplate(content: CString): Unit

    func FfiOHOSAceFrameworkWaterFlowSetRowsTemplate(content: CString): Unit

    func FfiOHOSAceFrameworkWaterFlowScrollBar(value: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowScrollBarColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkWaterFlowScrollBarWidth(value: Float64, valueUnit: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowEdgeEffect(value: Int32, isEnabled: Bool): Unit

    func FfiOHOSAceFrameworkWaterFlowSetItemConstraintSize(minWidth: Float64, minWidthUnit: Int32, maxWidth: Float64,
        maxWidthUnit: Int32, minHeight: Float64, minHeightUnit: Int32, maxHeight: Float64, maxHeightUnit: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowSetColumnsGap(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowSetRowsGap(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowSetFriction(value: Float64): Unit

    func FfiOHOSAceFrameworkWaterFlowSetLayoutDirection(value: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowSetCachedCount(value: Int32, show: Bool): Unit

    func FfiOHOSAceFrameworkWaterFlowSetScrollEnabled(value: Bool): Unit

    func FfiOHOSAceFrameworkWaterFlowSetNestedScroll(forward: Int32, backward: Int32): Unit

    func FfiOHOSAceFrameworkWaterFlowSetOnReachStartCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkWaterFlowSetOnReachEndCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkWaterFlowOnScrollStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkWaterFlowOnScrollStop(callback: Int64): Unit

    func FfiOHOSAceFrameworkWaterFlowSetOnScrollFrameBegin(callback: Int64): Unit

    func FfiOHOSAceFrameworkWaterFlowSetScrollIndexCallback(callback: Int64): Unit

    func FfiOHOSAceFrameworkWaterFlowSectionsCreate(): Int64

    func FfiOHOSAceFrameworkWaterFlowSectionsSplice(selfID: Int64, start: Int32, deleteCount: UInt32,
        sections: CArrNativeSectionOptions): Bool

    func FfiOHOSAceFrameworkWaterFlowSectionsPush(selfID: Int64, section: NativeSectionOptions): Bool

    func FfiOHOSAceFrameworkWaterFlowSectionsUpdate(selfID: Int64, sectionIndex: UInt32, section: NativeSectionOptions): Bool

    func FfiOHOSAceFrameworkWaterFlowSectionsLength(selfID: Int64): UInt32

    func FfiOHOSAceFrameworkWaterFlowSectionsValue(selfID: Int64, sections: CArrNativeSectionOptions): Unit

    func FfiOHOSAceFrameworkWaterFlowCreate(
        footer: Int64,
        scrollerID: Int64,
        scroollerHasValue: Bool,
        sectionID: Int64,
        sectionIDHasValue: Bool,
        direction: Int32
    ): Unit

    func FfiOHOSAceFrameworkFlowItemCreate(): Unit
}

@C
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func WaterFlowSectionsVoidFunc(a: Float64): Int32 {
    return Int32(a)
}

@C
struct NativeSectionOptions {
    NativeSectionOptions(
        var itemsCount: UInt32,
        var crossCount: Int32,
        var onGetItemMainSizeByIndex: Int64,
        var onGetItemMainSizeByIndexHasValue: Bool,
        var columnsGapValue: Float64,
        var columnsGapUnit: Int32,
        var columnsGapHasValue: Bool,
        var rowsGapValue: Float64,
        var rowsGapUnit: Int32,
        var rowsGapHasValue: Bool,
        var margin: CJEdge,
        var onGetItemMainSizeByIndexBack: CFunc<(Float64) -> Int32>
    ) {}

    func toSectionOptions(): SectionOptions {
        SectionOptions(
            itemsCount: this.itemsCount,
            margin: Margin(
                top: generateLength(margin.top, margin.topUnit),
                right: generateLength(margin.right, margin.rightUnit),
                bottom: generateLength(margin.bottom, margin.bottomUnit),
                left: generateLength(margin.left, margin.leftUnit)
            ),
            onGetItemMainSizeByIndex: (if (onGetItemMainSizeByIndexHasValue) {
                {a: Float64 => unsafe { onGetItemMainSizeByIndexBack(a) }}
            } else {
                None
            }),
            crossCount: this.crossCount,
            columnsGap: (if (columnsGapHasValue) {
                generateLength(columnsGapValue, columnsGapUnit)
            } else {
                None
            }),
            rowsGap: (if (rowsGapHasValue) {
                generateLength(rowsGapValue, rowsGapUnit)
            } else {
                None
            })
        )
    }

    func generateLength(margin: Float64, unit: Int32): Length {
        match (unit) {
            case 0 => margin.px
            case 1 => margin.vp
            case 2 => margin.fp
            case 3 => margin.percent
            case 4 => margin.lpx
            case _ => throw IllegalArgumentException("Unreachable")
        }
    }
}

@C
struct CArrNativeSectionOptions {
    CArrNativeSectionOptions(
        let head: CPointer<NativeSectionOptions>,
        let size: Int64
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SectionOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var itemsCount: UInt32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var crossCount: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var columnsGap: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rowsGap: Option<Length>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var margin: Margin
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onGetItemMainSizeByIndex: Option<(Float64) -> Int32>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        itemsCount!: UInt32,
        margin!: Margin,
        onGetItemMainSizeByIndex!: Option<(Float64) -> Int32> = None,
        crossCount!: Int32 = 1,
        columnsGap!: Option<Length> = None,
        rowsGap!: Option<Length> = None
    ) {
        this.itemsCount = itemsCount
        if (crossCount < 0) {
            this.crossCount = 1
        } else {
            this.crossCount = crossCount
        }
        match (columnsGap) {
            case Some(v) =>
                if (v.value < Float64(0)) {
                    this.columnsGap = 0.vp
                }
                this.columnsGap = v
            case _ => this.columnsGap = None
        }
        match (rowsGap) {
            case Some(v) =>
                if (v.value < Float64(0)) {
                    this.rowsGap = 0.vp
                }
                this.rowsGap = v
            case _ => this.rowsGap = None
        }
        this.margin = margin
        this.onGetItemMainSizeByIndex = onGetItemMainSizeByIndex
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        itemsCount!: UInt32,
        margin!: Length = 0.vp,
        onGetItemMainSizeByIndex!: Option<(Float64) -> Int32> = None,
        crossCount!: Int32 = 1,
        columnsGap!: Option<Length> = None,
        rowsGap!: Option<Length> = None
    ) {
        this.itemsCount = itemsCount
        if (crossCount < 0) {
            this.crossCount = 1
        } else {
            this.crossCount = crossCount
        }
        match (columnsGap) {
            case Some(v) =>
                if (v.value < Float64(0)) {
                    this.columnsGap = 0.vp
                }
                this.columnsGap = v
            case _ => this.columnsGap = None
        }
        match (rowsGap) {
            case Some(v) =>
                if (v.value < Float64(0)) {
                    this.rowsGap = 0.vp
                }
                this.rowsGap = v
            case _ => this.rowsGap = None
        }
        var margin_ = transAppResourceToLength(margin)
        this.margin = Margin(top: margin_, right: margin_, bottom: margin_, left: margin_)
        this.onGetItemMainSizeByIndex = onGetItemMainSizeByIndex
    }

    func toNative(): NativeSectionOptions {
        var onGetItemMainSizeByIndexID: Int64
        var onGetItemMainSizeByIndexHasValue: Bool
        if (let Some(v) <- onGetItemMainSizeByIndex) {
            let wrapper = {
                value: Int32 => Float32(v(Float64(value)))
            }
            let lambdaData = Callback1Param<Int32, Float32>(wrapper)
            onGetItemMainSizeByIndexID = lambdaData.getID()
            onGetItemMainSizeByIndexHasValue = true
        } else {
            onGetItemMainSizeByIndexID = 0
            onGetItemMainSizeByIndexHasValue = false
        }

        var columnsGapValue: Float64
        var columnsGapUnit: Int32
        var columnsGapHasValue: Bool
        if (let Some(v) <- columnsGap) {
            columnsGapValue = v.value
            columnsGapUnit = v.unitType.getValue()
            columnsGapHasValue = true
        } else {
            columnsGapValue = Float64(0)
            columnsGapUnit = 0
            columnsGapHasValue = false
        }

        var rowsGapValue: Float64
        var rowsGapUnit: Int32
        var rowsGapHasValue: Bool
        if (let Some(v) <- rowsGap) {
            rowsGapValue = v.value
            rowsGapUnit = v.unitType.getValue()
            rowsGapHasValue = true
        } else {
            rowsGapValue = Float64(0)
            rowsGapUnit = 0
            rowsGapHasValue = false
        }

        NativeSectionOptions(
            itemsCount,
            crossCount,
            onGetItemMainSizeByIndexID,
            onGetItemMainSizeByIndexHasValue,
            columnsGapValue,
            columnsGapUnit,
            columnsGapHasValue,
            rowsGapValue,
            rowsGapUnit,
            rowsGapHasValue,
            CJEdge(
                margin.top.value,
                margin.top.unitType.getValue(),
                margin.right.value,
                margin.right.unitType.getValue(),
                margin.bottom.value,
                margin.bottom.unitType.getValue(),
                margin.left.value,
                margin.left.unitType.getValue()
            ),
            WaterFlowSectionsVoidFunc
        )
    }
}

func freeCArrNativeSectionOptions(arr: CArrNativeSectionOptions) {
    if (arr.size > 0) {
        unsafe {
            LibC.free(arr.head)
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
public class WaterFlowSections <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe { FfiOHOSAceFrameworkWaterFlowSectionsCreate() })
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
    public func splice(start: Int32, deleteCount: UInt32, sections: Array<SectionOptions>): Bool {
        var arr: CPointer<NativeSectionOptions> = unsafe { LibC.malloc<NativeSectionOptions>(count: sections.size) }
        for (i in 0..sections.size) {
            unsafe {
                arr.write(i, sections[i].toNative())
            }
        }
        var cArr = CArrNativeSectionOptions(arr, sections.size)
        var result = unsafe { FfiOHOSAceFrameworkWaterFlowSectionsSplice(this.getID(), start, deleteCount, cArr) }
        freeCArrNativeSectionOptions(cArr)
        return result
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func push(section: SectionOptions): Bool {
        var result = unsafe { FfiOHOSAceFrameworkWaterFlowSectionsPush(this.getID(), section.toNative()) }
        return result
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func update(sectionIndex: UInt32, section: SectionOptions): Bool {
        var result = unsafe { FfiOHOSAceFrameworkWaterFlowSectionsUpdate(this.getID(), sectionIndex, section.toNative()) }
        return result
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func value(): Array<SectionOptions> {
        var arrSize = this.length()
        var arr: CPointer<NativeSectionOptions> = unsafe { LibC.malloc<NativeSectionOptions>(count: Int64(arrSize)) }
        var cArr = CArrNativeSectionOptions(arr, Int64(arrSize))
        var result: ArrayList<SectionOptions> = ArrayList<SectionOptions>()
        unsafe { FfiOHOSAceFrameworkWaterFlowSectionsValue(this.getID(), cArr) }
        for (i in 0..arrSize) {
            unsafe {
                result.add(cArr.head.read(Int64(i)).toSectionOptions())
            }
        }
        return result.toArray()
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func length(): UInt32 {
        var length = unsafe { FfiOHOSAceFrameworkWaterFlowSectionsLength(this.getID()) }
        return length
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum WaterFlowDirection {
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
public enum WaterFlowLayoutMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ALWAYS_TOP_DOWN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SLIDING_WINDOW
    | ...

    func getValue(): Int32 {
        match (this) {
            case ALWAYS_TOP_DOWN => 0
            case SLIDING_WINDOW => 1
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
public class FlowItem <: ContainerBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkFlowItemCreate()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkFlowItemCreate()
        }
        this.child = child
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class WaterFlow <: ScrollableBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        footer!: () -> Unit = {=>},
        scroller!: ?Scroller = None,
        waterFlowSections!: ?WaterFlowSections = None,
        layoutMode!: WaterFlowLayoutMode = WaterFlowLayoutMode.ALWAYS_TOP_DOWN
    ) {
        unsafe {
            FfiOHOSAceFrameworkWaterFlowCreate(
                Callback0Param<Unit>(footer).getID(),
                (if (let Some(v) <- scroller) {
                    v.getID()
                } else {
                    0
                }),
                (if (let Some(v) <- scroller) {
                    true
                } else {
                    false
                }),
                (if (let Some(v) <- waterFlowSections) {
                    v.getID()
                } else {
                    0
                }),
                (if (let Some(v) <- waterFlowSections) {
                    true
                } else {
                    false
                }),
                layoutMode.getValue()
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
    public init(
        footer!: () -> Unit = {=>},
        scroller!: ?Scroller = None,
        waterFlowSections!: ?WaterFlowSections = None,
        layoutMode!: WaterFlowLayoutMode = WaterFlowLayoutMode.ALWAYS_TOP_DOWN,
        child!: () -> Unit
    ) {
        unsafe {
            FfiOHOSAceFrameworkWaterFlowCreate(
                Callback0Param<Unit>(footer).getID(),
                (if (let Some(v) <- scroller) {
                    v.getID()
                } else {
                    0
                }),
                (if (let Some(v) <- scroller) {
                    true
                } else {
                    false
                }),
                (if (let Some(v) <- waterFlowSections) {
                    v.getID()
                } else {
                    0
                }),
                (if (let Some(v) <- waterFlowSections) {
                    true
                } else {
                    false
                }),
                layoutMode.getValue()
            )
        }
        this.child = child
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsGap(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetColumnsGap(value_.value, value_.unitType.getValue());
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
    public func rowsGap(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetRowsGap(size_.value, size_.unitType.getValue());
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
    public func layoutDirection(value: FlexDirection): This {
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetLayoutDirection(value.getValue());
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
    public func cachedCount(value: Int32, show: Bool): This {
        var para: Int32
        if (value < 0) {
            para = 1
        } else {
            para = value
        }
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetCachedCount(para, show);
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
    public func columnsTemplate(value: String): This {
        unsafe {
            let unsafeContent: CString
            if (value == "") {
                unsafeContent = LibC.mallocCString("1fr")
            } else {
                unsafeContent = LibC.mallocCString(value)
            }
            FfiOHOSAceFrameworkWaterFlowSetColumnsTemplate(unsafeContent)
            LibC.free(unsafeContent)
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
    public func rowsTemplate(value: String): This {
        unsafe {
            let unsafeContent: CString
            if (value == "") {
                unsafeContent = LibC.mallocCString("1fr")
            } else {
                unsafeContent = LibC.mallocCString(value)
            }
            FfiOHOSAceFrameworkWaterFlowSetRowsTemplate(unsafeContent)
            LibC.free(unsafeContent)
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
            FfiOHOSAceFrameworkWaterFlowScrollBar(value.getValue())
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
            FfiOHOSAceFrameworkWaterFlowScrollBarColor(transAppResourceToResourceColor(color))
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
            FfiOHOSAceFrameworkWaterFlowScrollBarWidth(value_.value, value_.unitType.getValue())
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
            FfiOHOSAceFrameworkWaterFlowEdgeEffect(value.getValue(), false)
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
    public func itemConstraintSize(minWidth: Length, maxWidth: Length, minHeight: Length, maxHeight: Length): This {
        var minWidth_ = transAppResourceToLength(minWidth)
        var maxWidth_ = transAppResourceToLength(maxWidth)
        var minHeight_ = transAppResourceToLength(minHeight)
        var maxHeight_ = transAppResourceToLength(maxHeight)
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetItemConstraintSize(minWidth_.value, minWidth_.unitType.getValue(),
                maxWidth_.value, maxWidth_.unitType.getValue(), minHeight_.value, minHeight_.unitType.getValue(),
                maxHeight_.value, maxHeight_.unitType.getValue());
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
    public func nestedScroll(
        scrollForward!: NestedScrollMode = NestedScrollMode.SELF_ONLY,
        scrollBackward!: NestedScrollMode = NestedScrollMode.SELF_ONLY
    ): This {
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetNestedScroll(scrollForward.getValue(), scrollBackward.getValue())
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
        nestedScroll(scrollForward: value.scrollForward, scrollBackward: value.scrollBackward)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetScrollEnabled(value);
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
            FfiOHOSAceFrameworkWaterFlowSetFriction(value)
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
    public func onReachStart(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetOnReachStartCallback(lambdaData.getID())
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
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetOnReachEndCallback(lambdaData.getID())
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
            FfiOHOSAceFrameworkWaterFlowOnScrollStart(Callback0Param<Unit>(callback).getID())
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
            FfiOHOSAceFrameworkWaterFlowOnScrollStop(Callback0Param<Unit>(callback).getID())
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
    public func onScrollFrameBegin(callback: (Float64, ScrollState) -> Float64): This {
        let wrapper = {
            offset: Float64, state: Int32 => callback(offset, ScrollState.parseValue(state))
        }
        let lambdaData = Callback2Param<Float64, Int32, Float64>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetOnScrollFrameBegin(lambdaData.getID())
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
    public func onScrollIndex(callback: (Int32, Int32) -> Unit): This {
        let lambdaData = Callback2Param<Int32, Int32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkWaterFlowSetScrollIndexCallback(lambdaData.getID())
        }
        this
    }
}
