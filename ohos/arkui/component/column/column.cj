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

import ohos.arkui.component.common.{CommonMethodComponent, HorizontalAlign, FlexAlign}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length, LengthProp}
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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Column <: CommonMethodComponent<Column> & ColumnAttribute {
    /**
     * Column constructor.
     *
     * @param { ?Length } space - The spacing between child elements in the vertical layout.
     * @param { () -> Unit } child - The child component of the column.
     */
    @!APILevel[
        22,
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
     * @param { ?HorizontalAlign } value - The horizontal alignment mode for child elements.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
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
     * @param { ?FlexAlign } value - The vertical alignment mode for child elements.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
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
