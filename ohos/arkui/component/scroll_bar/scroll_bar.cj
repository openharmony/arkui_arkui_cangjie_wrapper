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

package ohos.arkui.component.scroll_bar

import ohos.arkui.component.common.*
import ohos.arkui.component.scroll.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkScrollBarCreate(scroller: Int64, direction: Int32, state: Int32): Unit

    func FfiOHOSAceFrameworkSetEnableNestedScroll(value: Bool): Unit
}
/**
 * Defines ScrollBar Component.
 *
 * @relation const ScrollBar: ScrollBarInterface
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScrollBar <: CommonMethodComponent<ScrollBar> & ScrollBarAttribute {
    /**
    * Define the constructor of the scrollbar component.
    *
    * @param { scroller } scroller
    * @param { ScrollBarDirection } direction
    * @param { BarState } state
    * @param { () -> Unit } child
    * @returns { This }
    * @relation (value: ScrollBarOptions): ScrollBarAttribute;
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        scroller!: ?Scroller,
        direction!: ?ScrollBarDirection = None,
        state!: ?BarState = None,
        child!: () -> Unit
    ){
        let tmpScroller = scroller ?? Scroller()
        let tmpDirection = direction ?? ScrollBarDirection.Vertical
        let tmpState = state ?? BarState.Auto
        unsafe {
            FfiOHOSAceFrameworkScrollBarCreate(tmpScroller.getID(), tmpDirection.getValue(), tmpState.getValue())
        }
        this.child = child
    }
}
