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

package ohos.arkui.component.row

import ohos.arkui.component.common.{CommonMethodComponent, VerticalAlign, FlexAlign}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length, LengthProp}
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
 * A layout container that arranges its child components horizontally in a row.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Row <: CommonMethodComponent<Row> & RowAttribute {
    /**
     * Defines the constructor of Row.
     * Initializes a Row component with optional spacing and child content.
     *
     * @param { ?Length } [space] - Row spacing between child components.
     * @param { () -> Unit } [child] - Child component builder function.
     */
    @!APILevel[
        since: "22",
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
    * Configures the vertical alignment of child components within the row.
    *
    * @param { ?VerticalAlign } value - Vertical alignment of child components.
    * @returns { This } Returns the Row instance.
    */
    @!APILevel[
        since: "22",
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
    * Configures the horizontal alignment of child components within the row.
    *
    * @param { ?FlexAlign } value - Horizontal alignment of child components.
    * @returns { This } Returns the Row instance.
    */
    @!APILevel[
        since: "22",
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
