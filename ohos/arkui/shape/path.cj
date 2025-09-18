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

package ohos.arkui.shape

import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkPathInsCreate(commands: CString): Int64

    func FfiOHOSAceFrameworkPathInsCreateWithSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32,
        commands: CString): Int64
}

@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PathShape <: BaseShape {
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(commands!: ?ResourceStr = None) {
        super(
            unsafe {
                let commandsValue = transResourceStrToString(commands ?? "")
                var id: Int64 = 0
                try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                    id = FfiOHOSAceFrameworkPathInsCreate(unsafeContent.value)
                }
                id
            })
    }

    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length, height!: ?Length, commands!: ?ResourceStr = None) {
        super(
            unsafe {
                let tmpWidth = width ?? throw IllegalArgumentException("The type now is not supported.")
                let tmpHeight = height ?? throw IllegalArgumentException("The type now is not supported.")
                var width_ = transAppResourceToLength(tmpWidth)
                var height_ = transAppResourceToLength(tmpHeight)
                let commandsValue = transResourceStrToString(commands ?? "")
                var id: Int64 = 0
                try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                    id = FfiOHOSAceFrameworkPathInsCreateWithSize(
                        width_.value, width_.unitType.getValue(),
                        height_.value, height_.unitType.getValue(),
                        unsafeContent.value)
                }
                id
            })
    }
}
