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

package ohos.component

foreign {
    func FfiOHOSAceFrameworkStepperCreate(index: UInt32): Unit

    func FfiOHOSAceFrameworkStepperOnFinish(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnSkip(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnNext(callback: Int64): Unit

    func FfiOHOSAceFrameworkStepperOnPrevious(callback: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Stepper <: ContainerBase {

    /**
     * Constructs a Stepper component.
     *
     * @param index:Sets the index value of the currently displayed StepperItem of the Step Navigator.The default value is 0.
     * @param content: Assigns the passed-in value to the child property inherited from ContainerBase.
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(index: UInt32, content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkStepperCreate(index)
        }
        this.child = content
    }

    /**
     * Constructs a Stepper component.
     *
     * @param content: Assigns the passed-in value to the child property inherited from ContainerBase.
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: () -> Unit) {
        this(0, content)
    }

    /**
     * This event is triggered when the last step in the step navigator is completed.
     *
     * @param callback: callback event.
     * @return This: Stepper component instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkStepperOnFinish(lambdaData.getID())
        }
        this
    }

    /**
     * This event is triggered when the skip button on the right is clicked when the next button in the step navigator is in the skip state.
     *
     * @param callback: callback event.
     * @return This: Stepper component instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSkip(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkStepperOnSkip(lambdaData.getID())
        }
        this
    }

    /**
     * This event is triggered when a user clicks the left or right button in the step navigator to switch steps.
     *
     * @param callback: callback event.
     * @return This: Stepper component instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (UInt32, UInt32) -> Unit): This {
        let wrapper = {
            prevIndex: Int32, index: Int32 => callback(UInt32(prevIndex), UInt32(index))
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkStepperOnChange(lambdaData.getID())
        }
        this
    }

    /**
     * This event is triggered when a user clicks the next button.
     *
     * @param callback: callback event.
     * @return This: Stepper component instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onNext(callback: (UInt32, UInt32) -> Unit): This {
        let wrapper = {
            index: Int32, pendingIndex: Int32 => callback(UInt32(index), UInt32(pendingIndex))
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkStepperOnNext(lambdaData.getID())
        }
        this
    }

    /**
     * This event is triggered when a user clicks the previous button.
     *
     * @param callback: callback event.
     * @return This: Stepper component instance
     * @since 11
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPrevious(callback: (UInt32, UInt32) -> Unit): This {
        let wrapper = {
            index: Int32, pendingIndex: Int32 => callback(UInt32(index), UInt32(pendingIndex))
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkStepperOnPrevious(lambdaData.getID())
        }
        this
    }
}
