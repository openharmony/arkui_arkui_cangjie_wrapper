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

package ohos.arkui.component.stepper_item

import ohos.arkui.component.common.{CommonMethodComponent, ItemState}
import ohos.labels.{APILevel}

foreign {
    func FfiOHOSAceFrameworkStepperItemCreate(): Unit

    func FfiOHOSAceFrameworkStepperItemSetPrevLabel(value: CString): Unit

    func FfiOHOSAceFrameworkStepperItemSetNextLabel(value: CString): Unit

    func FfiOHOSAceFrameworkStepperItemSetStatus(value: UInt32): Unit
}

/**
 * Defines StepperItem Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class StepperItem <: CommonMethodComponent<StepperItem> & StepperItemAttribute {

    /**
     * Initializes a StepperItem component with child content.
     *
     * @param { () -> Unit } child - Builder function for StepperItem content.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkStepperItemCreate()
        }
        this.child = child
    }

    /**
     * Called when the value of stepperItem prevLabel is set
     *
     * @param { ?String } value - Text displayed on the previous step button.
     * @returns { This } Returns the StepperItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func prevLabel(value: ?String): This {
        unsafe {
            try (valueCString = LibC.mallocCString(value ?? "").asResource()) {
                FfiOHOSAceFrameworkStepperItemSetPrevLabel(valueCString.value)
            }
        }
        this
    }

    /**
     * Called when the value of stepperItem nextLabel is set
     *
     * @param { ?String } value - Text displayed on the next step button.
     * @returns { This } Returns the StepperItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nextLabel(value: ?String): This {
        unsafe {
            try (valueCString = LibC.mallocCString(value ?? "").asResource()) {
                FfiOHOSAceFrameworkStepperItemSetNextLabel(valueCString.value)
            }
        }
        this
    }

    /**
     * Called when the value of stepperItem status is set
     *
     * @param { ?ItemState } [status] - Display state of the step item.
     * @returns { This } Returns the StepperItem instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func status(status!: ?ItemState = None): This {
        let tmpStatus = status ?? ItemState.Normal
        unsafe {
            FfiOHOSAceFrameworkStepperItemSetStatus(tmpStatus.getValue())
        }
        this
    }
}
