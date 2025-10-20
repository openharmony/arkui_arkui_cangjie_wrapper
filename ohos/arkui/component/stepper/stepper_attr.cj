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

package ohos.arkui.component.stepper

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Stepper Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface StepperAttribute <: CommonMethod<StepperAttribute> {
    /**
     * Callback when the finish label is clicked.
     *
     * @param { ?() -> Unit } callback
     * @returns { StepperAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFinish(callback: ?() -> Unit): StepperAttribute

    /**
     * Callback when the skip label is clicked.
     *
     * @param { ?() -> Unit } callback
     * @returns { StepperAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSkip(callback: ?() -> Unit): StepperAttribute

     /**
     * Callback when the change label is clicked.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback
     * @returns { StepperAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(UInt32, UInt32) -> Unit): StepperAttribute

     /**
     * Callback when the next label is clicked.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback
     * @returns { StepperAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onNext(callback: ?(UInt32, UInt32) -> Unit): StepperAttribute

     /**
     * Callback when the previous label is clicked.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback
     * @returns { StepperAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPrevious(callback: ?(UInt32, UInt32) -> Unit): StepperAttribute
}
