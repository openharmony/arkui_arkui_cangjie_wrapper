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
import ohos.router.*
import ohos.ui_test.*
import ohos.ui_test
import std.collection.ArrayList

@Test
class ScrollSplit_UT_2 {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func ScrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "error", "ScrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "error", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
        Hilog.error(1, "error", "started")
        scrollBar.scrollSearch(On().id("ScrollSplit_UT2")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_pagetransition() {
        ScrollTo("View_PageTransition")

        let inspector = getInspectorByKey("text")
        let jsonObject = JsonValue.fromStr(inspector).asObject()

        let obj_transition = jsonObject.get("$attrs").getOrThrow().asObject().get("content").getOrThrow().toString()
        @Expect(obj_transition, "\"页面转场1\"")
        driver.delayMs(1500)

        let button = driver.findComponent(On().id("Image1")).getOrThrow()
        button.click()
        driver.delayMs(1500)

        let inspector2 = getInspectorByKey("text2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let obj_transition2 = jsonObject2.get("$attrs").getOrThrow().asObject().get("content").getOrThrow().toString()
        @Expect(obj_transition2, "\"页面转场2\"")
        driver.delayMs(1500)
        driver.pressBack()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RefreshDefaultAttr() {
        ScrollTo("View_Refresh")
        let refresh_component = getInspectorByKey("refresh_default_attr")
        let jsonObject = JsonValue.fromStr(refresh_component).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "aaaa: ${attrs.getFields()}")

        let offset = attrs.get("refreshOffset").getOrThrow().toString()
        @Expect(offset, "\"0.00vp\"")

        let pullToRefresh = attrs.get("pullToRefresh").getOrThrow().toString()
        @Expect(pullToRefresh, "true")

        let pullDownRatio = attrs.get("pullDownRatio").getOrThrow().toString()
        @Expect(pullDownRatio, "\"\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RefreshSetAttr() {
        ScrollTo("View_Refresh")
        let refresh_component = getInspectorByKey("refresh_set_attr")
        let jsonObject = JsonValue.fromStr(refresh_component).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "aaaa: ${attrs.getFields()}")

        let offset = attrs.get("refreshOffset").getOrThrow().toString()
        @Expect(offset, "\"100.00vp\"")

        let pullToRefresh = attrs.get("pullToRefresh").getOrThrow().toString()
        @Expect(pullToRefresh, "false")

        let pullDownRatio = attrs.get("pullDownRatio").getOrThrow().toString()
        @Expect(pullDownRatio, "0.500000")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RefreshControllerBottom() {
        ScrollTo("View_Refresh")
        let text_1 = driver.findComponent(On().text("1")).getOrThrow();
        let text_2 = driver.findComponent(On().text("5")).getOrThrow();
        let StatusText = driver.findComponent(On().id("StatusText")).getOrThrow()
        let OnRefreshText = driver.findComponent(On().id("OnRefreshText")).getOrThrow()
        let onOffsetText = driver.findComponent(On().id("OnOffsetText")).getOrThrow()

        @Expect(onOffsetText.getText() == "noChange", true)
        @Expect(StatusText.getText() == "Inactive", true)
        @Expect(OnRefreshText.getText() == "noRefresh", true)

        text_1.dragTo(text_2)
        driver.delayMs(1000)

        @Expect(onOffsetText.getText() == "Change", true)
        @Expect(StatusText.getText() == "Inactive", false)
        @Expect(OnRefreshText.getText() == "Refresh", true)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_row() {
        ScrollTo("View_Row")
        let inspector = getInspectorByKey("row")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "aaaa: ${jsonObject.toString()}")

        let alignItem = attrs.get("alignItems").getOrThrow().toString()
        @Expect(alignItem, "\"VerticalAlign.Bottom\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_RowSplitCommonAttrs() {
        ScrollTo("View_RowSplit")

        //拖动第一个分割线向右x
        let comp1: Component = driver.findComponent(On().id("row_split_1")).getOrThrow()
        var rect = comp1.getBounds()
        let startx = rect.right
        let endx = rect.right + 100
        driver.drag(Int32(startx), Int32(rect.top), Int32(endx), Int32(rect.top))

        rect = comp1.getBounds()
        Hilog.info(1, "info", "comp1_right: ${startx} comp1_right_new: ${rect.right}")
        @Expect(startx != rect.right)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_ScrollCommonAttrs() {
        ScrollTo("View_Scroll")

        let text_0: Component = driver.findComponent(On().id("TEXT0")).getOrThrow()
        let rect_0_prev = text_0.getText()
        @Expect(rect_0_prev, "TEXT0")

        driver.findComponent(On().id("scrollTo")).getOrThrow().click()
        driver.waitForComponent(On().id("scrollBy"), 1000).getOrThrow().click()
        driver.waitForComponent(On().id("scrollToPage"), 1000).getOrThrow().click()
        driver.waitForComponent(On().id("scrollToIndex"), 1000).getOrThrow().click()
        driver.delayMs(1000)

        let text_4: Component = driver.findComponent(On().id("TEXT1")).getOrThrow()
        let rect_4_prev = text_4.getText()
        @Expect(rect_4_prev, "TEXT1")
    }

    // View_Scroll_2
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_ScrollCommonAttrs_2() {
        ScrollTo("View_Scroll_2")

        let inspector = getInspectorByKey("ScrollSelf")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let type_1 = jsonObject.get("$type").getOrThrow().toString()
        @Expect(type_1, "\"Scroll\"")

        let scrollable = attrs.get("scrollable").getOrThrow().toString()
        @Expect(scrollable, "\"ScrollDirection.Vertical\"")

        let scrollBar = attrs.get("scrollBar").getOrThrow().toString()
        @Expect(scrollBar, "\"BarState.Auto\"")

        let scrollBarColor = attrs.get("scrollBarColor").getOrThrow().toString()
        @Expect(scrollBarColor, "\"#FF0000FF\"")

        let scrollBarWidth = attrs.get("scrollBarWidth").getOrThrow().toString()
        @Expect(scrollBarWidth, "\"4.50vp\"")

        let edgeEffect = attrs.get("edgeEffect").getOrThrow().toString()
        @Expect(edgeEffect, "\"EdgeEffect.Spring\"")

        let alwaysEnabled = attrs.get("edgeEffectOptions").getOrThrow().toString()
        @Expect(alwaysEnabled, "{\"alwaysEnabled\":true,\"effectEdge\":\"EffectEdge.All\"}")

        let scrollSnapAlign = attrs.get("scrollSnapAlign").getOrThrow().toString()
        @Expect(scrollSnapAlign, "\"ScrollSnapAlign.NONE\"")

        let friction = attrs.get("friction").getOrThrow().toString()
        @Expect(friction, "0.800000")
    }

    // View_Scroll_3
    @TestCase
    @Tag[APILevel14, TestLevel0]
    func test_ScrollCommonAttrs_3() {
        ScrollTo("View_Scroll_2")
        driver.findComponent(On().id("scrollBottom")).getOrThrow().click()
        let text: Component = driver.waitForComponent(On().id("onScrollStopText"), 1000).getOrThrow()
        let rect_prev = text.getText()
        @Expect(rect_prev, "stopped")

        let text_start: Component = driver.findComponent(On().id("onScrollStartText")).getOrThrow()
        let rect_start_prev = text_start.getText()
        @Expect(rect_start_prev, "started")

        var scrollEdge: Component = driver.findComponent(On().id("onScrollEdgeText")).getOrThrow()
        var rect_edge = scrollEdge.getText()
        @Expect(rect_edge, "Bottom")

        driver.findComponent(On().id("isAtEnd")).getOrThrow().click()
        var isAtEnd: Component = driver.waitForComponent(On().id("isAtEndText"), 1000).getOrThrow()
        var end_edge = isAtEnd.getText()
        @Expect(end_edge, "isAtEnd")

        driver.findComponent(On().id("scrollTop")).getOrThrow().click()
        driver.waitForComponent(On().id("getCurYOffset"), 1000).getOrThrow().click()

        var yoffset: Component = driver.waitForComponent(On().id("yOffset"), 1000).getOrThrow()
        var rect_yoffset = yoffset.getText()
        @Expect(rect_yoffset, "YOFFSET: -0.000000")

        scrollEdge = driver.findComponent(On().id("onScrollEdgeText")).getOrThrow()
        rect_edge = scrollEdge.getText()
        @Expect(rect_edge, "Top")

        driver.findComponent(On().id("scrollTo")).getOrThrow().click()
        driver.waitForComponent(On().id("getCurYOffset"), 1000).getOrThrow().click()

        yoffset = driver.waitForComponent(On().id("yOffset"), 1000).getOrThrow()
        rect_yoffset = yoffset.getText()
        @Expect(rect_yoffset, "YOFFSET: 10.000000")

        driver.findComponent(On().id("scrollBy")).getOrThrow().click()

        driver.waitForComponent(On().id("getCurYOffset"), 1000).getOrThrow().click()

        yoffset = driver.waitForComponent(On().id("yOffset"), 1000).getOrThrow()
        rect_yoffset = yoffset.getText()
        @Expect(rect_yoffset, "YOFFSET: 15.000000")

        driver.findComponent(On().id("ScrollSelf")).getOrThrow().scrollToBottom()
        driver.delayMs(1000)

        let inspector = getInspectorByKey("ScrollSelf")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let frameBegin: Component = driver.waitForComponent(On().id("onScrollFrameBegin_offset"), 1000).getOrThrow()
        let rect_frameBegin = frameBegin.getText()
        @Expect(rect_frameBegin == "0.000000", false)

        let scrollState: Component = driver.findComponent(On().id("scrollState")).getOrThrow()
        let rect_scrollState = scrollState.getText()
        @Expect(rect_scrollState, "Fling")

        //scrollTo,有动画效果需要人工观察
        driver.findComponent(On().id("scrollTop")).getOrThrow().click()
        driver.delayMs(1000)
        driver.findComponent(On().id("scrollToAnimation")).getOrThrow().click()
        driver.delayMs(1000)
        driver.findComponent(On().id("getCurYOffset")).getOrThrow().click()
        driver.delayMs(1000)

        yoffset = driver.findComponent(On().id("yOffset")).getOrThrow()
        rect_yoffset = yoffset.getText()
        @Expect(rect_yoffset, "YOFFSET: 200.000000")

        //scrollTo,无动画效果，需要人工观察
        driver.findComponent(On().id("scrollTop")).getOrThrow().click()
        driver.delayMs(1000)
        driver.findComponent(On().id("scrollToAnimation_2")).getOrThrow().click()
        driver.delayMs(1000)
        driver.findComponent(On().id("getCurYOffset")).getOrThrow().click()
        driver.delayMs(1000)

        yoffset = driver.findComponent(On().id("yOffset")).getOrThrow()
        rect_yoffset = yoffset.getText()
        @Expect(rect_yoffset, "YOFFSET: 100.000000")

        //fling例外情况
        driver.findComponent(On().id("fling_0")).getOrThrow().click()
        driver.waitForComponent(On().id("getCurYOffset"), 1000).getOrThrow().click()

        yoffset = driver.waitForComponent(On().id("yOffset"), 1000).getOrThrow()
        rect_yoffset = yoffset.getText()
        @Expect(rect_yoffset, "YOFFSET: 100.000000")

        //fling1000
        driver.findComponent(On().id("fling_1000")).getOrThrow().click()
        scrollEdge = driver.waitForComponent(On().id("onScrollEdgeText"), 1000).getOrThrow()
        rect_edge = scrollEdge.getText()
        @Expect(rect_edge, "Top")

        //fling-3000
        driver.findComponent(On().id("fling_-3000.0")).getOrThrow().click()
        scrollEdge = driver.waitForComponent(On().id("onScrollEdgeText"), 1000).getOrThrow()
        rect_edge = scrollEdge.getText()
        @Expect(rect_edge, "Bottom")
    }

    // View_Scroll_default
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_ScrollCommonAttrs_Default() {
        ScrollTo("View_Scroll_2")

        let inspector = getInspectorByKey("scroll2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let scrollable = attrs.get("scrollable").getOrThrow().toString()
        @Expect(scrollable, "\"ScrollDirection.Vertical\"")

        let scrollBar = attrs.get("scrollBar").getOrThrow().toString()
        @Expect(scrollBar, "\"BarState.Auto\"")

        let scrollBarColor = attrs.get("scrollBarColor").getOrThrow().toString()
        @Expect(scrollBarColor, "\"#66000000\"")

        let scrollBarWidth = attrs.get("scrollBarWidth").getOrThrow().toString()
        @Expect(scrollBarWidth, "\"4.00vp\"")

        let edgeEffect = attrs.get("edgeEffect").getOrThrow().toString()
        @Expect(edgeEffect, "\"EdgeEffect.None\"")

        let scrollSnapAlign = attrs.get("scrollSnapAlign").getOrThrow().toString()
        @Expect(scrollSnapAlign, "\"ScrollSnapAlign.NONE\"")

        let friction = attrs.get("friction").getOrThrow().toString()
        @Expect(friction, "0.750000")

        let nestedScroll = attrs.get("nestedScroll").getOrThrow().toString()
        @Expect(nestedScroll, "{\"scrollForward\":\"NestedScrollMode.SELF_ONLY\",\"scrollBackward\":\"NestedScrollMode.SELF_ONLY\"}")
    }

    //View_Scroll_4
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_ScrollCommonAttrs_4() {
        ScrollTo("View_Scroll_2")

        var inspector = getInspectorByKey("scroll_3")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        var friction = attrs.get("friction").getOrThrow().toString()
        @Expect(friction, "0.750000")

        var scrollBarWidth = attrs.get("scrollBarWidth").getOrThrow().toString()
        @Expect(scrollBarWidth, "\"6.00vp\"")

        var edgeEffect = attrs.get("edgeEffect").getOrThrow().toString()
        @Expect(edgeEffect, "\"EdgeEffect.Fade\"")

        var alwaysEnabled = attrs.get("edgeEffectOptions").getOrThrow().toString()
        @Expect(alwaysEnabled, "{\"alwaysEnabled\":false,\"effectEdge\":\"EffectEdge.All\"}")

        inspector = getInspectorByKey("scroll_4")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        var nestedScroll = attrs.get("nestedScroll").getOrThrow().toString()
        @Expect(nestedScroll, "{\"scrollForward\":\"NestedScrollMode.PARENT_FIRST\",\"scrollBackward\":\"NestedScrollMode.SELF_FIRST\"}")

        var enablePaging = attrs.get("enablePaging").getOrThrow().toString()
        @Expect(enablePaging, "true")

        scrollBarWidth = attrs.get("scrollBarWidth").getOrThrow().toString()
        @Expect(scrollBarWidth, "\"6.00vp\"")

        edgeEffect = attrs.get("edgeEffect").getOrThrow().toString()
        @Expect(edgeEffect, "\"EdgeEffect.None\"")

        friction = attrs.get("friction").getOrThrow().toString()
        @Expect(friction, "0.850000")

        alwaysEnabled = attrs.get("edgeEffectOptions").getOrThrow().toString()
        @Expect(alwaysEnabled, "{\"alwaysEnabled\":true,\"effectEdge\":\"EffectEdge.All\"}")

        inspector = getInspectorByKey("scroll_1")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        var type_1 = jsonObject.get("$type").getOrThrow().toString()
        @Expect(type_1, "\"Scroll\"")

        inspector = getInspectorByKey("scroll_5")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        type_1 = jsonObject.get("$type").getOrThrow().toString()
        @Expect(type_1, "\"Scroll\"")

        attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        alwaysEnabled = attrs.get("edgeEffectOptions").getOrThrow().toString()
        @Expect(alwaysEnabled, "{\"alwaysEnabled\":true,\"effectEdge\":\"EffectEdge.All\"}")

        var scrollSnap = attrs.get("scrollSnap").getOrThrow().toString()
        @Expect(scrollSnap, "{\"snapPagination\":\"400.00vp\",\"enableSnapToStart\":true,\"enableSnapToEnd\":true}")

        var scrollSnapAlign = attrs.get("scrollSnapAlign").getOrThrow().toString()
        @Expect(scrollSnapAlign, "\"ScrollSnapAlign.START\"")

        inspector = getInspectorByKey("scroll_6")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        scrollSnapAlign = attrs.get("scrollSnapAlign").getOrThrow().toString()
        @Expect(scrollSnapAlign, "\"ScrollSnapAlign::CENTER\"")

        scrollSnap = attrs.get("scrollSnap").getOrThrow().toString()
        @Expect(scrollSnap, "{\"snapPagination\":[\"100.00vp\",\"200.00vp\",\"300.00vp\"],\"enableSnapToStart\":false,\"enableSnapToEnd\":false}")

        inspector = getInspectorByKey("scroll_7")
        jsonObject = JsonValue.fromStr(inspector).asObject()
        attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        scrollSnapAlign = attrs.get("scrollSnapAlign").getOrThrow().toString()
        @Expect(scrollSnapAlign, "\"ScrollSnapAlign::END\"")

        scrollSnap = attrs.get("scrollSnap").getOrThrow().toString()
        @Expect(scrollSnap, "{\"snapPagination\":\"0.00vp\",\"enableSnapToStart\":true,\"enableSnapToEnd\":true}")
    }

    //View_Scroll_5
    @TestCase
    @Tag[APILevel14, TestLevel0]
    func test_ScrollCommonAttrs_5() {
        ScrollTo("View_Scroll_2")

        driver.findComponent(On().id("getCurYOffset_2")).getOrThrow().click()

        var component: Component = driver.waitForComponent(On().id("initial_offset"), 1000).getOrThrow()
        var context = component.getText()
        @Expect(context, "initial_offset: 200.000000")

        driver.findComponent(On().id("scrollPage")).getOrThrow().click()
        driver.waitForComponent(On().id("getCurYOffset_3"), 1000).getOrThrow().click()
        driver.delayMs(1000)

        component = driver.findComponent(On().id("scrollPage_offset")).getOrThrow()
        context = component.getText()
        @Expect(context, "yoffset: 77.107694")

        driver.fling(ui_test.Point(20, 700), ui_test.Point(20, 300), 100, 40000)
        driver.waitForComponent(On().id("scroll_9"), 1000).getOrThrow().scrollToBottom()

        //不能用鼠标或者手势滑动
        component = driver.waitForComponent(On().id("onscrollMessage"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context == "0.0")

        //可以用控制器滑动
        driver.findComponent(On().id("controller move")).getOrThrow().click()

        component = driver.waitForComponent(On().id("onscrollMessage"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context == "0.000000, 60.000000", true)

        //鼠标悬停在scroll_10的位置，模仿滑动
        driver.mouseScroll(ui_test.Point(600, 600), true, 100)

        driver.waitForComponent(On().id("getCurYOffset_4"), 1000).getOrThrow().click()
        component = driver.waitForComponent(On().id("onScrollFrameBegin_offset_1"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "-0.000000")

        //鼠标悬停在scroll_11的位置，模仿滑动
        driver.mouseScroll(ui_test.Point(600, 900), true, 100)
        driver.waitForComponent(On().id("getCurOffset_5"), 1000).getOrThrow().click()
        //回调返回值为OffsetResult(0.0, 0.0)，不可滑动
        component = driver.waitForComponent(On().id("curOffset_5"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "-0.000000")
        //onWillScroll回调参数校验
        driver.mouseScroll(ui_test.Point(600, 900), true, 100)
        component = driver.waitForComponent(On().id("curOffset_5"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context == "-0.000000", false)
        component = driver.findComponent(On().id("onWillScrollMessage")).getOrThrow()
        context = component.getText()
        @Expect(context, "Scrolling, OTHER_USER_INPUT")

        //onWillScroll,onDidScroll验证
        driver.findComponent(On().id("scroll50")).getOrThrow().click()
        component = driver.waitForComponent(On().id("curOffset_6"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "0.000000, 50.000000")
        component = driver.findComponent(On().id("scrollState_6")).getOrThrow()
        context = component.getText()
        @Expect(context, "Idle")

        driver.findComponent(On().id("getOffset")).getOrThrow().click()
        component = driver.waitForComponent(On().id("curOffset_6"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "50.000000")

        //scrollToIndex, getItemRect, getItemIndex
        driver.findComponent(On().id("scrollTo4")).getOrThrow().click()

        driver.waitForComponent(On().id("getItemRect"), 1000).getOrThrow().click()

        component = driver.waitForComponent(On().id("itemRect"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "0.000000 -10.000000 348.923077 100.000000")

        driver.findComponent(On().id("getItemIndex")).getOrThrow().click()

        component = driver.waitForComponent(On().id("index"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "4")

        driver.findComponent(On().id("scrollTo5")).getOrThrow().click()
        driver.waitForComponent(On().id("getItemIndex"), 1000).getOrThrow().click()
        component = driver.waitForComponent(On().id("index"), 1000).getOrThrow()
        context = component.getText()
        @Expect(context, "5")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_scrollBarDefaultAttrs() {
        ScrollTo("View_Scrollbar")
        let inspector = getInspectorByKey("test_bar_1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        driver.delayMs(500)

        let direction = attrs.get("direction").getOrThrow().toString()
        driver.delayMs(500)
        @Expect(direction, "\"ScrollBarDirection.Vertical\"")

        let state = attrs.get("state").getOrThrow().toString()
        @Expect(state, "\"BarState.Auto\"")

        let enableNestedScroll = attrs.get("enableNestedScroll").getOrThrow().toString()
        @Expect(enableNestedScroll, "\"false\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_scrollBarCommonAttrs() {
        ScrollTo("View_Scrollbar")
        let inspector = getInspectorByKey("test_bar_2")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        driver.delayMs(500)

        let direction = attrs.get("direction").getOrThrow().toString()
        driver.delayMs(500)
        @Expect(direction, "\"ScrollBarDirection.Horizontal\"")

        let state = attrs.get("state").getOrThrow().toString()
        @Expect(state, "\"BarState.On\"")

        let enableNestedScroll = attrs.get("enableNestedScroll").getOrThrow().toString()
        @Expect(enableNestedScroll, "\"true\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_scrollBarSubcomponent() {
        ScrollTo("View_Scrollbar")
        driver.delayMs(500)

        let sub_text = driver.findComponent(On().id("sub_text")).getOrThrow().getText().toString()
        @Expect(sub_text, "abc")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_sidebar() {
        ScrollTo("View_SideBar")
        var inspector = getInspectorByKey("SideBar")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        @Expect(attrs.get("showSideBar").getOrThrow().toString(), '"false"')
        let divProp = attrs.get("divider").getOrThrow().toString().replace("\\", "").replace(" ", "").replace("\"", "")
        @Expect(divProp, '{strokeWidth:1.00vp,startMargin:4.00vp,endMargin:4.00vp,color:#FF0000FF}')
        @Expect(attrs.get("autoHide").getOrThrow().toString(), '"false"')
        @Expect(attrs.get("sideBarWidth").getOrThrow().toString(), '"150.000000"')
        @Expect(attrs.get("minSideBarWidth").getOrThrow().toString(), '"50.000000"')
        @Expect(attrs.get("maxSideBarWidth").getOrThrow().toString(), '"300.000000"')
        @Expect(attrs.get("minContentWidth").getOrThrow().toString(), '"1.000000"')
        @Expect(attrs.get("sideBarPosition").getOrThrow().toString(), '"SideBarPosition.End"')
        @Expect(attrs.get("showControlButton").getOrThrow().toString(), '"false"')
        @Expect(attrs.get("width").getOrThrow().toString(), '"90.00%"')
        @Expect(attrs.get("height").getOrThrow().toString(), '"85.00%"')
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_sidebar_default() {
        ScrollTo("View_SideBar_Default")
        var inspector = getInspectorByKey("SideBarDefault")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        @Expect(attrs.get("showSideBar").getOrThrow().toString(), '"true"')
        let divProp = attrs.get("divider").getOrThrow().toString().replace("\\", "").replace(" ", "").replace("\"", "")
        @Expect(divProp, '{strokeWidth:1.00vp,startMargin:0.00vp,endMargin:0.00vp,color:#08000000}')
        @Expect(attrs.get("autoHide").getOrThrow().toString(), '"true"')
        @Expect(attrs.get("sideBarWidth").getOrThrow().toString(), '"240.000000"')
        @Expect(attrs.get("minSideBarWidth").getOrThrow().toString(), '"240.000000"')
        @Expect(attrs.get("maxSideBarWidth").getOrThrow().toString(), '"280.000000"')
        @Expect(attrs.get("minContentWidth").getOrThrow().toString(), '"360.000000"')
        @Expect(attrs.get("sideBarPosition").getOrThrow().toString(), '"SideBarPosition.Start"')
        @Expect(attrs.get("showControlButton").getOrThrow().toString(), '"true"')
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_sidebar_enhance() {
        ScrollTo("View_SideBar_Enhance")
        var inspector = getInspectorByKey("SideBarEnhance")
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        @Expect(attrs.get("showSideBar").getOrThrow().toString(), '"true"')
        let divProp = attrs.get("divider").getOrThrow().toString().replace("\\", "").replace(" ", "").replace("\"", "")
        @Expect(divProp, '{strokeWidth:2.00vp,startMargin:3.00vp,endMargin:5.00vp,color:#08000000}')
        @Expect(attrs.get("minSideBarWidth").getOrThrow().toString(), '"100.000000"')
        @Expect(attrs.get("maxSideBarWidth").getOrThrow().toString(), '"350.000000"')
        @Expect(attrs.get("minContentWidth").getOrThrow().toString(), '"400.000000"')
        let sizeAttr = attrs.get("size").getOrThrow().toString().replace("\\", "").replace(" ", "").replace("\"", "")
        @Expect(sizeAttr, '{width:80.00%,height:90.00%}')
    }

    func clickButton(buttonId: String) {
        let button = driver.waitForComponent(On().id(buttonId), 200).getOrThrow()
        button.click()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_sidebar_init() {
        ScrollTo("View_SideBar_Init")
        //在循环中依次测试6个SideBarContainer
        for (i in 1..7) {
            var inspector = getInspectorByKey("SideBarInit_" + i.toString())
            var jsonObject = JsonValue.fromStr(inspector).asObject()
            var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let ctrlButton = attrs
                .get("controlButton")
                .getOrThrow()
                .toString()
                .replace("\\", "")
                .replace(" ", "")
                .replace("\"", "")
            var shown: String = ""
            if ([3, 6].contains(i)) {
                shown = "resource:///16777286.png"
            }
            var hidden: String = ""
            if ([4, 5, 6].contains(i)) {
                hidden = "resource:///16777286.png"
            }
            var switching: String = ""
            if ([2, 5].contains(i)) {
                switching = "resource:///16777286.png"
            }
        }
        clickButton("AppResource")
    }
}
