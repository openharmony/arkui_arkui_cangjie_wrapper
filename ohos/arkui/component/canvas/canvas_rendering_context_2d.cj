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

package ohos.arkui.component.canvas

import ohos.arkui.component.common.{ImageType, CanvasTextBaseline, GlobalCompositeOperation, ImageSmoothingQuality, CanvasDirection, parseLengthFromString, LineJoinStyle, CanvasTextAlign, FontStyle, LineCapStyle, Repetition, CanvasFillRule, px2vpInner, fp2pxInner, lpx2pxInner}
import ohos.arkui.component.path_2d.{Path2D}
import ohos.arkui.component.util.{transAppResourceToLength, transAppResourceToResourceColor}
import ohos.arkui.ui_context.Font as FontApi
import ohos.base.{FFIVectorFloat64, Length, LengthProp, nativeLog, CStringExtend, VectorFloat64Handle, Color, ResourceColor, LengthUnit}
import ohos.ffi.{RemoteDataLite, releaseFFIData}
import ohos.labels.{APILevel}
import ohos.multimedia.image.{PixelMap}

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

func parseLength2Vp(origin: Length): Float64 {
    match(origin.unitType) {
        case LengthUnit.Px => px2vpInner(origin.value).getOrDefault({ => origin}).value
        case LengthUnit.Vp => origin.value
        case LengthUnit.Fp => px2vpInner(fp2pxInner(origin.value).getOrDefault({ => origin})).getOrDefault({ => origin}).value
        case LengthUnit.Percent => origin.value
        case LengthUnit.Lpx => px2vpInner(lpx2pxInner(origin.value).getOrDefault({ => origin})).getOrDefault({ => origin}).value
        case _ => origin.value
    }
}

func parseFontValue(origin: String): (FontStyle, String, Length, String) {
    var style: FontStyle = FontStyle.Normal
    var weight: String = "normal"
    var size: Length = 14.px
    var family: String = "sans-serif"

    let fontInfoList = origin.split(" ")
    for (i in 0..fontInfoList.size) {
        let current = fontInfoList[i]
        if (FONT_WEIGHTS.contains(current)) {
            weight = current
        } else if (FONT_STYLES.contains(current)) {
            style = FontStyle.parseFromString(current)
        } else if (current.contains("vp") || current.contains("px")) {
            size = parseLengthFromString(current).getOrDefault({ => 14.px})
        } else if (FONT_FAMILIES.contains(current) || FontApi(0).getSystemFontList().contains(current)) {
            family = current
        }
    }
    return (style, weight, size, family)
}

