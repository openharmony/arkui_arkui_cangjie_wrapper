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
import std.math.*

enum CustomSwipeDirection {
  | Left
  | Right
  | Up
  | Down
}

@Test
class ScrollSplitUT1 {
    prop driver: Driver {
        get(){
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "error", "scrollTo ${view}")
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
        Hilog.error(1, "error","started")
        scrollBar.scrollSearch(On().id("ScrollSplitIndex1")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    func getLongPressPoints(startX: Float64, startY: Float64, pointNumber: Int64): ArrayList<ui_test.Point> {
        let res: ArrayList<ui_test.Point> = ArrayList<ui_test.Point>([])
        for (i in 0..pointNumber) {
            res.add(ui_test.Point(Int32(round(startX) + Float64(i % 2)), Int32(round(startY) + Float64(i % 2))))
        }
        return res
    }
    func getSwipePoints(startX: Float64, startY: Float64, distance: Float64, direction: CustomSwipeDirection,
        pointNumber: Int64): ArrayList<ui_test.Point> {
        let res: ArrayList<ui_test.Point> = ArrayList<ui_test.Point>([])
        let space: Float64 = distance / Float64((pointNumber - 1))
        for (i in 0..pointNumber) {
            match (direction) {
                case CustomSwipeDirection.Left => res.add(
                    ui_test.Point(Int32(round(startX - space * Float64(i))), Int32(round(startY))))
                case CustomSwipeDirection.Right => res.add(
                    ui_test.Point(Int32(round(startX + space * Float64(i))), Int32(round(startY))))
                case CustomSwipeDirection.Up => res.add(
                    ui_test.Point(Int32(round(startX)), Int32(round(startY - space * Float64(i)))))
                case CustomSwipeDirection.Down => res.add(
                    ui_test.Point(Int32(round(startX)), Int32(round(startY + space * Float64(i)))))
            }
        }
        return res
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testColumnCommonAttrs() {
        scrollTo("ViewColumn")

        let inspector_1 = getInspectorByKey("my_col_1")
        let jsonObject_1 = JsonValue.fromStr(inspector_1).asObject()
        let attrs_1 = jsonObject_1.get("$attrs").getOrThrow().asObject()

        let space_1 = attrs_1.get("space").getOrThrow().toString()
        @Expect(space_1, "\"5.00vp\"")

        let horizon_1 = attrs_1.get("alignItems").getOrThrow().toString()
        @Expect(horizon_1, "\"HorizontalAlign.Center\"")

        let jsContent_1 = attrs_1.get("justifyContent").getOrThrow().toString()
        @Expect(jsContent_1, "\"FlexAlign.Start\"")


        let inspector_2 = getInspectorByKey("my_col_2")
        let jsonObject_2 = JsonValue.fromStr(inspector_2).asObject()
        let attrs_2 = jsonObject_2.get("$attrs").getOrThrow().asObject()

        let space_2 = attrs_2.get("space").getOrThrow().toString()
        @Expect(space_2, "\"0.00vp\"")

        let horizon_2 = attrs_2.get("alignItems").getOrThrow().toString()
        @Expect(horizon_2, "\"HorizontalAlign.Start\"")


        let inspector_3 = getInspectorByKey("my_col_3")
        let jsonObject_3 = JsonValue.fromStr(inspector_3).asObject()
        let attrs_3 = jsonObject_3.get("$attrs").getOrThrow().asObject()

        let horizon_3 = attrs_3.get("alignItems").getOrThrow().toString()
        @Expect(horizon_3, "\"HorizontalAlign.End\"")


        let inspector_4 = getInspectorByKey("my_col_4")
        let jsonObject_4 = JsonValue.fromStr(inspector_4).asObject()
        let attrs_4 = jsonObject_4.get("$attrs").getOrThrow().asObject()

        let jsContent_4 = attrs_4.get("justifyContent").getOrThrow().toString()
        @Expect(jsContent_4, "\"FlexAlign.Center\"")


        let inspector_5 = getInspectorByKey("my_col_5")
        let jsonObject_5 = JsonValue.fromStr(inspector_5).asObject()
        let attrs_5 = jsonObject_5.get("$attrs").getOrThrow().asObject()

        let jsContent_5 = attrs_5.get("justifyContent").getOrThrow().toString()
        @Expect(jsContent_5, "\"FlexAlign.End\"")

        let inspector_6 = getInspectorByKey("my_col_6")
        let jsonObject_6 = JsonValue.fromStr(inspector_6).asObject()
        let attrs_6 = jsonObject_6.get("$attrs").getOrThrow().asObject()

        let space_6 = attrs_6.get("space").getOrThrow().toString()
        @Expect(space_6, "\"6.00vp\"")

        let inspector_7 = getInspectorByKey("my_col_7")
        let jsonObject_7 = JsonValue.fromStr(inspector_7).asObject()
        let attrs_7 = jsonObject_7.get("$attrs").getOrThrow().asObject()

        let space_7 = attrs_7.get("space").getOrThrow().toString()
        @Expect(space_7, "\"7.00vp\"")

        let inspector_8 = getInspectorByKey("my_col_8")
        let jsonObject_8 = JsonValue.fromStr(inspector_8).asObject()
        let attrs_8 = jsonObject_8.get("$attrs").getOrThrow().asObject()

        let space_8 = attrs_8.get("space").getOrThrow().toString()
        @Expect(space_8, "\"8.00vp\"")

        let inspector_9 = getInspectorByKey("my_col_9")
        let jsonObject_9 = JsonValue.fromStr(inspector_9).asObject()
        let attrs_9 = jsonObject_9.get("$attrs").getOrThrow().asObject()

        let space_9 = attrs_9.get("space").getOrThrow().toString()
        @Expect(space_9, "\"9.00vp\"")

        let inspector_10 = getInspectorByKey("my_col_10")
        let jsonObject_10 = JsonValue.fromStr(inspector_10).asObject()
        let attrs_10 = jsonObject_10.get("$attrs").getOrThrow().asObject()

        let space_10 = attrs_10.get("space").getOrThrow().toString()
        @Expect(space_10, "\"10.00vp\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testFlexCommonAttrs() {
        scrollTo("ViewFlex")

        //行布局，左端对齐
        let fex_1: Component = driver.findComponent(On().id("flex_1")).getOrThrow()
        let fex_4: Component = driver.findComponent(On().id("flex_4")).getOrThrow()
        let rect_1 = fex_1.getBounds()
        let rect_4 = fex_4.getBounds()
        Hilog.info(1, "info", "fex_1_left: ${rect_1.left} expect: 0")
        @Expect(rect_1.left, 0)
         Hilog.info(1, "info", "rect_4.left: ${rect_4.left} expect: ${(rect_1.right - rect_1.left) * 3}")
        @Expect(rect_4.left, (rect_1.right - rect_1.left) * 3)

        //多行布局，左端对齐
        let fex_5: Component = driver.findComponent(On().id("flex_5")).getOrThrow()
        let fex_7: Component = driver.findComponent(On().id("flex_7")).getOrThrow()
        let fex_8: Component = driver.findComponent(On().id("flex_8")).getOrThrow()
        let fex_10: Component = driver.findComponent(On().id("flex_10")).getOrThrow()
        let fex_11: Component = driver.findComponent(On().id("flex_11")).getOrThrow()
        let fex_13: Component = driver.findComponent(On().id("flex_13")).getOrThrow()
        let rect_5 = fex_5.getBounds()
        let rect_7 = fex_7.getBounds()
        Hilog.info(1, "info", "rect_5.left: ${rect_5.left} expect: 0")
        @Expect(rect_5.left, 0)
        Hilog.info(1, "info", "rect_7.left: ${rect_7.left} expect: 0")
        @Expect(rect_7.left, 0)

    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testForeach() {
        scrollTo("ViewForeach")

        let text1 = driver.findComponent(On().id("my_text_one")).getOrThrow().getText()
        @Expect(text1, "one")

        let text2 = driver.findComponent(On().id("my_text_two")).getOrThrow().getText()
        @Expect(text2, "two")

        let text3 = driver.findComponent(On().id("my_text_three")).getOrThrow().getText()
        @Expect(text3, "three")

        let inspector_foreach_text1 = getInspectorByKey("my_text_color_0")
        let jsonObject_foreach_text1 = JsonValue.fromStr(inspector_foreach_text1).asObject()
        let attrs_foreach_text1 = jsonObject_foreach_text1.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_foreach] foreach_text1 attrs: ${attrs_foreach_text1}")

        let backgroundColor1 = attrs_foreach_text1.get("backgroundColor").getOrThrow().toString()
        Hilog.info(1, "info", "[test_foreach] backgroundColor: ${backgroundColor1}")
        @Expect(backgroundColor1, "\"#FFFF0000\"")

        let inspector_foreach_text2 = getInspectorByKey("my_text_color_1")
        let jsonObject_foreach_text2 = JsonValue.fromStr(inspector_foreach_text2).asObject()
        let attrs_foreach_text2 = jsonObject_foreach_text2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_foreach] foreach_text2 attrs: ${attrs_foreach_text2}")

        let backgroundColor2 = attrs_foreach_text2.get("backgroundColor").getOrThrow().toString()
        Hilog.info(1, "info", "[test_foreach] backgroundColor: ${backgroundColor2}")
        @Expect(backgroundColor2, "\"#FF0000FF\"")

        let inspector_foreach_text3 = getInspectorByKey("my_text_color_2")
        let jsonObject_foreach_text3 = JsonValue.fromStr(inspector_foreach_text3).asObject()
        let attrs_foreach_text3 = jsonObject_foreach_text3.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_foreach] foreach_text3 attrs: ${attrs_foreach_text3}")

        let backgroundColor3 = attrs_foreach_text3.get("backgroundColor").getOrThrow().toString()
        Hilog.info(1, "info", "[test_foreach] backgroundColor: ${backgroundColor3}")
        @Expect(backgroundColor3, "\"#FF008000\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridEvent() {
        scrollTo("ViewGrid")
        var pointers: PointerMatrix = PointerMatrix.create(1, 800)
        var points1: ArrayList<ui_test.Point> = getLongPressPoints(Float64(615), Float64(505), 200)
        var points2: ArrayList<ui_test.Point> = getSwipePoints(Float64(points1[199].x), Float64(points1[199].y), 1000.0,
            CustomSwipeDirection.Down, 200)
        var points3: ArrayList<ui_test.Point> = getSwipePoints(Float64(points2[199].x), Float64(points2[199].y), 1000.0,
            CustomSwipeDirection.Up, 200)
        var points4: ArrayList<ui_test.Point> = getSwipePoints(Float64(points3[199].x), Float64(points3[199].y), 400.0,
            CustomSwipeDirection.Right, 200)

        for (i in 0..200) {
            pointers.setPoint(0, Int32(i), points1[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 200, points2[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 400, points3[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 600, points4[i])
        }
        driver.injectMultiPointerAction(pointers, speed: 210)
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGrid2Drag() {
        scrollTo("ViewGrid2")
        var pointers: PointerMatrix = PointerMatrix.create(1, 400)
        var points1: ArrayList<ui_test.Point> = getLongPressPoints(Float64(615), Float64(505), 200)
        var points2: ArrayList<ui_test.Point> = getSwipePoints(Float64(points1[199].x), Float64(points1[199].y), 1000.0,
            CustomSwipeDirection.Down, 200)
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i), points1[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 200, points2[i])
        }
        driver.injectMultiPointerAction(pointers, speed: 300)
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testList2Drag() {
        scrollTo("ViewList2")
        var pointers: PointerMatrix = PointerMatrix.create(1, 800)
        var points1: ArrayList<ui_test.Point> = getLongPressPoints(Float64(615), Float64(505), 200)
        var points2: ArrayList<ui_test.Point> = getSwipePoints(Float64(points1[199].x), Float64(points1[199].y), 1000.0,
            CustomSwipeDirection.Down, 200)
        var points3: ArrayList<ui_test.Point> = getSwipePoints(Float64(points2[199].x), Float64(points2[199].y), 1000.0,
            CustomSwipeDirection.Up, 200)
        var points4: ArrayList<ui_test.Point> = getSwipePoints(Float64(points3[199].x), Float64(points3[199].y), 400.0,
            CustomSwipeDirection.Right, 200)

        for (i in 0..200) {
            pointers.setPoint(0, Int32(i), points1[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 200, points2[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 400, points3[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, Int32(i) + 600, points4[i])
        }
        driver.injectMultiPointerAction(pointers, speed: 210)
        driver.delayMs(200)

        driver.delayMs(500)
        var pointers2: PointerMatrix = PointerMatrix.create(1, 400)
        var points11: ArrayList<ui_test.Point> = getLongPressPoints(Float64(615), Float64(1405), 200)
        var points12: ArrayList<ui_test.Point> = getSwipePoints(Float64(points11[199].x), Float64(points11[199].y), 1000.0,
            CustomSwipeDirection.Up, 200)
        for (i in 0..200) {
            pointers2.setPoint(0, Int32(i), points11[i])
        }
        for (i in 0..200) {
            pointers2.setPoint(0, Int32(i) + 200, points12[i])
        }
        driver.injectMultiPointerAction(pointers2, speed: 500)
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridCommonAttrs() {
        scrollTo("ViewGrid")
        let inspector_grid04 = getInspectorByKey("grid_case_04")
        let jsonObject_grid04 = JsonValue.fromStr(inspector_grid04).asObject()
        let attrs_grid04 = jsonObject_grid04.get("$attrs").getOrThrow().asObject()

        let bytes2: Array<Byte> = jsonObject_grid04.toJsonString().toArray()
        Hilog.info(1, "info", "[test_GridCommonAttrs] ----------------  bytes2: ${bytes2.size}")
        let arr11: Array<Byte> = bytes2.slice(0, 2600)
        let arr21: Array<Byte> = bytes2.slice(2600, 2600)
        let arr31: Array<Byte> = bytes2.slice(5200, bytes2.size - 5200)
        Hilog.info(1, "info", "[test_GridCommonAttrs] ----- jsonObject: ${String.fromUtf8(arr11)}")
        Hilog.info(1, "info", "${String.fromUtf8(arr21)}")
        Hilog.info(1, "info", "${String.fromUtf8(arr31)}")

        let inspector_grid05 = getInspectorByKey("grid_case_05")
        let jsonObject_grid05 = JsonValue.fromStr(inspector_grid05).asObject()
        let attrs_grid05 = jsonObject_grid05.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_GridCommonAttrs] grid_case_05 attrs: ${attrs_grid05}")

        let inspector_grid06 = getInspectorByKey("grid_case_06")
        let jsonObject_grid06 = JsonValue.fromStr(inspector_grid06).asObject()
        let attrs_grid06 = jsonObject_grid06.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_GridCommonAttrs] grid_case_06 attrs: ${attrs_grid06}")

        let inspector_grid07 = getInspectorByKey("grid_case_07")
        let jsonObject_grid07 = JsonValue.fromStr(inspector_grid07).asObject()
        let attrs_grid07 = jsonObject_grid07.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_GridCommonAttrs] grid_case_07 attrs: ${attrs_grid07}")

        let inspector_grid301 = getInspectorByKey("grid_case_301")
        let jsonObject_grid301 = JsonValue.fromStr(inspector_grid301).asObject()
        let attrs_grid301 = jsonObject_grid301.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_GridCommonAttrs] grid_case_301 attrs: ${attrs_grid301}")

        // @Case1 columnsTemplate("repeat(auto-fit, 50)")
        let columnsTemplate = attrs_grid04.get("columnsTemplate").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] columnsTemplate: ${columnsTemplate}")
        @Expect(columnsTemplate, "\"repeat(auto-fit, 50)\"")

        // @Case2 rowsTemplate("repeat(auto-fit, 30)")
        let rowsTemplate = attrs_grid07.get("rowsTemplate").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] rowsTemplate: ${rowsTemplate}")
        @Expect(rowsTemplate, "\"repeat(auto-fit, 30)\"")

        // @Case3 columnsGap(10.vp)
        let columnsGap = attrs_grid04.get("columnsGap").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] columnsGap: ${columnsGap}")
        @Expect(columnsGap, "\"10.00vp\"")

        // @Case4 rowsGap(10.0.vp)
        let rowsGap = attrs_grid07.get("rowsGap").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] rowsGap: ${rowsGap}")
        @Expect(rowsGap, "\"10.00vp\"")

        // @Case5 scrollBar(BarState.On)
        let scrollBar = attrs_grid04.get("scrollBar").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] scrollBar: ${scrollBar}")
        @Expect(scrollBar, "\"BarState.On\"")

        // @Case6 scrollBarColor(Color.Red)
        let scrollBarColor = attrs_grid04.get("scrollBarColor").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] scrollBarColor: ${scrollBarColor}")
        @Expect(scrollBarColor, "\"#FFFF0000\"")

        // @Case7 scrollBarWidth(10.0)
        let scrollBarWidth = attrs_grid04.get("scrollBarWidth").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] scrollBarWidth: ${scrollBarWidth}")
        @Expect(scrollBarWidth, "\"10.00vp\"")

