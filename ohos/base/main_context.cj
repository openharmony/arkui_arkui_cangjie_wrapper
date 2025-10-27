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

import ohos.labels.APILevel

foreign func FfiOHOSBaseGetUISchedulerHandle(): CPointer<Unit>

/**
 * Defines class MainThreadContext.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MainThreadContext <: ThreadContext {
    var schedule_: ?CPointer<Unit> = None
    private var hasEnded_: Bool = false

    protected func getSchedulerHandle(): CPointer<Unit> {
        schedule_ ?? {
            =>
            let handle = unsafe { FfiOHOSBaseGetUISchedulerHandle() }
            schedule_ = handle
            handle
        }()
    }

    private init() {}

    static let instance_: MainThreadContext = MainThreadContext()

    /**
     * MainThreadContext end func.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func end(): Unit {}

    /**
     * MainThreadContext hasEnded func.
     *
     * @returns { Bool } - Whether the context has ended
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hasEnded(): Bool {
        hasEnded_
    }
}

/**
 * UIThread get MainThreadContext instance.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public let UIThread: MainThreadContext = MainThreadContext.instance_
