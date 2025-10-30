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

import ohos.arkui.component.common.{CommonMethod}
import ohos.labels.APILevel

/**
 * Defines the Stepper attribute functions.
 * Provides methods for configuring the behavior of the Stepper component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface StepperAttribute <: CommonMethod<StepperAttribute> {
    /**
     * Triggered when the user clicks the finish button to complete all steps.
     *
     * @param { ?() -> Unit } callback - Callback function triggered when finish is clicked.
     * @returns { StepperAttribute } Returns the stepper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFinish(callback: ?() -> Unit): StepperAttribute

    /**
     * Triggered when the user clicks the skip button to bypass the current step.
     *
     * @param { ?() -> Unit } callback - Callback function triggered when skip is clicked.
     * @returns { StepperAttribute } Returns the stepper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onSkip(callback: ?() -> Unit): StepperAttribute

     /**
     * Triggered when the step changes, either forward or backward.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback - Callback function triggered when step changes.
     * The first parameter is the index of previous step, and the second parameter is the index of current step.
     * @returns { StepperAttribute } Returns the stepper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(callback: ?(UInt32, UInt32) -> Unit): StepperAttribute

     /**
     * Triggered when the user clicks the next button to proceed to the next step.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback - Callback function triggered when next is clicked.
     * The first parameter is the index of current step, and the second parameter is the index of next step.
     * @returns { StepperAttribute } Returns the stepper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onNext(callback: ?(UInt32, UInt32) -> Unit): StepperAttribute

     /**
     * Triggered when the user clicks the previous button to go back to the previous step.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback - Callback function triggered when previous is clicked.
     * The first parameter is the index of current step, and the second parameter is the index of previous step.
     * @returns { StepperAttribute } Returns the stepper attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onPrevious(callback: ?(UInt32, UInt32) -> Unit): StepperAttribute
}
