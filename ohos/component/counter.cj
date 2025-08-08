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
    func FfiOHOSAceFrameworkCounterCreate(): Unit

    func FfiOHOSAceFrameworkCounterSetOnInc(callback: Int64): Unit

    func FfiOHOSAceFrameworkCounterSetOnDec(callback: Int64): Unit

    func FfiOHOSAceFrameworkCounterEnableDec(enable: Bool): Unit

    func FfiOHOSAceFrameworkCounterEnableInc(enable: Bool): Unit
}

@!APILevel[
    2,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Counter <: ContainerBase {
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
            FfiOHOSAceFrameworkCounterCreate()
        }
        this.child = content
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableInc(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCounterEnableInc(value);
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableDec(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkCounterEnableDec(value);
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onInc(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnInc(Callback0Param<Unit>(callback).getID());
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDec(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkCounterSetOnDec(Callback0Param<Unit>(callback).getID());
        }
        this
    }
}
