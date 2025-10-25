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
 * A layout container that arranges its child components horizontally with resizable dividers between them.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RowSplit <: CommonMethodComponent<RowSplit> & RowSplitAttribute {
    /**
    * Initializes a RowSplit component with child content.
    *
    * @param { () -> Unit } child - The child component builder function.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkRowSplitCreate()
        }
        this.child = child
    }

    /**
    * Enable or disable resizeable.
    * Controls whether the dividers between child components can be dragged to resize the components.
    *
    * @param { ?Bool } value - Whether enable resizeable.
    * @returns { This } Returns the RowSplit instance.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resizeable(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkRowSplitResizeable(value ?? false)
        }
        this
    }
}
