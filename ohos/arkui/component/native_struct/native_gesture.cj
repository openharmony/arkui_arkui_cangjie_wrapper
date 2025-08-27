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
protected struct CJArea {
    protected CJArea(
        protected let width: Float64,
        protected let height: Float64,
        protected let position: CPointer<CJPosition>,
        protected let globalPosition: CPointer<CJPosition>
    ) {}
}

@C
protected struct CJPosition {
    protected CJPosition(
        protected let x: Float64,
        protected let y: Float64
    ) {}
}

@C
protected struct CJEventTarget {
    protected CJEventTarget(protected let area: CPointer<CJArea>) {}
}


@C
protected struct CJGestureEventV2 {
    protected CJGestureEventV2(
        protected let timestamp: Int64,
        protected let target: CPointer<CJEventTarget>,
        protected let repeat: Bool,
        protected let fingerList: CPointer<CJFingerInfo>,
        protected let fingerListSize: Int32,
        protected let source: Int32,
        protected let offsetX: Float64,
        protected let offsetY: Float64,
        protected let scale: Float64,
        protected let pinchCenterX: Float64,
        protected let pinchCenterY: Float64,
        protected let angle: Float64,
        protected let speed: Float64,
        protected let tiltX: Int64,
        protected let tiltY: Int64,
        protected let sourceTool: Int32,
        protected let velocityX: Float64,
        protected let velocityY: Float64,
        protected let velocity: Float64,
        protected let pressure: Float64,
        protected let axisHorizontal: Float32,
        protected let axisVertical: Float32,
        protected let deviveId: Int64,
        protected let baseEvtInfo: CPointer<Unit>
    ) {}
}

@C
protected struct CJFingerInfo {
    protected CJFingerInfo(
        protected let id: Int32,
        protected let globalX: Float64,
        protected let globalY: Float64,
        protected let localX: Float64,
        protected let localY: Float64
    ) {}
}
