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

import ohos.arkui.component.common.{CommonMethodComponent}
import ohos.base.{VoidCallback}
import ohos.ffi.{Callback0Param}
import ohos.labels.{APILevel}

foreign {
    func FfiOHOSAceFrameworkCounterCreate(): Unit

    func FfiOHOSAceFrameworkCounterSetOnInc(callback: Int64): Unit

    func FfiOHOSAceFrameworkCounterSetOnDec(callback: Int64): Unit

    func FfiOHOSAceFrameworkCounterEnableDec(enable: Bool): Unit

    func FfiOHOSAceFrameworkCounterEnableInc(enable: Bool): Unit
}

/**
 * Defines Counter Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Counter <: CommonMethodComponent<Counter> & CounterAttribute {

    /**
     * Counter constructor.
     *
     * @param { () -> Unit } content - The content to display in the counter.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?Bool } value - Whether to enable the increment button.
     * @default true
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableInc(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCounterEnableInc(value ?? true);
        }
        this
    }

    /**
     * Indicates whether the decrease button of counter component is available or not.
     *
     * @param { ?Bool } value - Whether to enable the decrement button.
     * @default true
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableDec(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCounterEnableDec(value ?? true);
        }
        this
    }

    /**
     * Listen to the event that the value increases.
     *
     * @param { ?VoidCallback } event - The callback function triggered when the counter value increases.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onInc(event: ?VoidCallback): This {
        let tmpEvent = event ?? { => }
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnInc(Callback0Param<Unit>(tmpEvent).getID());
        }
        this
    }

    /**
     * Listens to the number decrease event.
     *
     * @param { ?VoidCallback } event - The callback function triggered when the counter value decreases.
     * @returns { This } - The instance of the component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDec(event: ?VoidCallback): This {
        let tmpEvent = event ?? { => }
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnDec(Callback0Param<Unit>(tmpEvent).getID());
        }
        this
    }
}
