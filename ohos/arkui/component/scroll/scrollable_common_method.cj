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
import ohos.arkui.component.rect.*
import ohos.base.*
import ohos.resource.*
import ohos.arkui.shape.*

public interface ScrollableCommonMethod<T> <: CommonMethod<T> {
    func scrollBar(barState: BarState): T

    func scrollBarColor(color: ResourceColor): T

    func scrollBarWidth(value: Length): T

    func nestedScroll(value: NestedScrollOptions): T

    func enableScrollInteraction(value: Bool): T

    func friction(value: Float64): T

    func friction(value: AppResource): T

    func onReachStart(event: () -> Unit): T

    func onReachEnd(event: () -> Unit): T

    func onScrollStart(event: () -> Unit): T

    func onScrollStop(event: () -> Unit): T

    func flingSpeedLimit(speedLimit: Float64): T

    func fadingEdge(enabled: Option<Bool>): T

    func fadingEdge(enabled: Option<Bool>, options: FadingEdgeOptions): T

    func clipContent(clip: ContentClipMode): T

    func clipContent(clip: RectShape): T

    func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> ScrollResult>): T

    func onWillScroll(handler: Option<(Float64, ScrollState, ScrollSource) -> Unit>): T

    func onDidScroll(handler: OnScrollCallBack): T

}
