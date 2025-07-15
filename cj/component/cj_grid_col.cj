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
public struct GridColColumnOption {
    let xs: Int32
    let sm: Int32
    let md: Int32
    let lg: Int32
    let xl: Int32
    let xxl: Int32
    public GridColColumnOption(
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

foreign {
    func FfiOHOSAceFrameworkGridColCreate(): Unit

    func FfiOHOSAceFrameworkGridColCreateWithInt32(span: Int32, offset: Int32, order: Int32): Unit

    func FfiOHOSAceFrameworkGridColCreateWithOption(span: GridColColumnOption, offset: GridColColumnOption,
        order: GridColColumnOption): Unit

    func FfiOHOSAceFrameworkGridColSetSpan(span: Int32): Unit

    func FfiOHOSAceFrameworkGridColSetSpanWithOption(span: GridColColumnOption): Unit

    func FfiOHOSAceFrameworkGridColSetOffset(offset: Int32): Unit

    func FfiOHOSAceFrameworkGridColSetOffsetWithOption(offset: GridColColumnOption): Unit

    func FfiOHOSAceFrameworkGridColSetOrder(order: Int32): Unit

    func FfiOHOSAceFrameworkGridColSetOrderWithOption(order: GridColColumnOption): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridCol <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(span!: Int32 = 1, offset!: Int32 = 0, order!: Int32 = 0, child!: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridColCreateWithInt32(span, offset, order)
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
        span!: GridColColumnOption,
        offset!: GridColColumnOption,
        order!: GridColColumnOption,
        child!: () -> Unit
    ) {
        unsafe {
            FfiOHOSAceFrameworkGridColCreateWithOption(span, offset, order)
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
    public func span(span: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetSpan(span)
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
    public func span(span: GridColColumnOption): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetSpanWithOption(span)
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
    public func offset(offset: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOffset(offset)
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
    public func offset(offset: GridColColumnOption): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOffsetWithOption(offset)
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
    public func gridColOffset(offset: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOffset(offset)
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
    public func gridColOffset(offset: GridColColumnOption): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOffsetWithOption(offset)
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
    public func order(order: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOrder(order)
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
    public func order(order: GridColColumnOption): This {
        unsafe {
            FfiOHOSAceFrameworkGridColSetOrderWithOption(order)
        }
        this
    }
}
