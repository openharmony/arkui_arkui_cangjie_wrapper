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

import ohos.arkui.component.common.{CommonMethodComponent}
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
 * This class represents the responsive grid column options that define how many columns
 * a grid item should span on different screen sizes.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridColOptions {
    /**
     * Grid Col Column Option for extra small devices.
     * Defines how many columns the grid item should span on extra small screens.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xs: ?Int32

    /**
     * Grid Col Column Option for small devices.
     * Defines how many columns the grid item should span on small screens.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sm: ?Int32

    /**
     * Grid Col Column Option for medium devices.
     * Defines how many columns the grid item should span on medium screens.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var md: ?Int32

    /**
     * Grid Col Column Option for large devices.
     * Defines how many columns the grid item should span on large screens.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var lg: ?Int32

    /**
     * Grid Col Column Option for extra large devices.
     * Defines how many columns the grid item should span on extra large screens.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xl: ?Int32

    /**
     * Grid Col Column Option for double extra large devices.
     * Defines how many columns the grid item should span on double extra large screens.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var xxl: ?Int32

    /**
     * Defines the constructor of GridColOptions.
     * Creates a GridColOptions instance with specific values for different screen sizes.
     *
     * @param { ?Int32 } [xs] - Grid Col Column Option xs. Defines how many columns the grid item should span on extra small screens.
     * @param { ?Int32 } [sm] - Grid Col Column Option sm. Defines how many columns the grid item should span on small screens.
     * @param { ?Int32 } [md] - Grid Col Column Option md. Defines how many columns the grid item should span on medium screens.
     * @param { ?Int32 } [lg] - Grid Col Column Option lg. Defines how many columns the grid item should span on large screens.
     * @param { ?Int32 } [xl] - Grid Col Column Option xl. Defines how many columns the grid item should span on extra large screens.
     * @param { ?Int32 } [xxl] - Grid Col Column Option xxl. Defines how many columns the grid item should span on double extra large screens.
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
        this.xs = xs ?? 12
        this.sm = sm ?? 12
        this.md = md ?? 12
        this.lg = lg ?? 12
        this.xl = xl ?? 12
        this.xxl = xxl ?? 12
    }

    /**
    * Defines the option in number unit of grid-container child component.
    * Creates a GridColOptions instance with the same value for all screen sizes.
    *
    * @param { ?Int32 } value - The value to set for all grid column options. This value will be applied to xs, sm, md, lg, xl, and xxl.
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
 * GridCol is a component used within a GridContainer to define how many columns
 * a grid item should span, its offset, and order in the grid layout.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridCol <: CommonMethodComponent<GridCol> & GridColAttribute {
    /**
     * GridCol constructor.
     * Creates a GridCol component with integer values for span, offset, and order.
     *
     * @param { ?Int32 } [span] - Sets the span of current grid-container item. Defines how many columns the item should span.
     * @param { ?Int32 } [offset] - Sets the offset of current grid-container item. Defines how many columns to offset the item from its normal position.
     * @param { ?Int32 } [order] - Sets the order of current grid-container item. Defines the display order of the item in the grid.
     * @param { () -> Unit } [child] - The child component of GridCol. This is the content to be displayed within the grid item.
     */
    @!APILevel[
        since: "22",
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
     * Creates a GridCol component with responsive GridColOptions for span, offset, and order.
     *
     * @param { ?GridColOptions } span - Sets the span of current grid-container item. Defines how many columns the item should span on different screen sizes.
     * @param { ?GridColOptions } offset - Sets the offset of current grid-container item. Defines how many columns to offset the item from its normal position on different screen sizes.
     * @param { ?GridColOptions } order - Sets the order of current grid-container item. Defines the display order of the item in the grid on different screen sizes.
     * @param { () -> Unit } [child] - The child component of GridCol. This is the content to be displayed within the grid item.
     */
    @!APILevel[
        since: "22",
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
     * Sets the span of current grid-container item.
     * Defines how many columns the grid item should span.
     *
     * @param { ?Int32 } value - The span value to set. This determines how many columns the grid item will occupy.
     * @returns { This } - Returns the component itself for chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func span(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetSpan(value ?? 12)
        }
        this
    }

    /**
     * Sets the span of current grid-container item.
     * Defines how many columns the grid item should span on different screen sizes.
     *
     * @param { ?GridColOptions } value - The GridColOptions to set as span. This defines how many columns the grid item will occupy on different screen sizes.
     * @returns { This } - Returns the component itself for chaining.
     */
    @!APILevel[
        since: "22",
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
     * Sets the offset of current grid-container item.
     * Defines how many columns to offset the grid item from its normal position.
     *
     * @param { ?Int32 } value - The offset value to set. This determines how many columns the grid item will be offset from its normal position.
     * @returns { This } - Returns the component itself for chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func gridColOffset(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOffset(value ?? 12)
        }
        this
    }

    /**
     * Sets the offset of current grid-container item.
     * Defines how many columns to offset the grid item from its normal position on different screen sizes.
     *
     * @param { ?GridColOptions } value - The GridColOptions to set as offset. This defines how many columns the grid item will be offset from its normal position on different screen sizes.
     * @returns { This } - Returns the component itself for chaining.
     */
    @!APILevel[
        since: "22",
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
     * Sets the order of current grid-container item.
     * Defines the display order of the grid item in the grid layout.
     *
     * @param { ?Int32 } value - The order value to set. Items with a lower order value are displayed before items with a higher order value.
     * @returns { This } - Returns the component itself for chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func order(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOrder(value ?? 12)
        }
        this
    }

    /**
     * Sets the order of current grid-container item.
     * Defines the display order of the grid item in the grid layout on different screen sizes.
     *
     * @param { ?GridColOptions } value - The GridColOptions to set as order. This defines the display order of the grid item on different screen sizes.
     * @returns { This } - Returns the component itself for chaining.
     */
    @!APILevel[
        since: "22",
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
