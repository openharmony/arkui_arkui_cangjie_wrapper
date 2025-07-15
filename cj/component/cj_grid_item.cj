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
    func FfiOHOSAceFrameworkGridItemCreate(): Unit

    func FfiOHOSAceFrameworkGridItemCreateWithOptions(value: Int32): Unit

    func FfiOHOSAceFrameworkGridItemSetColumnStart(columnStart: Int32): Unit

    func FfiOHOSAceFrameworkGridItemSetColumnEnd(columnEnd: Int32): Unit

    func FfiOHOSAceFrameworkGridItemSetRowStart(rowStart: Int32): Unit

    func FfiOHOSAceFrameworkGridItemSetRowEnd(rowEnd: Int32): Unit

    func FfiOHOSAceFrameworkGridItemForceRebuild(forceRebuild: Bool): Unit

    func FfiOHOSAceFrameworkGridItemSelectable(value: Bool): Unit

    func FfiOHOSAceFrameworkGridItemSelected(value: Bool): Unit

    func FfiOHOSAceFrameworkGridItemOnSelect(callback: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum GridItemStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PLAIN
    | ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case PLAIN => 1
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
public class GridItemOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var style: GridItemStyle

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(style!: GridItemStyle = GridItemStyle.NONE) {
        this.style = style
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class GridItem <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkGridItemCreate()
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
            FfiOHOSAceFrameworkGridItemCreate()
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
    public init(value: GridItemOptions) {
        unsafe {
            FfiOHOSAceFrameworkGridItemCreateWithOptions(value.style.getValue())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: GridItemOptions, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridItemCreateWithOptions(value.style.getValue())
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
    public func columnStart(columnStart: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetColumnStart(columnStart)
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
    public func columnEnd(columnEnd: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetColumnEnd(columnEnd)
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
    public func rowStart(rowStart: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetRowStart(rowStart)
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
    public func rowEnd(rowEnd: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetRowEnd(rowEnd)
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
    public func selectable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSelectable(value)
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
    public func selected(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSelected(value)
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
    public func onSelect(callback: (Bool) -> Unit): This {
        let wrapper = {
            isSelected: Bool => callback(isSelected)
        }
        let lambdaData = Callback1Param<Bool, Unit>(wrapper);
        unsafe {
            FfiOHOSAceFrameworkGridItemOnSelect(lambdaData.getID())
        }
        this
    }
}
