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

import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkLocationButtonCreate(): Unit

    func FfiOHOSAceFrameworkLocationButtonCreateWithButtonOptions(icon: Int32, text: Int32, buttonStyle: Int32): Unit
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LocationIconStyle {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FullFilled
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lines
    | ...

    func getValue(): Int32 {
        match (this) {
            case FullFilled => 0
            case Lines => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LocationDescription {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CurrentLocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    AddLocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SelectLocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ShareLocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SendLocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Locating
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Location
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SendCurrentLocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Relocation
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PunchIn
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CurrentPosition
    | ...

    func getValue(): Int32 {
        match (this) {
            case CurrentLocation => 0
            case AddLocation => 1
            case SelectLocation => 2
            case ShareLocation => 3
            case SendLocation => 4
            case Locating => 5
            case Location => 6
            case SendCurrentLocation => 7
            case Relocation => 8
            case PunchIn => 9
            case CurrentPosition => 10
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LocationButtonOnClickResult {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Success
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    TemporaryAuthorizationFailed
    | ...

    func getValue(): Int32 {
        match (this) {
            case Success => 0
            case TemporaryAuthorizationFailed => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parseValue(value: Int32): LocationButtonOnClickResult {
        match (value) {
            case 0 => Success
            case 1 => TemporaryAuthorizationFailed
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocationButton <: SecurityComponent {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon!: ?LocationIconStyle = None, text!: ?LocationDescription = None,
        buttonType!: ButtonType = ButtonType.Capsule) {
        var iconValue = match (icon) {
            case Some(v) => v.getValue()
            case None => Int32(-1)
        }
        var textValue = match (text) {
            case Some(v) => v.getValue()
            case None => Int32(-1)
        }
        if (iconValue == -1 && textValue == -1) {
            unsafe {
                FfiOHOSAceFrameworkLocationButtonCreate()
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkLocationButtonCreateWithButtonOptions(iconValue, textValue, buttonType.getValue())
            }
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(callback: (ClickEvent, LocationButtonOnClickResult) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent, result: Int32 =>
            var resolved = parseCJClickEvent(evt)
            var res = LocationButtonOnClickResult.parseValue(result)
            callback(resolved, res)
        }
        let lambda = Callback2Param<CJClickEvent, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSaveButtonOnClick(lambda.getID())
        }
        this
    }
}
