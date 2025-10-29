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

package ohos.arkui.component.grid_item

import ohos.arkui.component.common.{CommonMethodComponent}
import ohos.labels.APILevel

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

/**
 * Defines GridItem Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GridItem <: CommonMethodComponent<GridItem> & GridItemAttribute {

    /**
     * GridItem constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkGridItemCreate()
        }
    }

    /**
     * GridItem constructor.
     *
     * @param { () -> Unit } child - The child component of GridItem.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridItemCreate()
        }
        this.child = child
    }

    /**
     * This parameter specifies the start column number of the current element.
     *
     * @param { ?Int32 } value - The start column index, must be a non-negative integer.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnStart(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetColumnStart(value ?? 0)
        }
        this
    }

    /**
     * This parameter specifies the end column number of the current element.
     *
     * @param { ?Int32 } value - The end column index, must be a non-negative integer greater than or equal to columnStart.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnEnd(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetColumnEnd(value ?? 0)
        }
        this
    }

    /**
     * This parameter specifies the start line number of the current element.
     *
     * @param { ?Int32 } value - Start line number of the element.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowStart(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetRowStart(value ?? 0)
        }
        this
    }

    /**
     * Specifies the end line number of the current element.
     *
     * @param { ?Int32 } value - End line number of the element.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowEnd(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetRowEnd(value ?? 0)
        }
        this
    }
}
