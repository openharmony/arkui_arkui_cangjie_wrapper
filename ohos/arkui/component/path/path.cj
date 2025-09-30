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

/**
 * Defines Path Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Path <: CommonShapeMethodComponent<Path> & PathAttribute {
    /**
     * Create a path.
     *
     * @params { ResourceStr } commands - Commands option.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(commands!: ?ResourceStr = None) {
        unsafe {
            let commandsValue = transResourceStrToString(commands ?? "")
            try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                FfiOHOSAceFrameworkPathCreate(unsafeContent.value)
            }
        }
    }

    /**
     * Create a path.
     *
     * @params { Length } width - Width option.
     * @params { Length } height - Height option.
     * @params { ResourceStr } commands - Commands option.
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: ?Length, height!: ?Length, commands!: ?ResourceStr = None) {
        var width_ = transAppResourceToLength(width ?? 0.0)
        var height_ = transAppResourceToLength(height ?? 0.0)
        unsafe {
            let commandsValue = transResourceStrToString(commands ?? "")
            try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                FfiOHOSAceFrameworkPathCreateWithSize(width_.value, width_.unitType.getValue(),
                    height_.value, height_.unitType.getValue(), unsafeContent.value)
            }
        }
    }

    /**
     * Called when the command string drawn by the path is set.
     *
     * @params { ResourceStr } commands
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func commands(value: ?ResourceStr): This {
        unsafe {
            let commandsValue = transResourceStrToString(value ?? "undefined")
            try (unsafeContent = LibC.mallocCString(commandsValue).asResource()) {
                FfiOHOSAceFrameworkPathSetCommands(unsafeContent.value)
            }
        }
        this
    }

    protected override func initial() {}
}
