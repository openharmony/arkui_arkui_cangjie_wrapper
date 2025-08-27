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

package ohos.arkui.component.row_split

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRowSplitCreate(): Unit

    func FfiOHOSAceFrameworkRowSplitResizeable(value: Bool): Unit

    func FfiOHOSAceFrameworkRowSplitClip(isClip: Bool): Unit

    func FfiOHOSAceFrameworkRowSplitClipByShape(shapeId: Int64): Unit
}

/**
 * Defines RowSplit Component.
 *
 * @relation const RowSplit: RowSplitInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RowSplit <: ContainerBase {
    /**
    * Called when the layout along the vertical direction is set.
    *
    * @param { () -> Unit } child
    * @returns { This }
    * @relation (): RowSplitAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkRowSplitCreate()
        }
        this.child = child
    }

    /**
    * Called when judging whether the split line can be dragged.
    *
    * @param { Bool } value
    * @returns { This }
    * @relation resizeable(value: boolean): RowSplitAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resizeable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRowSplitResizeable(value)
        }
        this
    }
}
