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

package ohos.arkui.component.image

import ohos.arkui.component.common.{CommonMethod, ImageFit, ImageRepeat, ImageInterpolation, ImageRenderMode}
import ohos.business_exception.BusinessException
import ohos.labels.APILevel
import ohos.base.{ResourceStr, Length, ResourceColor}
import ohos.multimedia.image.PixelMap

/**
 * Defines the Image attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ImageAttribute <: CommonMethod<ImageAttribute> {
    /**
     * Sets the placeholder image displayed during loading.
     * 
     * <p><strong>NOTE</strong>:
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     * 
     * @param { ?ResourceStr } value - Placeholder image displayed during loading. Default value is null.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alt(src: ?ResourceStr): ImageAttribute

    /**
     * Sets how the image is resized to fit its container.
     *
     * @param { ?ImageFit } value - How the image is resized to fit its container. Default value is ImageFit.Cover.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func objectFit(value: ?ImageFit): ImageAttribute

    /**
     * Set the repeat style of the picture.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute is not applicable to SVG images.
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?ImageRepeat } value - How the image is repeated. Default value is ImageRepeat.NoRepeat.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func objectRepeat(value: ?ImageRepeat): ImageAttribute

    /**
     * Sets the interpolation effect of the image, which can alleviate aliasing that occurs when the image is zoomed.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute is not applicable to SVG images.
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?ImageInterpolation } value - Interpolation effect of the image. Default value is ImageInterpolation.Low.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func interpolation(value: ?ImageInterpolation): ImageAttribute

    /**
     * Sets the rendering mode of the image.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute is not applicable to SVG images.
     * <br>When ColorFilter is set, this attribute is not effective.
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?ImageRenderMode } value - Rendering mode of the image. Default value is ImageRenderMode.Original.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func renderMode(value: ?ImageRenderMode): ImageAttribute

    /**
     * Sets the decoding size of the image. 
     * The original picture is decoded into a picture of a specified size. The unit of the number type is px.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute works only when the target size is smaller than the source size.
     * <br>This attribute is not applicable to SVG images or PixelMap objects.
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?Length } width - Decoding size of the image.
     * @param { ?Length } height - Decoding size of the image.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sourceSize(width: ?Length, height: ?Length): ImageAttribute

    /**
     * Specifies whether to load the image synchronously.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?Bool } value - Whether to load the image synchronously. Default value is false.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func syncLoad(value: ?Bool): ImageAttribute

    /**
     * Sets the fill color to be superimposed on the image.
     * By default, no fill color is applied. If an invalid value is passed, the system uses the default theme color:
     * black in light mode and white in dark mode.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute applies only to SVG images.
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?ResourceColor } value - Fill color to be superimposed on the image.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fillColor(value: ?ResourceColor): ImageAttribute

    /**
     * Specifies whether to resize the image source based on the size of the display area during image decoding.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor
     * or SVG.
     * </p>
     *
     * @param { ?Bool } value - Whether to resize the image source based on the size of the display area
     * during image decoding. Default value is false.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func autoResize(value: ?Bool): ImageAttribute

    /**
     * Specifies whether to display the image in the system language direction.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?Bool } value - Whether to display the image in the system language direction. Default value is false.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func matchTextDirection(value: ?Bool): ImageAttribute

    /**
     * Sets whether the display size of the image follows the source size.
     *
     * <p><strong>NOTE</strong>:
     * <br>This attribute does not take effect when the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?Bool } value - Whether to fit the image to the size of the image source. Default value is false.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fitOriginalSize(value: ?Bool): ImageAttribute

    /**
     * Triggered when an image is successfully loaded or decoded.
     * The size of the image source that is successfully loaded is returned, in pixels.
     *
     * <p><strong>NOTE</strong>:
     * <br>This event is not triggered if the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?ImageCompleteCallback } callback - The callback function triggered when image loading is complete.
     * @returns { ImageAttribute }
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onComplete(callback: ?ImageCompleteCallback): ImageAttribute

    /**
     * Triggered when an error occurs during image loading.
     * The field of "message" carries the detailed information of failed image loading.
     * 
     * <p><strong>NOTE</strong>:
     * <br>This event is not triggered if the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?ImageErrorCallback } callback - The callback function triggered when an error occurs.
     * @returns { ImageAttribute }
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onError(callback: ?ImageErrorCallback): ImageAttribute

    /**
     * When the loaded source file is a svg image, this callback is triggered when the playback of the svg image is complete.
     * If the svg image is a wireless loop image, this callback is not triggered.
     *
     * <p><strong>NOTE</strong>:
     * <br>Only SVG images are supported.
     * <br>This event is not triggered if the parameter type of the component is AnimatedDrawableDescriptor.
     * </p>
     *
     * @param { ?() -> Unit } event - The callback function triggered when SVG playback is complete.
     * @returns { ImageAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFinish(event: ?() -> Unit): ImageAttribute
}
