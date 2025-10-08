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
import ohos.ui_test.{MouseButton as MouseButtonT, Driver, Component, On}

@Test
class BasicCommonUT2 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("BasicCommonIndex2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // ComponentUtils
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testComponentUtils() {
        scrollTo("ViewComponentUtils")
        let button = driver.findComponent(On().id("getRectangleById")).getOrThrow()
        button.click()
        let button_2 = driver.findComponent(On().id("ccomponentInfo")).getOrThrow()
        button_2.click()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLaunchHasContainer() {
        scrollTo("ViewConcurrency")

        let button1: Component = driver.findComponent(On().id("test_button_launch")).getOrThrow()
        button1.click()

        let button2: Component = driver.waitForComponent(On().id("test_button_hasContainer"),2000).getOrThrow()
        button2.click()
        driver.delayMs(2000)

        let inspector = getInspectorByKey("test_button_launch")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs.toString():\t ${attrs.toString()}")

        let label = attrs.get("label").getOrThrow().toString()
        @Expect(label, "\"blink_0\"")

        let inspector2 = getInspectorByKey("test_button_hasContainer")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs.toString():\t ${attrs2.toString()}")

        let button16: Component = driver.findComponent(On().id("test_button_progressStyle")).getOrThrow()
        button16.click()
        driver.delayMs(2000)

        let inspector_progressstyle = getInspectorByKey("test_button_progressStyle")
        let jsonObject_progressstyle = JsonValue.fromStr(inspector_progressstyle).asObject()
        let attrs_progressstyle = jsonObject_progressstyle.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "Cangjie-Test", "attrs.toString():\t ${attrs_progressstyle.toString()}")

        let label_progressstyle = attrs_progressstyle.get("label").getOrThrow().toString()
        @Expect(label_progressstyle, "\"button_progressStyle\"")
    }


    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testCustomView() {
        scrollTo("ViewCustomView")
        let click = driver.findComponent(On().id("click")).getOrThrow()
        let button = click.getType()
        click.click()
        @Expect(button, "Button")
    }

    // Enablded
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testEnabledAttrs1() {
        scrollTo("ViewEnablded")

        let inspector = getInspectorByKey("Button1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let enabled = attrs.get("enabled").getOrThrow().toString()
        @Expect(enabled, "false")

        let inspector2 = getInspectorByKey("Button2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let enabled2 = attrs2.get("enabled").getOrThrow().toString()
        @Expect(enabled2, "true")
    }

    // flex lay out
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testFlexLayout1() {
        scrollTo("ViewFlexLayout")

        var inspector = getInspectorByKey("my_view_flex_layout1")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let flexBasis_t = attrs.get("flexBasis").getOrThrow().toString()
        @Expect(flexBasis_t,"\"100.00vp\"")

        var inspector2 = getInspectorByKey("my_view_flex_layout2")
        var jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        var attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let flexGrow_t = attrs2.get("flexGrow").getOrThrow().toString()
        @Expect(flexGrow_t,"30")

        var inspector3 = getInspectorByKey("my_view_flex_layout3")
        var jsonObject3 = JsonValue.fromStr(inspector3).asObject()
        var attrs3 = jsonObject3.get("$attrs").getOrThrow().asObject()
        let flexShrink_t = attrs3.get("flexShrink").getOrThrow().toString()
        @Expect(flexShrink_t,"0")
        let alignSelf_t = attrs3.get("alignSelf").getOrThrow().toString()
        @Expect(alignSelf_t,"\"ItemAlign.Center\"")
    }

    // GeometryTransition
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGeometrytransition() {
        scrollTo("ViewGeometryTransition")

        let button = driver.findComponent(On().id("Test_Image_01")).getOrThrow()
        button.click()
        driver.delayMs(1000)

        let Inspector = getInspectorByKey("text2")
        let obj = JsonValue.fromStr(Inspector).asObject()

        let obj_transition = obj.get("$attrs").getOrThrow().asObject().get("content").getOrThrow().toString()
        @Expect(obj_transition, "\"文本01\"")
    }

    // ViewInteractable
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testMouse() {
        scrollTo("ViewInteractable")

        let hoverBtn = driver.findComponent(On().id("hoverBtn")).getOrThrow()
        driver.mouseMoveTo(hoverBtn.getBoundsCenter())
        let onMouseBtn = driver.waitForComponent(On().id("onMouseBtn"),500).getOrThrow()
        driver.mouseClick(onMouseBtn.getBoundsCenter(), MouseButtonT.MouseButtonLeft)

        let keyBtn = driver.waitForComponent(On().id("keyBtn"),500).getOrThrow()
        keyBtn.click()
        keyBtn.inputText("keyclick")
        @Expect(keyBtn.getType(), "Button")
        let inspector5 = getInspectorByKey("keyBtn")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let fontColor = attrs5.get("backgroundColor").getOrThrow().toString()
        Hilog.info(1, "Cangjie-App", "[test_mouse] keyBtn fontColor: ${fontColor}")
        @Expect(fontColor, "\"#FF2788D9\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testOtherInteractable() {
        scrollTo("ViewInteractable")
        // Drag
        let apple = driver.findComponent(On().id("apple")).getOrThrow()
        let orange = driver.findComponent(On().id("orange")).getOrThrow()
        let text_0 = driver.findComponent(On().id("text_0")).getOrThrow()
        let text_1 = driver.findComponent(On().id("text_1")).getOrThrow()
        apple.dragTo(orange)
        driver.delayMs(500)
        orange.dragTo(text_0)
        driver.delayMs(500)
        text_0.dragTo(text_1)
        driver.delayMs(500)
        // KeyEvent
        driver.triggerKey(123)
        driver.delayMs(500)
        // TouchEvent
        let keyBtn = driver.findComponent(On().id("keyBtn")).getOrThrow()
        keyBtn.dragTo(text_1)
        driver.delayMs(500)
        // AreaChange
        let text_areaChange = driver.findComponent(On().id("text_areaChange")).getOrThrow()
        text_areaChange.click()
        driver.delayMs(200)
        text_areaChange.click()
        driver.delayMs(200)
        text_areaChange.click()
        driver.delayMs(500)
        let inspector5 = getInspectorByKey("keyBtn")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let fontColor = attrs5.get("backgroundColor").getOrThrow().toString()
        @Expect(fontColor, "\"#FF2788D9\"")
    }

    // layout constraints
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLayoutConstraints() {
        scrollTo("ViewLayoutConstraints")

        var inspector = getInspectorByKey("my_layout_constraints")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let aspectRatio_t = attrs.get("aspectRatio").getOrThrow().toString()
        @Expect(aspectRatio_t, "2")
        let displayPriority_t = attrs.get("displayPriority").getOrThrow().toString()
        @Expect(displayPriority_t , "1")
    }

   @TestCase
   @Tag[APILevel16, TestLevel0]
   func testLocalStorage() {
       scrollTo("ViewLocalStorage")

        var inspector = getInspectorByKey("parentText")
        var jsonObject = JsonValue.fromStr(inspector).asObject()

        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width1 = attrs.get("width").getOrThrow().toString()
        @Expect(width1, "\"0.00vp\"")

        let pbtn = driver.waitForComponent(On().id("parentBtn"),500).getOrThrow()
        pbtn.click()

        driver.delayMs(500)
        inspector = getInspectorByKey("parentText")
        jsonObject = JsonValue.fromStr(inspector).asObject()

        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width2 = attrs.get("width").getOrThrow().toString()
        @Expect(width2, "\"10.00vp\"")

        let sbtn = driver.waitForComponent(On().id("sonBtn"),500).getOrThrow()
        sbtn.click()

        driver.delayMs(500)
        inspector = getInspectorByKey("parentText")
        jsonObject = JsonValue.fromStr(inspector).asObject()

        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width3 = attrs.get("width").getOrThrow().toString()
        @Expect(width3, "\"0.00vp\"")

        inspector = getInspectorByKey("Son2k1create")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son2_k1create = attrs.get("content").getOrThrow().toString()
        @Expect(Son2_k1create,'"k1create: true"')

        inspector = getInspectorByKey("Son2k0set")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son2_k0set = attrs.get("content").getOrThrow().toString()
        @Expect(Son2_k0set,'"k0set: false"')

        inspector = getInspectorByKey("Son2k1get")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son2_k1get = attrs.get("content").getOrThrow().toString()
        @Expect(Son2_k1get,'"k1get: None"')

        inspector = getInspectorByKey("Son2k0get")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son2_k0get = attrs.get("content").getOrThrow().toString()
        @Expect(Son2_k0get,'"k0get: None"')

        inspector = getInspectorByKey("Son2k1reCreate")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son2_k1reCreate = attrs.get("content").getOrThrow().toString()
        @Expect(Son2_k1reCreate,'"k1reCreate: true"')

        inspector = getInspectorByKey("Son2k2set")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son2_k2set = attrs.get("content").getOrThrow().toString()
        @Expect(Son2_k2set,'"k2set: false"')

        inspector = getInspectorByKey("Son3size1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son3_size1 = attrs.get("content").getOrThrow().toString()
        @Expect(Son3_size1,'"size1: 2"')

        inspector = getInspectorByKey("Son3deleteK1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son3_deleteK1 = attrs.get("content").getOrThrow().toString()
        @Expect(Son3_deleteK1,'"deleteK1: true"')

        inspector = getInspectorByKey("Son3deleteK0")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son3_deleteK0 = attrs.get("content").getOrThrow().toString()
        @Expect(Son3_deleteK0,'"deleteK0: false"')

        inspector = getInspectorByKey("Son3size2")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son3_size2 = attrs.get("content").getOrThrow().toString()
        @Expect(Son3_size2,'"size2: 1"')

        inspector = getInspectorByKey("Son3clear")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son3_clear = attrs.get("content").getOrThrow().toString()
        @Expect(Son3_clear,'"clear: true"')

        inspector = getInspectorByKey("Son3size3")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let Son3_size3 = attrs.get("content").getOrThrow().toString()
        @Expect(Son3_size3,'"size3: 0"')
    }
}
