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

package ohos.arkui.component.canvas

import ohos.arkui.component.common.*
import ohos.arkui.component.path_2d.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.multimedia.image.*

foreign {
    func FfiOHOSAceFrameworkRenderingContextCtor(antialias: Bool): Int64

    func FfiOHOSAceFrameworkRenderingContextCtorWithUnit(antialias: Bool, metricsUnit: Int32): Int64

    func FfiOHOSAceFrameworkRenderingContextSetFillStyle(selfId: Int64, colorValue: UInt32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetFillStyleByGradient(selfId: Int64, gradientId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetFillStyleByCanvasPattern(selfId: Int64, patternId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetLineWidth(selfId: Int64, lineWidth: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetStrokeStyle(selfId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetStrokeStyleByGradient(selfId: Int64, gradientId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetStrokeStyleByPattern(selfId: Int64, patterntId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetLineCap(selfId: Int64, lineCap: Int32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetLineJoin(selfId: Int64, lineJoin: Int32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetMiterLimit(selfId: Int64, limit: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetFont(
        selfId: Int64,
        style: Int32,
        weight: CString,
        size: Float64,
        sizeUnit: Int32,
        family: CString
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextSetTextAlign(selfId: Int64, align: Int32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetTextBaseline(selfId: Int64, baseline: Int32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetGlobalAlpha(selfId: Int64, alpha: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetLineDash(selfId: Int64, handle: VectorFloat64Handle): Unit

    func FfiOHOSAceFrameworkRenderingContextSetLineDashOffset(selfId: Int64, lineDashOffset: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetGlobalCompositeOperation(selfId: Int64, operation: Int32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetShadowBlur(selfId: Int64, blur: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetShadowColor(selfId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkRenderingContextSetShadowOffsetX(selfId: Int64, offsetX: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetShadowOffsetY(selfId: Int64, offsetY: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextSetImageSmoothingEnabled(selfId: Int64, enabled: Bool): Unit

    func FfiOHOSAceFrameworkRenderingContextSetImageSmoothingQuality(selfId: Int64, quality: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextSetDirection(selfId: Int64, direction: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextSetFilter(selfId: Int64, filterStr: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextFillRect(
        controllerId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextStrokeRect(
        selfId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextClearRect(
        selfId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextFillText(selfId: Int64, x: Float64, y: Float64, text: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextFillTextWithMaxWidth(
        selfId: Int64,
        x: Float64,
        y: Float64,
        text: CString,
        maxWidth: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextStrokeText(selfId: Int64, x: Float64, y: Float64, text: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextStrokeTextWithMaxWidth(
        selfId: Int64,
        x: Float64,
        y: Float64,
        text: CString,
        maxWidth: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextMeasureText(selfId: Int64, text: CString): NativeTextMetrics

    func FfiOHOSAceFrameworkRenderingContextStroke(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextStrokeWithPath(selfId: Int64, pathId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextBeginPath(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextMoveTo(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextLineTo(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextClosePath(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextBezierCurveTo(
        selfId: Int64,
        cp1x: Float64,
        cp1y: Float64,
        cp2x: Float64,
        cp2y: Float64,
        x: Float64,
        y: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextQuadraticCurveTo(
        selfId: Int64,
        cpx: Float64,
        cpy: Float64,
        x: Float64,
        y: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextArc(
        selfId: Int64,
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        anticlockwise: Bool
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextArcTo(
        selfId: Int64,
        x1: Float64,
        y1: Float64,
        x2: Float64,
        y2: Float64,
        radius: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextEllipse(
        selfId: Int64,
        x: Float64,
        y: Float64,
        radiusX: Float64,
        radiusY: Float64,
        rotation: Float64,
        startAngle: Float64,
        endAngle: Float64,
        anticlockwise: Bool
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextRect(
        selfId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextFill(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextClip(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextRotate(selfId: Int64, angle: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextScale(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextTransform(
        selfId: Int64,
        scaleX: Float64,
        scaleY: Float64,
        skewX: Float64,
        skewY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextSetTransform(
        selfId: Int64,
        scaleX: Float64,
        scaleY: Float64,
        skewX: Float64,
        skewY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextSetTransformByMatrix(selfId: Int64, matrixId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextTranslate(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkRenderingContextRestore(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextSave(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextDrawImage(
        selfId: Int64,
        src: CString,
        imageInfo: ImageInfo
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
        selfId: Int64,
        pixelId: Int64,
        imageInfo: ImageInfo
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
        selfId: Int64,
        pixelMapId: Int64,
        imageInfo: ImageInfo
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextGetPixelMap(
        selfId: Int64,
        left: Float64,
        top: Float64,
        width: Float64,
        height: Float64
    ): Int64

    func FfiOHOSAceFrameworkRenderingContextCreateConicGradient(
        selfId: Int64,
        startAngle: Float64,
        x: Float64,
        y: Float64
    ): Int64

    func FfiOHOSAceFrameworkRenderingContextReset(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextSavaLayer(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextRestoreLayer(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextResetTransform(selfId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextGetTransform(selfId: Int64): Int64

    func FfiOHOSAceFrameworkRenderingContextTransferFromImageBitmap(selfId: Int64, imageId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextFillWithStr(selfId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextFillWithPath(selfId: Int64, pathId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextClipWithStr(selfId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextClipWithPath(selfId: Int64, pathId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkRenderingContextGetHight(selfId: Int64): Float64

    func FfiOHOSAceFrameworkRenderingContextGetWidth(selfId: Int64): Float64

    func FfiOHOSAceFrameworkRenderingContextSetPixelMap(selfId: Int64, pixelMapId: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextGetLineDash(selfId: Int64): VectorFloat64Handle

    func FfiOHOSAceFrameworkRenderingContextToDataURL(selfId: Int64, imageType: CString, quality: Float64): CString

    func FfiOHOSAceFrameworkRenderingContextCreateImageDataWithImageData(selfId: Int64, imageDataId: Int64): Int64

    func FfiOHOSAceFrameworkRenderingContextCreateImageData(selfId: Int64, height: Float64, width: Float64): Int64

    func FfiOHOSAceFrameworkRenderingContextGetImageData(
        selfId: Int64,
        left: Float64,
        top: Float64,
        width: Float64,
        height: Float64
    ): Int64

    func FfiOHOSAceFrameworkRenderingContextPutImageDataWithDirty(
        selfId: Int64,
        imageDataId: Int64,
        dx: Float64,
        dy: Float64,
        dirtyX: Float64,
        dirtyY: Float64,
        dirtyWidth: Float64,
        dirtyHeight: Float64
    ): Unit

    func FfiOHOSAceFrameworkRenderingContextPutImageData(
        selfId: Int64,
        imageDataId: Int64,
        dx: Float64,
        dy: Float64
    ): Unit
}

/**
 * Draw context object for the Canvas component.
 *
 * @relation declare class CanvasRenderingContext2D extends CanvasRenderer
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CanvasRenderingContext2D <: RemoteDataLite {
    /**
     * Init function of the canvas drawing context object, which is used to create a drawing context object.
     *
     * @relation constructor(settings?: RenderingContextSettings);
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(settings: RenderingContextSettings) {
        super(unsafe {
            FfiOHOSAceFrameworkRenderingContextCtor(settings.antialias)
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Attributes that describe the fill color and style. The options are as follows:
     *
     * @type { string | number | CanvasGradient | CanvasPattern }
     * string: Color String.
     * number: Indicates the color with number.
     * CanvasGradient: Color gradient object. For details, see {@link CanvasGradient}.
     * CanvasPattern: Template object. For details, see {@link CanvasPattern}.
     * @default #000000 (black)
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @crossplatform
     * @form
     * @atomicservice
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(color: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetFillStyle(this.getID(), transAppResourceToResourceColor(color))
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(gradient: CanvasGradient): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetFillStyleByGradient(this.getID(), gradient.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(pattern: CanvasPattern): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetFillStyleByCanvasPattern(this.getID(), pattern.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop lineWidth: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetLineWidth(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(color: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetStrokeStyle(this.getID(), transAppResourceToResourceColor(color))
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(gradient: CanvasGradient): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetStrokeStyleByGradient(this.getID(), gradient.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(pattern: CanvasPattern): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetStrokeStyleByPattern(this.getID(), pattern.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop lineCap: Option<LineCapStyle> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetLineCap(this.getID(), v.getValue())
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop lineJoin: Option<LineJoinStyle> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetLineJoin(this.getID(), v.getValue())
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop miterLimit: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetMiterLimit(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(
        style!: FontStyle = FontStyle.Normal,
        weight!: FontWeight = FontWeight.Normal,
        size!: Length = 14.px,
        family!: String = "sans-serif"
    ): Unit {
        unsafe {
            var weightValue = LibC.mallocCString(weight.getValue())
            var familyValue = LibC.mallocCString(family)
            var size_ = transAppResourceToLength(size)
            FfiOHOSAceFrameworkRenderingContextSetFont(
                this.getID(),
                style.getValue(),
                weightValue,
                size_.value,
                size_.unitType.getValue(),
                familyValue
            )
            weightValue.free()
            familyValue.free()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop textAlign: Option<TextAlignStyle> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetTextAlign(this.getID(), v.getValue())
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop textBaseline: Option<TextBaseline> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetTextBaseline(this.getID(), v.getValue())
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop globalAlpha: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetGlobalAlpha(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setLineDash(dashArr: Array<Float64>): Unit {
        let vecFFi = FFIVectorFloat64(dashArr.size)
        var index = 0
        for (i in dashArr) {
            nativeLog("Canvas LineDash vecdata: " + i.toString())
            vecFFi.setElement(index, i)
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetLineDash(this.getID(), vecFFi.getNativeHandle());
            vecFFi.free()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop lineDashOffset: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetLineDashOffset(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop globalCompositeOperation: Option<CompositeOperation> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetGlobalCompositeOperation(this.getID(), v.getValue())
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop shadowBlur: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetShadowBlur(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop shadowColor: Option<ResourceColor> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetShadowColor(this.getID(), transAppResourceToResourceColor(v))
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop shadowOffsetX: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetShadowOffsetX(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop shadowOffsetY: Option<Float64> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetShadowOffsetY(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop imageSmoothingEnabled: Option<Bool> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetImageSmoothingEnabled(this.getID(), v)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop imageSmoothingQuality: Option<QualityType> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    var qualityValue = LibC.mallocCString(v.getValue())
                    FfiOHOSAceFrameworkRenderingContextSetImageSmoothingQuality(this.getID(), qualityValue)
                    LibC.free(qualityValue)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop direction: Option<CanvasDirection> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    var directionValue = LibC.mallocCString(v.getValue())
                    FfiOHOSAceFrameworkRenderingContextSetDirection(this.getID(), directionValue)
                    LibC.free(directionValue)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop filter: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    var filterValue = LibC.mallocCString(v)
                    FfiOHOSAceFrameworkRenderingContextSetFilter(this.getID(), filterValue);
                    LibC.free(filterValue)
                }
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextFillRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextStrokeRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clearRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextClearRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillText(text: String, x: Float64, y: Float64, maxWidth!: Option<Float64> = Option.None): Unit {
        match (maxWidth) {
            case Some(v) =>
                unsafe {
                    var content = LibC.mallocCString(text)
                    FfiOHOSAceFrameworkRenderingContextFillTextWithMaxWidth(this.getID(), x, y, content, v)
                    LibC.free(content)
                }
            case None =>
                unsafe {
                    var content = LibC.mallocCString(text)
                    FfiOHOSAceFrameworkRenderingContextFillText(this.getID(), x, y, content)
                    LibC.free(content)
                }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeText(text: String, x: Float64, y: Float64, maxWidth!: Option<Float64> = Option.None): Unit {
        match (maxWidth) {
            case Some(v) =>
                unsafe {
                    var content = LibC.mallocCString(text)
                    FfiOHOSAceFrameworkRenderingContextStrokeTextWithMaxWidth(this.getID(), x, y, content, v)
                    LibC.free(content)
                }
            case None =>
                unsafe {
                    var content = LibC.mallocCString(text)
                    FfiOHOSAceFrameworkRenderingContextStrokeText(this.getID(), x, y, content)
                    LibC.free(content)
                }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func measureText(text: String): TextMetrics {
        unsafe {
            var content = LibC.mallocCString(text)
            let nativeMetrics: NativeTextMetrics = FfiOHOSAceFrameworkRenderingContextMeasureText(this.getID(), content)
            let metrics = nativeMetrics.parseToCJ()
            LibC.free(content)
            return metrics
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextStroke(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(path2D: Path2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextStrokeWithPath(this.getID(), path2D.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func beginPath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextBeginPath(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextMoveTo(this.getID(), x, y)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextLineTo(this.getID(), x, y)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextClosePath(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createPattern(image: ImageBitmap, repetition: Repetition): CanvasPattern {
        return CanvasPattern(this.getID(), image, repetition)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bezierCurveTo(cp1x: Float64, cp1y: Float64, cp2x: Float64, cp2y: Float64, x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextBezierCurveTo(this.getID(), cp1x, cp1y, cp2x, cp2y, x, y)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func quadraticCurveTo(cpx: Float64, cpy: Float64, x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextQuadraticCurveTo(this.getID(), cpx, cpy, x, y)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        counterclockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextArc(this.getID(), x, y, radius, startAngle, endAngle, counterclockwise)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arcTo(x1: Float64, y1: Float64, x2: Float64, y2: Float64, radius: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextArcTo(this.getID(), x1, y1, x2, y2, radius)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ellipse(
        x: Float64,
        y: Float64,
        radiusX: Float64,
        radiusY: Float64,
        rotation: Float64,
        startAngle: Float64,
        endAngle: Float64,
        counterclockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextEllipse(
                this.getID(),
                x,
                y,
                radiusX,
                radiusY,
                rotation,
                startAngle,
                endAngle,
                counterclockwise
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(fillRule!: CanvasFillRule = CanvasFillRule.nonzero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextFillWithStr(this.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(path: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.nonzero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextFillWithPath(this.getID(), path.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(fillRule!: CanvasFillRule = CanvasFillRule.nonzero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextClipWithStr(this.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(path: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.nonzero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextClipWithPath(this.getID(), path.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(angle: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextRotate(this.getID(), angle)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextScale(this.getID(), x, y)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transform(
        scaleX: Float64,
        skewX: Float64,
        skewY: Float64,
        scaleY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextTransform(
                this.getID(),
                scaleX,
                scaleY,
                skewX,
                skewY,
                translateX,
                translateY
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(
        scaleX: Float64,
        skewX: Float64,
        skewY: Float64,
        scaleY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetTransform(
                this.getID(),
                scaleX,
                scaleY,
                skewX,
                skewY,
                translateX,
                translateY
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(matrix: Option<Matrix2D>): Unit {
        match (matrix) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetTransformByMatrix(this.getID(), v.getID())
                }
            case None => ()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextTranslate(this.getID(), x, y)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func restore(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextRestore(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func save(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSave(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createLinearGradient(x0: Float64, y0: Float64, x1: Float64, y1: Float64): CanvasGradient {
        return CanvasGradient(this.getID(), x0, y0, x1, y1)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createRadialGradient(x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64): CanvasGradient {
        return CanvasGradient(this.getID(), x0, y0, r0, x1, y1, r1)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createConicGradient(startAngle: Float64, x: Float64, y: Float64): CanvasGradient {
        unsafe {
            let gradientId = FfiOHOSAceFrameworkRenderingContextCreateConicGradient(this.getID(), startAngle, x, y)
            return CanvasGradient(gradientId)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: Float64, dy: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesOnly.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, image.width,
                    image.height)
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: Float64, dy: Float64, dWidth: Float64, dHeight: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesAndSize.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, dWidth, dHeight)
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(
        image: ImageBitmap,
        sx: Float64,
        sy: Float64,
        sWidth: Float64,
        sHeight: Float64,
        dx: Float64,
        dy: Float64,
        dWidth: Float64,
        dHeight: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(
                    CanvasImageType.CoordinatesAndSizeWithSource.getValue(),
                    sx,
                    sy,
                    sWidth,
                    sHeight,
                    dx,
                    dy,
                    dWidth,
                    dHeight
                )
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(pixelMap: PixelMap, dx: Float64, dy: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
                this.getID(),
                pixelMap.getID(),
                ImageInfo(CanvasImageType.CoordinatesOnly.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, 0.0, 0.0)
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(pixelMap: PixelMap, dx: Float64, dy: Float64, dWidth: Float64, dHeight: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
                this.getID(),
                pixelMap.getID(),
                ImageInfo(CanvasImageType.CoordinatesAndSize.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, dWidth, dHeight)
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(
        pixelMap: PixelMap,
        sx: Float64,
        sy: Float64,
        sWidth: Float64,
        sHeight: Float64,
        dx: Float64,
        dy: Float64,
        dWidth: Float64,
        dHeight: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
                this.getID(),
                pixelMap.getID(),
                ImageInfo(
                    CanvasImageType.CoordinatesAndSizeWithSource.getValue(),
                    sx,
                    sy,
                    sWidth,
                    sHeight,
                    dx,
                    dy,
                    dWidth,
                    dHeight
                )
            )
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPixelMap(left: Float64, top: Float64, width: Float64, height: Float64): PixelMap {
        let id = unsafe {
            FfiOHOSAceFrameworkRenderingContextGetPixelMap(
                this.getID(),
                left,
                top,
                width,
                height
            )
        }
        return PixelMap(id)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextReset(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func saveLayer(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSavaLayer(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func restoreLayer(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextRestoreLayer(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resetTransform(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextResetTransform(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getTransform(): Matrix2D {
        unsafe {
            let matrixId = FfiOHOSAceFrameworkRenderingContextGetTransform(this.getID())
            return Matrix2D(matrixId)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transferFromImageBitmap(bitmap: ImageBitmap): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextTransferFromImageBitmap(this.getID(), bitmap.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop height: Float64 {
        get() {
            unsafe {
                return FfiOHOSAceFrameworkRenderingContextGetHight(this.getID())
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop width: Float64 {
        get() {
            unsafe {
                return FfiOHOSAceFrameworkRenderingContextGetWidth(this.getID())
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setPixelMap(pixelMap: Option<PixelMap>): Unit {
        match (pixelMap) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetPixelMap(
                        this.getID(),
                        v.getID()
                    )
                }
            case None => ()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getLineDash(): Array<Float64> {
        unsafe {
            let vectorDash = FFIVectorFloat64(FfiOHOSAceFrameworkRenderingContextGetLineDash(this.getID()))
            let lineDash = Array<Float64>(vectorDash.getSize(), {i => vectorDash.getElement(i)})
            vectorDash.free()
            return lineDash
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toDataURL(imageType!: ImageType = ImageType.png, quality!: Float64 = 0.92): String {
        unsafe {
            let typeStr = LibC.mallocCString(imageType.getValue())
            var actuaQua: Float64 = 0.0
            if (quality < 0.0 || quality > 1.0) {
                actuaQua = 0.92
            } else {
                actuaQua = quality
            }

            let dataUrl = FfiOHOSAceFrameworkRenderingContextToDataURL(this.getID(), typeStr, actuaQua)
            let result = dataUrl.toString()
            LibC.free(typeStr)
            dataUrl.free()
            return result
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(sw: Float64, sh: Float64): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkRenderingContextCreateImageData(this.getID(), sh, sw)
            return ImageData(imageDataId)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(imageData: ImageData): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkRenderingContextCreateImageDataWithImageData(this.getID(),
                imageData.getID())
            return ImageData(imageDataId)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getImageData(sx: Float64, sy: Float64, sw: Float64, sh: Float64): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkRenderingContextGetImageData(this.getID(), sx, sy, sw, sh)
            return ImageData(imageDataId)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(imageData: ImageData, dx: Length, dy: Length): Unit {
        // TODO
        // unsafe {
        //     FfiOHOSAceFrameworkRenderingContextPutImageData(this.getID(), imageData.getID(), dx, dy)
        // }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(
        imageData: ImageData,
        dx: Float64,
        dy: Float64,
        dirtyX: Float64,
        dirtyY: Float64,
        dirtyWidth: Float64,
        dirtyHeight: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextPutImageDataWithDirty(this.getID(), imageData.getID(), dx, dy, dirtyX,
                dirtyY, dirtyWidth, dirtyHeight)
        }
    }
}
