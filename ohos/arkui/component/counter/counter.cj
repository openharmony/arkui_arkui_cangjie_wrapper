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

package ohos.arkui.component.counter

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkCounterCreate(): Unit

    func FfiOHOSAceFrameworkCounterSetOnInc(callback: Int64): Unit

    func FfiOHOSAceFrameworkCounterSetOnDec(callback: Int64): Unit

    func FfiOHOSAceFrameworkCounterEnableDec(enable: Bool): Unit

    func FfiOHOSAceFrameworkCounterEnableInc(enable: Bool): Unit
}

/**
 * Defines Counter Component.
 *
 * @relation declare const Counter: CounterInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Counter <: ContainerBase {

    /**
     * Return Counter.
     *
     * @param { () -> Unit } content
     * @returns { This }
     * @relation (): CounterAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkCounterCreate()
        }
        this.child = content
    }

    /**
     * Indicates whether the increase button of counter component is available or not.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation enableInc(value: boolean): CounterAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableInc(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCounterEnableInc(value);
        }
        this
    }

    /**
     * Indicates whether the decrease button of counter component is available or not.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation enableDec(value: boolean): CounterAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableDec(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCounterEnableDec(value);
        }
        this
    }

    /**
     * Listen to the event that the value increases.
     *
     * @param { VoidCallback } event
     * @returns { This }
     * @relation onInc(event: VoidCallback): CounterAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onInc(event: VoidCallback): This {
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnInc(Callback0Param<Unit>(event).getID());
        }
        this
    }

    /**
     * Listens to the number decrease event.
     *
     * @param { VoidCallback } event
     * @returns { This }
     * @relation onDec(event: VoidCallback): CounterAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDec(event: VoidCallback): This {
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnDec(Callback0Param<Unit>(event).getID());
        }
        this
    }
}
