/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// Stub for arm32 / macOS where std.reflect is disabled.

package ohos.arkui.component.custom_component

import ohos.base.ReuseParams

func tryGetReuseParamsFromChild(child: CustomView): Option<ReuseParams> {
    return Option<ReuseParams>.None
}

func tryGetReuseParamsFromParent(parent: CustomView, childId: Int64): Option<ReuseParams> {
    return Option<ReuseParams>.None
}
