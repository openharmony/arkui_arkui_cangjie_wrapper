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

/**
 * Created on 2024/6/13
 */
package ohos_app_cangjie_entry

internal import ohos.business_exception.BusinessException

let _ = testsuite()

func testsuite(): Unit{
    registerTestSuite("CanvasDrawingUT1") {CanvasDrawingUT1()}
    registerTestSuite("CanvasDrawingUT11") {CanvasDrawingUT11()}
    registerTestSuite("CanvasDrawingUT2") {CanvasDrawingUT2()}
    registerTestSuite("CanvasDrawingUTShapeMaskClip") {CanvasDrawingUTShapeMaskClip()}
}
let UT_views = [
    "CanvasDrawingIndex1",
    "CanvasDrawingIndex2"
]
let UT1 = [
    "ViewCanvas",
    "ViewCircle",
    "ViewCurves",
    "ViewEllipse",
    "ViewGradientColor",
    "ViewImage",
    "ViewImageAnimator",
    "ViewImageAnimator",
    "ViewImageEffect",
    "ViewImageEffect2"
]
let UT2 = [
    "ViewLine",
    "ViewPath",
    "ViewShape",
    "ViewShapeClip",
    "ViewShapeMaskClipBasic",
    "ViewShapeMaskClipAdvanced",
    "ViewCanvas2",
    "ViewCanvasRenderingContext2D"
]
