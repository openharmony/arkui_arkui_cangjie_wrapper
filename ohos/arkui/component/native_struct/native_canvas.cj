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

protected package ohos.arkui.component.native_struct

@C
protected struct TransformParams {
    protected TransformParams(
        let scaleX: Float64,
        let skewX: Float64,
        let skewY: Float64,
        let scaleY: Float64,
        let translateX: Float64,
        let translateY: Float64
    ) {}
}

@C
protected struct ArcParams {
    protected ArcParams(
        let x: Float64,
        let y: Float64,
        let radius: Float64,
        let startAngle: Float64,
        let endAngle: Float64
    ) {}
}

@C
protected struct ArcToParams {
    protected ArcToParams(
        let x1: Float64,
        let y1: Float64,
        let x2: Float64,
        let y2: Float64,
        let radius: Float64
    ) {}
}

@C
protected struct QuadraticCurveToParams {
    protected QuadraticCurveToParams(
        let cpx: Float64,
        let cpy: Float64,
        let x: Float64,
        let y: Float64
    ) {}
}

@C
protected struct BezierCurveToParams {
    protected BezierCurveToParams(
        let cp1x: Float64,
        let cp1y: Float64,
        let cp2x: Float64,
        let cp2y: Float64,
        let x: Float64,
        let y: Float64
    ) {}
}

@C
protected struct EllipseParams {
    protected EllipseParams(
        let x: Float64,
        let y: Float64,
        let radiusX: Float64,
        let radiusY: Float64,
        let rotation: Float64,
        let startAngle: Float64,
        let endAngle: Float64
    ) {}
}

@C
protected struct RectParams {
    protected RectParams(
        let x: Float64,
        let y: Float64,
        let width: Float64,
        let height: Float64
    ) {}
}
