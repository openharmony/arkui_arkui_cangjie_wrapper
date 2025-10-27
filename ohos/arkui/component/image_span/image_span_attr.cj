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

package ohos.arkui.component.image_span

import ohos.arkui.component.common.*
import ohos.arkui.component.image.*
import ohos.labels.APILevel
import ohos.base.*
import ohos.resource.*
import ohos.multimedia.image.PixelMap

/**
 * Defines ImageSpan Component instance.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ImageSpanAttribute <: CommonMethod<ImageSpanAttribute> {
    /**
     * Called when the alignment of image span is set.
     *
     * @param { ?ImageSpanAlignment } value - The alignment type of image span.
     * @returns { ImageSpanAttribute } The attribute of the image span.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func verticalAlign(value: ?ImageSpanAlignment): ImageSpanAttribute

    /**
     * Sets the zoom type of an image.
     *
     * @param { ?ImageFit } value - Image display mode.
     * @returns { ImageSpanAttribute } The attribute of the image span.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func objectFit(value: ?ImageFit): ImageSpanAttribute

    /**
     * Sets the color filter effect on the image span.
     *
     * @param { ?ColorFilter } filter - ColorFilter object.
     * @returns { ImageSpanAttribute } The attribute of the image span.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colorFilter(filter: ?ColorFilter): ImageSpanAttribute

    /**
     * Sets a callback which is triggered when the image is successfully loaded.
     * The size of the image source that is successfully loaded is returned, in pixels.
     *
     * @param { ?ImageCompleteCallback } callback - Triggered when the image is successfully loaded.
     * @returns { ImageSpanAttribute } The attribute of the image span.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onComplete(callback: ?ImageCompleteCallback): ImageSpanAttribute

    /**
     * Sets a callback which is triggered when an exception occurs during image loading.
     * The field of "message" returned in the callback carries the detailed information of failed image loading.
     *
     * @param { ?ImageErrorCallback } callback - Triggered when an exception occurs during image loading.
     * @returns { ImageSpanAttribute } The attribute of the image span.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onError(callback: ?ImageErrorCallback): ImageSpanAttribute
}
