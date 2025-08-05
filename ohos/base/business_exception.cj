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

package ohos.base

import std.collection.HashMap
import ohos.labels.APILevel

protected const ERR_NO_PERMISSION: Int32 = 201
protected const ERR_NOT_SYSTEM_APP: Int32 = 202
protected const ERR_PARAMETER_ERROR: Int32 = 401
protected const ERR_NOT_SUPPOERTED: Int32 = 801
protected let UNIVERSAL_ERROR_MAP = HashMap<Int32, String>(
    [
        (ERR_NO_PERMISSION,
            "Permission verification failed. The application does not have the permission required to call the API."),
        (ERR_NOT_SYSTEM_APP, "Permission verification failed. A non-system application calls a system API."),
        (ERR_PARAMETER_ERROR, "Parameter error. Parameter verification failed."),
        (ERR_NOT_SUPPOERTED, "Capability not supported. Failed to call the API due to limited device capabilities.")
    ]
)

protected func getUniversalErrorMsg(code: Int32): ?String {
    UNIVERSAL_ERROR_MAP.get(code)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class BusinessException <: Exception {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let code: Int32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(code: Int32, msg: String) {
        super(msg)
        this.code = code
    }

    protected override func getClassName(): String {
        "BusinessException"
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func toString(): String {
        let className: String = getClassName()
        let message: String = this.message
        if (message.isEmpty()) {
            return "${className}:  errorcode: ${code}"
        }
        return "${className}: errorcode: ${code}, message: ${message}"
    }
}
