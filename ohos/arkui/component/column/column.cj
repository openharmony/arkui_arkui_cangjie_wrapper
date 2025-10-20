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

package ohos.arkui.component.column

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkColumnCreate(): Unit

    func FfiOHOSAceFrameworkColumnCreateWithSpace(space: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkColumnSetAlignItems(alignItems: Int32): Unit

    func FfiOHOSAceFrameworkColumnSetJustifyContent(justifyContent: Int32): Unit

    func FfiOHOSAceFrameworkColumnSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkColumnSetWidth(width: Float64, unit: Int32): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines Column Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Column <: CommonMethodComponent<Column> & ColumnAttribute {
    /**
    * Column constructor.
    *
    * @param { ?Length } space
    * @param { () -> Unit } child
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(space!: ?Length = None, child!: () -> Unit = {=>}) {
        var space_ = transAppResourceToLength(space ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkColumnCreateWithSpace(space_.value, space_.unitType.getValue())
        }
        this.child = child
    }

    /**
     * Sets the alignment format of the subassembly in the horizontal direction.
     *
     * @param { ?HorizontalAlign } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignItems(value: ?HorizontalAlign): This {
        unsafe {
            FfiOHOSAceFrameworkColumnSetAlignItems((value ?? HorizontalAlign.Center).getValue())
        }
        this
    }

    /**
     * Sets the alignment format of the subassembly in the vertical direction.
     *
     * @param { ?FlexAlign } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func justifyContent(value: ?FlexAlign): This {
        unsafe {
            FfiOHOSAceFrameworkColumnSetJustifyContent((value ?? FlexAlign.Start).getValue())
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkColumnSetWidth(value_.value, value_.unitType.getValue())
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
                    FfiOHOSAceFrameworkColumnSetHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }
}
