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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GridRowDirection {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    GridRowRow
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    RowReverse
    | ...

    func getValue(): Int32 {
        match (this) {
            case GridRowRow => 0
            case RowReverse => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
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
public enum BreakpointsReference {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WindowSize
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRowSizeOption {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: Length
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public GridRowSizeOption(
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
public struct GridRowColumnOption {
    let xs: Int32
    let sm: Int32
    let md: Int32
    let lg: Int32
    let xl: Int32
    let xxl: Int32
    public GridRowColumnOption(
        xs!: Int32 = 12,
        sm!: Int32 = 12,
        md!: Int32 = 12,
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
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GutterOption {
    let data: GridRowGutter
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: Length, y!: Length) {
        this.data = GridRowGutter.GUTTERLENGTH(GutterLength(x, y))
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x!: GridRowSizeOption, y!: GridRowSizeOption) {
        this.data = GridRowGutter.GUTTEROPTION(GutterSizeOption(x, y))
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
public class BreakPoints {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BreakPoints(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var value!: Array<Length> = [320.vp, 520.vp, 840.vp],
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var reference!: BreakpointsReference = BreakpointsReference.WindowSize
    ) {}
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
        let columns: GridRowColumnOption,
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
        let columns: GridRowColumnOption,
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
        let columns: GridRowColumnOption,
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridRow <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridRowCreate()
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
        columns!: Int32,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
    ) {
        this(gutter: 0.vp, columns: columns, breakpoints: breakpoints, direction: direction, child: child)
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
        columns!: GridRowColumnOption,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
    ) {
        this(gutter: 0.vp, columns: columns, breakpoints: breakpoints, direction: direction, child: child)
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
        gutter!: Length,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
    ) {
        this(gutter: gutter, columns: 12, breakpoints: breakpoints, direction: direction, child: child)
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
        gutter!: GutterOption,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
    ) {
        this(gutter: gutter, columns: 12, breakpoints: breakpoints, direction: direction, child: child)
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
        gutter!: Length,
        columns!: Int32,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        gutter!: Length,
        columns!: GridRowColumnOption,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
    ) {
        var gutter_ = transAppResourceToLength(gutter)
        let valuesHandle = FFIVectorFloat64(breakpoints.value.size)
        let unitsHandle = FFIVectorInt32(breakpoints.value.size)
        for (i in 0..breakpoints.value.size) {
            valuesHandle.setElement(i, breakpoints.value[i].value)
            unitsHandle.setElement(i, breakpoints.value[i].unitType.getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkGridRowCreateWithFloat64ColumnOption(
                GridRowCreateWithFloat64ColumnOption(
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        gutter!: GutterOption,
        columns!: Int32,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
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
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        gutter!: GutterOption,
        columns!: GridRowColumnOption,
        breakpoints!: BreakPoints = BreakPoints(),
        direction!: GridRowDirection = GridRowDirection.GridRowRow,
        child!: () -> Unit
    ) {
        let valuesHandle = FFIVectorFloat64(breakpoints.value.size)
        let unitsHandle = FFIVectorInt32(breakpoints.value.size)
        for (i in 0..breakpoints.value.size) {
            valuesHandle.setElement(i, breakpoints.value[i].value)
            unitsHandle.setElement(i, breakpoints.value[i].unitType.getValue())
        }
        match (gutter.data) {
            case GUTTERLENGTH(gutterValue) => unsafe {
                FfiOHOSAceFrameworkGridRowCreateWithFloat64OptionColumnOption(
                    GridRowCreateWithFloat64OptionColumnOption(
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
                FfiOHOSAceFrameworkGridRowCreateWithSizeOptionColumnOption(
                    GridRowCreateWithSizeOptionColumnOption(
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
            FfiOHOSAceFrameworkGridRowSetHeight(value_.value, value_.unitType.getValue())
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
    public func alignItems(value: ItemAlign): This {
        unsafe {
            FfiOHOSAceFrameworkGridRowAlignItem(value.getValue())
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
