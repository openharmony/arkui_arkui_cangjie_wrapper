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
    func FfiOHOSAceFrameworkLoadingProgressCreate(): Unit

    func FfiOHOSAceFrameworkLoadingProgressSetColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkLoadingProgressSetEnableLoading(enable: Bool): Unit

    func FfiOHOSAceFrameworkLoadingProgressForegroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkLoadingProgressForegroundColorStrategy(strategy: CString): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LoadingProgress <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkLoadingProgressCreate()
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkLoadingProgressSetColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableLoading(enable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkLoadingProgressSetEnableLoading(enable)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func foregroundColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkLoadingProgressForegroundColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func foregroundColor(value: ColoringStrategy): This {
        unsafe {
            try (strategy = LibC.mallocCString(value.getValue()).asResource()) {
                FfiOHOSAceFrameworkLoadingProgressForegroundColorStrategy(strategy.value)
            }
        }
        this
    }
}
