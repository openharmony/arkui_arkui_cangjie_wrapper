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
public class Counter <: CommonMethodComponent<CounterAttribute> & CounterAttribute {

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
    public func enableInc(value: ?Bool): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCounterEnableInc(tmpValue);
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
    public func enableDec(value: ?Bool): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCounterEnableDec(tmpValue);
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
    public func onInc(event: ?VoidCallback): This {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnInc(Callback0Param<Unit>(tmpEvent).getID());
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
    public func onDec(event: ?VoidCallback): This {
        let tmpEvent = event ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnDec(Callback0Param<Unit>(tmpEvent).getID());
        }
        this
    }
}
