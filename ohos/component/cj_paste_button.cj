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
    func FfiOHOSAceFrameworkPasteButtonCreate(): Unit

    func FfiOHOSAceFrameworkPasteButtonCreateWithButtonOptions(icon: Int32, text: Int32, buttonStyle: Int32): Unit
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum PasteIconStyle {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Lines | ...

    func getValue(): Int32 {
        match (this) {
            case Lines => 0
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
public enum PasteDescription {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Paste | ...

    func getValue(): Int32 {
        match (this) {
            case Paste => 0
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
public enum PasteButtonOnClickResult {
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

    static func parseValue(value: Int32): PasteButtonOnClickResult {
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
public class PasteButton <: SecurityComponent {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon!: ?PasteIconStyle = None, text!: ?PasteDescription = None,
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
                FfiOHOSAceFrameworkPasteButtonCreate()
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkPasteButtonCreateWithButtonOptions(iconValue, textValue, buttonType.getValue())
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
    public func onClick(callback: (ClickEvent, PasteButtonOnClickResult) -> Unit): This {
        let wrapper = {
            evt: CJClickEvent, result: Int32 =>
            var resolved = parseCJClickEvent(evt)
            var res = PasteButtonOnClickResult.parseValue(result)
            callback(resolved, res)
        }
        let lambda = Callback2Param<CJClickEvent, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSaveButtonOnClick(lambda.getID())
        }
        this
    }
}
