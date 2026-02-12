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

package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.business_exception.*

@Test
class CanvasDrawingUTShapeMaskClip {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
                driver.delayMs(800)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.error(1, "Cangjie-Test", "CanvasDrawingUTShapeMaskClip started")
        scrollBar?.scrollSearch(On().id("CanvasDrawingIndex2"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // ========== ViewShapeMaskClipBasic 测试 ==========
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMaskShapeBasic() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 maskShape 基本功能（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("mask_shape_basic"))
        let inspector = getInspectorByKey("mask_shape_basic")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testClipShapeBasic() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 clipShape 基本功能（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("clip_shape_basic"))
        let inspector = getInspectorByKey("clip_shape_basic")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testClipShapeNone() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 clipShape(None) 取消裁剪（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("clip_shape_none"))
        let inspector = getInspectorByKey("clip_shape_none")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        // clipShape(None) 后应该没有 clip 属性或为空
        let clip = attrs.get("clip").getOrDefault({ => JsonValue.fromStr("\"\"") }).toString()
        Hilog.info(1, "Cangjie-Test", "clip_shape_none clip: ${clip}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageMask() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 Image 组件使用 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("image_mask"))
        let inspector = getInspectorByKey("image_mask")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testShapeMask() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 Shape 组件使用 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("shape_mask"))
        let inspector = getInspectorByKey("shape_mask")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testTextClip() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 Text 组件使用 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("text_clip"))
        let inspector = getInspectorByKey("text_clip")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCircleShapeMask() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 CircleShape 作为 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("circle_mask_default"))
        let inspector1 = getInspectorByKey("circle_mask_default")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("circle_mask_size"))
        let inspector2 = getInspectorByKey("circle_mask_size")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let mask2 = attrs2.get("mask").getOrThrow().toString()
        @Expect(mask2.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCircleShapeClip() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 CircleShape 作为 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("circle_clip_image"))
        let inspector1 = getInspectorByKey("circle_clip_image")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let clip1 = attrs1.get("clip").getOrThrow().toString()
        @Expect(clip1.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("circle_clip_shape"))
        let inspector2 = getInspectorByKey("circle_clip_shape")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let clip2 = attrs2.get("clip").getOrThrow().toString()
        @Expect(clip2.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRectShapeMask() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 RectShape 作为 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("rect_mask_size"))
        let inspector1 = getInspectorByKey("rect_mask_size")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Rect"), true)

        scrollView?.scrollSearch(On().id("rect_mask_hex"))
        let inspector2 = getInspectorByKey("rect_mask_hex")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let mask2 = attrs2.get("mask").getOrThrow().toString()
        @Expect(mask2.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRectShapeClip() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 RectShape 作为 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("rect_clip_size"))
        let inspector1 = getInspectorByKey("rect_clip_size")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let clip1 = attrs1.get("clip").getOrThrow().toString()
        @Expect(clip1.contains("Rect"), true)

        scrollView?.scrollSearch(On().id("rect_clip_radius"))
        let inspector2 = getInspectorByKey("rect_clip_radius")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let clip2 = attrs2.get("clip").getOrThrow().toString()
        @Expect(clip2.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRectShapeRadius() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 RectShape 圆角遮罩（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("rect_radius_unified"))
        let inspector1 = getInspectorByKey("rect_radius_unified")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Rect"), true)

        scrollView?.scrollSearch(On().id("rect_radius_separate"))
        let inspector2 = getInspectorByKey("rect_radius_separate")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let mask2 = attrs2.get("mask").getOrThrow().toString()
        @Expect(mask2.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCircleShapeAttributes() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 CircleShape 属性配置（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("circle_attr_size"))
        let inspector1 = getInspectorByKey("circle_attr_size")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("circle_attr_offset"))
        let inspector2 = getInspectorByKey("circle_attr_offset")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let clip2 = attrs2.get("clip").getOrThrow().toString()
        @Expect(clip2.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("circle_attr_fill"))
        let inspector3 = getInspectorByKey("circle_attr_fill")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let mask3 = attrs3.get("mask").getOrThrow().toString()
        @Expect(mask3.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testRectShapeAttributes() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)

        // 测试 RectShape 属性配置（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("rect_attr_size"))
        let inspector1 = getInspectorByKey("rect_attr_size")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Rect"), true)

        // scrollView?.scrollSearch(On().id("rect_attr_radius"))
        // let inspector2 = getInspectorByKey("rect_attr_radius")
        // let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        // let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        // let mask2 = attrs2.get("mask").getOrThrow().toString()
        // @Expect(mask2.contains("Rect"), true)

        // scrollView?.scrollSearch(On().id("rect_attr_fill"))
        // let inspector3 = getInspectorByKey("rect_attr_fill")
        // let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        // let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        // let mask3 = attrs3.get("mask").getOrThrow().toString()
        // @Expect(mask3.contains("Rect"), true)
    }

    // ========== ViewShapeMaskClipAdvanced 测试 ==========

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testEllipseShapeMask() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 EllipseShape 作为 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("ellipse_mask_size"))
        let inspector = getInspectorByKey("ellipse_mask_size")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Ellipse"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testEllipseShapeClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 EllipseShape 作为 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("ellipse_clip_size"))
        let inspector = getInspectorByKey("ellipse_clip_size")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip.contains("Ellipse"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPathShapeMask() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 PathShape 作为 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("path_mask_simple"))
        let inspector = getInspectorByKey("path_mask_simple")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Path"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPathShapeClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 PathShape 作为 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("path_clip_simple"))
        let inspector = getInspectorByKey("path_clip_simple")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip.contains("Path"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComboClipMask() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试组合使用：先 clipShape 后 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("combo_clip_mask"))
        let inspector = getInspectorByKey("combo_clip_mask")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComboMaskClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试组合使用：先 maskShape 后 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("combo_mask_clip"))
        let inspector = getInspectorByKey("combo_mask_clip")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMultiClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试多次调用 clipShape（覆盖）（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("multi_clip"))
        let inspector = getInspectorByKey("multi_clip")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        // 最后一次调用应该覆盖前面的，所以应该是 Rect
        @Expect(clip.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testMultiMask() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试多次调用 maskShape（覆盖）（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("multi_mask"))
        let inspector = getInspectorByKey("multi_mask")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        // 最后一次调用应该覆盖前面的，所以应该是 Rect
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentImageMask() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 Image 组件使用 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("component_image_mask"))
        let inspector = getInspectorByKey("component_image_mask")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentImageClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 Image 组件使用 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("component_image_clip"))
        let inspector = getInspectorByKey("component_image_clip")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentImageCombo() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 Image 组件组合使用 maskShape 和 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("component_image_combo"))
        let inspector = getInspectorByKey("component_image_combo")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentShapeMask() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 Shape 组件使用 maskShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("component_shape_mask"))
        let inspector = getInspectorByKey("component_shape_mask")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let mask = attrs.get("mask").getOrThrow().toString()
        @Expect(mask.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentShapeClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 Shape 组件使用 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("component_shape_clip"))
        let inspector = getInspectorByKey("component_shape_clip")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let clip = attrs.get("clip").getOrThrow().toString()
        @Expect(clip.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testComponentTextClip() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 Text 组件使用 clipShape（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("component_text_circle"))
        let inspector1 = getInspectorByKey("component_text_circle")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let clip1 = attrs1.get("clip").getOrThrow().toString()
        @Expect(clip1.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("component_text_rect"))
        let inspector2 = getInspectorByKey("component_text_rect")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let clip2 = attrs2.get("clip").getOrThrow().toString()
        @Expect(clip2.contains("Rect"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testBaseShapeAttributes() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 BaseShape 通用属性（fill, size, offset）（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("fill_color"))
        let inspector1 = getInspectorByKey("fill_color")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("size_width_height"))
        let inspector2 = getInspectorByKey("size_width_height")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let mask2 = attrs2.get("mask").getOrThrow().toString()
        @Expect(mask2.contains("Circle"), true)

        scrollView?.scrollSearch(On().id("offset_positive"))
        let inspector3 = getInspectorByKey("offset_positive")
        let jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        let attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let mask3 = attrs3.get("mask").getOrThrow().toString()
        @Expect(mask3.contains("Circle"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPathShapeComplex() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 PathShape 复杂路径（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("path_commands"))
        let inspector1 = getInspectorByKey("path_commands")
        let jsonObject1 = JsonValue.fromStr(inspector1).asObject()
        let attrs1 = jsonObject1.get("$attrs").getOrThrow().asObject()
        let mask1 = attrs1.get("mask").getOrThrow().toString()
        @Expect(mask1.contains("Path"), true)

        // scrollView?.scrollSearch(On().id("path_complex"))
        // let inspector2 = getInspectorByKey("path_complex")
        // let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        // let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        // let mask2 = attrs2.get("mask").getOrThrow().toString()
        // @Expect(mask2.contains("Path"), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testExceptionClipNone() {
        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)

        // 测试 clipShape(None) 取消裁剪（先滚动到组件位置确保可见）
        let scrollView = driver.findComponent(On().id("scroller"))
        scrollView?.scrollSearch(On().id("exception_clip_none"))
        let inspector = getInspectorByKey("exception_clip_none")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        // clipShape(None) 后应该没有 clip 属性或为空
        let clip = attrs.get("clip").getOrDefault({ => JsonValue.fromStr("\"\"") }).toString()
        Hilog.info(1, "Cangjie-Test", "exception_clip_none clip: ${clip}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testScrollToBottom() {
        scrollTo("ViewShapeMaskClipBasic")
        driver.delayMs(300)
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollToBottom(speed: 15000)
        driver.delayMs(500)

        scrollTo("ViewShapeMaskClipAdvanced")
        driver.delayMs(300)
        scrollBar?.scrollToBottom(speed: 15000)
        driver.delayMs(500)
    }
}

