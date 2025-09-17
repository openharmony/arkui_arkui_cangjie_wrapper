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

package ohos.arkui.component.video

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

sealed interface VideoAttribute <: CommonMethod<VideoAttribute> {

    func muted(value: ?Bool): VideoAttribute

    func autoPlay(value: ?Bool): VideoAttribute

    func controls(value: ?Bool): VideoAttribute

    func objectFit(value: ?ImageFit): VideoAttribute

    func loop(value: ?Bool): VideoAttribute

    func onStart(event: ?VoidCallback): VideoAttribute

    func onPause(event: ?VoidCallback): VideoAttribute

    func onFinish(event: ?() -> Unit): VideoAttribute

    func onError(event: ?VoidCallback): VideoAttribute

    func onPrepared(callback: ?Callback<PreparedInfo, Unit>): VideoAttribute

    func onSeeking(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    func onSeeked(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    func onUpdate(callback: ?Callback<PlaybackInfo, Unit>): VideoAttribute

    func onFullscreenChange(callback: ?Callback<FullscreenInfo, Unit>): VideoAttribute
}
