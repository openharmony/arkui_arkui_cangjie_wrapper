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

package ohos.arkui.component.grid_col

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.labels.APILevel

@C
struct NativeGridColColumnOption {
    let xs: Int32
    let sm: Int32
    let md: Int32
    let lg: Int32
    let xl: Int32
    let xxl: Int32
    NativeGridColColumnOption(xs: Int32, sm: Int32, md: Int32,
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
 * Defines the option in number unit of grid-container child component.
 *
 * @relation interface GridColColumnOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridColOptions {
    /**
    * Grid Col Column Option xs
    *
    * @type { Int32 }
    * @relation xs?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: ?Int32

    /**
    * Grid Col Column Option sm
    *
    * @type { Int32 }
    * @relation sm?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: ?Int32

    /**
    * Grid Col Column Option md
    *
    * @type { Int32 }
    * @relation md?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: ?Int32

    /**
    * Grid Col Column Option lg
    *
    * @type { Int32 }
    * @relation lg?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: ?Int32

    /**
    * Grid Col Column Option xl
    *
    * @type { Int32 }
    * @relation xl?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: ?Int32

    /**
    * Grid Col Column Option xxl
    *
    * @type { Int32 }
    * @relation xxl?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: ?Int32

    /**
    * Defines the constructor of GridColOptions.
    *
    * @param { Int32 } xs
    * @param { Int32 } sm
    * @param { Int32 } md
    * @param { Int32 } lg
    * @param { Int32 } xl
    * @param { Int32 } xxl
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
        this.xs = xs ?? 12
        this.sm = sm ?? 12
        this.md = md ?? 12
        this.lg = lg ?? 12
        this.xl = xl ?? 12
        this.xxl = xxl ?? 12
    }

    /**
    * Defines the option in number unit of grid-container child component.
    *
    * @param { Int32 } value
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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

    func parseToNative(): NativeGridColColumnOption {
        NativeGridColColumnOption(this.xs ?? 12, this.sm ?? 12, this.md ?? 12,
            this.lg ?? 12, this.xl ?? 12, this.xxl ?? 12)
    }
}

foreign {
    func FfiOHOSAceFrameworkGridColCreate(): Unit

    func FfiOHOSAceFrameworkGridColCreateWithInt32(span: Int32, offset: Int32, order: Int32): Unit

    func FfiOHOSAceFrameworkGridColCreateWithOption(span: NativeGridColColumnOption, offset: NativeGridColColumnOption,
        order: NativeGridColColumnOption): Unit

    func FfiOHOSAceFrameworkGridColSetSpan(span: Int32): Unit

    func FfiOHOSAceFrameworkGridColSetSpanWithOption(span: NativeGridColColumnOption): Unit

    func FfiOHOSAceFrameworkGridColSetOffset(offset: Int32): Unit

    func FfiOHOSAceFrameworkGridColSetOffsetWithOption(offset: NativeGridColColumnOption): Unit

    func FfiOHOSAceFrameworkGridColSetOrder(order: Int32): Unit

    func FfiOHOSAceFrameworkGridColSetOrderWithOption(order: NativeGridColColumnOption): Unit
}

/**
 * Defines GridCol Component.
 *
 * @relation const GridCol: GridColInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridCol <: CommonMethodComponent<GridColAttribute> & GridColAttribute {
    /**
     * GridCol constructor.
     *
     * @param { Int32 } span
     * @param { Int32 } offset
     * @param { Int32 } order
     * @param { () -> Unit } child
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(span!: ?Int32 = None, offset!: ?Int32 = None, order!: ?Int32 = None, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkGridColCreateWithInt32(span ?? 1, offset ?? 0, order ?? 0)
        }
        this.child = child
    }

    /**
     * GridCol constructor.
     *
     * @param { GridColOptions } span
     * @param { GridColOptions } offset
     * @param { GridColOptions } order
     * @param { () -> Unit } child
     * @returns { This }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        span!: ?GridColOptions,
        offset!: ?GridColOptions,
        order!: ?GridColOptions,
        child!: () -> Unit = {=>}
    ) {
        unsafe {
            let nativeSpan = (span ?? GridColOptions(1)).parseToNative()
            let nativeOffset = (offset ?? GridColOptions(0)).parseToNative()
            let nativeOrder = (order ?? GridColOptions(0)).parseToNative()
            FfiOHOSAceFrameworkGridColCreateWithOption(nativeSpan, nativeOffset, nativeOrder)
        }
        this.child = child
    }

    /**
    * Sets the span of current gird-container item.
    *
    * @param { Int32 } value
    * @returns { This }
    * @relation span(value: number | GridColColumnOption): GridColAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func span(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetSpan(value ?? 12)
        }
        this
    }

    /**
    * Sets the span of current gird-container item.
    *
    * @param { GridColOptions } value
    * @returns { This }
    * @relation span(value: number | GridColColumnOption): GridColAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func span(value: ?GridColOptions): This {
        unsafe {
            let nativeValue = (value ?? GridColOptions()).parseToNative()
            FfiOHOSAceFrameworkGridColSetSpanWithOption(nativeValue)
        }
        this
    }
    /**
    * Sets the offset of current gird-container item.
    *
    * @param { Int32 } value
    * @returns { This }
    * @relation gridColOffset(value: number | GridColColumnOption): GridColAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func gridColOffset(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOffset(value ?? 12)
        }
        this
    }
    /**
    * Sets the offset of current gird-container item.
    *
    * @param { GridColOptions } value
    * @returns { This }
    * @relation gridColOffset(value: number | GridColColumnOption): GridColAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func gridColOffset(value: ?GridColOptions): This {
        unsafe {
            let nativeValue = (value ?? GridColOptions()).parseToNative()
            FfiOHOSAceFrameworkGridColSetOffsetWithOption(nativeValue)
        }
        this
    }

    /**
    * Sets the order of current gird-container item.
    *
    * @param { Int32 } value
    * @returns { This }
    * @relation order(value: number | GridColColumnOption): GridColAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func order(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOrder(value ?? 12)
        }
        this
    }

    /**
    * Sets the order of current gird-container item.
    *
    * @param { GridColOptions } value
    * @returns { This }
    * @relation order(value: number | GridColColumnOption): GridColAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func order(value: ?GridColOptions): This {
        unsafe {
            let nativeValue = (value ?? GridColOptions()).parseToNative()
            FfiOHOSAceFrameworkGridColSetOrderWithOption(nativeValue)
        }
        this
    }
}
