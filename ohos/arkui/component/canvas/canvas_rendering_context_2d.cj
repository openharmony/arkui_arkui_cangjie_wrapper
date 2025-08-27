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
     * Set the attributes specifie the gradient to use inside shapes.
     * 
     * @param { ResourceColor } color
     * @relation set fillStyle(fillStyle: string | number | CanvasGradient | CanvasPattern)
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

    /**
     * Set the attributes specifie the gradient to use inside shapes.
     * 
     * @param { CanvasGradient } gradient
     * @relation set fillStyle(fillStyle: string | number | CanvasGradient | CanvasPattern)
     */
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

    /**
     * Set the attributes specifie the pattern to use inside shapes.
     * 
     * @param { CanvasPattern } pattern
     * @relation set fillStyle(fillStyle: string | number | CanvasGradient | CanvasPattern)
     */
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

    /**
     * Line thickness attribute. The value cannot be 0 or a negative number.
     *
     * @relation lineWidth: number
     */
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

    /**
     * Set the attributes specifie the color to use for the strokes (outlines) around shapes.
     * 
     * @param { ResourceColor } color
     * @relation set strokeStyle(strokeStyle: string | number | CanvasGradient | CanvasPattern)
     */
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

    /**
     * Set the attributes specifie the gradient to use for the strokes (outlines) around shapes.
     * 
     * @param { CanvasGradient } gradient
     * @relation set strokeStyle(strokeStyle: string | number | CanvasGradient | CanvasPattern)
     */
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

    /**
     * Set the attributes specifie the pattern to use for the strokes (outlines) around shapes.
     * 
     * @param { CanvasPattern } pattern
     * @relation set strokeStyle(strokeStyle: string | number | CanvasGradient | CanvasPattern)
     */
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

    /**
     * Line segment endpoint attribute.
     *
     * @relation lineCap: CanvasLineCap
     */
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

    /**
     * Line segment connection point attribute
     *
     * @relation lineJoin: CanvasLineJoin
     */
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

    /**
     * The value of this parameter cannot be 0 or a negative number.
     *
     * @relation miterLimit: number
     */
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

    /**
     * Set the font style.
     * 
     * @param { FontStyle } style
     * @param { FontWeight } weight
     * @param { Length } size
     * @param { String } family
     * @relation set font(font: string)
     */
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

    /**
     * Text alignment mode
     *
     * @relation textAlign: CanvasTextAlign
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop textAlign: Option<CanvasTextAlign> {
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

    /**
     * Text baseline.
     *
     * @relation textBaseline: CanvasTextBaseline
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop textBaseline: Option<CanvasTextBaseline> {
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

    /**
     * Transparency. The value ranges from 0.0 (completely transparent) to 1.0 (completely opaque).
     * If the value is out of range, the assignment is invalid.
     *
     * @relation globalAlpha: number
     */
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

    /**
     * Sets the dashed line mode for line drawing.
     *
     * @param { Array<Float64> } segments - A set of numbers that describe the length of alternating drawn lines segments and
     * spacing (coordinate space units).
     *
     * @relation setLineDash(segments: number[]): void
     */
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

    /**
     * Dotted line offset attribute.
     *
     * @relation lineDashOffset: number
     */
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

    /**
     * Type of composition operation applied when drawing a new shape。
     *
     * @relation globalCompositeOperation: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop globalCompositeOperation: Option<GlobalCompositeOperation> {
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

    /**
     * Shadow blur radius. The value cannot be a negative number.
     *
     * @relation shadowBlur: number
     */
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

    /**
     * Shadow color.
     *
     * @relation shadowColor: string
     */
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

    /**
     * Horizontal offset distance of the shadow.
     *
     * @relation shadowOffsetX: number
     */
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

    /**
     * Vertical offset distance of the shadow.
     *
     * @relation shadowOffsetY: number
     */
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

    /**
     * Specifies whether to smooth the image. The value true indicates that the image is smooth.
     *    The value false indicates that the image is not smooth.
     *
     * @relation imageSmoothingEnabled: boolean
     */
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

    /**
     * Smoothness level of the current image.
     *
     * @relation imageSmoothingQuality: ImageSmoothingQuality
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop imageSmoothingQuality: Option<ImageSmoothingQuality> {
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

    /**
     * Text drawing direction.
     *
     * @relation direction: CanvasDirection
     */
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

    /**
     * Provides filter effects such as blur and grayscale. You can set the following filter effects:
     * blur(<length>): Adds a Gaussian blur effect to the drawing
     * brightness(<percentage>): Provides a linear multiplication for the drawing and adjusts the brightness level.
     * contrast(<percentage>): Adjusts the contrast of the image. When the value is 0%, the image is completely black.
     *    When the value is 100%, there is no change in the image.
     * grayscale(<percentage>): Converts the image to a gray image. When the value is 100%, the image is completely gray.
     *    When the value is 0%, there is no change in the image.
     * hue-rotate(<degree>): Perform color rotation on an image. When the value is 0 degrees, there is no change in the image.
     * invert(<percentage>): Inverted image (representing the effect of a photographic negative). When the value is 100%,
     *    the image is completely inverted. When the value is 0%, there is no change in the image.
     * opacity(<percentage>): Transparency of the image. At 0%, the image is completely transparent.
     *    When the value is 100%, there is no change in the image.
     * saturate(<percentage>): Perform saturation processing on the image. At 0%, the image is completely un-saturated.
     *    When the value is 100%, there is no change in the image.
     * sepia(<percentage>): The image is sepia (nostalgic style). At 100%, the image turns completely sepia.
     *    When the value is 0%, there is no change in the image.
     * none: Turn off filter effects
     *
     * @relation filter: string
     * 
     */
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

    /**
     * Fills a specified rectangular area
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     * @relation fillRect(x: number, y: number, w: number, h: number): void
     */
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

    /**
     * Stroke Specify Rectangular Area
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     * @relation strokeRect(x: number, y: number, w: number, h: number): void
     */
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

    /**
     * Clears the drawing content of a rectangular area.
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     * @relation clearRect(x: number, y: number, w: number, h: number): void
     */
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

    /**
     * Fills the specified text at the specified location
     *
     * @param { string } text - Text string to be drawn.
     * @param { number } x - The x-axis coordinate of the start point of the text.
     * @param { number } y - The y-axis coordinate of the start point of the text.
     * @param { number } maxWidth - Maximum width of the drawing.
     * @relation fillText(text: string, x: number, y: number, maxWidth?: number): void
     */
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

    /**
     * Stroke specified text at specified position
     *
     * @param { string } text - Text string to be stroked.
     * @param { number } x - The x-axis coordinate of the start point of the text.
     * @param { number } y - The y-axis-axis coordinate of the start point of the text.
     * @param { number } maxWidth - Maximum width of the stroke.
     * @relation strokeText(text: string, x: number, y: number, maxWidth?: number): void
     */
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

    /**
     * Measure the size of a specified text.
     *
     * @param { String } text - Text string to be measured.
     * @relation measureText(text: string): TextMetrics
     */
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

    /**
     * Draws an existing path according to the current stroke style.
     *
     * @relation stroke(): void
     */
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

    /**
     * Draws the specified path according to the current stroke style
     *
     * @param { Path2D } path - Specified stroke path object
     * @relation stroke(path: Path2D): void
     */
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

    /**
     * Clear the sub-path list and start a new path.
     *
     * @relation beginPath(): void
     */
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

    /**
   * Moves the start point of a new sub-path to the (x, y) coordinate.
   *
   * @param { Float64 } x - The x-axis coordinate of the point.
   * @param { Float64 } y - The y-axis coordinate of the point.
   * @relation moveTo(x: number, y: number): void
   */
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

    /**
     * Connect sub-path using straight lines
     *
     * @param { number } x - The x-axis coordinate of the end point of the line.
     * @param { number } y - The y-axis coordinate of the end point of the line.
     * @relation lineTo(x: number, y: number): void
     */
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

    /**
     * Returns the pen point to the start point of the current sub-path
     *
     * @relation closePath(): void
     */
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

    /**
     * Creates a template object using the specified image
     *
     * @param { ImageBitmap } image - Objects as duplicate image sources
     * @param { Repetition } repetition - Specifies how to repeat images.
     * @relation createPattern(image: ImageBitmap, repetition: string | null): CanvasPattern | null
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createPattern(image: ImageBitmap, repetition: Repetition): CanvasPattern {
        return CanvasPattern(this.getID(), image, repetition)
    }

    /**
     * Drawing Cubic Bessel Curve Paths
     *
     * @param { Float64 } cp1x - The x-axis coordinate of the first control point.
     * @param { Float64 } cp1y - The y-axis coordinate of the first control point.
     * @param { Float64 } cp2x - The x-axis coordinate of the second control point.
     * @param { Float64 } cp2y - The y-axis coordinate of the second control point.
     * @param { Float64 } x - x-axis coordinate of the end point.
     * @param { Float64 } y - y-axis coordinate of the end point.
     * @relation bezierCurveTo(cp1x: number, cp1y: number, cp2x: number, cp2y: number, x: number, y: number): void
     */
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

    /**
     * Draw quadratic Bezier curve paths
     *
     * @param { Float64 } cpx - The x-axis coordinate of the control point.
     * @param { Float64 } cpy - The y-axis coordinate of the control point.
     * @param { Float64 } x - x-axis coordinate of the end point.
     * @param { Float64 } y - y-axis coordinate of the end point.
     * @relation quadraticCurveTo(cpx: number, cpy: number, x: number, y: number): void
     */
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

    /**
   * Draw an arc path
   *
   * @param { Float64 } x - The x-axis coordinate of the center (center of the circle) of the arc.
   * @param { Float64 } y - The y-axis coordinate of the center (center of the circle) of the arc.
   * @param { Float64 } radius - Radius of the arc.
   * @param { Float64 } startAngle - Start point of an arc, which starts to be calculated in the x-axis direction. The unit is radian.
   * @param { Float64 } endAngle - The end point of the arc, in radians.
   * @param { Bool } counterclockwise - If the value is true, the arc is drawn counterclockwise. Otherwise,
   *    the arc is drawn clockwise. The default value is false.
   * @relation arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void
   */
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

    /**
     * Draw arc paths based on control points and radius
     *
     * @param { Float64 } x1 - The x-axis coordinate of the first control point.
     * @param { Float64 } y1 - The y-axis coordinate of the first control point.
     * @param { Float64 } x2 - The x-axis coordinate of the second control point.
     * @param { Float64 } y2 - The y-axis coordinate of the second control point.
     * @param { Float64 } radius - Radius of the arc.
     * @relation arcTo(x1: number, y1: number, x2: number, y2: number, radius: number): void
     */
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

    /**
     * Draw an Elliptic Path
     *
     * @param { Float64 } x - x-axis coordinate of the center of the ellipse.
     * @param { Float64 } y - y-axis coordinate of the center of the ellipse.
     * @param { Float64 } radiusX - Radius of the major axis of the ellipse.
     * @param { Float64 } radiusY - Radius of the minor axis of the ellipse.
     * @param { Float64 } rotation - The rotation angle of the ellipse, in radians (not angular degrees).
     * @param { Float64 } startAngle - The angle of the starting point to be drawn, measured from the x-axis in radians
     *    (not angular degrees).
     * @param { Float64 } endAngle - The angle, in radians, at which the ellipse is to be drawn (not angular degrees).
     * @param { Bool } counterclockwise - If the value is true, the ellipse is drawn counterclockwise. Otherwise,
     *    the ellipse is drawn clockwise. The default value is false.
     */
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

    /**
     * Draw Rectangular Paths
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     * @relation rect(x: number, y: number, w: number, h: number): void
     */
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

    /**
     * Fills existing paths according to the current fill style.
     *
     * @param { CanvasFillRule } fillRule - Algorithm rule.
     * @relation fill(fillRule?: CanvasFillRule): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextFillWithStr(this.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    /**
     * Fills the specified path according to the current fill style
     *
     * @param { Path2D } path - Path to be filled.
     * @param { CanvasFillRule } fillRule - Algorithm rule.
     * @relation fill(path: Path2D, fillRule?: CanvasFillRule): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(path: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextFillWithPath(this.getID(), path.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    /**
     * Sets the currently created path as the current clipping path
     *
     * @param { CanvasFillRule } fillRule - Algorithm rule.
     * @relation clip(fillRule?: CanvasFillRule): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextClipWithStr(this.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    /**
     * Tailoring according to the specified path
     *
     * @param { Path2D } path - Path to be cut.
     * @param { CanvasFillRule } fillRule - Algorithm rule.
     * @relation clip(path: Path2D, fillRule?: CanvasFillRule): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(path: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.NonZero): Unit {
        unsafe {
            var ruleStr = LibC.mallocCString(fillRule.getValue())
            FfiOHOSAceFrameworkRenderingContextClipWithPath(this.getID(), path.getID(), ruleStr)
            LibC.free(ruleStr)
        }
    }

    /**
     * Adds the effect of a rotation
     *
     * @param { number } angle - The radian of clockwise rotation, which can be converted to an angle value using the formula:
     *    degree * Math.PI / 180
     * @relation rotate(angle: number): void
     */
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

    /**
     * Increases the scaling effect of the X and Y axes.
     *
     * @param { number } x - Horizontal scaling factor
     * @param { number } y - Vertical scaling factor
     * @relation scale(x: number, y: number): void
     */
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

    /**
     * Adds the 2D transformation effect, including rotation, translation, and scaling,
     *    and overwrites the current transformation matrix.
     *
     * @param { Float64 } scaleX - Horizontal Zoom
     * @param { Float64 } skewX - Vertical Tilt
     * @param { Float64 } skewY - Horizontal Tilt
     * @param { Float64 } scaleY - Vertical Zoom
     * @param { Float64 } translateX - Horizontal movement
     * @param { Float64 } translateY - Vertical movement
     * @relation transform(a: number, b: number, c: number, d: number, e: number, f: number): void
     */
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
    /**
     * Adds the 2D transformation effect, including rotation, translation, and scaling,
     *    and overwrites the current transformation matrix.
     *
     * @param { Float64 } scaleX - Horizontal Zoom
     * @param { Float64 } skewX - Vertical Tilt
     * @param { Float64 } skewY - Horizontal Tilt
     * @param { Float64 } scaleY - Vertical Zoom
     * @param { Float64 } translateX - Horizontal movement
     * @param { Float64 } translateY - Vertical movement
     * @relation transform(a: number, b: number, c: number, d: number, e: number, f: number): void
     */
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

    /**
     * The 2D transformation effect is added. The current transformation matrix is not overwritten and
     *    the transformations are superimposed for multiple times.
     *
     * @param { Matrix2D } transform - 2D transformation matrix.
     * @relation setTransform(transform?: Matrix2D): void
     */
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

    /**
     * Increases the translation effect of the X and Y axes
     *
     * @param { Float64 } x - Horizontal movement distance
     * @param { Float64 } y - Vertical travel distance
     * @relation translate(x: number, y: number): void
     */
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

    /**
     * Top of the stack pop-up state in the drawing state stack
     *
     * @relation restore(): void
     */
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

    /**
     * Saves the current drawing state to the drawing state stack
     *
     * @relation save(): void
     */
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

    /**
     * Creates a linear gradient object that is specified along the parameter coordinates
     *
     * @param { Float64 } x0 - The x-axis coordinate of the start point.
     * @param { Float64 } y0 - The y-axis coordinate of the start point.
     * @param { Float64 } x1 - x-axis coordinate of the end point.
     * @param { Float64 } y1 - y-axis coordinate of the end point.
     * @returns { CanvasGradient }
     * @relation createLinearGradient(x0: number, y0: number, x1: number, y1: number): CanvasGradient
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createLinearGradient(x0: Float64, y0: Float64, x1: Float64, y1: Float64): CanvasGradient {
        return CanvasGradient(this.getID(), x0, y0, x1, y1)
    }

    /**
     * Creates a radioactive gradient object based on parameters that determine the coordinates of two circles
     *
     * @param { Float64 } x0 - The x-axis coordinate of the start circle.
     * @param { Float64 } y0 - The y-axis coordinate of the start circle.
     * @param { Float64 } r0 - Radius of the starting circle.
     * @param { Float64 } x1 - The x-axis coordinate of the end circle.
     * @param { Float64 } y1 - The y-axis coordinate of the end circle.
     * @param { Float64 } r1 - Radius of the end circle.
     * @returns { CanvasGradient }
     * @relation createRadialGradient(x0: number, y0: number, r0: number, x1: number, y1: number, r1: number): CanvasGradient
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createRadialGradient(x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64): CanvasGradient {
        return CanvasGradient(this.getID(), x0, y0, r0, x1, y1, r1)
    }

    /**
     * Creates a gradient around a point with given coordinates.
     *
     * @param { Float64 } startAngle - The angle at which to begin the gradient, in radians.
     *                   Angle measurements start horizontally the right of the center and move around clockwise.
     * @param { Float64 } x - The x-axis coordinate of the center of the gradient.
     * @param { Float64 } y - The y-axis coordinate of the center of the gradient.
     * @returns { CanvasGradient } A CanvasGradient object that draws a conic gradient around the given coordinates.
     * @relation createConicGradient(startAngle: number, x: number, y: number): CanvasGradient
     */
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

    /**
     * Draw an image on a canvas
     *
     * @param { ImageBitmap } image - Picture objects drawn to the canvas.
     * @param { Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @relation drawImage(image: ImageBitmap | PixelMap, dx: number, dy: number): void
     */
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

    /**
     * Draw an image on a canvas
     *
     * @param { ImageBitmap } image - Picture objects drawn to the canvas.
     * @param { Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     * @relation drawImage(image: ImageBitmap | PixelMap, dx: number, dy: number, dw: number, dh: number): void
     */
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

    /**
     *Draw an image on a canvas
     *
     * @param { ImageBitmap } image - Picture objects drawn to the canvas.
     * @param { Float64 } sx - x coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { Float64 } sy - y coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { Float64 } sw - Width of the rectangle (cropping) selection box of the image.
     * @param { Float64 } sh - Height of the rectangle (cropping) selection box of the image.
     * @param { Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     * @relation drawImage(image: ImageBitmap | PixelMap, sx: number, sy: number,sw: number, sh: number, dx: number, dy: number, dw: number, dh: number): void
     */
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

    /**
     * Draw an image on a canvas
     *
     * @param { PixelMap } image - Picture objects drawn to the canvas.
     * @param { Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @relation drawImage(image: ImageBitmap | PixelMap, dx: number, dy: number): void
     */
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

    /**
     * Draw an image on a canvas
     *
     * @param { PixelMap } image - Picture objects drawn to the canvas.
     * @param { Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     * @relation drawImage(image: ImageBitmap | PixelMap, dx: number, dy: number, dw: number, dh: number): void
     */
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

    /**
     *Draw an image on a canvas
     *
     * @param { PixelMap } image - Picture objects drawn to the canvas.
     * @param { Float64 } sx - x coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { Float64 } sy - y coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { Float64 } sw - Width of the rectangle (cropping) selection box of the image.
     * @param { Float64 } sh - Height of the rectangle (cropping) selection box of the image.
     * @param { Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     * @relation drawImage(image: ImageBitmap | PixelMap, sx: number, sy: number,sw: number, sh: number, dx: number, dy: number, dw: number, dh: number): void
     */
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

    /**
     * Obtains the PixelMap of a specified area on the current canvas.
     *
     * @param { Float64 } sx - x coordinate of the upper left corner of the rectangular area of the PixelMap to be extracted.
     * @param { Float64 } sy - y coordinate of the upper left corner of the rectangular area of the PixelMap to be extracted.
     * @param { Float64 } sw - The width of the rectangular area of the PixelMap to be extracted.
     * @param { Float64 } sh - The height of the rectangular area of the PixelMap to be extracted.
     * @returns { PixelMap }
     * @relation getPixelMap(sx: number, sy: number, sw: number, sh: number): PixelMap
     */
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

    /**
     * Clear the backing buffer, drawing state stack, any defined paths, and styles.
     *
     * @relation reset(): void
     */
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

    /**
     * Allocate a layer for subsequent drawing.
     *
     * @relation saveLayer(): void
     */
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

    /**
     * Remove changes to transform and clip since saveLayer was last called and draw the layer on canvas.
     *
     * @relation restoreLayer(): void
     */
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

    /**
     * Resets the current transformation matrix using the identity matrix
     *
     * @relation resetTransform(): void
     */
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

    /**
     * Obtains the currently applied transformation matrix.
     *
     * @returns { Matrix2D }
     * @relation getTransform(): Matrix2D
     */
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

    /**
     * transfer ImageBitmap to content.
     *
     * @param { ImageBitmap } bitmap
     * @relation transferFromImageBitmap(bitmap: ImageBitmap): void
     */
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

    /**
     * The default value is 0, which is bound to the height of the specified canvas. The value is read-only.
     *
     * @relation readonly height: number
     */
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

    /**
     * The default value is 0, which is bound to the width of the specified canvas. The value is read-only.
     *
     * @relation readonly width: number
     */
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

    /**
     * Set a PixelMap to the current context. The drawing content is synchronized to the PixelMap.
     *
     * @param { PixelMap } value - PixelMap object
     * @relation setPixelMap(value?: PixelMap): void
     */
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

    /**
     * Gets the current segment style.
     *
     * @returns { Array<Float64> }
     * @relation getLineDash(): number[]
     */
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

    /**
     * Generate a character string in the data url format.
     *
     * @param { String } type - Image format. The default value is image/png.
     * @param { Float64 } quality - If the image format is image/jpeg or image/webp, you can select the image quality from 0 to 1.
     *    If the value is out of the range, the default value 0.92 is used.
     * @returns { String }
     * @relation toDataURL(type?: string, quality?: any): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toDataURL(imageType!: ImageType = ImageType.Png, quality!: Float64 = 0.92): String {
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

    /**
   * Creates a new, empty ImageData object of the specified size
   *
   * @param { Float64 } sw - Width of the ImageData object.
   * @param { Float64 } sh - Height of the ImageData object.
   * @returns { ImageData }
   * @relation createImageData(sw: number, sh: number): ImageData
   */
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

    /**
     * From an existing ImageData object, copy an object with the same width and height as the image.
     *    The image content is not copied.
     *
     * @param { ImageData } imagedata - ImageData object to be copied.
     * @returns { ImageData }
     * @relation createImageData(imagedata: ImageData): ImageData
     */
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

    /**
     * Obtains the pixel data of a specified area on the current canvas.
     *
     * @param { Float64 } sx - x coordinate of the upper left corner of the rectangular area of the image data to be extracted.
     * @param { Float64 } sy - y coordinate of the upper left corner of the rectangular area of the image data to be extracted.
     * @param { Float64 } sw - The width of the rectangular area of the image data to be extracted.
     * @param { Float64 } sh - The height of the rectangular area of the image data to be extracted.
     * @returns { ImageData }
     * @relation getImageData(sx: number, sy: number, sw: number, sh: number): ImageData
     */
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

    /**
     * Draws the specified ImageData object onto the canvas
     *
     * @param { ImageData } imagedata - ImageData object to be drawn.
     * @param { Length } dx - Position offset of the source image data in the target canvas (the offset in the x-axis direction).
     * @param { Length } dy - Position offset of the source image data in the target canvas (the offset in the y-axis direction).
     * @relation putImageData(imagedata: ImageData, dx: number | string, dy: number | string): void
     */
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

    /**
     * Draws the specified ImageData object onto the canvas
     *
     * @param { ImageData } imagedata - ImageData object to be drawn.
     * @param { number | string } dx - Position offset of the source image data in the target canvas (the offset in the x-axis direction).
     * @param { number | string } dy - Position offset of the source image data in the target canvas (the offset in the y-axis direction).
     * @param { number | string } dirtyX - Position of the upper left corner of the rectangular area in the source image data.
     *    The default is the upper left corner (x coordinate) of the entire image data.
     * @param { number | string } dirtyY - Position of the upper left corner of the rectangular area in the source image data.
     *    The default is the upper left corner (y coordinate) of the entire image data.
     * @param { number | string } dirtyWidth - Width of the rectangular area in the source image data.
     *    The default is the width of the image data.
     * @param { number | string } dirtyHeight - Height of the rectangular area in the source image data.
     *    The default is the height of the image data.
     * @relation putImageData(imagedata: ImageData, dx: number | string, dy: number | string, dirtyX: number | string, dirtyY: number | string, dirtyWidth: number | string, dirtyHeight: number | string): void
     */
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
