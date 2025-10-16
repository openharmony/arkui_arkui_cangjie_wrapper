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

package ohos.arkui.component.counter

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Counter attributes.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface CounterAttribute <: CommonMethod<CounterAttribute> {
    /**
     * Indicates whether the increase button of counter component is available or not.
     *
     * @param { ?Bool } value
     * @returns { CounterAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enableInc(value: ?Bool): CounterAttribute

    /**
     * Indicates whether the decrease button of counter component is available or not.
     *
     * @param { ?Bool } value
     * @returns { CounterAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enableDec(value: ?Bool): CounterAttribute

    /**
     * Listen to the event that the value increases.
     *
     * @param { ?VoidCallback } event
     * @returns { CounterAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onInc(event: ?VoidCallback): CounterAttribute

    /**
     * Listens to the number decrease event.
     *
     * @param { ?VoidCallback } event
     * @returns { CounterAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDec(event: ?VoidCallback): CounterAttribute
}
