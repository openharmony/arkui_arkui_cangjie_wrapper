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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.qrcode

import ohos.arkui.component.common.{CommonMethodComponent, }
import ohos.arkui.component.util.{transResourceStrToString, transAppResourceToResourceColor}
import ohos.base.{ResourceStr, ResourceColor, Length}
import ohos.resource.{AppResource, getResourceLength}
import ohos.labels.{APILevel, Hide}

foreign {
    func FfiOHOSAceFrameworkQRCodeCreate(value: CString): Unit

    func FfiOHOSAceFrameworkQRCodeSetQRCodeColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkQRCodeSetBackgroundColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkQRCodeSetContentOpacity(value: Float64): Unit
}

/**
 * Defines QRCode Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class QRCode <: CommonMethodComponent<QRCode> & QRCodeAttribute {
    /**
     * Called when a QR code is set.
     *
     * @param { ?ResourceStr } value - Content of the QR code. Maximum of 512 characters are supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?ResourceStr) {
        let value_ = transResourceStrToString(value ?? "undefined")
        unsafe {
            try (str = LibC.mallocCString(value_).asResource()) {
                FfiOHOSAceFrameworkQRCodeCreate(str.value)
            }
        }
    }

    /**
     * Called when the QR code color is set.
     *
     * @param { ?ResourceColor } value - Color of the QR code. The default value is 0xff000000.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func color(value: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkQRCodeSetQRCodeColor(transAppResourceToResourceColor(value ?? 0xFF000000))
        }
        this
    }

    protected override func backgroundColorInner(value: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkQRCodeSetBackgroundColor(transAppResourceToResourceColor(value ?? 0xFFFFFFFF))
        }
        this
    }

    /**
     * Set the opacity of the QR code content color.
     *
     * @param { ?Float64 } value - Indicates the opacity of the QR code content color. The value ranges from 0 to 1. The default value is 1.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentOpacity(value: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkQRCodeSetContentOpacity(value ?? 1.0)
        }
        this
    }

    /**
     * Set the opacity of the QR code content color.
     *
     * @param { ?AppResource } value - Indicates the opacity of the QR code content color. The value ranges from 0 to 1. The default value is 1.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentOpacity(value: ?AppResource): This {
        if (let Some(v) <- value) {
            var dimension: Length = getResourceLength(v)
            contentOpacity(dimension.value)
        } else {
            contentOpacity(1.0)
        }
        return this
    }
}
