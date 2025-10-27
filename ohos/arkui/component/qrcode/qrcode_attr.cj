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
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*

/**
 * Defines QRCode Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface QRCodeAttribute <: CommonMethod<QRCodeAttribute> {
    /**
     * Called when the QR code color is set.
     *
     * @param { ?ResourceColor } value - Color of the QR code. The default value is #ff000000.
     * @returns { QRCodeAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func color(value: ?ResourceColor): QRCodeAttribute

    /**
     * Set the opacity of the QR code content color.
     *
     * @param { ?Float64 } value - Indicates the opacity of the QR code content color. The value ranges from 0 to 1. The default value is 1.
     * @returns { QRCodeAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contentOpacity(value: ?Float64): QRCodeAttribute

    /**
     * Set the opacity of the QR code content color.
     *
     * @param { ?AppResource } value - Indicates the opacity of the QR code content color. The value ranges from 0 to 1. The default value is 1.
     * @returns { QRCodeAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contentOpacity(value: ?AppResource): QRCodeAttribute
}
