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
    func FfiOHOSAceFrameworkPathCreate(commands: CString): Unit

    func FfiOHOSAceFrameworkPathCreateWithSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32,
        commands: CString): Unit

    func FfiOHOSAceFrameworkPathInsCreate(commands: CString): Int64

    func FfiOHOSAceFrameworkPathInsCreateWithSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32,
        commands: CString): Int64

    func FfiOHOSAceFrameworkPathSetCommands(commands: CString): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PathShape <: ShapeAbstract {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(commands!: String) {
        super(
            unsafe {
                var id: Int64 = 0
                try (unsafeContent = LibC.mallocCString(commands).asResource()) {
                    id = FfiOHOSAceFrameworkPathInsCreate(unsafeContent.value)
                }
                id
            })
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width!: Length, height!: Length, commands!: String = "") {
        super(
            unsafe {
                var width_ = transAppResourceToLength(width)
                var height_ = transAppResourceToLength(height)
                var id: Int64 = 0
                try (unsafeContent = LibC.mallocCString(commands).asResource()) {
                    id = FfiOHOSAceFrameworkPathInsCreateWithSize(
                        width_.value,
                        width_.unitType.getValue(),
                        height_.value,
                        height_.unitType.getValue(),
                        unsafeContent.value
                    )
                }
                id
            })
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this(commands: "")
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
public class Path <: ShapeComponent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(commands!: String = "") {
        unsafe {
            try (unsafeContent = LibC.mallocCString(commands).asResource()) {
                FfiOHOSAceFrameworkPathCreate(unsafeContent.value)
            }
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
    public init(width!: Length, height!: Length, commands!: String = "") {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            try (unsafeContent = LibC.mallocCString(commands).asResource()) {
                FfiOHOSAceFrameworkPathCreateWithSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue(), unsafeContent.value)
            }
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
    public func commands(commands: String): This {
        unsafe {
            try (unsafeContent = LibC.mallocCString(commands).asResource()) {
                FfiOHOSAceFrameworkPathSetCommands(unsafeContent.value)
            }
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
    public override func initial() {}
}
