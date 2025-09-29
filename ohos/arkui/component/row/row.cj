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

package ohos.arkui.component.row

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRowCreate(): Unit

    func FfiOHOSAceFrameworkRowCreateWithSpace(space: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRowSetAlignItems(alignItems: Int32): Unit

    func FfiOHOSAceFrameworkRowSetJustifyContent(justifyContent: Int32): Unit

    func FfiOHOSAceFrameworkRowSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRowSetWidth(width: Float64, unit: Int32): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines Row Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Row <: CommonMethodComponent<RowAttribute> & RowAttribute {
    /**
    * Defines the constructor of Row.
    *
    * @params { Length } space
    * @params { () -> Unit } child
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(space!: ?Length = None, child!: () -> Unit = {=>}) {
        var space_ = transAppResourceToLength(space ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkRowCreateWithSpace(space_.value, space_.unitType.getValue())
        }
        this.child = child
    }

    /**
    * Called when the vertical alignment is set.
    *
    * @params { VerticalAlign } value
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignItems(value: ?VerticalAlign): This {
        unsafe {
            FfiOHOSAceFrameworkRowSetAlignItems((value ?? VerticalAlign.Center).getValue())
        }
        this
    }

    /**
    * Called when the horizontal alignment is set.
    *
    * @params { FlexAlign } value
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func justifyContent(value: ?FlexAlign): This {
        unsafe {
            FfiOHOSAceFrameworkRowSetJustifyContent((value ?? FlexAlign.Start).getValue())
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkRowSetWidth(value_.value, value_.unitType.getValue())
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
                    FfiOHOSAceFrameworkRowSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }
}
