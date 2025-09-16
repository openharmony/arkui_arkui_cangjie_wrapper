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

package ohos.arkui.component.scroll

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

sealed interface ScrollAttribute <: ScrollableCommonMethod<ScrollAttribute> {

    func scrollable(scrollDirection: ?ScrollDirection): ScrollAttribute

    func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> OffsetResult): ScrollAttribute

    func onWillScroll(handler: ?(Float64, Float64, ScrollState, ScrollSource) -> Unit): ScrollAttribute

    func onDidScroll(callback: ?ScrollOnScrollCallback): ScrollAttribute

    func onScrollFrameBegin(event: ?OnScrollFrameBeginCallback): ScrollAttribute

    func onScrollEdge(event: ?OnScrollEdgeCallback): ScrollAttribute
}