/**
 * FillStyle.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface FillStyle {}

extend Int64 <: FillStyle {}

extend UInt32 <: FillStyle {}

extend Color <: FillStyle {}

extend CanvasGradient <: FillStyle {}

extend CanvasPattern <: FillStyle {}

/**
 * StrokeStyle.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface StrokeStyle {}

extend Int64 <: StrokeStyle {}

extend UInt32 <: StrokeStyle {}

extend Color <: StrokeStyle {}

extend CanvasGradient <: StrokeStyle {}

extend CanvasPattern <: StrokeStyle {}

/**
 * Draw context object for the Canvas component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CanvasRenderingContext2D <: RemoteDataLite {
    /**
     * Init function of the canvas drawing context object, which is used to create a drawing context object.
     *
     * @param { ?RenderingContextSettings } settings - The canvas render context setting.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(settings: ?RenderingContextSettings) {
        super(unsafe {
            match(settings) {
                case Some(value) =>
                    FfiOHOSAceFrameworkRenderingContextCtor(value.antialias ?? false)
                case None =>
                    FfiOHOSAceFrameworkRenderingContextCtor(false)
            }
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Set the attributes specified the gradient to use inside shapes.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop fillStyle: Option<FillStyle> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                match(v) {
                    case gridient: CanvasGradient =>
                        unsafe {
                            FfiOHOSAceFrameworkRenderingContextSetFillStyleByGradient(this.getID(), gridient.getID())
                        }
                    case pattern: CanvasPattern =>
                        unsafe {
                            FfiOHOSAceFrameworkRenderingContextSetFillStyleByCanvasPattern(this.getID(), pattern.getID())
                        }
                    case color: ResourceColor =>
                        unsafe {
                            FfiOHOSAceFrameworkRenderingContextSetFillStyle(this.getID(), transAppResourceToResourceColor(color))
                        }
                    case _ => ()
                }
            }
        }
    }

    /**
     * Line thickness attribute. The value cannot be 0 or a negative number.
     */
    @!APILevel[
        since: "22",
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
     * Set the attributes specified the color to use for the strokes (outlines) around shapes.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop strokeStyle: Option<StrokeStyle> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                match(v) {
                    case gridient: CanvasGradient =>
                        unsafe {
                            FfiOHOSAceFrameworkRenderingContextSetStrokeStyleByGradient(this.getID(), gridient.getID())
                        }
                    case pattern: CanvasPattern =>
                        unsafe {
                            FfiOHOSAceFrameworkRenderingContextSetStrokeStyleByPattern(this.getID(), pattern.getID())
                        }
                    case color: ResourceColor =>
                        unsafe {
                            FfiOHOSAceFrameworkRenderingContextSetStrokeStyle(this.getID(), transAppResourceToResourceColor(color))
                        }
                    case _ => ()
                }
            }
        }
    }

    /**
     * Line segment endpoint attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop lineCap: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue: LineCapStyle = match (v) {
                    case "butt" => LineCapStyle.Butt
                    case "round" => LineCapStyle.Round
                    case "square" => LineCapStyle.Square
                    case _ => LineCapStyle.Butt
                }
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetLineCap(this.getID(), realValue.getValue())
                }
            }
        }
    }

    /**
     * Line segment connection point attribute
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop lineJoin: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue: LineJoinStyle = match (v) {
                    case "miter" => LineJoinStyle.Miter
                    case "round" => LineJoinStyle.Round
                    case "bevel" => LineJoinStyle.Bevel
                    case _ => LineJoinStyle.Miter
                }
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetLineJoin(this.getID(), realValue.getValue())
                }
            }
        }
    }

    /**
     * The value of this parameter cannot be 0 or a negative number.
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop font: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let params = parseFontValue(v)
                unsafe {
                    try (
                        weightValue = LibC.mallocCString(params[1]).asResource(),
                        familyValue = LibC.mallocCString(params[3]).asResource()
                    ) {
                        var size_ = transAppResourceToLength(params[2])
                        FfiOHOSAceFrameworkRenderingContextSetFont(
                            this.getID(),
                            params[0].getValue(),
                            weightValue.value,
                            size_.value,
                            size_.unitType.getValue(),
                            familyValue.value
                        )
                    }
                }
            }
        }
    }

    /**
     * Text alignment mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop textAlign: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue = match (v) {
                    case "center" => CanvasTextAlign.Center
                    case "end" => CanvasTextAlign.End
                    case "left" => CanvasTextAlign.Left
                    case "right" => CanvasTextAlign.Right
                    case "start" => CanvasTextAlign.Start
                    case _ => CanvasTextAlign.Start
                }
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetTextAlign(this.getID(), realValue.getValue())
                }
            }
        }
    }

    /**
     * Text baseline.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop textBaseline: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue = match (v) {
                    case "alphabetic" => CanvasTextBaseline.Alphabetic
                    case "ideographic" => CanvasTextBaseline.Ideographic
                    case "top" => CanvasTextBaseline.Top
                    case "bottom" => CanvasTextBaseline.Bottom
                    case "middle" => CanvasTextBaseline.Middle
                    case "hanging" => CanvasTextBaseline.Hanging
                    case _ =>CanvasTextBaseline.Alphabetic
                }
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetTextBaseline(this.getID(),
                        realValue.getValue())
                }
            }
        }
    }

    /**
     * Transparency. The value ranges from 0.0 (completely transparent) to 1.0 (completely opaque).
     * If the value is out of range, the assignment is invalid.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?Array<Float64> } segments - A set of numbers that describe the length of alternating drawn lines
     *   segments and spacing (coordinate space units).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setLineDash(segments: ?Array<Float64>): Unit {
        let tmpDashArr = segments ?? []
        let vecFFi = FFIVectorFloat64(tmpDashArr.size)
        var index = 0
        for (i in tmpDashArr) {
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
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop globalCompositeOperation: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue: GlobalCompositeOperation = match (v) {
                    case "source-over" => GlobalCompositeOperation.SourceOver
                    case "source-atop" => GlobalCompositeOperation.SourceAtop
                    case "source-in" => GlobalCompositeOperation.SourceIn
                    case "source-out" => GlobalCompositeOperation.SourceOut
                    case "destination-over" => GlobalCompositeOperation.DestinationOver
                    case "destination-atop" => GlobalCompositeOperation.DestinationAtop
                    case "destination-in" => GlobalCompositeOperation.DestinationIn
                    case "destination-out" => GlobalCompositeOperation.DestinationOut
                    case "lighter" => GlobalCompositeOperation.Lighter
                    case "copy" => GlobalCompositeOperation.Copy
                    case "xor" => GlobalCompositeOperation.Xor
                    case _ => GlobalCompositeOperation.SourceOver
                }
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetGlobalCompositeOperation(this.getID(),
                        realValue.getValue())
                }
            }
        }
    }

    /**
     * Shadow blur radius. The value cannot be a negative number.
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
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
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop imageSmoothingQuality: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue: ImageSmoothingQuality = match (v) {
                    case "high" => ImageSmoothingQuality.High
                    case "low" => ImageSmoothingQuality.Low
                    case "medium" => ImageSmoothingQuality.Medium
                    case _ => ImageSmoothingQuality.Low
                }
                unsafe {
                    try (qualityValue = LibC.mallocCString(realValue.getValue()).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextSetImageSmoothingQuality(this.getID(), qualityValue.value)
                    }
                }
            }
        }
    }

    /**
     * Text drawing direction.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop direction: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                let realValue: CanvasDirection = match (v) {
                    case "inherit" => CanvasDirection.Inherit
                    case "ltr" => CanvasDirection.Ltr
                    case "rtl" => CanvasDirection.Rtl
                    case _ => CanvasDirection.Inherit
                }
                unsafe {
                    try (directionValue = LibC.mallocCString(realValue.getValue()).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextSetDirection(this.getID(), directionValue.value)
                    }
                }
            }
        }
    }

    /**
     * Provides filter effects such as blur and grayscale. You can set the following filter effects:
     * blur(<length>): Adds a Gaussian blur effect to the drawing.
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
     * none: Turn off filter effects.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop filter: Option<String> {
        get() {
            return Option.None
        }
        set(value) {
            if (let Some(v) <- value) {
                unsafe {
                    try (filterValue = LibC.mallocCString(v).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextSetFilter(this.getID(), filterValue.value)
                    }
                }
            }
        }
    }

    /**
     * Fills a specified rectangular area.
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillRect(x: Float64, y: Float64, w: Float64, h: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextFillRect(this.getID(), x, y, w, h)
        }
    }

    /**
     * Stroke Specify Rectangular Area.
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeRect(x: Float64, y: Float64, w: Float64, h: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextStrokeRect(this.getID(), x, y, w, h)
        }
    }

    /**
     * Clears the drawing content of a rectangular area.
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clearRect(x: Float64, y: Float64, w: Float64, h: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextClearRect(this.getID(), x, y, w, h)
        }
    }

    /**
     * Fills the specified text at the specified location.
     *
     * @param { String } text - Text string to be drawn.
     * @param { Float64 } x - The x-axis coordinate of the start point of the text.
     * @param { Float64 } y - The y-axis coordinate of the start point of the text.
     * @param { ?Float64 } maxWidth - Maximum width of the drawing.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillText(text: String, x: Float64, y: Float64, maxWidth!: ?Float64 = Option.None): Unit {
        match (maxWidth) {
            case Some(v) =>
                unsafe {
                    try (content = LibC.mallocCString(text).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextFillTextWithMaxWidth(this.getID(), x, y, content.value, v)
                    }
                }
            case None =>
                unsafe {
                    try (content = LibC.mallocCString(text).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextFillText(this.getID(), x, y, content.value)
                    }
                }
        }
    }

    /**
     * Stroke specified text at specified position.
     *
     * @param { String } text - Text string to be stroked.
     * @param { Float64 } x - The x-axis coordinate of the start point of the text.
     * @param { Float64 } y - The y-axis-axis coordinate of the start point of the text.
     * @param { ?Float64 } maxWidth - Maximum width of the stroke.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeText(text: String, x: Float64, y: Float64, maxWidth!: Option<Float64> = Option.None): Unit {
        match (maxWidth) {
            case Some(v) =>
                unsafe {
                    try (content = LibC.mallocCString(text).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextStrokeTextWithMaxWidth(this.getID(), x, y, content.value, v)
                    }
                }
            case None =>
                unsafe {
                    try (content = LibC.mallocCString(text).asResource()) {
                        FfiOHOSAceFrameworkRenderingContextStrokeText(this.getID(), x, y, content.value)
                    }
                }
        }
    }

    /**
     * Measure the size of a specified text.
     *
     * @param { ?String } text - Text string to be measured.
     * @returns { TextMetrics } - The metrics of the text.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func measureText(text: ?String): TextMetrics {
        var metrics = TextMetrics(0.0, 0.0)
        unsafe {
            try (content = LibC.mallocCString(text ?? "undefined").asResource()) {
                let nativeMetrics: NativeTextMetrics = FfiOHOSAceFrameworkRenderingContextMeasureText(this.getID(), content.value)
                metrics = nativeMetrics.parseToCJ()
            }
            return metrics
        }
    }

    /**
     * Draws an existing path according to the current stroke style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextStroke(this.getID())
        }
    }

    /**
     * Draws the specified path according to the current stroke style.
     *
     * @param { Path2D } path - Specified stroke path object.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(path: Path2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextStrokeWithPath(this.getID(), path.getID())
        }
    }

    /**
     * Clear the sub-path list and start a new path.
     */
    @!APILevel[
        since: "22",
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
   */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextMoveTo(this.getID(), x, y)
        }
    }

    /**
     * Connect sub-path using straight lines.
     *
     * @param { Float64 } x - The x-axis coordinate of the end point of the line.
     * @param { Float64 } y - The y-axis coordinate of the end point of the line.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextLineTo(this.getID(), x, y)
        }
    }

    /**
     * Returns the pen point to the start point of the current sub-path.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextClosePath(this.getID())
        }
    }

    /**
     * Creates a template object using the specified image.
     *
     * @param { ?ImageBitmap } image - Objects as duplicate image sources.
     * @param { ?Repetition } repetition - Specifies how to repeat images.
     * @returns { Option<CanvasPattern> } - The created canvas pattern.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createPattern(image: ?ImageBitmap, repetition: Option<Repetition>): Option<CanvasPattern> {
        let tmpImage = image ?? ImageBitmap("")
        match (repetition) {
            case Some(v) => return CanvasPattern(this.getID(), tmpImage, v)
            case None => return CanvasPattern(this.getID(), tmpImage, Repetition.NoRepeat)
        }
    }

    /**
     * Drawing Cubic Bessel Curve Paths.
     *
     * @param { Float64 } cp1x - The x-axis coordinate of the first control point.
     * @param { Float64 } cp1y - The y-axis coordinate of the first control point.
     * @param { Float64 } cp2x - The x-axis coordinate of the second control point.
     * @param { Float64 } cp2y - The y-axis coordinate of the second control point.
     * @param { Float64 } x - x-axis coordinate of the end point.
     * @param { Float64 } y - y-axis coordinate of the end point.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bezierCurveTo(cp1x: Float64, cp1y: Float64, cp2x: Float64, cp2y: Float64, x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextBezierCurveTo(this.getID(), cp1x, cp1y, cp2x, cp2y, x, y)
        }
    }

    /**
     * Draw quadratic Bezier curve paths.
     *
     * @param { Float64 } cpx - The x-axis coordinate of the control point.
     * @param { Float64 } cpy - The y-axis coordinate of the control point.
     * @param { Float64 } x - x-axis coordinate of the end point.
     * @param { Float64 } y - y-axis coordinate of the end point.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func quadraticCurveTo(cpx: Float64, cpy: Float64, x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextQuadraticCurveTo(this.getID(), cpx, cpy, x, y)
        }
    }

    /**
     * Draw an arc path.
     *
     * @param { Float64 } x - The x-axis coordinate of the center (center of the circle) of the arc.
     * @param { Float64 } y - The y-axis coordinate of the center (center of the circle) of the arc.
     * @param { Float64 } radius - Radius of the arc.
     * @param { Float64 } startAngle - Start point of an arc, which starts to be calculated in the x-axis direction. The unit is radian.
     * @param { Float64 } endAngle - The end point of the arc, in radians.
     * @param { ?Bool } counterclockwise - If the value is true, the arc is drawn counterclockwise. Otherwise,
     *    the arc is drawn clockwise. The default value is false.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        counterclockwise!: ?Bool = None
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextArc(this.getID(), x, y, radius, startAngle, endAngle, counterclockwise ?? false)
        }
    }

    /**
     * Draw arc paths based on control points and radius.
     *
     * @param { Float64 } x1 - The x-axis coordinate of the first control point.
     * @param { Float64 } y1 - The y-axis coordinate of the first control point.
     * @param { Float64 } x2 - The x-axis coordinate of the second control point.
     * @param { Float64 } y2 - The y-axis coordinate of the second control point.
     * @param { Float64 } radius - Radius of the arc.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arcTo(x1: Float64, y1: Float64, x2: Float64, y2: Float64, radius: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextArcTo(this.getID(), x1, y1, x2, y2, radius)
        }
    }

    /**
     * Draw an Elliptic Path.
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
        since: "22",
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
        counterclockwise!: ?Bool = None
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
                counterclockwise ?? false
            )
        }
    }

    /**
     * Draw Rectangular Paths.
     *
     * @param { Float64 } x - The x-axis coordinate of the start point of the rectangle.
     * @param { Float64 } y - The y-axis coordinate of the start point of the rectangle.
     * @param { Float64 } w - Width of the rectangle.
     * @param { Float64 } h - Height of the rectangle.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?CanvasFillRule } fillRule - Algorithm rule.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(fillRule!: ?CanvasFillRule = None): Unit {
        let tmpFillRule = fillRule ?? CanvasFillRule.NonZero
        unsafe {
            try (ruleStr = LibC.mallocCString(tmpFillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkRenderingContextFillWithStr(this.getID(), ruleStr.value)
            }
        }
    }

    /**
     * Fills the specified path according to the current fill style.
     *
     * @param { ?Path2D } path - Path to be filled.
     * @param { ?CanvasFillRule } fillRule - Algorithm rule.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(path: ?Path2D, fillRule!: ?CanvasFillRule = None): Unit {
        let tmpPath = path ?? Path2D()
        let tmpFillRule = fillRule ?? CanvasFillRule.NonZero
        unsafe {
            try (ruleStr = LibC.mallocCString(tmpFillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkRenderingContextFillWithPath(this.getID(), tmpPath.getID(), ruleStr.value)
            }
        }
    }

    /**
     * Sets the currently created path as the current clipping path.
     *
     * @param { ?CanvasFillRule } fillRule - Algorithm rule.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(fillRule!: ?CanvasFillRule = None): Unit {
        let tmpFillRule = fillRule ?? CanvasFillRule.NonZero
        unsafe {
            try (ruleStr = LibC.mallocCString(tmpFillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkRenderingContextClipWithStr(this.getID(), ruleStr.value)
            }
        }
    }

    /**
     * Tailoring according to the specified path.
     *
     * @param { ?Path2D } path - Path to be cut.
     * @param { ?CanvasFillRule } fillRule - Algorithm rule.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(path: ?Path2D, fillRule!: ?CanvasFillRule = None): Unit {
        let tmpPath = path ?? Path2D()
        let tmpFillRule = fillRule ?? CanvasFillRule.NonZero
        unsafe {
            try (ruleStr = LibC.mallocCString(tmpFillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkRenderingContextClipWithPath(this.getID(), tmpPath.getID(), ruleStr.value)
            }
        }
    }

    /**
     * Adds the effect of a rotation.
     *
     * @param { Float64 } angle - The radian of clockwise rotation, which can be converted to an angle value using the formula:
     *    degree * Math.PI / 180
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } x - Horizontal scaling factor.
     * @param { Float64 } y - Vertical scaling factor.
     */
    @!APILevel[
        since: "22",
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
     * @param { Float64 } a - Horizontal Zoom.
     * @param { Float64 } b - Vertical Tilt.
     * @param { Float64 } c - Horizontal Tilt.
     * @param { Float64 } d - Vertical Zoom.
     * @param { Float64 } e - Horizontal movement.
     * @param { Float64 } f - Vertical movement.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transform(
        a: Float64,
        b: Float64,
        c: Float64,
        d: Float64,
        e: Float64,
        f: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextTransform(
                this.getID(),
                a,
                b,
                c,
                d,
                e,
                f
            )
        }
    }
    /**
     * Adds the 2D transformation effect, including rotation, translation, and scaling,
     *    and overwrites the current transformation matrix.
     *
     * @param { Float64 } a - Horizontal Zoom.
     * @param { Float64 } b - Vertical Tilt.
     * @param { Float64 } c - Horizontal Tilt.
     * @param { Float64 } d - Vertical Zoom.
     * @param { Float64 } e - Horizontal movement.
     * @param { Float64 } f - Vertical movement.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(
        a: Float64,
        b: Float64,
        c: Float64,
        d: Float64,
        e: Float64,
        f: Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSetTransform(
                this.getID(),
                a,
                b,
                c,
                d,
                e,
                f
            )
        }
    }

    /**
     * The 2D transformation effect is added. The current transformation matrix is not overwritten and
     *    the transformations are superimposed for multiple times.
     *
     * @param { ?Matrix2D } transform - 2D transformation matrix.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(matrix: ?Matrix2D): Unit {
        match (matrix) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkRenderingContextSetTransformByMatrix(this.getID(), v.getID())
                }
            case None => ()
        }
    }

    /**
     * Increases the translation effect of the X and Y axes.
     *
     * @param { Float64 } x - Horizontal movement distance.
     * @param { Float64 } y - Vertical travel distance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextTranslate(this.getID(), x, y)
        }
    }

    /**
     * Top of the stack pop-up state in the drawing state stack.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func restore(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextRestore(this.getID())
        }
    }

    /**
     * Saves the current drawing state to the drawing state stack.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func save(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSave(this.getID())
        }
    }

    /**
     * Creates a linear gradient object that is specified along the parameter coordinates.
     *
     * @param { Float64 } x0 - The x-axis coordinate of the start point.
     * @param { Float64 } y0 - The y-axis coordinate of the start point.
     * @param { Float64 } x1 - x-axis coordinate of the end point.
     * @param { Float64 } y1 - y-axis coordinate of the end point.
     * @returns { CanvasGradient } - The created linear gradient.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createLinearGradient(x0: Float64, y0: Float64, x1: Float64, y1: Float64): CanvasGradient {
        return CanvasGradient(this.getID(), x0, y0, x1, y1)
    }

    /**
     * Creates a radioactive gradient object based on parameters that determine the coordinates of two circles.
     *
     * @param { Float64 } x0 - The x-axis coordinate of the start circle.
     * @param { Float64 } y0 - The y-axis coordinate of the start circle.
     * @param { Float64 } r0 - Radius of the starting circle.
     * @param { Float64 } x1 - The x-axis coordinate of the end circle.
     * @param { Float64 } y1 - The y-axis coordinate of the end circle.
     * @param { Float64 } r1 - Radius of the end circle.
     * @returns { CanvasGradient } - The created radial gradient.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createRadialGradient(x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64): CanvasGradient {
        return CanvasGradient(this.getID(), x0, y0, r0, x1, y1, r1)
    }

    /**
     * Creates a gradient around a point with given coordinates.
     *
     * @param { ?Float64 } startAngle - The angle at which to begin the gradient, in radians.
     *   Angle measurements start horizontally the right of the center and move around clockwise.
     * @param { ?Float64 } x - The x-axis coordinate of the center of the gradient.
     * @param { ?Float64 } y - The y-axis coordinate of the center of the gradient.
     * @returns { CanvasGradient } - A CanvasGradient object that draws a conic gradient around the given coordinates.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createConicGradient(startAngle: ?Float64, x: ?Float64, y: ?Float64): CanvasGradient {
        unsafe {
            let gradientId = FfiOHOSAceFrameworkRenderingContextCreateConicGradient(this.getID(), startAngle ?? 0.0, x ?? 0.0, y ?? 0.0)
            return CanvasGradient(gradientId)
        }
    }

    /**
     * Draw an image on a canvas.
     *
     * @param { ImageBitmap } image - Picture objects drawn to the canvas.
     * @param { ?Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: ?Float64, dy: ?Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesOnly.getValue(), 0.0, 0.0, 0.0, 0.0, dx ?? 0.0, dy ?? 0.0, image.width,
                    image.height)
            )
        }
    }

    /**
     * Draw an image on a canvas.
     *
     * @param { ImageBitmap } image - Picture objects drawn to the canvas.
     * @param { ?Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { ?Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: ?Float64, dy: ?Float64, dw: ?Float64, dh: ?Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesAndSize.getValue(), 0.0, 0.0, 0.0, 0.0, dx ?? 0.0, dy ?? 0.0, dw ?? 0.0, dh ?? 0.0)
            )
        }
    }

    /**
     *Draw an image on a canvas.
     *
     * @param { ImageBitmap } image - Picture objects drawn to the canvas.
     * @param { Float64 } ?sx - x coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { Float64 } ?sy - y coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { Float64 } ?sw - Width of the rectangle (cropping) selection box of the image.
     * @param { Float64 } ?sh - Height of the rectangle (cropping) selection box of the image.
     * @param { Float64 } ?dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } ?dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { Float64 } ?dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { Float64 } ?dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(
        image: ImageBitmap,
        sx: ?Float64,
        sy: ?Float64,
        sw: ?Float64,
        sd: ?Float64,
        dx: ?Float64,
        dy: ?Float64,
        dw: ?Float64,
        dh: ?Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(
                    CanvasImageType.CoordinatesAndSizeWithSource.getValue(),
                    sx ?? 0.0,
                    sy ?? 0.0,
                    sw ?? 0.0,
                    sd ?? 0.0,
                    dx ?? 0.0,
                    dy ?? 0.0,
                    dw ?? 0.0,
                    dh ?? 0.0
                )
            )
        }
    }

    /**
     * Draw an image on a canvas.
     *
     * @param { PixelMap } image - Picture objects drawn to the canvas.
     * @param { ?Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: PixelMap, dx: ?Float64, dy: ?Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesOnly.getValue(), 0.0, 0.0, 0.0, 0.0, dx ?? 0.0, dy ?? 0.0, 0.0, 0.0)
            )
        }
    }

    /**
     * Draw an image on a canvas.
     *
     * @param { PixelMap } image - Picture objects drawn to the canvas.
     * @param { ?Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { ?Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: PixelMap, dx: ?Float64, dy: ?Float64, dw: ?Float64, dh: ?Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesAndSize.getValue(), 0.0, 0.0, 0.0, 0.0, dx ?? 0.0, dy ?? 0.0, dw ?? 0.0, dh ?? 0.0)
            )
        }
    }

    /**
     * Draw an image on a canvas.
     *
     * @param { PixelMap } image - Picture objects drawn to the canvas.
     * @param { ?Float64 } sx - x coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { ?Float64 } sy - y coordinate of the upper left corner of the rectangle (cropping) selection box of the image.
     * @param { ?Float64 } sw - Width of the rectangle (cropping) selection box of the image.
     * @param { ?Float64 } sh - Height of the rectangle (cropping) selection box of the image.
     * @param { ?Float64 } dx - x-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dy - y-axis coordinate of the upper left corner of the image on the target canvas.
     * @param { ?Float64 } dw - Specifies the drawing width of the image on the target canvas. The width of the drawn image will be scaled.
     * @param { ?Float64 } dh - Specifies the drawing height of the image on the target canvas. The height of the drawn image will be scaled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(
        image: PixelMap,
        sx: ?Float64,
        sy: ?Float64,
        sw: ?Float64,
        sd: ?Float64,
        dx: ?Float64,
        dy: ?Float64,
        dw: ?Float64,
        dh: ?Float64
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextDrawImageWithPixelMap(
                this.getID(),
                image.getID(),
                ImageInfo(
                    CanvasImageType.CoordinatesAndSizeWithSource.getValue(),
                    sx ?? 0.0,
                    sy ?? 0.0,
                    sw ?? 0.0,
                    sd ?? 0.0,
                    dx ?? 0.0,
                    dy ?? 0.0,
                    dw ?? 0.0,
                    dh ?? 0.0
                )
            )
        }
    }

    /**
     * Obtains the PixelMap of a specified area on the current canvas.
     *
     * @param { ?Float64 } sx - x coordinate of the upper left corner of the rectangular area of the PixelMap to be extracted.
     * @param { ?Float64 } sy - y coordinate of the upper left corner of the rectangular area of the PixelMap to be extracted.
     * @param { ?Float64 } sw - The width of the rectangular area of the PixelMap to be extracted.
     * @param { ?Float64 } sh - The height of the rectangular area of the PixelMap to be extracted.
     * @returns { PixelMap } - The pixel map of the specified area.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPixelMap(sx: ?Float64, sy: ?Float64, sw: ?Float64, sh: ?Float64): PixelMap {
        let id = unsafe {
            FfiOHOSAceFrameworkRenderingContextGetPixelMap(
                this.getID(),
                sx ?? 0.0,
                sy ?? 0.0,
                sw ?? 0.0,
                sh ?? 0.0
            )
        }
        return PixelMap(id)
    }

    /**
     * Clear the backing buffer, drawing state stack, any defined paths, and styles.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextReset(this.getID())
        }
    }

    /**
     * Allocate a layer for subsequent drawing.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func saveLayer(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextSavaLayer(this.getID())
        }
    }

    /**
     * Remove changes to transform and clip since saveLayer was last called and draw the layer on canvas.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func restoreLayer(): Unit {
        unsafe {
            FfiOHOSAceFrameworkRenderingContextRestoreLayer(this.getID())
        }
    }

    /**
     * Resets the current transformation matrix using the identity matrix.
     */
    @!APILevel[
        since: "22",
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
     * @returns { Matrix2D } - The current transformation matrix.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?ImageBitmap } bitmap - The image to transfer from.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transferFromImageBitmap(bitmap: ?ImageBitmap): Unit {
        let tmpBitmap = bitmap ?? ImageBitmap("")
        unsafe {
            FfiOHOSAceFrameworkRenderingContextTransferFromImageBitmap(this.getID(), tmpBitmap.getID())
        }
    }

    /**
     * Which is bound to the height of the specified canvas. The value is read-only.
     * @default 0
     */
    @!APILevel[
        since: "22",
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
     * Which is bound to the width of the specified canvas. The value is read-only.
     * @default 0
     */
    @!APILevel[
        since: "22",
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
     * @param { ?PixelMap } value - PixelMap object
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setPixelMap(value: ?PixelMap): Unit {
        match (value) {
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
     * @returns { Array<Float64> } - The current line dash pattern array.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?String } type - Image format. The default value is image/png.
     * @param { ?Float64 } quality - If the image format is image/jpeg or image/webp, you can select the image quality from 0 to 1.
     *    If the value is out of the range, the default value 0.92 is used.
     * @returns { String } - The data URL string of the canvas.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toDataURL(imageType!: ?String = None, quality!: ?Float64 = None): String {
        var tmpImageType = imageType ?? "image/png"
        let tmpQuality = quality ?? 0.92
        unsafe {
            var realType = "image/png"
            if (
                tmpImageType == ImageType.Png.getValue() ||
                tmpImageType == ImageType.Jpeg.getValue() ||
                tmpImageType == ImageType.Webp.getValue()
            ) {
                realType = tmpImageType
            }

            var actuaQua: Float64 = 0.0
            if (tmpQuality < 0.0 || tmpQuality > 1.0) {
                actuaQua = 0.92
            } else {
                actuaQua = tmpQuality
            }

            var result = ""
            try (typeStr = LibC.mallocCString(realType).asResource()) {
                let dataUrl = FfiOHOSAceFrameworkRenderingContextToDataURL(this.getID(), typeStr.value, actuaQua)
                result = dataUrl.toString()
                dataUrl.free()
            }
            return result
        }
    }

    /**
     * Creates a new, empty ImageData object of the specified size.
     *
     * @param { ?Float64 } sw - Width of the ImageData object.
     * @param { ?Float64 } sh - Height of the ImageData object.
     * @returns { ImageData } - The created empty ImageData object.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(sw: ?Float64, sh: ?Float64): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkRenderingContextCreateImageData(this.getID(), sh ?? 0.0, sw ?? 0.0)
            return ImageData(imageDataId)
        }
    }

    /**
     * From an existing ImageData object, copy an object with the same width and height as the image.
     *    The image content is not copied.
     *
     * @param { ?ImageData } imagedata - ImageData object to be copied.
     * @returns { ImageData } - The created ImageData object with the same dimensions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(imageData: ?ImageData): ImageData {
        let tmpImageData = imageData ?? ImageData(0.0, 0.0)
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkRenderingContextCreateImageDataWithImageData(this.getID(),
                tmpImageData.getID())
            return ImageData(imageDataId)
        }
    }

    /**
     * Obtains the pixel data of a specified area on the current canvas.
     *
     * @param { ?Float64 } sx - x coordinate of the upper left corner of the rectangular area of the image data to be extracted.
     * @param { ?Float64 } sy - y coordinate of the upper left corner of the rectangular area of the image data to be extracted.
     * @param { ?Float64 } sw - The width of the rectangular area of the image data to be extracted.
     * @param { ?Float64 } sh - The height of the rectangular area of the image data to be extracted.
     * @returns { ImageData } - The pixel data of the specified area.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getImageData(sx: ?Float64, sy: ?Float64, sw: ?Float64, sh: ?Float64): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkRenderingContextGetImageData(this.getID(), sx ?? 0.0, sy ?? 0.0, sw ?? 0.0, sh ?? 0.0)
            return ImageData(imageDataId)
        }
    }

    /**
     * Draws the specified ImageData object onto the canvas.
     *
     * @param { ImageData } imagedata - ImageData object to be drawn.
     * @param { Length } dx - Position offset of the source image data in the target canvas (the offset in the x-axis direction).
     * @param { Length } dy - Position offset of the source image data in the target canvas (the offset in the y-axis direction).
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(imageData: ImageData, dx: Length, dy: Length): Unit {
        var realDx: Float64 = 0.0
        var realDy: Float64 = 0.0
        realDx = parseLength2Vp(dx)
        realDy = parseLength2Vp(dy)
        unsafe {
            FfiOHOSAceFrameworkRenderingContextPutImageData(this.getID(), imageData.getID(), realDx, realDy)
        }
    }

    /**
     * Draws the specified ImageData object onto the canvas.
     *
     * @param { ImageData } imagedata - ImageData object to be drawn.
     * @param { ?Length } dx - Position offset of the source image data in the target canvas (the offset in the x-axis direction).
     * @param { ?Length } dy - Position offset of the source image data in the target canvas (the offset in the y-axis direction).
     * @param { ?Length } dirtyX - Position of the upper left corner of the rectangular area in the source image data.
     *    The default is the upper left corner (x coordinate) of the entire image data.
     * @param { ?Length } dirtyY - Position of the upper left corner of the rectangular area in the source image data.
     *    The default is the upper left corner (y coordinate) of the entire image data.
     * @param { ?Length } dirtyWidth - Width of the rectangular area in the source image data.
     *    The default is the width of the image data.
     * @param { ?Length } dirtyHeight - Height of the rectangular area in the source image data.
     *    The default is the height of the image data.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(
        imageData: ImageData,
        dx: ?Length,
        dy: ?Length,
        dirtyX: ?Length,
        dirtyY: ?Length,
        dirtyWidth: ?Length,
        dirtyHeight: ?Length
    ): Unit {
        var realDx: Float64 = 0.0
        var realDy: Float64 = 0.0
        var realDirtyX: Float64 = 0.0
        var realDirtyY: Float64 = 0.0
        var realDirtyWidth: Float64 = 0.0
        var realDirtyHeight: Float64 = 0.0
        realDx = parseLength2Vp(dx ?? 0.0)
        realDy = parseLength2Vp(dy ?? 0.0)
        realDirtyX = parseLength2Vp(dirtyX ?? 0.0)
        realDirtyY = parseLength2Vp(dirtyY ?? 0.0)
        realDirtyWidth = parseLength2Vp(dirtyWidth ?? 0.0)
        realDirtyHeight = parseLength2Vp(dirtyHeight ?? 0.0)
        unsafe {
            FfiOHOSAceFrameworkRenderingContextPutImageDataWithDirty(this.getID(), imageData.getID(), realDx, realDy, realDirtyX,
                realDirtyY, realDirtyWidth, realDirtyHeight)
        }
    }
}
