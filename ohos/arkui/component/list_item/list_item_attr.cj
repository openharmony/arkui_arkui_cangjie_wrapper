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

package ohos.arkui.component.list_item

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines the ListItem attribute functions.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ListItemAttribute <: CommonMethod<ListItemAttribute> {

    /**
     * Called when judging whether it is selectable.
     *
     * @param { ?Bool } value - Whether enable selection for the item.
     * @returns { ListItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func selectable(value: ?Bool): ListItemAttribute

    /**
     * Sets the action item that appears when the list item slides in the cross axis direction of the list.
     *
     * @param { ?CustomBuilder } start - The action when swipe start.
     * @param { ?CustomBuilder } end - The action when swipe end.
     * @param { ?SwipeEdgeEffect } edgeEffect - The swipe edge effect.
     * @param { ?(Float64) -> Unit } onOffsetChange - The callback on offset change.
     * @returns { ListItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func swipeAction(
        start!: ?CustomBuilder,
        end!: ?CustomBuilder,
        edgeEffect!: ?SwipeEdgeEffect,
        onOffsetChange!: ?(Float64) -> Unit
    ): ListItemAttribute

    /**
     * Called when the listItem is selected.
     *
     * @param { ?(Bool) -> Unit } event - The callback on selection.
     * @returns { ListItemAttribute }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSelect(event: ?(Bool) -> Unit): ListItemAttribute
}
