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
    func FfiOHOSAceFrameworkStepperItemCreate(): Unit

    func FfiOHOSAceFrameworkStepperItemSetPrevLabel(value: CString): Unit

    func FfiOHOSAceFrameworkStepperItemSetNextLabel(value: CString): Unit

    func FfiOHOSAceFrameworkStepperItemSetStatus(value: UInt32): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class StepperItem <: ContainerBase {

    /**
     * Constructs a StepperItem component.
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
        unsafe {
            FfiOHOSAceFrameworkStepperItemCreate()
        }
        this.child = content
    }

    /**
     * The description text for the fallback text button at the bottom of the step navigator.
     *
     * @param value: Content of the text button on the left.
     * @return StepperItem component instance
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
    public func prevLabel(value: String): This {
        unsafe {
            var valueCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkStepperItemSetPrevLabel(valueCString)
            LibC.free(valueCString)
        }
        this
    }

    /**
     * The description text for the next step text button at the bottom of the step navigator.
     *
     * @param value: Content of the text button on the right.
     * @return StepperItem component instance
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
    public func nextLabel(value: String): This {
        unsafe {
            var valueCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkStepperItemSetNextLabel(valueCString)
            LibC.free(valueCString)
        }
        this
    }

    /**
     * Sets the display state of the Step Navigator nextLabel.
     *
     * @param status: Display status of the nextLabel of the step navigator.
     * @return StepperItem component instance
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
    public func status(status: ItemState): This {
        unsafe {
            FfiOHOSAceFrameworkStepperItemSetStatus(status.getValue())
        }
        this
    }
}
