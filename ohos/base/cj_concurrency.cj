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

package ohos.base

import ohos.ffi.{Callback0Param}
import ohos.labels.{APILevel}

foreign func FfiOHOSAceFrameworkPostTaskToMainThread(taskId: Int64): Unit

foreign func FfiOHOSAceFrameworkHasContainer(): Bool

/**
 * Submit the task to the main thread for execution.
 *
 * @param { () -> Unit } task - The task to be executed on the main thread
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func launch(task: () -> Unit): Unit {
    unsafe { FfiOHOSAceFrameworkPostTaskToMainThread(Callback0Param<Unit>(task).getID()) }
}

protected func hasContainer(): Bool {
    return unsafe { FfiOHOSAceFrameworkHasContainer() }
}
