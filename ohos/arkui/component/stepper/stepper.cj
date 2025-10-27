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

package ohos.arkui.component.stepper

import ohos.arkui.component.common.*
import ohos.ffi.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkStepperCreate(index: UInt32): Unit

    func FfiOHOSAceFrameworkStepperOnFinish(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnSkip(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnNext(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnPrevious(callback: Int64): Unit
}
/**
 * A component that provides step-by-step navigation for multi-step processes or wizards.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Stepper <: CommonMethodComponent<Stepper> & StepperAttribute {

    /**
     * Initializes a Stepper component with optional initial index and child content.
     *
     * @param { ?UInt32 } [index] - Initial step index.
     * @param { () -> Unit } [child] - Builder function for Stepper content.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(index!: ?UInt32 = None, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkStepperCreate(index ?? 0)
        }
        this.child = child
    }

    /**
     * Callback when the finish label is clicked.
     * Triggered when the user clicks the finish button to complete all steps.
     *
     * @param { ?() -> Unit } callback - Callback function triggered when finish is clicked.
     * @returns { This } Returns the Stepper instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? { => }
        let lambdaData = Callback0Param<Unit>(tmpCallback);
        unsafe {
            FfiOHOSAceFrameworkStepperOnFinish(lambdaData.getID())
        }
        this
    }

    /**
     * Triggered when the user clicks the skip button to bypass the current step.
     *
     * @param { ?() -> Unit } callback - Callback function triggered when skip is clicked.
     * @returns { This } Returns the Stepper instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSkip(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? { => }
        let lambdaData = Callback0Param<Unit>(tmpCallback);
        unsafe {
            FfiOHOSAceFrameworkStepperOnSkip(lambdaData.getID())
        }
        this
    }

     /**
     * Triggered when the step changes, either forward or backward.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback - Callback function triggered when step changes.
     * The first parameter is the index of previous step, and the second parameter is the index of current step.
     * @returns { This } Returns the Stepper instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(UInt32, UInt32) -> Unit): This {
        let tmpCallback = callback ?? { _, _ => }
        let wrapper = {
            prevIndex: Int32, index: Int32 => tmpCallback(UInt32(prevIndex), UInt32(index))
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkStepperOnChange(lambdaData.getID())
        }
        this
    }

     /**
     * Triggered when the user clicks the next button to proceed to the next step.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback - Callback function triggered when next is clicked.
     * The first parameter is the index of current step, and the second parameter is the index of next step.
     * @returns { This } Returns the Stepper instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onNext(callback: ?(UInt32, UInt32) -> Unit): This {
        let tmpCallback = callback ?? { _, _ => }
        let wrapper = {
            index: Int32, pendingIndex: Int32 => tmpCallback(UInt32(index), UInt32(pendingIndex))
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkStepperOnNext(lambdaData.getID())
        }
        this
    }

     /**
     * Triggered when the user clicks the previous button to go back to the previous step.
     *
     * @param { ?(UInt32, UInt32) -> Unit } callback - Callback function triggered when previous is clicked.
     * The first parameter is the index of current step, and the second parameter is the index of previous step.
     * @returns { This } Returns the Stepper instance.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPrevious(callback: ?(UInt32, UInt32) -> Unit): This {
        let tmpCallback = callback ?? { _, _ => }
        let wrapper = {
            index: Int32, pendingIndex: Int32 => tmpCallback(UInt32(index), UInt32(pendingIndex))
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkStepperOnPrevious(lambdaData.getID())
        }
        this
    }
}
