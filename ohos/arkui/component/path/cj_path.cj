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

package ohos.arkui.component.path

import ohos.arkui.component.common.*
import ohos.arkui.component.shape.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkPathCreate(commands: CString): Unit

    func FfiOHOSAceFrameworkPathCreateWithSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32,
        commands: CString): Unit

    func FfiOHOSAceFrameworkPathSetCommands(commands: CString): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Path <: ShapeComponent {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(commands!: ResourceStr = "") {
        unsafe {
            let commandsValue = transResourceStrToString(commands)
            try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                FfiOHOSAceFrameworkPathCreate(unsafeContent.value)
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length, height!: Length, commands!: ResourceStr = "") {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            let commandsValue = transResourceStrToString(commands)
            try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                FfiOHOSAceFrameworkPathCreateWithSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue(), unsafeContent.value)
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func commands(commands: ResourceStr): This {
        unsafe {
            let commandsValue = transResourceStrToString(commands)
            try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                FfiOHOSAceFrameworkPathSetCommands(unsafeContent.value)
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func initial() {}
}
