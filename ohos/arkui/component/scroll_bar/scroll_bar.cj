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

protected package ohos.arkui.component.scroll_bar

import ohos.arkui.component.common.*
import ohos.arkui.component.scroll.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkScrollBarCreate(scroller: Int64, direction: Int32, state: Int32): Unit

    func FfiOHOSAceFrameworkSetEnableNestedScroll(value: Bool): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollBar <: ContainerBase {
    static let directionDefault: ScrollBarDirection = ScrollBarDirection.Vertical
    static let stateDefault: BarState = BarState.Auto

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, direction: ScrollBarDirection, state: BarState, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkScrollBarCreate(scroller.getID(), direction.getValue(), state.getValue())
        }
        this.child = child
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, child: () -> Unit) {
        this(scroller, directionDefault, stateDefault, child)
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, direction: ScrollBarDirection, child: () -> Unit) {
        this(scroller, direction, stateDefault, child)
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, state: BarState, child: () -> Unit) {
        this(scroller, directionDefault, state, child)
    }
}
