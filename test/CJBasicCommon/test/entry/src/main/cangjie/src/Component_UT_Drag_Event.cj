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

import ohos.base.*
import std.unittest.testmacro.*
import std.unittest.*
import std.math.*
import std.convert.*
import ohos.ui_test.*
import ohos.ui_test.Point as uitestPoint
import std.collection.ArrayList

enum CustomSwipeDirection {
    | Left
    | Right
    | Up
    | Down
}

@Test
public class Component_UT_Drag_Event {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }
    // 滑动手势模拟点
    func getSwipePoints(startX: Float64, startY: Float64, distance: Float64, direction: CustomSwipeDirection,
        pointNumber: Int64): ArrayList<uitestPoint> {
        let res: ArrayList<uitestPoint> = ArrayList<uitestPoint>([])
        let space: Float64 = distance / Float64((pointNumber - 1))
        for (i in 0..pointNumber) {
            match (direction) {
                case CustomSwipeDirection.Left => res.add(
                    uitestPoint(IntNative(round(startX - space * Float64(i))), IntNative(round(startY))))
                case CustomSwipeDirection.Right => res.add(
                    uitestPoint(IntNative(round(startX + space * Float64(i))), IntNative(round(startY))))
                case CustomSwipeDirection.Up => res.add(
                    uitestPoint(IntNative(round(startX)), IntNative(round(startY - space * Float64(i)))))
                case CustomSwipeDirection.Down => res.add(
                    uitestPoint(IntNative(round(startX)), IntNative(round(startY + space * Float64(i)))))
            }
        }
        return res
    }

    // 长按手势模拟点
    func getLongPressPoints(startX: Float64, startY: Float64, pointNumber: Int64): ArrayList<uitestPoint> {
        let res: ArrayList<uitestPoint> = ArrayList<uitestPoint>([])
        for (i in 0..pointNumber) {
            res.add(uitestPoint(IntNative(round(startX) + Float64(i % 2)), IntNative(round(startY) + Float64(i % 2))))
        }
        return res
    }

    // 获取组件左上角坐标
    func getStartPoint(id: String): uitestPoint {
        let strJson = getInspectorByKey(id)
        let obj = JsonValue.fromStr(strJson).asObject()
        let rectInfo = obj.get("$rect").getOrThrow().toString()
        let pointStr: String = rectInfo.split("],[")[0]
        let x = Float64.parse(pointStr.split(",")[0].removePrefix("\"["))
        let y = Float64.parse(pointStr.split(",")[1].removePrefix(" "))
        return uitestPoint(IntNative(x), IntNative(y))
    }

    private func ScrollTo(view: String) {
        driver.delayMs(200)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.info(1, "1", "Cangjie-App", view + " started")
        scrollBar.scrollSearch(On().id(view)).click()
        driver.delayMs(200)
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"), 200)
        Hilog.info(1, "1", "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("View_DragTest")).click()
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Drag_ListItem_1() {
        Hilog.info(1, "1", "Cangjie-Test", "### Test_Drag_ListItem_1")
        var startPoint = getStartPoint("listItem1")
        var pointers: PointerMatrix = PointerMatrix.create(1, 400)
        var points1: ArrayList<uitestPoint> = getLongPressPoints(Float64(startPoint.x + 10), Float64(startPoint.y + 10),
            200)
        var points2: ArrayList<uitestPoint> = getSwipePoints(Float64(startPoint.x + 10), Float64(startPoint.y + 10),
            100.0, CustomSwipeDirection.Right, 200)
        for (i in 0..200) {
            pointers.setPoint(0, IntNative(i), points1[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, IntNative(i) + 200, points2[i])
        }
        Hilog.info(1, "1", "Cangjie-Test", "### 2")
        driver.injectMultiPointerAction(pointers, speed: 210)
        Hilog.info(1, "1", "Cangjie-Test", "### 3")
        driver.delayMs(200)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Drag_ListItem_2() {
        Hilog.info(1, "1", "Cangjie-Test", "### Test_Drag_ListItem_2")
        var startPoint = getStartPoint("listItem2")
        var pointers: PointerMatrix = PointerMatrix.create(1, 400)
        var points1: ArrayList<uitestPoint> = getLongPressPoints(Float64(startPoint.x + 10), Float64(startPoint.y + 10),
            200)
        var points2: ArrayList<uitestPoint> = getSwipePoints(Float64(startPoint.x + 10), Float64(startPoint.y + 10),
            100.0, CustomSwipeDirection.Right, 200)
        for (i in 0..200) {
            pointers.setPoint(0, IntNative(i), points1[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, IntNative(i) + 200, points2[i])
        }

        driver.injectMultiPointerAction(pointers, speed: 210)
        driver.delayMs(200)
    }
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Drag_Img() {
        Hilog.info(1, "1", "Cangjie-Test", "### Test_Drag_Img")
        var startPoint = getStartPoint("drag_img")
        var pointers: PointerMatrix = PointerMatrix.create(1, 400)
        var points1: ArrayList<uitestPoint> = getLongPressPoints(Float64(startPoint.x + 10), Float64(startPoint.y + 10),
            200)
        var points2: ArrayList<uitestPoint> = getSwipePoints(Float64(startPoint.x + 10), Float64(startPoint.y + 10),
            600.0, CustomSwipeDirection.Right, 200)
        for (i in 0..200) {
            pointers.setPoint(0, IntNative(i), points1[i])
        }
        for (i in 0..200) {
            pointers.setPoint(0, IntNative(i) + 200, points2[i])
        }

        driver.injectMultiPointerAction(pointers, speed: 210)
        driver.delayMs(800)

        // 小艺弹窗取消点
        driver.click(344, 1912)
        driver.delayMs(300)
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_Drag_Enum() {
        Hilog.info(1, "1", "Cangjie-Test", "### Test_Drag_Enum")
        var testDragBehavior: Bool = true
        var dragBehaviorAns: Array<String> = [
            "COPY",
            "MOVE"
        ]
        var testDragResult: Bool = true
        var dragResultAns: Array<String> = [
            "DRAG_DEFAULT",
            "DRAG_FAILED",
            "DRAG_CANCELED",
            "DROP_ENABLED",
            "DROP_DISABLED"
        ]
        var testPreDragStatus: Bool = true
        var preDragStatusAns: Array<String> = [
            "ACTION_DETECTING_STATUS",
            "READY_TO_TRIGGER_DRAG_ACTION",
            "PREVIEW_LIFT_STARTED",
            "PREVIEW_LIFT_FINISHED",
            "PREVIEW_LANDING_STARTED",
            "PREVIEW_LANDING_FINISHED",
            "ACTION_CANCELED_BEFORE_DRAG"
        ]
        if (testDragBehavior) {
            var tempSize = dragBehaviorAns.size
            for (i in 0..tempSize) {
                clickButton("changeDragBehavior")
                @Expect(getContentFromText("parsedDragBehavior"), "\"${dragBehaviorAns[i]}\"")
            }
        }
        if (testDragResult) {
            var tempSize = dragResultAns.size
            for (i in 0..tempSize) {
                clickButton("changeDragResult")
                @Expect(getContentFromText("parsedDragResult"), "\"${dragResultAns[i]}\"")
            }
        }
        if (testPreDragStatus) {
            var tempSize = preDragStatusAns.size
            for (i in 0..tempSize) {
                clickButton("changePreDragStatus")
                @Expect(getContentFromText("parsedPreDragResult"), "\"${preDragStatusAns[i]}\"")
            }
        }
    }

    func getContentFromText(textId: String): String {
        var inspector = getInspectorByKey(textId)
        var jsonObject = JsonValue.fromStr(inspector).asObject()
        var attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        attrs.get("content").getOrThrow().toString()
    }

    func clickButton(buttonId: String) {
        let button = driver.waitForComponent(On().id(buttonId), 500)
        button.click()
        driver.delayMs(200)
    }
}
