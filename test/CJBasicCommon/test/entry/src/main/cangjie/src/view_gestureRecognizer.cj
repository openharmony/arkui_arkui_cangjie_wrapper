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
//
//import ohos.base.*
//import ohos.arkui.component.*
//import ohos.arkui.state_management.*
//import ohos.arkui.state_macro_manage.*
//import std.collection.ArrayList
//
//let ShouldBuiltInId: Int64 = 0
//let OnGestureRecognizerId: Int64 = 1
//let JudgeBeginEventId: Int64 = 2
//let JudgeBeginWithExposeId: Int64 = 3
//let GestureRecognizerTypeId: Int64 = 4
//let GestureRecognizerId: Int64 = 5
//let RecognizerStateId: Int64 = 6
//
//@Component
//class ShouldBuiltIn_View {
//
//    @State var currentText = "0"
//    @State var childText = "0"
//
//    func build() {
//        Column {
//        Scroll {
//            Scroll()
//            .backgroundColor(Color.Red)
//            .width(100.percent)
//            .height(50.percent)
//            .id("GestureRecognizer_ShouldBuiltIn")
//                .onScrollStart({
//                    =>
//                    this.childText = "1"
//                })
//        }
//        .width(100.percent)
//        .height(80.percent)
//        .backgroundColor(0xDCDCDC)
//        .shouldBuiltInRecognizerParallelWith({
//            current: GestureRecognizer, others: Array<GestureRecognizer> =>
//            for (i in 0..others.size) {
//                if (others[i].getType().toString() == "PAN_GESTURE") {
//                    return others[i]
//                }
//            }
//                return GestureRecognizer()
//        })
//            .onScrollStart({
//                =>
//                this.currentText = "1"
//            })
//
//        Text(this.currentText).id("ShouldBuiltInCurrent")
//        Text(this.childText).id("ShouldBuiltInChild")
//            }
//    }
//}
//
//@Component
//class OnGestureRecognizer_View {
//    @State var recognizerJudgeBegin = false
//
//    func build() {
//        Column {
//            Scroll {
//                Scroll()
//                .width(100.percent)
//                .height(80.percent)
//                .id("OnGestureRecognizerInner")
//                .backgroundColor(Color.Red)
//            }
//            .width(100.percent)
//            .height(80.percent)
//            .id("OnGestureRecognizerOuter")
//            .backgroundColor(0xDCDCDC)
//            .shouldBuiltInRecognizerParallelWith({
//                current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                for (i in 0..others.size) {
//                    if (others[i].getType().toString() == "PAN_GESTURE") {
//                        return others[i]
//                    }
//                }
//                return GestureRecognizer()
//            })
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                if (current.getEventTargetInfo().getId() == "OnGestureRecognizerOuter") {
//                    for (i in 0..others.size) {
//                        if (others[i].getEventTargetInfo().getId() == "OnGestureRecognizerInner") {
//                            this.recognizerJudgeBegin = true
//                        }
//                    }
//                }
//                return GestureJudgeResult.CONTINUE
//            })
//
//            Text("${this.recognizerJudgeBegin}").id("OnGestureRecognizerJudgeBegin")
//
//        }
//        .width(100.percent)
//        .height(100.percent)
//    }
//}
//
//@Component
//class JudgeBeginEvent_View {
//
//    @State var width = false
//    @State var height = false
//    @State var position = false
//    @State var globalPosition = false
//    @State var timeStamp = false
//    @State var source = false
//    @State var pressure = false
//    @State var sourceTool = false
//    @State var deviceId = false
//    @State var fingerList = true
//
//    func build() {
//        Column {
//            Column {
//                Column()
//                .width(80.percent)
//                .height(80.percent)
//                .backgroundColor(Color.Red)
//                .gesture(TapGesture())
//                .id("GestureRecognizer_JudgeBeginEvent")
//                .onGestureRecognizerJudgeBegin({
//                    event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                    Hilog.info(1,"1","Cangjie-App", "onGestureRecognizerJudgeBegin event ${event.target.area.width}, ${event.target.area.width}, ${event.target.area.width}, ${event.target.area.width}")
//                    if (event.target.area.width > 0.0) {
//                        this.width = true
//                    }
//                    if (event.target.area.height > 0.0) {
//                        this.height = true
//                    }
//                    if (event.target.area.position.x > 0.0 && event.target.area.position.y > 0.0) {
//                        this.position = true
//                    }
//                    if (event.target.area.globalPosition.x > 0.0 && event.target.area.globalPosition.x > 0.0) {
//                        this.globalPosition = true
//                    }
//                    if (event.timestamp > 0) {
//                        this.timeStamp = true
//                    }
//                    if (event.source.toString() == "TouchScreen") {
//                        this.source = true
//                    }
//                    if (event.pressure > 0.0) {
//                        this.pressure = true
//                    }
//                    if (event.sourceTool.toString() == "Finger") {
//                        this.sourceTool = true
//                    }
//                    if (event.deviceId > 0) {
//                        this.deviceId = true
//                    }
//                    for (i in 0..event.fingerList.size) {
//                        var temp = event.fingerList[i]
//                        if (Int64(temp.id) != i || temp.localX <= 0.0 || temp.localY <= 0.0 || temp.globalX <= 0.0 || temp.globalY <= 0.0) {
//                            this.fingerList = false
//                        }
//                    }
//                    return GestureJudgeResult.CONTINUE
//                })
//            }
//            .width(100.percent)
//            .height(80.percent)
//            .backgroundColor(0xDCDCDC)
//            .justifyContent(FlexAlign.Center)
//            .alignItems(HorizontalAlign.Center)
//
//            Row {
//                Text("${this.width}").id("width")
//                Text("${this.height}").id("height")
//                Text("${this.position}").id("position")
//                Text("${this.globalPosition}").id("globalPosition")
//                Text("${this.timeStamp}").id("timeStamp")
//            }
//            .width(100.percent)
//            .height(10.percent)
//            Row {
//                Text("${this.source}").id("source")
//                Text("${this.pressure}").id("pressure")
//                Text("${this.sourceTool}").id("sourceTool")
//                Text("${this.deviceId}").id("deviceId")
//                Text("${this.fingerList}").id("fingerList")
//            }
//            .width(100.percent)
//            .height(10.percent)
//        }
//        .width(100.percent)
//        .height(100.percent)
//    }
//
//}
//
//@Component
//class JudgeBeginWithExpose_View {
//
//    @State var innerIndex: Int32 = 0
//    @State var outerIndex: Int32 = 0
//
//    func build() {
//        Column {
//            Tabs {
//                TabContent {
//                    Tabs {
//                        TabContent {
//                            Column {
//                                Text("tabcontent1")
//                            }
//                        }
//                        .tabBar("inner1")
//                        TabContent {
//                            Column {
//                                Text("tabcontent2")
//                            }
//                        }
//                        .tabBar("inner2")
//                    }
//                    .id("JudgeBeginWithExpose_Tabs")
//                    .onAnimationStart({
//                        index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
//                        this.innerIndex = targetIndex
//                    })
//                    .onGestureRecognizerJudgeBegin({
//                        event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                        Hilog.info(1,"1","Cangjie-App", "onGestureRecognizerJudgeBegin 1")
//                            if (event is PanGestureEvent) {
//                                Hilog.info(1,"1","Cangjie-App", "onGestureRecognizerJudgeBegin index: ${this.innerIndex}")
//                                var panEvent = (event as PanGestureEvent).getOrThrow()
//                                if (panEvent.velocityX < 0.0 && this.innerIndex == 1) {
//                                    return GestureJudgeResult.REJECT
//                                }
//                            }
//                            return GestureJudgeResult.CONTINUE
//                    }, true)
//                }
//                .tabBar("outer1")
//                TabContent {
//                    Column {
//                        Text("outerTabContent")
//                    }
//                }
//                .tabBar("outer2")
//            }
//            .onAnimationStart({
//                index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
//                        this.outerIndex = targetIndex
//            })
//            .width(100.percent)
//            .height(60.percent)
//
//            Text("${this.outerIndex}").id("outerIndex")
//            Text("${this.innerIndex}").id("innerIndex")
//        }
//        .width(100.percent)
//        .height(100.percent)
//    }
//}
//
//@Component
//class GestureRecognizerType_View {
//
//    @State var tapGesture = false
//    @State var longPressGesture = false
//    @State var panGesture = false
//    @State var pinchGesture = false
//    @State var swipeGesture = false
//    @State var rotationGesture = false
//    @State var dragGesture = false
//    @State var clickGesture = false
//
//    func build() {
//        Column {
//            Column()
//            .id("GestureRecognizerType_Column")
//            .width(100.percent)
//            .height(50.percent)
//            .backgroundColor(Color.Red)
//            .gesture(TapGesture())
//            .gesture(LongPressGesture())
//            .gesture(PanGesture())
//            .gesture(PinchGesture())
//            .gesture(SwipeGesture())
//            .gesture(RotationGesture())
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                for(i in 0.. others.size) {
//                        match (others[i].getType()) {
//                            case TAP_GESTURE => this.tapGesture = true
//                            case LONG_PRESS_GESTURE => this.longPressGesture = true
//                            case PAN_GESTURE => this.panGesture = true
//                            case PINCH_GESTURE => this.pinchGesture = true
//                            case SWIPE_GESTURE => this.swipeGesture = true
//                            case ROTATION_GESTURE => this.rotationGesture = true
//                            case DRAG => this.dragGesture = true
//                            case _ => continue
//                        }
//                }
//                return GestureJudgeResult.CONTINUE
//            })
//
//            Button("CLICKGESTURE")
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                if (current.getType().toString() == "CLICK") {
//                    this.clickGesture = true
//                }
//                    return GestureJudgeResult.CONTINUE
//            })
//
//            Row {
//                Text("${tapGesture}").id("tapGesture")
//                Text("${longPressGesture}").id("longPressGesture")
//                Text("${panGesture}").id("panGesture")
//                Text("${pinchGesture}").id("pinchGesture")
//            }
//            .width(100.percent)
//            .height(15.percent)
//
//            Row {
//                Text("${swipeGesture}").id("swipeGesture")
//                Text("${rotationGesture}").id("rotationGesture")
//                Text("${dragGesture}").id("dragGesture")
//                Text("${clickGesture}").id("clickGesture")
//            }
//            .width(100.percent)
//            .height(15.percent)
//
//        }
//        .width(100.percent)
//        .height(100.percent)
//        .backgroundColor(0xDCDCDC)
//    }
//}
//
//@Component
//class GestureRecognizer_View {
//
//    var scrollRecognizer: GestureRecognizer = GestureRecognizer()
//    var panOptions: PanGestureOptions = PanGestureOptions(fingers: 2, direction: PanDirection.Vertical, distance: 5.2)
//    @State var tag = ""
//    @State var builtIn = false
//    @State var notBuiltIn = false
//    @State var valid = false
//    @State var notValid = false
//    @State var enabled = false
//    @State var notEnabled = false
//    @State var scrollId = "scrollId"
//
//    func build() {
//        Column {
//            Scroll()
//            .id("GestureRecognizerScroll")
//            .width(100.percent)
//            .height(30.percent)
//            .backgroundColor(Color.Red)
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                    this.tag = current.getTag()
//                    this.builtIn = current.isBuiltIn()
//                    this.valid = current.isValid()
//                    this.scrollRecognizer = current
//                    var target = current.getEventTargetInfo()
//                    this.scrollId = target.getId()
//                    return GestureJudgeResult.CONTINUE
//            })
//            Column()
//            .id("GestureRecognizerColumn")
//            .gesture(PanGesture(panOptions))
//            .width(100.percent)
//            .height(30.percent)
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                    this.notValid = !this.scrollRecognizer.isValid()
//                    this.scrollRecognizer.setEnabled(false)
//                    this.notEnabled = !this.scrollRecognizer.isEnabled()
//                    this.scrollRecognizer.setEnabled(true)
//                    this.enabled = this.scrollRecognizer.isEnabled()
//                    this.notBuiltIn = !current.isBuiltIn()
//                    if (current is PanRecognizer) {
//                        var panRecognizer = (current as PanRecognizer).getOrThrow()
//                        var panOptions = panRecognizer.getPanGestureOptions()
//                    }
//                    return GestureJudgeResult.CONTINUE
//            })
//            Row {
//                Text("${tag}").id("tag")
//                Text("${builtIn}").id("builtIn")
//                Text("${notBuiltIn}").id("notBuiltIn")
//                Text("${valid}").id("valid")
//            }
//            .width(100.percent)
//            .height(20.percent)
//            Row {
//                Text("${notValid}").id("notValid")
//                Text("${enabled}").id("enabled")
//                Text("${notEnabled}").id("notEnabled")
//                Text("${scrollId}").id("scrollId")
//            }
//            .width(100.percent)
//            .height(20.percent)
//        }
//        .width(100.percent)
//        .height(100.percent)
//        .backgroundColor(0xDCDCDC)
//    }
//}
//
//@Component
//class RecognizerState_View {
//
//    var arr: Array<Int64> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//    var longPressRecognizer: GestureRecognizer = GestureRecognizer()
//    var tapRecognizer: GestureRecognizer = GestureRecognizer()
//    let scroller = Scroller()
//    var scrollRecognizer: GestureRecognizer = GestureRecognizer()
//    @State var isReady = false
//    @State var isDetecting = false
//    @State var isSuccessful = false
//    @State var isFailed = false
//    @State var isBetween = false
//    @State var isBegin = false
//    @State var isEnd = false
//
//    func build() {
//        Column {
//            Column()
//            .id("gestureRecognizerState")
//            .width(100.percent)
//            .height(30.percent)
//            .gesture(LongPressGesture().onActionEnd({
//                event: GestureEvent =>
//                    this.isSuccessful = this.longPressRecognizer.getState().toString() == "SUCCESSFUL"
//                    this.isFailed = this.tapRecognizer.getState().toString() == "FAILED"
//            }))
//            .gesture(TapGesture())
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                    for (i in 0..others.size) {
//                        if (others[i].getType().toString() == "LONG_PRESS_GESTURE") {
//                            this.longPressRecognizer = others[i]
//                            this.isDetecting = others[i].getState().toString() == "DETECTING"
//                        }
//                        if (others[i].getType().toString() == "TAP_GESTURE") {
//                            this.tapRecognizer = others[i]
//                            this.isReady = others[i].getState().toString() == "READY"
//                        }
//                    }
//                    return GestureJudgeResult.CONTINUE
//            })
//            Scroll(this.scroller) {
//                Column {
//                    ForEach(this.arr, itemGeneratorFunc: {
//                            item: Int64, index: Int64 =>
//                                Text(item.toString())
//                                .width(90.percent)
//                                .height(150)
//                                .backgroundColor(0xFFFFFF)
//                                .borderRadius(15)
//                                .fontSize(16)
//                                .textAlign(TextAlign.Center)
//                                .margin(top: 10)
//                    })
//                }
//                .width(100.percent)
//            }
//            .width(100.percent)
//            .height(30.percent)
//            .backgroundColor(Color.Blue)
//            .id("End_Start_Scroll")
//            .onGestureRecognizerJudgeBegin({
//                event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer> =>
//                    this.scrollRecognizer = current
//                    return GestureJudgeResult.CONTINUE
//            })
//            Row {
//                Button("between")
//                .id("between")
//                .onClick({ e
//                    =>
//                    this.scroller.scrollToIndex(5, align: ScrollAlign.START)
//                    if (this.scrollRecognizer.getEventTargetInfo() is ScrollableTargetInfo) {
//                        var scrollTarget = (this.scrollRecognizer.getEventTargetInfo() as ScrollableTargetInfo).getOrThrow()
//                        this.isBetween = !scrollTarget.isEnd() && !scrollTarget.isBegin()
//                    }
//                })
//
//                Button("start")
//                .id("start")
//                .onClick({ e
//                    =>
//                    this.scroller.scrollToIndex(0, align: ScrollAlign.START)
//                    if (this.scrollRecognizer.getEventTargetInfo() is ScrollableTargetInfo) {
//                        var scrollTarget = (this.scrollRecognizer.getEventTargetInfo() as ScrollableTargetInfo).getOrThrow()
//                        this.isBegin = !scrollTarget.isEnd() && scrollTarget.isBegin()
//                    }
//                })
//
//                Button("end")
//                .id("end")
//                .onClick({ e
//                    =>
//                    this.scroller.scrollToIndex(10, align: ScrollAlign.END)
//                    if (this.scrollRecognizer.getEventTargetInfo() is ScrollableTargetInfo) {
//                        var scrollTarget = (this.scrollRecognizer.getEventTargetInfo() as ScrollableTargetInfo).getOrThrow()
//                        this.isEnd = scrollTarget.isEnd() && !scrollTarget.isBegin()
//                    }
//                })
//            }
//            .width(100.percent)
//            .height(10.percent)
//            Row {
//                Text("${isReady}").id("isReady")
//                Text("${isDetecting}").id("isDetecting")
//                Text("${isSuccessful}").id("isSuccessful")
//                Text("${isFailed}").id("isFailed")
//            }
//            .width(100.percent)
//            .height(10.percent)
//            Row {
//                Text("${isBetween}").id("isBetween")
//                Text("${isBegin}").id("isBegin")
//                Text("${isEnd}").id("isEnd")
//            }
//            .width(100.percent)
//            .height(10.percent)
//        }
//        .width(100.percent)
//        .height(100.percent)
//        .backgroundColor(0xDCDCDC)
//    }
//}
//
//
//@Entry
//@Component
//class View_GestureRecognizer {
//
//    @State var currentView: Int64 = 0
//
//    func build() {
//        Column {
//            Button("Next View")
//            .onClick({ e
//                =>
//                this.currentView++
//            })
//            .id("NextButton")
//            .width(100)
//            .height(80)
//            if (this.currentView == 0) {
//                ShouldBuiltIn_View()
//            }
//            else if (this.currentView == 1) {
//                OnGestureRecognizer_View()
//            }
//            else if (this.currentView == 2) {
//                JudgeBeginEvent_View()
//            }
//            else if (this.currentView == 3) {
//                JudgeBeginWithExpose_View()
//            }
//            else if (this.currentView == 4) {
//                GestureRecognizerType_View()
//            }
//            else if (this.currentView == 5) {
//                GestureRecognizer_View()
//            }
//            else if (this.currentView == 6) {
//                RecognizerState_View()
//            }
//            else {
//                Text("End")
//            }
//        }
//        .width(100.percent)
//        .height(100.percent)
//    }
//}
