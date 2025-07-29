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

@!APILevel[
    12,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageLoadResult {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var componentWidth: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var componentHeight: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var loadingStatus: Int64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentWidth: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentHeight: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentOffsetX: Float64
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentOffsetY: Float64

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: Float64,
        height: Float64,
        componentWidth: Float64,
        componentHeight: Float64,
        loadingStatus: Int64,
        contentWidth: Float64,
        contentHeight: Float64,
        contentOffsetX: Float64,
        contentOffsetY: Float64
    ) {
        this.width = width
        this.height = height
        this.componentWidth = componentWidth
        this.componentHeight = componentHeight
        this.loadingStatus = loadingStatus
        this.contentWidth = contentWidth
        this.contentHeight = contentHeight
        this.contentOffsetX = contentOffsetX
        this.contentOffsetY = contentOffsetY
    }
}

@C
struct CImageLoadResult {
    CImageLoadResult(
        let width: Float64,
        let height: Float64,
        let componentWidth: Float64,
        let componentHeight: Float64,
        let loadingStatus: Int64,
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

@!APILevel[
    12,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageSpan <: ViewBase {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: AppResource) {
        unsafe {
            let unsafeSrc = LibC.mallocCString(getResourceMedia(src))
            FfiOHOSAceFrameworkImageSpanCreateWithUrl(unsafeSrc)
            LibC.free(unsafeSrc)
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: PixelMap) {
        unsafe {
            FfiOHOSAceFrameworkImageSpanCreateWithPixelMap(src.getID())
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: String) {
        unsafe {
            var unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkImageSpanCreateWithUrl(unsafeSrc)
            LibC.free(unsafeSrc)
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func verticalAlign(value: ImageSpanAlignment): This {
        unsafe {
            FfiOHOSAceFrameworkImageSpanVerticalAlign(value.getValue())
        }
        return this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func objectFit(value: ImageFit): This {
        unsafe {
            FfiOHOSAceFrameworkImageSpanObjectFit(value.getValue())
        }
        return this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textBackgroundStyle(color!: ResourceColor = Color.TRANSPARENT, radius!: Length = 0.vp): This {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkImageSpanTextBackgroundStyleBorder(transAppResourceToResourceColor(color),
                CBorderRadiuses(radius_, radius_, radius_, radius_))
        }
        return this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textBackgroundStyle(color!: ResourceColor = Color.TRANSPARENT, radius!: BorderRadiuses): This {
        unsafe {
            FfiOHOSAceFrameworkImageSpanTextBackgroundStyleBorder(transAppResourceToResourceColor(color),
                radius.toCBorderRadiuses())
        }
        return this
    }

    @!APILevel[
        15,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colorFilter(filter: ColorFilter): This {
        let vecFfi = FFIVectorFloat32(filter.matrix.size)
        for (i in 0..filter.matrix.size) {
            vecFfi.setElement(i, filter.matrix[i])
        }
        unsafe {
            FfiOHOSAceFrameworkImageSpanSetColorFilter(vecFfi.getNativeHandle())
            vecFfi.free()
        }
        return this
    }

    @!APILevel[
        15,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onComplete(callback: (ImageLoadResult) -> Unit): This {
        let wrapper = {
            value: CImageLoadResult => callback(parseCImageLoadResult(value))
        }
        let lambdaData = Callback1Param<CImageLoadResult, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkImageSpanOnComplete(lambdaData.getID())
        }
        return this
    }

    @!APILevel[
        15,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onError(callback: (CJImageError) -> Unit): This {
        let wrapper = {
            value: CImageError =>
            let error = CJImageError()
            error.componentWidth = value.componentWidth
            error.componentHeight = value.componentHeight
            error.message = value.message.toString()
            callback(error)
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
