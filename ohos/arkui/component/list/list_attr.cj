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

package ohos.arkui.component.list

import ohos.arkui.component.common.*
import ohos.arkui.component.scroll.*
import ohos.base.*

sealed interface ListAttribute <: ScrollableCommonMethod<ListAttribute> {

    func listDirection(value: Axis): ListAttribute

    func divider(strokeWidth!: Length, color!: ResourceColor, startMargin!: Length,
        endMargin!: Length): ListAttribute

    func edgeEffect(value: EdgeEffect): ListAttribute

    func chainAnimation(value: Bool): ListAttribute

    func cachedCount(value: Int32): ListAttribute

    func multiSelectable(value: Bool): ListAttribute

    func lanes(value: Int32): ListAttribute

    func lanes(minLength!: Length, maxLength!: Length): ListAttribute

    func alignListItem(value: ListItemAlign): ListAttribute

    func sticky(value: StickyStyle): ListAttribute

    func onScrollIndex(event: (Int32, Int32, Int32) -> Unit): ListAttribute

    func onScrollFrameBegin(event: (Float64, ScrollState) -> onScrollFrameBeginHandleResult): ListAttribute
}
