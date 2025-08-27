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

package ohos.arkui.component.grid_row

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkGridRowCreate(): Unit

    func FfiOHOSAceFrameworkGridRowCreateWithFloat64Int32(createOption: GridRowCreateWithFloat64Int32): Unit

    func FfiOHOSAceFrameworkGridRowCreateWithFloat64ColumnOption(createOption: GridRowCreateWithFloat64ColumnOption): Unit

    func FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionColumnOption(
        createOption: GridRowCreateWithFloat64OptionColumnOption): Unit

    func FfiOHOSAceFrameworkGridRowCreateWithSizeOptionColumnOption(
        createOption: GridRowCreateWithSizeOptionColumnOption): Unit

    func FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionInt32(createOption: GridRowCreateWithFloat64OptionInt32): Unit

    func FfiOHOSAceFrameworkGridRowCreateWithSizeOptionInt32(createOption: GridRowCreateWithSizeOptionInt32): Unit

    func FfiOHOSAceFrameworkGridRowSetHeight(height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkGridRowBreakpointEvent(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridRowAlignItem(value: Int32): Unit
}

enum GridRowGutter {
    GUTTERLENGTH(GutterLength)
    | GUTTEROPTION(GutterSizeOption)
}

struct GutterLength {
    let x: Length
    let y: Length
    GutterLength(x: Length, y: Length) {
        this.x = transAppResourceToLength(x)
        this.y = transAppResourceToLength(y)
    }
}

struct GutterSizeOption {
    let x: GridRowSizeOption
    let y: GridRowSizeOption
    GutterSizeOption(x: GridRowSizeOption, y: GridRowSizeOption) {
        this.x = x
        this.y = y
    }
}

/**
 * Defines the direction of grid-container component.
 *
 * @relation enum GridRowDirection
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GridRowDirection {
    /**
    * The elements in the grid component are arranged in rows
    *
    * @relation Row
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Row
    |
    /**
    * The elements in the grid component are arranged in reverse order of rows
    *
    * @relation RowReverse
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse
    | ...

    func getValue(): Int32 {
        match (this) {
            case Row => 0
            case RowReverse => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the breakpoint reference of grid-container component.
 *
 * @relation enum BreakpointsReference
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BreakpointsReference {
    /**
    * Respond to breakpoint changes according to window width
    *
    * @relation WindowSize
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WindowSize
    |
    /**
    * Respond to breakpoint changes according to component width
    *
    * @relation ComponentSize
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentSize
    | ...

    func getValue(): Int32 {
        match (this) {
            case WindowSize => 0
            case ComponentSize => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the option in length unit of grid-row component.
 *
 * @relation interface GridRowSizeOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRowSizeOption {
    /**
    * Grid Row Size Option xs, select xs gutter size based on gridRow current breakpoint
    *
    * @type { Length }
    * @relation xs?: Length
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: Length
    /**
    * Grid Row Size Option sm, select sm gutter size based on gridRow current breakpoint
    *
    * @type { Length }
    * @relation sm?: Length
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: Length
    /**
    * Grid Row Size Option md, select md gutter size based on gridRow current breakpoint
    *
    * @type { Length }
    * @relation md?: Length
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: Length
    /**
    * Grid Row Size Option lg, select lg gutter size based on gridRow current breakpoint
    *
    * @type { Length }
    * @relation lg?: Length
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: Length
    /**
    * Grid Row Size Option xl, select xl gutter size based on gridRow current breakpoint
    *
    * @type { Length }
    * @relation xl?: Length
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: Length
    /**
    * Grid Row Size Option xxl, select xxl gutter size based on gridRow current breakpoint
    *
    * @type { Length }
    * @relation xxl?: Length
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: Length

    /**
    * Defines the constructor of GridRowSizeOption.
    *
    * @param { Length } xs
    * @param { Length } sm
    * @param { Length } md
    * @param { Length } lg
    * @param { Length } xl
    * @param { Length } xxl
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        xs!: Length = 0.vp,
        sm!: Length = 0.vp,
        md!: Length = 0.vp,
        lg!: Length = 0.vp,
        xl!: Length = 0.vp,
        xxl!: Length = 0.vp
    ) {
        this.xs = transAppResourceToLength(xs)
        this.sm = transAppResourceToLength(sm)
        this.md = transAppResourceToLength(md)
        this.lg = transAppResourceToLength(lg)
        this.xl = transAppResourceToLength(xl)
        this.xxl = transAppResourceToLength(xxl)
    }

    /**
    * Defines the constructor of GridRowSizeOption.
    *
    * @param { Length } value
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: Length) {
        this.xs = transAppResourceToLength(value)
        this.sm = transAppResourceToLength(value)
        this.md = transAppResourceToLength(value)
        this.lg = transAppResourceToLength(value)
        this.xl = transAppResourceToLength(value)
        this.xxl = transAppResourceToLength(value)
    }

    func toAtC(): AtCGridRowSizeOption {
        AtCGridRowSizeOption(
            xs.value,
            xs.unitType.getValue(),
            sm.value,
            sm.unitType.getValue(),
            md.value,
            md.unitType.getValue(),
            lg.value,
            lg.unitType.getValue(),
            xl.value,
            xl.unitType.getValue(),
            xxl.value,
            xxl.unitType.getValue()
        )
    }
}

@C
struct AtCGridRowSizeOption {
    AtCGridRowSizeOption(
        let xs: Float64,
        let xsUnit: Int32,
        let sm: Float64,
        let smUnit: Int32,
        let md: Float64,
        let mdUnit: Int32,
        let lg: Float64,
        let lgUnit: Int32,
        let xl: Float64,
        let xlUnit: Int32,
        let xxl: Float64,
        let xxlUnit: Int32
    ) {}
}

@C
struct NativeGridRowColumnOption {
    let xs: Int32
    let sm: Int32
    let md: Int32
    let lg: Int32
    let xl: Int32
    let xxl: Int32
    NativeGridRowColumnOption(xs: Int32, sm: Int32, md: Int32,
        lg: Int32, xl: Int32, xxl: Int32) {
        this.xs = xs
        this.sm = sm
        this.md = md
        this.lg = lg
        this.xl = xl
        this.xxl = xxl
    }
}

/**
 * Defines the option in number unit of grid-container component.
 *
 * @relation interface GridRowColumnOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRowColumnOption {
    /**
    * Grid Row Column Option xs, select xs column num based on gridRow current breakpoint
    *
    * @type { Int32 }
    * @relation xs?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: Int32

    /**
     * Grid Row Column Option sm, select sm column num based on gridRow current breakpoint
    *
    * @type { Int32 }
    * @relation sm?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: Int32

    /**
    * Grid Row Column Option md, select md column num based on gridRow current breakpoint
    *
    * @type { Int32 }
    * @relation md?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: Int32

    /**
    * Grid Row Column Option lg, select lg column num based on gridRow current breakpoint
    *
    * @type { Int32 }
    * @relation lg?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: Int32

    /**
    * Grid Row Column Option xl, select xl column num based on gridRow current breakpoint
    *
    * @type { Int32 }
    * @relation xl?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: Int32

    /**
    * Grid Row Column Option xxl, select xxl column num based on gridRow current breakpoint
    *
    * @type { Int32 }
    * @relation xxl?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: Int32

    /**
    * Defines the constructor of GridRowColumnOption.
    *
    * @param { Int32 } xs
    * @param { Int32 } sm
    * @param { Int32 } md
    * @param { Int32 } lg
    * @param { Int32 } xl
    * @param { Int32 } xxl
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        xs!: Int32 = 2,
        sm!: Int32 = 4,
        md!: Int32 = 8,
        lg!: Int32 = 12,
        xl!: Int32 = 12,
        xxl!: Int32 = 12
    ) {
        this.xs = xs
        this.sm = sm
        this.md = md
        this.lg = lg
        this.xl = xl
        this.xxl = xxl
    }

    /**
    * Defines the constructor of GridRowColumnOption.
    *
    * @param { Int32 } value
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: Int32) {
        this.xs = value
        this.sm = value
        this.md = value
        this.lg = value
        this.xl = value
        this.xxl = value
    }

    func parseToNative(): NativeGridRowColumnOption {
        NativeGridRowColumnOption(this.xs, this.sm, this.md,
            this.lg, this.xl, this.xxl)
    }
}

/**
 * Defines the gutter of grid-row component.
 *
 * @relation interface GutterOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GutterOption {
    let data: GridRowGutter
    /**
    * Defines the constructor of GutterOption.
    *
    * @param { Length } x
    * @param { Length } y
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Length, y!: Length) {
        this.data = GridRowGutter.GUTTERLENGTH(GutterLength(x, y))
    }

    /**
    * Defines the constructor of GutterOption.
    *
    * @param { GridRowSizeOption } x
    * @param { GridRowSizeOption } y
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: GridRowSizeOption, y!: GridRowSizeOption) {
        this.data = GridRowGutter.GUTTEROPTION(GutterSizeOption(x, y))
    }
}

/**
 * Defines the breakpoints of grid-row component.
 *
 * @relation interface BreakPoints
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BreakPoints {
    /**
    * Breakpoint array
    *
    * @type { Array<Length> }
    * @relation value?: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: Array<Length>

    /**
    * Set breakpoint reference
    *
    * @type { BreakpointsReference }
    * @relation reference?: BreakpointsReference
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var reference: BreakpointsReference

    /**
    * BreakPoints constructor.
    *
    * @param { Array<Length> } value
    * @returns { This } value
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: Array<Length> = [320.vp, 600.vp, 840.vp],
        reference!: BreakpointsReference = BreakpointsReference.WindowSize
    ) {
        this.value = value
        this.reference = reference
    }
}

@C
struct GridRowCreateWithFloat64Int32 {
    GridRowCreateWithFloat64Int32(
        let gutterValue: Float64,
        let gutterUnit: Int32,
        let columns: Int32,
        let breakpointVals: VectorFloat64Handle,
        let breakpointUnits: VectorInt32Handle,
        let breakpointReference: Int32,
        let direction: Int32
    ) {}
}

@C
struct GridRowCreateWithFloat64ColumnOption {
    GridRowCreateWithFloat64ColumnOption(
        let gutterValue: Float64,
        let gutterUnit: Int32,
        let columns: NativeGridRowColumnOption,
        let breakpointVals: VectorFloat64Handle,
        let breakpointUnits: VectorInt32Handle,
        let breakpointReference: Int32,
        let direction: Int32
    ) {}
}

@C
struct GridRowCreateWithFloat64OptionColumnOption {
    GridRowCreateWithFloat64OptionColumnOption(
        let x: Float64,
        let xUnit: Int32,
        let y: Float64,
        let yUnit: Int32,
        let columns: NativeGridRowColumnOption,
        let breakpointVals: VectorFloat64Handle,
        let breakpointUnits: VectorInt32Handle,
        let breakpointReference: Int32,
        let direction: Int32
    ) {}
}

@C
struct GridRowCreateWithSizeOptionColumnOption {
    GridRowCreateWithSizeOptionColumnOption(
        let x: AtCGridRowSizeOption,
        let Y: AtCGridRowSizeOption,
        let columns: NativeGridRowColumnOption,
        let breakpointVals: VectorFloat64Handle,
        let breakpointUnits: VectorInt32Handle,
        let breakpointReference: Int32,
        let direction: Int32
    ) {}
}

@C
struct GridRowCreateWithFloat64OptionInt32 {
    GridRowCreateWithFloat64OptionInt32(
        let x: Float64,
        let xUnit: Int32,
        let Y: Float64,
        let yUnit: Int32,
        let columns: Int32,
        let breakpointVals: VectorFloat64Handle,
        let breakpointUnits: VectorInt32Handle,
        let breakpointReference: Int32,
        let direction: Int32
    ) {}
}

@C
struct GridRowCreateWithSizeOptionInt32 {
    GridRowCreateWithSizeOptionInt32(
        let x: AtCGridRowSizeOption,
        let Y: AtCGridRowSizeOption,
        let columns: Int32,
        let breakpointVals: VectorFloat64Handle,
        let breakpointUnits: VectorInt32Handle,
        let breakpointReference: Int32,
        let direction: Int32
    ) {}
}

/**
 * Defines GridRow Component.
 *
 * @relation const GridRow: GridRowInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRow <: ContainerBase {
    /**
    * Defines the constructor of GridRow.
    * 
    * @param { Int32 } columns
    * @param { Length } gutter
    * @param { BreakPoints } breakpoints
    * @param { GridRowDirection } direction
    * @param { () -> Unit } child
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: Int32 = 12,
        gutter!: Length = 0.vp,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.Row,
        child!: () -> Unit = {=>}
    ) {
        var gutter_ = transAppResourceToLength(gutter)
        let valuesHandle = FFIVectorFloat64(breakpoints.value.size)
        let unitsHandle = FFIVectorInt32(breakpoints.value.size)
        for (i in 0..breakpoints.value.size) {
            valuesHandle.setElement(i, breakpoints.value[i].value)
            unitsHandle.setElement(i, breakpoints.value[i].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkGridRowCreateWithFloat64Int32(
                GridRowCreateWithFloat64Int32(
                    gutter_.value,
                    gutter_.unitType.getValue(),
                    columns,
                    valuesHandle.getNativeHandle(),
                    unitsHandle.getNativeHandle(),
                    breakpoints.reference.getValue(),
                    direction.getValue()
                )
            )
            valuesHandle.free()
            unitsHandle.free()
        }
        this.child = child
    }

    /**
    * Defines the constructor of GridRow.
    * 
    * @param { GridRowColumnOption } columns
    * @param { Length } gutter
    * @param { BreakPoints } breakpoints
    * @param { GridRowDirection } direction
    * @param { () -> Unit } child
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: GridRowColumnOption,
        gutter!: Length = 0.vp,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.Row,
        child!: () -> Unit = {=>}
    ) {
        var gutter_ = transAppResourceToLength(gutter)
        let valuesHandle = FFIVectorFloat64(breakpoints.value.size)
        let unitsHandle = FFIVectorInt32(breakpoints.value.size)
        for (i in 0..breakpoints.value.size) {
            valuesHandle.setElement(i, breakpoints.value[i].value)
            unitsHandle.setElement(i, breakpoints.value[i].unitType.getValue())
        }
        unsafe {
            let nativeColumns = columns.parseToNative()
            FfiOHOSAceFrameworkGridRowCreateWithFloat64ColumnOption(
                GridRowCreateWithFloat64ColumnOption(
                    gutter_.value,
                    gutter_.unitType.getValue(),
                    nativeColumns,
                    valuesHandle.getNativeHandle(),
                    unitsHandle.getNativeHandle(),
                    breakpoints.reference.getValue(),
                    direction.getValue()
                )
            )
            valuesHandle.free()
            unitsHandle.free()
        }
        this.child = child
    }

    /**
    * Defines the constructor of GridRow.
    * 
    * @param { Int32 } columns
    * @param { GutterOption } gutter
    * @param { BreakPoints } breakpoints
    * @param { GridRowDirection } direction
    * @param { () -> Unit } child
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: Int32 = 12,
        gutter!: GutterOption,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.Row,
        child!: () -> Unit = {=>}
    ) {
        let valuesHandle = FFIVectorFloat64(breakpoints.value.size)
        let unitsHandle = FFIVectorInt32(breakpoints.value.size)
        for (i in 0..breakpoints.value.size) {
            valuesHandle.setElement(i, breakpoints.value[i].value)
            unitsHandle.setElement(i, breakpoints.value[i].unitType.getValue())
        }
        match (gutter.data) {
            case GUTTERLENGTH(gutterValue) => unsafe {
                FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionInt32(
                    GridRowCreateWithFloat64OptionInt32(
                        gutterValue.x.value,
                        gutterValue.x.unitType.getValue(),
                        gutterValue.y.value,
                        gutterValue.y.unitType.getValue(),
                        columns,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        breakpoints.reference.getValue(),
                        direction.getValue()
                    )
                )
                valuesHandle.free()
                unitsHandle.free()
            }
            case GUTTEROPTION(gutterValue) => unsafe {
                FfiOHOSAceFrameworkGridRowCreateWithSizeOptionInt32(
                    GridRowCreateWithSizeOptionInt32(
                        gutterValue.x.toAtC(),
                        gutterValue.y.toAtC(),
                        columns,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        breakpoints.reference.getValue(),
                        direction.getValue()
                    )
                )
                valuesHandle.free()
                unitsHandle.free()
            }
        }
        this.child = child
    }

    /**
    * Defines the constructor of GridRow.
    * 
    * @param { GridRowColumnOption } columns
    * @param { GutterOption } gutter
    * @param { BreakPoints } breakpoints
    * @param { GridRowDirection } direction
    * @param { () -> Unit } child
    * @returns { This }
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: GridRowColumnOption,
        gutter!: GutterOption,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.Row,
        child!: () -> Unit = {=>}
    ) {

        let valuesHandle = FFIVectorFloat64(breakpoints.value.size)
        let unitsHandle = FFIVectorInt32(breakpoints.value.size)
        for (i in 0..breakpoints.value.size) {
            valuesHandle.setElement(i, breakpoints.value[i].value)
            unitsHandle.setElement(i, breakpoints.value[i].unitType.getValue())
        }
        match (gutter.data) {
            case GUTTERLENGTH(gutterValue) => unsafe {
                let nativeColumns = columns.parseToNative()
                FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionColumnOption(
                    GridRowCreateWithFloat64OptionColumnOption(
                        gutterValue.x.value,
                        gutterValue.x.unitType.getValue(),
                        gutterValue.y.value,
                        gutterValue.y.unitType.getValue(),
                        nativeColumns,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        breakpoints.reference.getValue(),
                        direction.getValue()
                    )
                )
                valuesHandle.free()
                unitsHandle.free()
            }
            case GUTTEROPTION(gutterValue) => unsafe {
                let nativeColumns = columns.parseToNative()
                FfiOHOSAceFrameworkGridRowCreateWithSizeOptionColumnOption(
                    GridRowCreateWithSizeOptionColumnOption(
                        gutterValue.x.toAtC(),
                        gutterValue.y.toAtC(),
                        nativeColumns,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        breakpoints.reference.getValue(),
                        direction.getValue()
                    )
                )
                valuesHandle.free()
                unitsHandle.free()
            }
        }
        this.child = child
    }

    protected override func heightInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkGridRowSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
    * Cross axis alignment of each line in GridRow.
    *
    * @param { ItemAlign } value - element alignment
    * @returns { This }
    * @relation alignItems(value: ItemAlign): GridRowAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignItems(value: ItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkGridRowAlignItem(value.getValue())
        }
        this
    }

    /**
    * Callback triggered when the breakpoint changes, breakpoints value can be xs, sm, md, lg, xl, xxl
    *
    * @param { (String) -> Unit } callback
    * @returns { This }
    * @relation onBreakpointChange(callback: (breakpoints: string) => void): GridRowAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBreakpointChange(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGridRowBreakpointEvent(lambdaData.getID())
        }
        this
    }
}
