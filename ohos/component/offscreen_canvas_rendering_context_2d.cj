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

foreign {
    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContext2DCtor(id: Int64, contextType: Int32, options: Bool,
        widht: Float64, height: Float64): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCtor(width: Float64, height: Float64, antialias: Bool,
        unit: Int32): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFillStyle(selfId: Int64, colorValue: UInt32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFillStyleByGradient(selfId: Int64, gradientId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFillStyleByCanvasPattern(selfId: Int64, patternId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineWidth(selfId: Int64, lineWidth: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetStrokeStyle(selfId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetStrokeStyleByGradient(selfId: Int64, gradientId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetStrokeStyleByPattern(selfId: Int64, patterntId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineCap(selfId: Int64, lineCap: Int32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineJoin(selfId: Int64, lineJoin: Int32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetMiterLimit(selfId: Int64, limit: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFont(
        selfId: Int64,
        style: Int32,
        weight: CString,
        size: Float64,
        sizeUnit: Int32,
        family: CString
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTextAlign(selfId: Int64, align: Int32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTextBaseline(selfId: Int64, baseline: Int32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetGlobalAlpha(selfId: Int64, alpha: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineDashOffset(selfId: Int64, lineDashOffset: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetGlobalCompositeOperation(selfId: Int64, operation: Int32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowBlur(selfId: Int64, blur: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowColor(selfId: Int64, color: UInt32): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowOffsetX(selfId: Int64, offsetX: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowOffsetY(selfId: Int64, offsetY: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetImageSmoothingEnabled(selfId: Int64, enabled: Bool): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetImageSmoothingQuality(selfId: Int64, quality: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetDirection(selfId: Int64, direction: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFilter(selfId: Int64, filterStr: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillRect(
        controllerId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeRect(
        selfId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClearRect(
        selfId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillText(selfId: Int64, x: Float64, y: Float64, text: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillTextWithMaxWidth(
        selfId: Int64,
        x: Float64,
        y: Float64,
        text: CString,
        maxWidth: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeText(selfId: Int64, x: Float64, y: Float64,
        text: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeTextWithMaxWidth(
        selfId: Int64,
        x: Float64,
        y: Float64,
        text: CString,
        maxWidth: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextMeasureText(selfId: Int64, text: CString): TextMetrics

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStroke(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeWithPath(selfId: Int64, pathId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextBeginPath(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextMoveTo(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextLineTo(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClosePath(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateCanvasPattern(reder: Int64, imageId: Int64,
        repetition: CString): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextBezierCurveTo(
        selfId: Int64,
        cp1x: Float64,
        cp1y: Float64,
        cp2x: Float64,
        cp2y: Float64,
        x: Float64,
        y: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextQuadraticCurveTo(
        selfId: Int64,
        cpx: Float64,
        cpy: Float64,
        x: Float64,
        y: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextArc(
        selfId: Int64,
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        anticlockwise: Bool
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextArcTo(
        selfId: Int64,
        x1: Float64,
        y1: Float64,
        x2: Float64,
        y2: Float64,
        radius: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextEllipse(
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

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRect(
        selfId: Int64,
        x: Float64,
        y: Float64,
        width: Float64,
        height: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFill(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillWithStr(selfId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillWithPath(selfId: Int64, pathId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClip(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClipWithStr(selfId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClipWithPath(selfId: Int64, pathId: Int64, ruleStr: CString): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextReset(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSavaLayer(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRestoreLayer(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRotate(selfId: Int64, angle: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextScale(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextTransform(
        selfId: Int64,
        scaleX: Float64,
        scaleY: Float64,
        skewX: Float64,
        skewY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTransform(
        selfId: Int64,
        scaleX: Float64,
        scaleY: Float64,
        skewX: Float64,
        skewY: Float64,
        translateX: Float64,
        translateY: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextResetTransform(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTransformByMatrix(selfId: Int64, matrixId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetTransform(selfId: Int64): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextTranslate(selfId: Int64, x: Float64, y: Float64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithImageBitMap(
        selfId: Int64,
        pixelId: Int64,
        imageInfo: ImageInfo
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithPixelMap(
        selfId: Int64,
        pixelMapId: Int64,
        imageInfo: ImageInfo
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetPixelMap(
        selfId: Int64,
        left: Float64,
        top: Float64,
        width: Float64,
        height: Float64
    ): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetPixelMap(selfId: Int64, pixelMapId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineDash(selfId: Int64, handle: VectorFloat64Handle): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetLineDash(selfId: Int64): VectorFloat64Handle

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextTransferToImageBitmap(contextId: Int64): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextToDataURL(selfId: Int64, imageType: CString, quality: Float64): CString

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRestore(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSave(selfId: Int64): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateLinearGradient(
        selfId: Int64,
        x0: Float64,
        y0: Float64,
        x1: Float64,
        y1: Float64
    ): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateRadialGradient(
        selfId: Int64,
        x0: Float64,
        y0: Float64,
        r0: Float64,
        x1: Float64,
        y1: Float64,
        r1: Float64
    ): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateConicGradient(
        selfId: Int64,
        startAngle: Float64,
        x: Float64,
        y: Float64
    ): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateImageDataWithImageData(
        selfId: Int64,
        imageDataId: Int64
    ): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateImageData(selfId: Int64, height: Float64,
        width: Float64): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetImageData(
        selfId: Int64,
        left: Float64,
        top: Float64,
        width: Float64,
        height: Float64
    ): Int64

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextPutImageDataWithDirty(
        selfId: Int64,
        imageDataId: Int64,
        dx: Float64,
        dy: Float64,
        dirtyX: Float64,
        dirtyY: Float64,
        dirtyWidth: Float64,
        dirtyHeight: Float64
    ): Unit

    func FfiOHOSAceFrameworkOffscreenCanvasRenderingContextPutImageData(
        selfId: Int64,
        imageDataId: Int64,
        dx: Float64,
        dy: Float64
    ): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class OffscreenCanvasRenderingContext2D <: RemoteDataLite {
    init(offScreenId: Int64, contextType: ContextType, options: RenderingContextSettings, width: Float64,
        height: Float64) {
        super(
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContext2DCtor(offScreenId, contextType.getValue(),
                    options.antialias, width, height)
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: Float64,
        height: Float64,
        settings: RenderingContextSettings,
        unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT
    ) {
        super(
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCtor(width, height, settings.antialias,
                    unit.getValue())
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        width: Int64,
        height: Int64,
        settings: RenderingContextSettings,
        unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT
    ) {
        super(
            unsafe {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCtor(Float64(width), Float64(height),
                    settings.antialias, unit.getValue())
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(color: Color): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFillStyle(this.getID(), color.toUInt32());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(color: UInt32): Unit {
        fillStyle(Color(color))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(gradient: CanvasGradient): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFillStyleByGradient(this.getID(), gradient.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillStyle(pattern: CanvasPattern): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFillStyleByCanvasPattern(this.getID(), pattern.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineWidth(width: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineWidth(this.getID(), width)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineWidth(width: Int64): Unit {
        lineWidth(Float64(width))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(color: Color): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetStrokeStyle(this.getID(), color.toUInt32());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(color: UInt32): Unit {
        strokeStyle(Color(color))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(gradient: CanvasGradient): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetStrokeStyleByGradient(this.getID(), gradient.getID());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeStyle(pattern: CanvasPattern): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetStrokeStyleByPattern(this.getID(), pattern.getID());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineCap(value: LineCapStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineCap(this.getID(), value.getValue());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineJoin(value: LineJoinStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineJoin(this.getID(), value.getValue());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func miterLimit(limit: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetMiterLimit(this.getID(), limit);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func miterLimit(limit: Int64): Unit {
        miterLimit(Float64(limit))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
            try (weightValue = LibC.mallocCString(weight.getValue()).asResource(),
                familyValue = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFont(
                    this.getID(),
                    style.getValue(),
                    weightValue.value,
                    size.value,
                    size.unitType.getValue(),
                    familyValue.value
                )
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(align: TextAlignStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTextAlign(this.getID(), align.getValue());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textBaseline(baseline: TextBaseline): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTextBaseline(this.getID(), baseline.getValue());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func globalAlpha(alpha: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetGlobalAlpha(this.getID(), alpha);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func globalAlpha(alpha: Int64): Unit {
        globalAlpha(Float64(alpha))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineDashOffset(offset: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineDashOffset(this.getID(), offset);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineDashOffset(offset: Int64): Unit {
        lineDashOffset(Float64(offset))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func globalCompositeOperation(operation: CompositeOperation): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetGlobalCompositeOperation(this.getID(),
                operation.getValue());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowBlur(blur: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowBlur(this.getID(), blur);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowBlur(offset: Int64): Unit {
        shadowBlur(Float64(offset))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowColor(color: Color): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowColor(this.getID(), color.toUInt32());
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowColor(color: UInt32): Unit {
        shadowColor(Color(color))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowOffsetX(offset: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowOffsetX(this.getID(), offset);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowOffsetX(offset: Int64): Unit {
        shadowOffsetX(Float64(offset))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowOffsetY(offset: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetShadowOffsetY(this.getID(), offset);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadowOffsetY(offset: Int64): Unit {
        shadowOffsetY(Float64(offset))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func imageSmoothingEnabled(enabled: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetImageSmoothingEnabled(this.getID(), enabled);
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func imageSmoothingQuality(quality: QualityType): Unit {
        unsafe {
            try (qualityValue = LibC.mallocCString(quality.getValue()).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetImageSmoothingQuality(this.getID(),
                    qualityValue.value);
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func direction(canvasDirection: CanvasDirection): Unit {
        unsafe {
            try (directionValue = LibC.mallocCString(canvasDirection.getValue()).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetDirection(this.getID(), directionValue.value);
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func filter(filterStr: String): Unit {
        unsafe {
            try (filterValue = LibC.mallocCString(filterStr).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetFilter(this.getID(), filterValue.value);
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillRect(x: Int64, y: Int64, width: Int64, height: Int64): Unit {
        fillRect(Float64(x), Float64(y), Float64(width), Float64(height))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeRect(x: Int64, y: Int64, width: Int64, height: Int64): Unit {
        strokeRect(Float64(x), Float64(y), Float64(width), Float64(height))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clearRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClearRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clearRect(x: Int64, y: Int64, width: Int64, height: Int64): Unit {
        clearRect(Float64(x), Float64(y), Float64(width), Float64(height))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillText(text: String, x: Float64, y: Float64): Unit {
        unsafe {
            try (content = LibC.mallocCString(text).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillText(this.getID(), x, y, content.value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillText(text: String, x: Int64, y: Int64): Unit {
        fillText(text, Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillText(text: String, x: Float64, y: Float64, maxWidth: Float64): Unit {
        unsafe {
            try (content = LibC.mallocCString(text).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillTextWithMaxWidth(this.getID(), x, y, content.value,
                    maxWidth)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillText(text: String, x: Int64, y: Int64, maxWidth: Int64): Unit {
        fillText(text, Float64(x), Float64(y), Float64(maxWidth))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeText(text: String, x: Float64, y: Float64): Unit {
        unsafe {
            try (content = LibC.mallocCString(text).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeText(this.getID(), x, y, content.value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeText(text: String, x: Int64, y: Int64): Unit {
        strokeText(text, Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeText(text: String, x: Float64, y: Float64, maxWidth: Float64): Unit {
        unsafe {
            try (content = LibC.mallocCString(text).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeTextWithMaxWidth(this.getID(), x, y,
                    content.value, maxWidth)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func strokeText(text: String, x: Int64, y: Int64, maxWidth: Int64): Unit {
        strokeText(text, Float64(x), Float64(y), Float64(maxWidth))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func measureText(text: String): TextMetrics {
        unsafe {
            var metrics: TextMetrics = TextMetrics()
            try (content = LibC.mallocCString(text).asResource()) {
                metrics = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextMeasureText(this.getID(), content.value)
            }
            return metrics
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStroke(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stroke(path2D: Path2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextStrokeWithPath(this.getID(), path2D.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func beginPath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextBeginPath(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextMoveTo(this.getID(), x, y)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveTo(x: Int64, y: Int64): Unit {
        moveTo(Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextLineTo(this.getID(), x, y)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineTo(x: Int64, y: Int64): Unit {
        lineTo(Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closePath(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClosePath(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createPattern(image: ImageBitmap, repetition: Repetition): CanvasPattern {
        unsafe {
            var id: Int64 = 0
            try (repSrc = LibC.mallocCString(repetition.toString()).asResource()) {
                id = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateCanvasPattern(this.getID(), image.getID(),
                    repSrc.value)
            }
            return CanvasPattern(id)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bezierCurveTo(cp1x: Float64, cp1y: Float64, cp2x: Float64, cp2y: Float64, x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextBezierCurveTo(this.getID(), cp1x, cp1y, cp2x, cp2y, x, y)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bezierCurveTo(cp1x: Int64, cp1y: Int64, cp2x: Int64, cp2y: Int64, x: Int64, y: Int64): Unit {
        bezierCurveTo(Float64(cp1x), Float64(cp1y), Float64(cp2x), Float64(cp2y), Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func quadraticCurveTo(cpx: Float64, cpy: Float64, x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextQuadraticCurveTo(this.getID(), cpx, cpy, x, y)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func quadraticCurveTo(cpx: Int64, cpy: Int64, x: Int64, y: Int64): Unit {
        quadraticCurveTo(Float64(cpx), Float64(cpy), Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(
        x: Float64,
        y: Float64,
        radius: Float64,
        startAngle: Float64,
        endAngle: Float64,
        anticlockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextArc(this.getID(), x, y, radius, startAngle, endAngle,
                anticlockwise)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arc(x: Int64, y: Int64, radius: Int64, startAngle: Int64, endAngle: Int64, anticlockwise!: Bool = false): Unit {
        arc(
            Float64(x),
            Float64(y),
            Float64(radius),
            Float64(startAngle),
            Float64(endAngle),
            anticlockwise: anticlockwise
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arcTo(x1: Float64, y1: Float64, x2: Float64, y2: Float64, radius: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextArcTo(this.getID(), x1, y1, x2, y2, radius)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func arcTo(x1: Int64, y1: Int64, x2: Int64, y2: Int64, radius: Int64): Unit {
        arcTo(Float64(x1), Float64(y1), Float64(x2), Float64(y2), Float64(radius))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        anticlockwise!: Bool = false
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextEllipse(
                this.getID(),
                x,
                y,
                radiusX,
                radiusY,
                rotation,
                startAngle,
                endAngle,
                anticlockwise
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ellipse(
        x: Int64,
        y: Int64,
        radiusX: Int64,
        radiusY: Int64,
        rotation: Int64,
        startAngle: Int64,
        endAngle: Int64,
        anticlockwise!: Bool = false
    ): Unit {
        ellipse(
            Float64(x),
            Float64(y),
            Float64(radiusX),
            Float64(radiusY),
            Float64(rotation),
            Float64(startAngle),
            Float64(endAngle),
            anticlockwise: anticlockwise
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRect(this.getID(), x, y, width, height)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rect(x: Int64, y: Int64, width: Int64, height: Int64): Unit {
        rect(Float64(x), Float64(y), Float64(width), Float64(height))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFill(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(fillRule: CanvasFillRule): Unit {
        unsafe {
            try (ruleStr = LibC.mallocCString(fillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillWithStr(this.getID(), ruleStr.value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fill(path2D: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.nonzero): Unit {
        unsafe {
            try (ruleStr = LibC.mallocCString(fillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextFillWithPath(this.getID(), path2D.getID(),
                    ruleStr.value)
            }
        }
    }

    /**
     * Set the current path to the clipping path.
     *
     * @since 14
     */
    public func clip(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClip(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(fillRule: CanvasFillRule): Unit {
        unsafe {
            try (ruleStr = LibC.mallocCString(fillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClipWithStr(this.getID(), ruleStr.value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(path2D: Path2D, fillRule!: CanvasFillRule = CanvasFillRule.nonzero): Unit {
        unsafe {
            try (ruleStr = LibC.mallocCString(fillRule.getValue()).asResource()) {
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextClipWithPath(this.getID(), path2D.getID(),
                    ruleStr.value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextReset(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func saveLayer(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSavaLayer(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func restoreLayer(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRestoreLayer(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(angle: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRotate(this.getID(), angle)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(angle: Int64): Unit {
        rotate(Float64(angle))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextScale(this.getID(), x, y)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(x: Int64, y: Int64): Unit {
        scale(Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextTransform(
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
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transform(
        scaleX: Int64,
        skewX: Int64,
        skewY: Int64,
        scaleY: Int64,
        translateX: Int64,
        translateY: Int64
    ): Unit {
        transform(
            Float64(scaleX),
            Float64(skewX),
            Float64(skewY),
            Float64(scaleY),
            Float64(translateX),
            Float64(translateY)
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTransform(
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
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(matrix: Matrix2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetTransformByMatrix(this.getID(), matrix.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(
        scaleX: Int64,
        skewX: Int64,
        skewY: Int64,
        scaleY: Int64,
        translateX: Int64,
        translateY: Int64
    ): Unit {
        setTransform(
            Float64(scaleX),
            Float64(skewX),
            Float64(skewY),
            Float64(scaleY),
            Float64(translateX),
            Float64(translateY)
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getTransform(): Matrix2D {
        unsafe {
            let matrixId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetTransform(this.getID())
            return Matrix2D(matrixId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x: Float64, y: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextTranslate(this.getID(), x, y)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x: Int64, y: Int64): Unit {
        translate(Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: Float64, dy: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesOnly.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, 0.0, 0.0)
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: Int64, dy: Int64): Unit {
        drawImage(image, Float64(dx), Float64(dy))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: Float64, dy: Float64, dWidth: Float64, dHeight: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithImageBitMap(
                this.getID(),
                image.getID(),
                ImageInfo(CanvasImageType.CoordinatesAndSize.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, dWidth, dHeight)
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(image: ImageBitmap, dx: Int64, dy: Int64, dWidth: Int64, dHeight: Int64): Unit {
        drawImage(image, Float64(dx), Float64(dy), Float64(dWidth), Float64(dHeight))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithImageBitMap(
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
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(
        image: ImageBitmap,
        sx: Int64,
        sy: Int64,
        sWidth: Int64,
        sHeight: Int64,
        dx: Int64,
        dy: Int64,
        dWidth: Int64,
        dHeight: Int64
    ): Unit {
        drawImage(
            image,
            Float64(sx),
            Float64(sy),
            Float64(sWidth),
            Float64(sHeight),
            Float64(dx),
            Float64(dy),
            Float64(dWidth),
            Float64(dHeight)
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(pixelMap: PixelMap, dx: Float64, dy: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithPixelMap(
                this.getID(),
                pixelMap.getID(),
                ImageInfo(CanvasImageType.CoordinatesOnly.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, 0.0, 0.0)
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(pixelMap: PixelMap, dx: Int64, dy: Int64): Unit {
        drawImage(pixelMap, Float64(dx), Float64(dy))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(pixelMap: PixelMap, dx: Float64, dy: Float64, dWidth: Float64, dHeight: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithPixelMap(
                this.getID(),
                pixelMap.getID(),
                ImageInfo(CanvasImageType.CoordinatesAndSize.getValue(), 0.0, 0.0, 0.0, 0.0, dx, dy, dWidth, dHeight)
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(pixelMap: PixelMap, dx: Int64, dy: Int64, dWidth: Int64, dHeight: Int64): Unit {
        drawImage(pixelMap, Float64(dx), Float64(dy), Float64(dWidth), Float64(dHeight))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextDrawImageWithPixelMap(
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
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func drawImage(
        pixelMap: PixelMap,
        sx: Int64,
        sy: Int64,
        sWidth: Int64,
        sHeight: Int64,
        dx: Int64,
        dy: Int64,
        dWidth: Int64,
        dHeight: Int64
    ): Unit {
        drawImage(
            pixelMap,
            Float64(sx),
            Float64(sy),
            Float64(sWidth),
            Float64(sHeight),
            Float64(dx),
            Float64(dy),
            Float64(dWidth),
            Float64(dHeight)
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPixelMap(left: Float64, top: Float64, width: Float64, height: Float64): PixelMap {
        let id = unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetPixelMap(
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
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPixelMap(left: Int64, top: Int64, width: Int64, height: Int64): PixelMap {
        return getPixelMap(Float64(left), Float64(top), Float64(width), Float64(height))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setPixelMap(pixelMap: PixelMap): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetPixelMap(
                this.getID(),
                pixelMap.getID()
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineDash(dashArr: Array<Float64>): Unit {
        let vecFFi = FFIVectorFloat64(dashArr.size)
        var index = 0
        for (i in dashArr) {
            nativeLog("Canvas LineDash vecdata: " + i.toString())
            vecFFi.setElement(index, i)
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineDash(this.getID(), vecFFi.getNativeHandle());
            vecFFi.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineDash(dashArr: Array<Int64>): Unit {
        let vecFFi = FFIVectorFloat64(dashArr.size)
        var index = 0
        for (i in dashArr) {
            nativeLog("Canvas LineDash vecdata: " + i.toString())
            vecFFi.setElement(index, Float64(i))
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSetLineDash(this.getID(), vecFFi.getNativeHandle());
            vecFFi.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getLineDash(): Array<Float64> {
        unsafe {
            let vectorDash = FFIVectorFloat64(
                FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetLineDash(this.getID()))
            let lineDash = Array<Float64>(vectorDash.getSize(), {i => vectorDash.getElement(i)})
            vectorDash.free()
            return lineDash
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transferToImageBitmap(): ImageBitmap {
        unsafe {
            let bitMapId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextTransferToImageBitmap(this.getID())
            return ImageBitmap(bitMapId, true)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toDataURL(imageType!: ImageType = ImageType.png, quality!: Float64 = 0.92): String {
        unsafe {
            var result: String = ""
            var actuaQua: Float64 = 0.0
            if (quality < 0.0 || quality > 1.0) {
                actuaQua = 0.92
            } else {
                actuaQua = quality
            }
            try (typeStr = LibC.mallocCString(imageType.getValue()).asResource()) {
                let dataUrl = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextToDataURL(this.getID(), typeStr.value,
                    actuaQua)
                result = dataUrl.toString()
                dataUrl.free()
            }
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func restore(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextRestore(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func save(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextSave(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createLinearGradient(x0: Float64, y0: Float64, x1: Float64, y1: Float64): CanvasGradient {
        unsafe {
            let gradientId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateLinearGradient(this.getID(), x0, y0,
                x1, y1)
            return CanvasGradient(gradientId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createLinearGradient(x0: Int64, y0: Int64, x1: Int64, y1: Int64): CanvasGradient {
        return createLinearGradient(Float64(x0), Float64(y0), Float64(x1), Float64(y1))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createRadialGradient(x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64): CanvasGradient {
        unsafe {
            let gradientId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateRadialGradient(this.getID(), x0, y0,
                r0, x1, y1, r1)
            return CanvasGradient(gradientId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createRadialGradient(x0: Int64, y0: Int64, r0: Int64, x1: Int64, y1: Int64, r1: Int64): CanvasGradient {
        return createRadialGradient(Float64(x0), Float64(y0), Float64(r0), Float64(x1), Float64(y1), Float64(r1))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createConicGradient(startAngle: Float64, x: Float64, y: Float64): CanvasGradient {
        unsafe {
            let gradientId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateConicGradient(this.getID(),
                startAngle, x, y)
            return CanvasGradient(gradientId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createConicGradient(startAngle: Int64, x: Int64, y: Int64): CanvasGradient {
        return createConicGradient(Float64(startAngle), Float64(x), Float64(y))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(sw: Float64, sh: Float64): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateImageData(this.getID(), sh, sw)
            return ImageData(imageDataId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(sw: Int64, sh: Int64): ImageData {
        return createImageData(Float64(sw), Float64(sh))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createImageData(imageData: ImageData): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextCreateImageDataWithImageData(
                this.getID(), imageData.getID())
            return ImageData(imageDataId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getImageData(sx: Float64, sy: Float64, sw: Float64, sh: Float64): ImageData {
        unsafe {
            let imageDataId = FfiOHOSAceFrameworkOffscreenCanvasRenderingContextGetImageData(this.getID(), sx, sy, sw,
                sh)
            return ImageData(imageDataId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getImageData(sx: Int64, sy: Int64, sw: Int64, sh: Int64): ImageData {
        return getImageData(Float64(sx), Float64(sy), Float64(sw), Float64(sh))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(imageData: ImageData, dx: Float64, dy: Float64): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextPutImageData(this.getID(), imageData.getID(), dx, dy)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(imageData: ImageData, dx: Int64, dy: Int64): Unit {
        putImageData(imageData, Float64(dx), Float64(dy))
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextPutImageDataWithDirty(this.getID(), imageData.getID(), dx,
                dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func putImageData(
        imageData: ImageData,
        dx: Int64,
        dy: Int64,
        dirtyX: Int64,
        dirtyY: Int64,
        dirtyWidth: Int64,
        dirtyHeight: Int64
    ): Unit {
        putImageData(
            imageData,
            Float64(dx),
            Float64(dy),
            Float64(dirtyX),
            Float64(dirtyY),
            Float64(dirtyWidth),
            Float64(dirtyHeight)
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resetTransform(): Unit {
        unsafe {
            FfiOHOSAceFrameworkOffscreenCanvasRenderingContextResetTransform(this.getID())
        }
    }
}
