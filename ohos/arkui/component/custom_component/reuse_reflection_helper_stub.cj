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

// Stub for arm32 where std.reflect is disabled.
// All reflection-based reuse helpers return false/None, gracefully
// degrading to the old (pre-paramsGenerator) behavior.

package ohos.arkui.component.custom_component

import ohos.base.ReuseParams
import ohos.labels.{Hide}

@!Hide
public func trySetParamsGenerator(cv: CustomView, gen: () -> ReuseParams): Bool {
    return false
}

@!Hide
public func tryRegisterReuseHandle(handleName: String, handle: (Int64, ReuseParams) -> Unit): Bool {
    return false
}

@!Hide
public func tryRegisterRecycleHandle(handleName: String, handle: (Int64) -> Unit): Bool {
    return false
}

@!Hide
public func tryReuseHybridPage(id: Int64, compName: String, params: ReuseParams): Bool {
    return false
}

@!Hide
public func tryRecycleHybridPage(id: Int64, compName: String): Bool {
    return false
}
