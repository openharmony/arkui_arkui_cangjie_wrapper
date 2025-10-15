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

package ohos.arkui.component.stack

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkStackCreate(value: Int32): Unit

    func FfiOHOSAceFrameworkStackSetOverflow(value: Int32): Unit

    func FfiOHOSAceFrameworkStackSetStackFit(value: Int32): Unit

    func FfiOHOSAceFrameworkStackSetAlignment(value: Int32): Unit

    func FfiOHOSAceFrameworkStackSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkStackSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkStackSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines Stack Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Stack <: CommonMethodComponent<Stack> & StackAttribute {
    /**
    * Defines the constructor of Stack.
    *
    * @param { ?Alignment } alignContent
    * @param { ?() -> Unit } child
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(alignContent!: ?Alignment = None, child!: () -> Unit = {=>}) {
        let tmpAlignContent = alignContent ?? Alignment.Center
        unsafe {
            FfiOHOSAceFrameworkStackCreate(tmpAlignContent.getValue())
        }
        this.child = child
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkStackSetWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkStackSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            var width_ = transAppResourceToLength(width ?? 0.0.vp)
            var height_ = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkStackSetSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue())
            }
        }
        this
    }

    /**
    * Called when the alignment of items in the container is set.
    *
    * @param { ?Alignment } value
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignContent(value: ?Alignment): This {
        unsafe {
            FfiOHOSAceFrameworkStackSetAlignment((value ?? Alignment.Center).getValue())
        }
        this
    }
}
