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

package ohos.arkui.component.loading_progress

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.arkui.component.custom_component.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkLoadingProgressCreate(): Unit

    func FfiOHOSAceFrameworkLoadingProgressSetColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkLoadingProgressSetEnableLoading(enable: Bool): Unit

    func FfiOHOSAceFrameworkLoadingProgressForegroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkLoadingProgressForegroundColorStrategy(strategy: CString): Unit
}

/**
 * Defines LoadingProgress Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LoadingProgress <: CommonMethodComponent<LoadingProgress> & LoadingProgressAttribute {
    /**
     * Create a LoadingProgress
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkLoadingProgressCreate()
        }
    }
    /**
     * Load the color of the progress bar.
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkLoadingProgressSetColor(transAppResourceToResourceColor(value ?? 0xFF666666))
        }
        this
    }
}