        // @Case8 cachedCount(2, true)
        let cachedCount = attrs_grid04.get("cachedCount").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] cachedCount: ${cachedCount}")
        @Expect(cachedCount, "2")

        // @Case9 editMode(true)
        // let editMode = attrs_grid04.get("editMode").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] editMode: ${editMode}")
        // @Expect(editMode, "\"true\"")

        // @Case10 layoutDirection(GridDirection.ColumnReverse)
        // let layoutDirection = attrs_grid301.get("layoutDirection").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] layoutDirection: ${layoutDirection}")
        // @Expect(layoutDirection, "\"GridDirection.ColumnReverse\"")

        // @Case11 maxCount(3)
        // let maxCount = attrs_grid301.get("maxCount").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] maxCount: ${maxCount}")
        // @Expect(maxCount, "3")

        // @Case12 minCount(2)
        // let minCount = attrs_grid301.get("minCount").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] minCount: ${minCount}")
        // @Expect(minCount, "2")

        // @Case13 cellLength(20)
        // let cellLength = attrs_grid301.get("cellLength").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] cellLength: ${cellLength}")
        // @Expect(cellLength, "20")

        // @Case14 multiSelectable(true)
        // let multiSelectable = attrs_grid04.get("multiSelectable").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] multiSelectable: ${multiSelectable}")
        // @Expect(multiSelectable, "\"true\"")

        // @Case15 supportAnimation(true)
        // let supportAnimation = attrs_grid04.get("supportAnimation").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] supportAnimation: ${supportAnimation}")
        // @Expect(supportAnimation, "\"true\"")

        // @Case16 edgeEffect(EdgeEffect.Spring)
        // let edgeEffect = attrs_grid04.get("edgeEffect").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridCommonAttrs] edgeEffect: ${edgeEffect}")
        // @Expect(edgeEffect, "\"EdgeEffect.Spring\"")

        // @Case17 enableScrollInteraction(true)
        let enableScrollInteraction = attrs_grid04.get("enableScrollInteraction").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] enableScrollInteraction: ${enableScrollInteraction}")
        @Expect(enableScrollInteraction, "true")

        // @Case18 nestedScroll(NestedScrollOptions(NestedScrollMode.SelfOnly, NestedScrollMode.SelfOnly))
        let nestedScroll = attrs_grid04.get("nestedScroll").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] nestedScroll: ${nestedScroll}")
        @Expect(nestedScroll, "{\"scrollForward\":\"NestedScrollMode.SELF_ONLY\",\"scrollBackward\":\"NestedScrollMode.SELF_ONLY\"}")

        // @Case19 friction(0.8)
        let friction = attrs_grid04.get("friction").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridCommonAttrs] friction: ${friction}")
        @Expect(friction, "0.800000")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridColCtor() {
        scrollTo("ViewGridCol")

        let grid_col_1 = driver
            .findComponent(On().id("grid_col_1")).getOrThrow()
            .getType()
        @Expect(grid_col_1, "GridCol")

        let grid_col_2 = driver
            .findComponent(On().id("grid_col_2")).getOrThrow()
            .getType()
        @Expect(grid_col_2, "GridCol")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridColAttr() {
        scrollTo("ViewGridCol")

        let inspector = getInspectorByKey("grid_col_attr_1")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let span = attrs
            .get("span")
            .getOrThrow()
            .toString()
        @Expect(span, "\"2\"")

        let offset = attrs
            .get("offset")
            .getOrThrow()
            .toString()
        @Expect(offset, "\"1\"")

        let gridColOffset = attrs
            .get("gridColOffset")
            .getOrThrow()
            .toString()
        @Expect(gridColOffset, "\"1\"")

        let order = attrs
            .get("order")
            .getOrThrow()
            .toString()
        @Expect(order, "\"0\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridColAttr2() {
        scrollTo("ViewGridCol")

        let inspector = getInspectorByKey("grid_col_attr_2")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let span = attrs
            .get("span")
            .getOrThrow()
            .toString()
        @Expect(span, "\"12\"")

        let offset = attrs
            .get("offset")
            .getOrThrow()
            .toString()
        @Expect(offset, "\"12\"")

        let gridColOffset = attrs
            .get("gridColOffset")
            .getOrThrow()
            .toString()
        @Expect(gridColOffset, "\"12\"")

        let order = attrs
            .get("order")
            .getOrThrow()
            .toString()
        @Expect(order, "\"12\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridItemCommonAttrs() {
        scrollTo("ViewGridItem")
        let text1 = driver.findComponent(On().id("text1")).getOrThrow().getText()
        @Expect(text1, "4")

        let inspector = getInspectorByKey("gridItem1")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] gridItem1 attrs: ${attrs}")

        let bytes2: Array<Byte> = jsonObject.toJsonString().toArray()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] ----------------  bytes2: ${bytes2.size}")
        let arr11: Array<Byte> = bytes2.slice(0, 2600)
        let arr21: Array<Byte> = bytes2.slice(2600, 2600)
        let arr31: Array<Byte> = bytes2.slice(5200, bytes2.size - 5200)
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] ----- jsonObject: ${String.fromUtf8(arr11)}")
        Hilog.info(1, "info", "${String.fromUtf8(arr21)}")
        Hilog.info(1, "info", "${String.fromUtf8(arr31)}")

        let inspector2 = getInspectorByKey("gridItem2")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] gridItem2 attrs: ${attrs2}")

        // @Case3 rowStart(1)
        let rowStart = attrs.get("rowStart").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] rowStart: ${rowStart}")
        @Expect(rowStart, "\"1\"")

        // @Case4 rowEnd(4)
        let rowEnd = attrs.get("rowEnd").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] rowEnd: ${rowEnd}")
        @Expect(rowEnd, "\"4\"")

        // @Case5 columnStart(1)
        let columnStart = attrs2.get("columnStart").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] columnStart: ${columnStart}")
        @Expect(columnStart, "\"1\"")

        // @Case6 columnEnd(5)
        let columnEnd = attrs2.get("columnEnd").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] columnEnd: ${columnEnd}")
        @Expect(columnEnd, "\"5\"")

        // @Case7 selectable(false)
        let selectable = attrs.get("selectable").getOrThrow().toString()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] selectable: ${selectable}")
        @Expect(selectable, "\"true\"")

        // @Case8 selected(true)
        // let selected = attrs2.get("selected").getOrThrow().toString()
        // Hilog.info(1, "info", "[test_GridItemCommonAttrs] selected: ${selected}")
        // @Expect(selected, "\"true\"")

        // @Case9 onSelect
        let select_event = driver.findComponent(On().id("select_event")).getOrThrow()
        let selectStr = select_event.getText()
        Hilog.info(1, "info", "[test_GridItemCommonAttrs] selectStr: ${selectStr}")
        @Expect(selectStr, "select_event")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridRowCtor() {
        scrollTo("ViewGridRow")

        let grid_row_1 = driver
            .findComponent(On().id("grid_row_1")).getOrThrow()
            .getType()
        @Expect(grid_row_1, "GridRow")

        let grid_row_2 = driver
            .findComponent(On().id("grid_row_2")).getOrThrow()
            .getType()
        @Expect(grid_row_2, "GridRow")

        let grid_row_3 = driver
            .findComponent(On().id("grid_row_3")).getOrThrow()
            .getType()
        @Expect(grid_row_3, "GridRow")

        let grid_row_4 = driver
            .findComponent(On().id("grid_row_4")).getOrThrow()
            .getType()
        @Expect(grid_row_4, "GridRow")

        let grid_row_5 = driver
            .findComponent(On().id("grid_row_5")).getOrThrow()
            .getType()
        @Expect(grid_row_5, "GridRow")

        let grid_row_6 = driver
            .findComponent(On().id("grid_row_6")).getOrThrow()
            .getType()
        @Expect(grid_row_6, "GridRow")

        let grid_row_7 = driver
            .findComponent(On().id("grid_row_7")).getOrThrow()
            .getType()
        @Expect(grid_row_7, "GridRow")

        let grid_row_8 = driver
            .findComponent(On().id("grid_row_8")).getOrThrow()
            .getType()
        @Expect(grid_row_8, "GridRow")

        let grid_row_9 = driver
            .findComponent(On().id("grid_row_9")).getOrThrow()
            .getType()
        @Expect(grid_row_9, "GridRow")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridRowAttr() {
        scrollTo("ViewGridRow")

        let inspector = getInspectorByKey("grid_row_attr")
        let jsonObject = JsonValue
            .fromStr(inspector)
            .asObject()
        let attrs = jsonObject
            .get("$attrs")
            .getOrThrow()
            .asObject()

        let height = attrs
            .get("height")
            .getOrThrow()
            .toString()
        @Expect(height, "\"200.00vp\"")

        let alignItems = attrs
            .get("alignItems")
            .getOrThrow()
            .toString()
        @Expect(alignItems, "\"ItemAlign.Center\"")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGridRowEvent() {
        scrollTo("ViewGridRow")

        let currentBp = driver.findComponent(On().id("currentBp")).getOrThrow()
        @Expect(currentBp.getText(), "onBreakpointChange")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testIfelse() {
        scrollTo("ViewIfelse")

        let text1 = driver.findComponent(On().id("my_text1")).getOrThrow().getText()
        @Expect(text1, "the flag is true")

        let button1 = driver.findComponent(On().id("my_button1")).getOrThrow()
        driver.delayMs(200)
        button1.click()

        let text2 = driver.waitForComponent(On().id("my_text2"),200).getOrThrow().getText()
        @Expect(text2, "the flag is false")

        let text3 = driver.findComponent(On().id("my_text3")).getOrThrow().getText()
        @Expect(text3, "the status is 0")

        let button2 = driver.findComponent(On().id("my_button2")).getOrThrow()
        driver.delayMs(200)
        button2.click()

        let text4 = driver.waitForComponent(On().id("my_text4"),200).getOrThrow().getText()
        @Expect(text4, "the status is 1")

        driver.delayMs(200)
        button2.click()

        let text5 = driver.waitForComponent(On().id("my_text5"),200).getOrThrow().getText()
        @Expect(text5, "the status is 2")

        driver.delayMs(200)
        button2.click()

        let text6 = driver.waitForComponent(On().id("my_text6"),200).getOrThrow().getText()
        @Expect(text6, "error")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testListCommonAttrs() {
        scrollTo("ViewList")

        let inspector = getInspectorByKey("list")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        Hilog.info(1, "info", "aaaa: ${jsonObject.toString()}")

        let alignItem = attrs.get("listDirection").getOrThrow().toString()
        Hilog.info(1, "info", "xs${alignItem}")
        @Expect(alignItem, "\"Axis.Vertical\"")

        let edgeEffect = attrs.get("edgeEffect").getOrThrow().toString()
        @Expect(edgeEffect, "\"EdgeEffect.Spring\"")

        let chainAnimation = attrs.get("chainAnimation").getOrThrow().toString()
        @Expect(chainAnimation, "false")

        let scrollBar = attrs.get("scrollBar").getOrThrow().toString()
        @Expect(scrollBar, "\"BarState.Auto\"")

        let cachedCount = attrs.get("cachedCount").getOrThrow().toString()
        @Expect(cachedCount, "\"0\"")

        let multiSelectable = attrs.get("multiSelectable").getOrThrow().toString()
        @Expect(multiSelectable, "true")

        let lanes = attrs.get("lanes").getOrThrow().toString()
        @Expect(lanes,"\"1\"")

        let alignListItem = attrs.get("alignListItem").getOrThrow().toString()
        @Expect(alignListItem, "\"ListItemAlign.Center\"")

        let sticky = attrs.get("sticky").getOrThrow().toString()
        @Expect(sticky, "\"StickyStyle.None\"")

        let divider = attrs.get("divider").getOrThrow().toString()
         @Expect(divider , "{\"strokeWidth\":\"2.00px\",\"startMargin\":\"0.00vp\",\"endMargin\":\"0.00vp\",\"color\":\"#FF000000\"}")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testListControllerBottom() {
        scrollTo("ViewList")

        let scrollBar = driver.findComponent(On().id("list")).getOrThrow()
        scrollBar.scrollToBottom()
        let text1  = driver.waitForComponent(On().id("text"),3000).getOrThrow().getText()
        //@Expect(text1, "46")
        let text2 = driver.findComponent(On().id("text2")).getOrThrow().getText()
        @Expect(text2, "truefalse")
        let text3 = driver.findComponent(On().id("text3")).getOrThrow().getText()
        @Expect(text3, "truefalse")
        let text4 = driver.findComponent(On().id("text4")).getOrThrow().getText()
        @Expect(text4, "0.000000Idle")
    }



    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testListitemgroupCommonAttrs() {
        scrollTo("ViewListItemGroup")
        let inspector = getInspectorByKey("list_item_group")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

         let divider = attrs.get("divider").getOrThrow().toString()
         @Expect(divider , "{\"strokeWidth\":\"2.00vp\",\"startMargin\":\"10.00vp\",\"endMargin\":\"10.00vp\",\"color\":\"#FF808080\"}")
    }
}