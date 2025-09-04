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
    registerTestSuite("CanvasDrawing_UT_1") {CanvasDrawing_UT_1()}
    registerTestSuite("CanvasDrawing_UT_1_1") {CanvasDrawing_UT_1_1()}
    registerTestSuite("CanvasDrawing_UT_2") {CanvasDrawing_UT_2()}
}
let UT_views = [
    "Index_UT1",
    "Index_UT2"
]
let UT1 = [
    "View_Canvas",
    "View_Circle",
    "View_Curves",
    "View_Ellipse",
    "View_GradientColor",
    "View_Image",
    "View_Image_Animator",
    "View_ImageAnimator",
    "View_ImageEffect",
    "View_ImageEffect2"
]
let UT2 = [
    "View_Line",
    "View_OffscreenCanvasRenderingContext2D",
    "View_Path",
    "View_Polygon",
    "View_Polyline",
    "View_Shape",
    "View_ShapeClip",
    "View_XComponent",
    "View_Canvas_2",
    "View_CanvasRenderingContext2D"
]
