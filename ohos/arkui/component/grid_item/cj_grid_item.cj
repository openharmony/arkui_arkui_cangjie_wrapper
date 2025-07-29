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

package ohos.arkui.component.grid_item

import ohos.arkui.component.common.*
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class GridItem <: ContainerBase {
    @!APILevel[
        12,
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
        12,
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
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowEnd(rowEnd: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkGridItemSetRowEnd(rowEnd)
        }
        this
    }
}
