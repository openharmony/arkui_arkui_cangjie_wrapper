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
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.image.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap

@C
struct CImageLoadResult {
    CImageLoadResult(
        let width: Float64,
        let height: Float64,
        let componentWidth: Float64,
        let componentHeight: Float64,
        let loadingStatus: Int32,
        let contentWidth: Float64,
        let contentHeight: Float64,
        let contentOffsetX: Float64,
        let contentOffsetY: Float64
    ) {}
}

func parseCImageLoadResult(value: CImageLoadResult): ImageLoadResult {
    ImageLoadResult(value.width, value.height, value.componentWidth, value.componentHeight, value.loadingStatus,
        value.contentWidth, value.contentHeight, value.contentOffsetX, value.contentOffsetY)
}

foreign {
    func FfiOHOSAceFrameworkImageSpanCreateWithUrl(src: CString): Unit

    func FfiOHOSAceFrameworkImageSpanCreateWithPixelMap(src: Int64): Unit

    func FfiOHOSAceFrameworkImageSpanVerticalAlign(value: Int32): Unit

    func FfiOHOSAceFrameworkImageSpanObjectFit(value: Int32): Unit

    func FfiOHOSAceFrameworkImageSpanTextBackgroundStyle(color: UInt32, radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkImageSpanTextBackgroundStyleBorder(color: UInt32, radius: CBorderRadiuses): Unit

    func FfiOHOSAceFrameworkImageSpanSetColorFilter(handle: VectorFloat32Handle): Unit

    func FfiOHOSAceFrameworkImageSpanAlt(pixelMapId: Int64): Unit

    func FfiOHOSAceFrameworkImageSpanOnComplete(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageSpanOnError(callback: Int64): Unit
}

/**
 * Defines ImageSpan Component instance.
 *
 * @relation const ImageSpan: ImageSpanInterface
 */
@!APILevel[
    21,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageSpan <: CommonMethodComponent<ImageSpanAttribute> & ImageSpanAttribute {
    /**
     * Called when image is entered in span.
     *
     * @param { ResourceStr } value - The image resource.
     * @returns { ImageSpan } The attribute of the image span.
     * @relation (value: ResourceStr | PixelMap): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?ResourceStr) {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let content = match(tmpValue) {
            case v: AppResource => getResourceMedia(v)
            case v: String => v
            case _ => ""
        }
        unsafe {
            try (unsafeSrc = LibC.mallocCString(content).asResource()) {
                FfiOHOSAceFrameworkImageSpanCreateWithUrl(unsafeSrc.value)
            }
        }
    }

    /**
     * Called when image is entered in span.
     *
     * @param { PixelMap } value - The image resource.
     * @returns { ImageSpan } The attribute of the image span.
     * @relation (value: ResourceStr | PixelMap): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?PixelMap) {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkImageSpanCreateWithPixelMap(tmpValue.getID())
        }
    }

    /**
     * Called when the alignment of image span is set.
     *
     * @param { ImageSpanAlignment } value - The alignment type of image span.
     * @returns { This } The attribute of the image span.
     * @relation verticalAlign(value: ImageSpanAlignment): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func verticalAlign(value: ?ImageSpanAlignment): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkImageSpanVerticalAlign(tmpValue.getValue())
        }
        return this
    }

    /**
     * Sets the zoom type of an image.
     *
     * @param { ImageFit } value - Image display mode.
     * @returns { This } The attribute of the image span.
     * @relation objectFit(value: ImageFit): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func objectFit(value: ?ImageFit): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkImageSpanObjectFit(tmpValue.getValue())
        }
        return this
    }

    /**
     * Sets the color filter effect on the image span.
     *
     * @param { ColorFilter } filter ColorFilter object.
     * @returns { This } The attribute of the image span.
     * @relation colorFilter(filter: ColorFilter | DrawingColorFilter): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colorFilter(filter: ?ColorFilter): This {
        let tmpFilter = filter ?? throw IllegalArgumentException("The type now is not supported.")
        let vecFfi = FFIVectorFloat32(tmpFilter.matrix.size)
        for (i in 0..tmpFilter.matrix.size) {
            vecFfi.setElement(i, tmpFilter.matrix[i])
        }
        unsafe {
            FfiOHOSAceFrameworkImageSpanSetColorFilter(vecFfi.getNativeHandle())
            vecFfi.free()
        }
        return this
    }

    /**
     * Sets a callback which is triggered when the image is successfully loaded.
     * The size of the image source that is successfully loaded is returned, in pixels.
     *
     * @param { ImageCompleteCallback } callback - Triggered when the image is successfully loaded.
     * @returns { ImageSpanAttribute } The attribute of the image span.
     * @relation onComplete(callback: ImageCompleteCallback): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onComplete(callback: ?ImageCompleteCallback): This {
        let tmpCallback = callback ?? throw IllegalArgumentException("The type now is not supported.")
        let wrapper = {
            value: CImageLoadResult => tmpCallback(parseCImageLoadResult(value))
        }
        let lambdaData = Callback1Param<CImageLoadResult, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkImageSpanOnComplete(lambdaData.getID())
        }
        return this
    }

    /**
     * Sets a callback which is triggered when an exception occurs during image loading.
     * The field of "message" returned in the callback carries the detailed information of failed image loading.
     *
     * @param { ImageErrorCallback } callback - Triggered when an exception occurs during image loading.
     * @returns { This } The attribute of the image span.
     * @relation onError(callback: ImageErrorCallback): ImageSpanAttribute
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onError(callback: ?ImageErrorCallback): This {
        let tmpCallback = callback ?? throw IllegalArgumentException("The type now is not supported.")
        let wrapper = {
            value: CImageError =>
            let error = ImageError(
                value.componentWidth, value.componentHeight, value.message.toString())
            tmpCallback(error)
        }
        let lambdaData = Callback1Param<CImageError, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkImageSpanOnError(lambdaData.getID())
        }
        return this
    }

    // ImageSpan does not need to implement pop function
    protected func pop(): Unit {}
}
