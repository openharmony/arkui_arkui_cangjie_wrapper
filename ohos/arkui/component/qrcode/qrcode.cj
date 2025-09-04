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

package ohos.arkui.component.qrcode

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkQRCodeCreate(value: CString): Unit

    func FfiOHOSAceFrameworkQRCodeSetQRCodeColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkQRCodeSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkQRCodeSetContentOpacity(value: Float64): Unit
}

/**
 * Defines QRCode Component.
 *
 * @relation declare const QRCode: QRCodeInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class QRCode <: CommonMethodComponent<QRCodeAttribute> & QRCodeAttribute {
    /**
     * Called when a QR code is set.
     *
     * @param { ResourceStr } value
     * @returns { This }
     * @relation (value: ResourceStr): QRCodeAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ResourceStr) {
        let value_ = transResourceStrToString(value)
        unsafe {
            try (str = LibC.mallocCString(value_).asResource()) {
                FfiOHOSAceFrameworkQRCodeCreate(str.value)
            }
        }
    }

    /**
     * Called when the QR code color is set.
     *
     * @param { ResourceStr } value
     * @returns { This }
     * @relation color(value: ResourceColor): QRCodeAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkQRCodeSetQRCodeColor(transAppResourceToResourceColor(value))
        }
        this
    }

    protected override func backgroundColorInner(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkQRCodeSetBackgroundColor(transAppResourceToResourceColor(value))
        }
        this
    }

    /**
     * Set the opacity of the QR code content color.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation contentOpacity(value: number | Resource): QRCodeAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentOpacity(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkQRCodeSetContentOpacity(value)
        }
        this
    }

    /**
     * Set the opacity of the QR code content color.
     *
     * @param { AppResource } value
     * @returns { This }
     * @relation contentOpacity(value: number | Resource): QRCodeAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentOpacity(value: AppResource): This {
        var dimension: Length = getResourceLength(value)
        contentOpacity(dimension.value)
    }
}
