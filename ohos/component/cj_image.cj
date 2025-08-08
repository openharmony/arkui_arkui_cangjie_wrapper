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

import ohos.image.PixelMap

@C
struct CImageComplete {
    CImageComplete(
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

@C
struct CImageError {
    CImageError(
        let componentWidth: Float64,
        let componentHeight: Float64,
        let message: CString
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkImageCreateWithUrl(src: CString): Unit

    func FfiOHOSAceFrameworkImageCreateWithPixelMap(id: Int64): Unit

    func FfiOHOSAceFrameworkImageCreateWithContent(src: Int32): Unit

    func FfiOHOSAceFrameworkImageSetAlt(src: CString): Unit

    func FfiOHOSAceFrameworkImageSetAltWithPixelMap(id: Int64): Unit

    func FfiOHOSAceFrameworkImageSetObjectFit(objectFit: Int32): Unit

    func FfiOHOSAceFrameworkImageSetObjectRepeat(objectRepeat: Int32): Unit

    func FfiOHOSAceFrameworkImageSetInterpolation(interpolation: Int32): Unit

    func FfiOHOSAceFrameworkImageSetRenderMode(renderMode: Int32): Unit

    func FfiOHOSAceFrameworkImageSetSourceSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkImageSetSyncLoad(syncLoad: Bool): Unit

    func FfiOHOSAceFrameworkImageSetImageFill(color: UInt32): Unit

    func FfiOHOSAceFrameworkImageSetBorderRadius(): Unit

    func FfiOHOSAceFrameworkImageSetAutoResize(autoResize: Bool): Unit

    func FfiOHOSAceFrameworkImageSetMatchTextDirection(isMatchTextDirection: Bool): Unit

    func FfiOHOSAceFrameworkImageSetFitOriginalSize(isFitOriginalSize: Bool): Unit

    func FfiOHOSAceFrameworkImageSetColorFilter(handle: VectorFloat32Handle): Unit

    func FfiOHOSAceFrameworkImageDynamicRangeMode(value: Int32): Unit

    func FfiOHOSAceFrameworkImageCopyOption(value: Int32): Unit

    func FfiOHOSAceFrameworkImageDraggable(value: Bool): Unit

    func FfiOHOSAceFrameworkImageOnErrorV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageOnFinish(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageOnCompleteV2(callback: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CJImageComplete {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var componentWidth: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var componentHeight: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var loadingStatus: Int32 = 0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentWidth: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentHeight: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentOffsetX: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var contentOffsetY: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: Float64,
        height: Float64,
        componentWidth: Float64,
        componentHeight: Float64,
        loadingStatus: Int32
    ) {
        this.width = width
        this.height = height
        this.componentWidth = componentWidth
        this.componentHeight = componentHeight
        this.loadingStatus = loadingStatus
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: Float64,
        height: Float64,
        componentWidth: Float64,
        componentHeight: Float64,
        loadingStatus: Int32,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CJImageError {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var componentWidth: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var componentHeight: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var message: String = ""

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        componentWidth: Float64,
        componentHeight: Float64
    ) {
        this.componentWidth = componentWidth
        this.componentHeight = componentHeight
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        componentWidth: Float64,
        componentHeight: Float64,
        message: String
    ) {
        this.componentWidth = componentWidth
        this.componentHeight = componentHeight
        this.message = message
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ImageContent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMPTY | ...

    func getValue(): Int32 {
        match (this) {
            case EMPTY => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum DynamicRangeMode {
    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HIGH
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CONSTRAINT
    | @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    STANDARD
    | ...

    func getValue(): Int32 {
        match (this) {
            case HIGH => 0
            case CONSTRAINT => 1
            case STANDARD => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ColorFilter {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    private static let defaultMatrix: Array<Float32> = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0,
        0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0]

    protected let matrix: Array<Float32>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(array: Array<Float32>) {
        if (array.size != 20) {
            matrix = defaultMatrix
        } else {
            matrix = array
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Image <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: String) {
        unsafe {
            var unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkImageCreateWithUrl(unsafeSrc)
            LibC.free(unsafeSrc)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: AppResource) {
        unsafe {
            var unsafeSrc = LibC.mallocCString(getResourceMedia(src))
            FfiOHOSAceFrameworkImageCreateWithUrl(unsafeSrc)
            LibC.free(unsafeSrc)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: PixelMap) {
        unsafe {
            FfiOHOSAceFrameworkImageCreateWithPixelMap(src.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(src: ImageContent) {
        unsafe {
            FfiOHOSAceFrameworkImageCreateWithContent(src.getValue())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alt(src: String): This {
        unsafe {
            var unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkImageSetAlt(unsafeSrc)
            LibC.free(unsafeSrc)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alt(src: AppResource): This {
        unsafe {
            var unsafeSrc = LibC.mallocCString(getResourceMedia(src))
            FfiOHOSAceFrameworkImageSetAlt(unsafeSrc)
            LibC.free(unsafeSrc)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alt(src: PixelMap): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetAltWithPixelMap(src.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func objectFit(objectFit: ImageFit): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetObjectFit(objectFit.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func objectRepeat(objectRepeat: ImageRepeat): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetObjectRepeat(objectRepeat.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func interpolation(interpolation: ImageInterpolation): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetInterpolation(interpolation.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func renderMode(renderMode: ImageRenderMode): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetRenderMode(renderMode.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        super.borderInner(width, color, radius, style)
        unsafe {
            FfiOHOSAceFrameworkImageSetBorderRadius()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func borderRadiusInner(radius: Length): This {
        super.borderRadiusInner(radius)
        unsafe {
            FfiOHOSAceFrameworkImageSetBorderRadius()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func borderRadiusInner(
        topLeft!: Length,
        topRight!: Length,
        bottomLeft!: Length,
        bottomRight!: Length
    ): This {
        super.borderRadiusInner(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        unsafe {
            FfiOHOSAceFrameworkImageSetBorderRadius()
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sourceSize(width: Length, height: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkImageSetSourceSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func syncLoad(syncLoad: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetSyncLoad(syncLoad)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetImageFill(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoResize(autoResize: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetAutoResize(autoResize)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func matchTextDirection(isMatchTextDirection: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetMatchTextDirection(isMatchTextDirection)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fitOriginalSize(isFitOriginalSize: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageSetFitOriginalSize(isFitOriginalSize)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colorFilter(value: ColorFilter): This {
        let vecFfi = FFIVectorFloat32(value.matrix.size)
        for (i in 0..value.matrix.size) {
            vecFfi.setElement(i, value.matrix[i])
        }
        unsafe {
            FfiOHOSAceFrameworkImageSetColorFilter(vecFfi.getNativeHandle())
            vecFfi.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dynamicRangeMode(value: DynamicRangeMode): This {
        unsafe {
            FfiOHOSAceFrameworkImageDynamicRangeMode(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOption(value: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkImageCopyOption(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func draggable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageDraggable(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onComplete(callback: (CJImageComplete) -> Unit): This {
        let lambdaData = CallbackCJImageComplete(callback)
        unsafe {
            FfiOHOSAceFrameworkImageOnCompleteV2(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onError(callback: (CJImageError) -> Unit): This {
        let lambdaData = CallbackCJImageError(callback)
        unsafe {
            FfiOHOSAceFrameworkImageOnErrorV2(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkImageOnFinish(lambdaData.getID())
        }
        this
    }

    // image does not need to implement pop function.
    protected func pop(): Unit {}
}
