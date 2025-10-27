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

package ohos.arkui.component.grid_row

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.business_exception.BusinessException
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

    func FFISetHeightWithEmpty(): Unit
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
    let x: GridRowSizeOptions
    let y: GridRowSizeOptions
    GutterSizeOption(x: GridRowSizeOptions, y: GridRowSizeOptions) {
        this.x = x
        this.y = y
    }
}

/**
 * Defines the direction of grid-container component.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GridRowDirection {
    /**
     * The elements in the grid component are arranged in rows
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Row
    |
    /**
     * The elements in the grid component are arranged in reverse order of rows
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse
    | ...

    func getValue(): Int32 {
        match (this) {
            case Row => 0
            case RowReverse => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the breakpoint reference of grid-container component.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BreakpointsReference {
    /**
     * Respond to breakpoint changes according to window width
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WindowSize
    |
    /**
     * Respond to breakpoint changes according to component width
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ComponentSize
    | ...

    func getValue(): Int32 {
        match (this) {
            case WindowSize => 0
            case ComponentSize => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Defines the option in length unit of grid-row component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRowSizeOptions {
    /**
     * Grid Row Size Option xs, select xs gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: ?Length
    /**
     * Grid Row Size Option sm, select sm gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: ?Length
    /**
     * Grid Row Size Option md, select md gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: ?Length
    /**
     * Grid Row Size Option lg, select lg gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: ?Length
    /**
     * Grid Row Size Option xl, select xl gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: ?Length
    /**
     * Grid Row Size Option xxl, select xxl gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: ?Length

    /**
     * Defines the constructor of GridRowSizeOptions.
     *
     * @param { ?Length } xs - Grid Row Size Option xs, select xs gutter size based on gridRow current breakpoint.
     * @param { ?Length } sm - Grid Row Size Option sm, select sm gutter size based on gridRow current breakpoint.
     * @param { ?Length } md - Grid Row Size Option md, select md gutter size based on gridRow current breakpoint.
     * @param { ?Length } lg - Grid Row Size Option lg, select lg gutter size based on gridRow current breakpoint.
     * @param { ?Length } xl - Grid Row Size Option xl, select xl gutter size based on gridRow current breakpoint.
     * @param { ?Length } xxl - Grid Row Size Option xxl, select xxl gutter size based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        xs!: ?Length = None,
        sm!: ?Length = None,
        md!: ?Length = None,
        lg!: ?Length = None,
        xl!: ?Length = None,
        xxl!: ?Length = None
    ) {
        this.xs = transAppResourceToLength(xs ?? 0.vp)
        this.sm = transAppResourceToLength(sm ?? 0.vp)
        this.md = transAppResourceToLength(md ?? 0.vp)
        this.lg = transAppResourceToLength(lg ?? 0.vp)
        this.xl = transAppResourceToLength(xl ?? 0.vp)
        this.xxl = transAppResourceToLength(xxl ?? 0.vp)
    }

    /**
    * Defines the constructor of GridRowSizeOptions.
    *
    * @param { ?Length } value - The value to set for all breakpoints.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?Length) {
        this.xs = transAppResourceToLength(value ?? 0.vp)
        this.sm = transAppResourceToLength(value ?? 0.vp)
        this.md = transAppResourceToLength(value ?? 0.vp)
        this.lg = transAppResourceToLength(value ?? 0.vp)
        this.xl = transAppResourceToLength(value ?? 0.vp)
        this.xxl = transAppResourceToLength(value ?? 0.vp)
    }

    func toAtC(): AtCGridRowSizeOption {
        AtCGridRowSizeOption(
            (xs ?? 0.vp).value,
            (xs ?? 0.vp).unitType.getValue(),
            (sm ?? 0.vp).value,
            (sm ?? 0.vp).unitType.getValue(),
            (md ?? 0.vp).value,
            (md ?? 0.vp).unitType.getValue(),
            (lg ?? 0.vp).value,
            (lg ?? 0.vp).unitType.getValue(),
            (xl ?? 0.vp).value,
            (xl ?? 0.vp).unitType.getValue(),
            (xxl ?? 0.vp).value,
            (xxl ?? 0.vp).unitType.getValue()
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
 * Defines the option in number unit of grid-row component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRowOptions {
    /**
     * Grid Row Column Option xs, select xs column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: ?Int32

    /**
     * Grid Row Column Option sm, select sm column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: ?Int32

    /**
     * Grid Row Column Option md, select md column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: ?Int32

    /**
     * Grid Row Column Option lg, select lg column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: ?Int32

    /**
     * Grid Row Column Option xl, select xl column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: ?Int32

    /**
     * Grid Row Column Option xxl, select xxl column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: ?Int32

    /**
     * Defines the constructor of GridRowOptions.
     *
     * @param { ?Int32 } xs - Grid Row Column Option xs, select xs column num based on gridRow current breakpoint.
     * @param { ?Int32 } sm - Grid Row Column Option sm, select sm column num based on gridRow current breakpoint.
     * @param { ?Int32 } md - Grid Row Column Option md, select md column num based on gridRow current breakpoint.
     * @param { ?Int32 } lg - Grid Row Column Option lg, select lg column num based on gridRow current breakpoint.
     * @param { ?Int32 } xl - Grid Row Column Option xl, select xl column num based on gridRow current breakpoint.
     * @param { ?Int32 } xxl - Grid Row Column Option xxl, select xxl column num based on gridRow current breakpoint.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        xs!: ?Int32 = None,
        sm!: ?Int32 = None,
        md!: ?Int32 = None,
        lg!: ?Int32 = None,
        xl!: ?Int32 = None,
        xxl!: ?Int32 = None
    ) {
        this.xs = xs ?? 2
        this.sm = sm ?? 4
        this.md = md ?? 8
        this.lg = lg ?? 12
        this.xl = xl ?? 12
        this.xxl = xxl ?? 12
    }

    /**
    * Defines the constructor of GridRowOptions.
    *
    * @param { ?Int32 } value - The value to set for all breakpoints.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?Int32) {
        this.xs = value ?? 12
        this.sm = value ?? 12
        this.md = value ?? 12
        this.lg = value ?? 12
        this.xl = value ?? 12
        this.xxl = value ?? 12
    }

    func parseToNative(): NativeGridRowColumnOption {
        NativeGridRowColumnOption(this.xs ?? 2, this.sm ?? 4, this.md ?? 8,
            this.lg ?? 12, this.xl ?? 12, this.xxl ?? 12)
    }
}

/**
 * Defines the gutter of grid-row component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GutterOptions {
    let data: GridRowGutter
    /**
    * Defines the constructor of GutterOptions.
    *
    * @param { ?Length } x - Horizontal spacing between grid items.
    * @param { ?Length } y - Vertical spacing between grid items.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?Length = None, y!: ?Length = None) {
        this.data = GridRowGutter.GUTTERLENGTH(GutterLength(x ?? 0.vp, y ?? 0.vp))
    }

    /**
    * Defines the constructor of GutterOptions.
    *
    * @param { ?GridRowSizeOptions } x - Horizontal spacing options between grid items.
    * @param { ?GridRowSizeOptions } y - Vertical spacing options between grid items.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: ?GridRowSizeOptions, y!: ?GridRowSizeOptions) {
        this.data = GridRowGutter.GUTTEROPTION(GutterSizeOption(x ?? GridRowSizeOptions(), y ?? GridRowSizeOptions()))
    }
}

/**
 * Defines the breakpoints of grid-row component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BreakPoints {
    /**
    * Breakpoint array.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: ?Array<Length>

    /**
    * Set breakpoint reference.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var reference: ?BreakpointsReference

    /**
    * BreakPoints constructor.
    *
    * @param { ?Array<Length> } value - Breakpoint array.
    * @param { ?BreakpointsReference } reference - Set breakpoint reference.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: ?Array<Length> = None,
        reference!: ?BreakpointsReference = None ) {
        this.value = value ?? [320.vp, 600.vp, 840.vp]
        this.reference = reference ?? BreakpointsReference.WindowSize
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
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRow <: CommonMethodComponent<GridRow> & GridRowAttribute {
    /**
    * Defines the constructor of GridRow.
    * 
    * @param { ?Int32 } columns - Sets the total number of columns in the current layout.
    * @param { ?Length } gutter - Layout spacing between sub-components.
    * @param { ?BreakPoints } breakpoints - Grid-row layout breakpoints.
    * @param { ?GridRowDirection } direction - Grid-row layout direction.
    * @param { () -> Unit } child - The child component of GridRow.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: ?Int32,
        gutter!: ?Length = None,
        breakpoints!: ?BreakPoints = Option.None,
        direction!: ?GridRowDirection = Option.None,
        child!: () -> Unit = {=>}
    ) {
        let tmpBreakpoints = breakpoints ?? BreakPoints()
        let tmpBreakpointsValue = tmpBreakpoints.value ?? [320.vp, 600.vp, 840.vp]
        let tmpDirection = direction ?? GridRowDirection.Row

        var gutter_ = transAppResourceToLength(gutter ?? 0.vp)
        let valuesHandle = FFIVectorFloat64(tmpBreakpointsValue.size)
        let unitsHandle = FFIVectorInt32(tmpBreakpointsValue.size)
        for (i in 0..tmpBreakpointsValue.size) {
            valuesHandle.setElement(i, tmpBreakpointsValue[i].value)
            unitsHandle.setElement(i, tmpBreakpointsValue[i].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkGridRowCreateWithFloat64Int32(
                GridRowCreateWithFloat64Int32(
                    gutter_.value,
                    gutter_.unitType.getValue(),
                    columns ?? 12,
                    valuesHandle.getNativeHandle(),
                    unitsHandle.getNativeHandle(),
                    (tmpBreakpoints.reference ?? BreakpointsReference.WindowSize).getValue(),
                    tmpDirection.getValue()
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
    * @param { ?GridRowOptions } columns - Sets the total number of columns in the current layout.
    * @param { ?Length } gutter - Layout spacing between sub-components.
    * @param { ?BreakPoints } breakpoints - Grid-row layout breakpoints.
    * @param { ?GridRowDirection } direction - Grid-row layout direction.
    * @param { () -> Unit } child - The child component of GridRow.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: ?GridRowOptions = None,
        gutter!: ?Length = None,
        breakpoints!: ?BreakPoints = Option.None,
        direction!: ?GridRowDirection = Option.None,
        child!: () -> Unit = {=>}
    ) {
        let tmpColumns = columns ?? GridRowOptions()
        let tmpBreakpoints = breakpoints ?? BreakPoints()
        let tmpBreakpointsValue = tmpBreakpoints.value ?? [320.vp, 600.vp, 840.vp]
        let tmpDirection = direction ?? GridRowDirection.Row

        var gutter_ = transAppResourceToLength(gutter ?? 0.vp)
        let valuesHandle = FFIVectorFloat64(tmpBreakpointsValue.size)
        let unitsHandle = FFIVectorInt32(tmpBreakpointsValue.size)
        for (i in 0..tmpBreakpointsValue.size) {
            valuesHandle.setElement(i, tmpBreakpointsValue[i].value)
            unitsHandle.setElement(i, tmpBreakpointsValue[i].unitType.getValue())
        }
        unsafe {
            let nativeColumns = tmpColumns.parseToNative()
            FfiOHOSAceFrameworkGridRowCreateWithFloat64ColumnOption(
                GridRowCreateWithFloat64ColumnOption(
                    gutter_.value,
                    gutter_.unitType.getValue(),
                    nativeColumns,
                    valuesHandle.getNativeHandle(),
                    unitsHandle.getNativeHandle(),
                    (tmpBreakpoints.reference ?? BreakpointsReference.WindowSize).getValue(),
                    tmpDirection.getValue()
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
     * @param { ?Int32 } columns - Sets the total number of columns in the current layout.
     * @param { ?GutterOptions } gutter - Layout spacing between sub-components.
     * @param { ?BreakPoints } breakpoints - Grid-row layout breakpoints.
     * @param { ?GridRowDirection } direction - Grid-row layout direction.
     * @param { () -> Unit } child - The child component of GridRow.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: ?Int32,
        gutter!: ?GutterOptions,
        breakpoints!: ?BreakPoints = Option.None,
        direction!: ?GridRowDirection = Option.None,
        child!: () -> Unit = {=>}
    ) {
        let tmpGutter = gutter ?? GutterOptions()
        let tmpBreakpoints = breakpoints ?? BreakPoints()
        let tmpBreakpointsValue = tmpBreakpoints.value ?? [320.vp, 600.vp, 840.vp]
        let tmpDirection = direction ?? GridRowDirection.Row

        let valuesHandle = FFIVectorFloat64(tmpBreakpointsValue.size)
        let unitsHandle = FFIVectorInt32(tmpBreakpointsValue.size)
        for (i in 0..tmpBreakpointsValue.size) {
            valuesHandle.setElement(i, tmpBreakpointsValue[i].value)
            unitsHandle.setElement(i, tmpBreakpointsValue[i].unitType.getValue())
        }
        match (tmpGutter.data) {
            case GUTTERLENGTH(gutterValue) => unsafe {
                FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionInt32(
                    GridRowCreateWithFloat64OptionInt32(
                        gutterValue.x.value,
                        gutterValue.x.unitType.getValue(),
                        gutterValue.y.value,
                        gutterValue.y.unitType.getValue(),
                        columns ?? 12,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        (tmpBreakpoints.reference ?? BreakpointsReference.WindowSize).getValue(),
                        tmpDirection.getValue()
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
                        columns ?? 12,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        (tmpBreakpoints.reference ?? BreakpointsReference.WindowSize).getValue(),
                        tmpDirection.getValue()
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
    * @param { ?GridRowOptions } columns - Sets the total number of columns in the current layout.
    * @param { ?GutterOptions } gutter - Layout spacing between sub-components.
    * @param { ?BreakPoints } breakpoints - Grid-row layout breakpoints.
    * @param { ?GridRowDirection } direction - Grid-row layout direction.
    * @param { () -> Unit } child - The child component of GridRow.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        columns!: ?GridRowOptions = None,
        gutter!: ?GutterOptions,
        breakpoints!: ?BreakPoints = Option.None,
        direction!: ?GridRowDirection = Option.None,
        child!: () -> Unit = {=>}
    ) {
        let tmpColumns = columns ?? GridRowOptions()
        let tmpGutter = gutter ?? GutterOptions()
        let tmpBreakpoints = breakpoints ?? BreakPoints()
        let tmpBreakpointsValue = tmpBreakpoints.value ?? [320.vp, 600.vp, 840.vp]
        let tmpDirection = direction ?? GridRowDirection.Row

        let valuesHandle = FFIVectorFloat64(tmpBreakpointsValue.size)
        let unitsHandle = FFIVectorInt32(tmpBreakpointsValue.size)
        for (i in 0..tmpBreakpointsValue.size) {
            valuesHandle.setElement(i, tmpBreakpointsValue[i].value)
            unitsHandle.setElement(i, tmpBreakpointsValue[i].unitType.getValue())
        }
        match (tmpGutter.data) {
            case GUTTERLENGTH(gutterValue) => unsafe {
                let nativeColumns = tmpColumns.parseToNative()
                FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionColumnOption(
                    GridRowCreateWithFloat64OptionColumnOption(
                        gutterValue.x.value,
                        gutterValue.x.unitType.getValue(),
                        gutterValue.y.value,
                        gutterValue.y.unitType.getValue(),
                        nativeColumns,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        (tmpBreakpoints.reference ?? BreakpointsReference.WindowSize).getValue(),
                        tmpDirection.getValue()
                    )
                )
                valuesHandle.free()
                unitsHandle.free()
            }
            case GUTTEROPTION(gutterValue) => unsafe {
                let nativeColumns = tmpColumns.parseToNative()
                FfiOHOSAceFrameworkGridRowCreateWithSizeOptionColumnOption(
                    GridRowCreateWithSizeOptionColumnOption(
                        gutterValue.x.toAtC(),
                        gutterValue.y.toAtC(),
                        nativeColumns,
                        valuesHandle.getNativeHandle(),
                        unitsHandle.getNativeHandle(),
                        (tmpBreakpoints.reference ?? BreakpointsReference.WindowSize).getValue(),
                        tmpDirection.getValue()
                    )
                )
                valuesHandle.free()
                unitsHandle.free()
            }
        }
        this.child = child
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkGridRowSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    /**
     * Cross axis alignment of each line in GridRow.
     *
     * @param { ?ItemAlign } value - Element alignment.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignItems(value: ?ItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkGridRowAlignItem((value ?? ItemAlign.Start) .getValue())
        }
        this
    }

    /**
     * Callback triggered when the breakpoint changes, breakpoints value can be xs, sm, md, lg, xl, xxl.
     *
     * @param { ?(String) -> Unit } callback - Callback function triggered when breakpoint changes.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBreakpointChange(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { res: String => }
        let wrapper = {
            value: CString => tmpCallback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGridRowBreakpointEvent(lambdaData.getID())
        }
        this
    }
}
