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

///**
// * Created on 2024/11/1
// */
package ohos_app_cangjie_entry
//
//import ohos.arkui.state_macro_manage.*
//
//let TapGestureId: Int64 = 0
//let PanGestureId: Int64 = 1
//let LongPressGestureId: Int64 = 2
//let PinchGestureId: Int64 = 3
//let RotateGestureId: Int64 = 4
//let SwipeGestureId: Int64 = 5
//let BindGestureId: Int64 = 6
//let GroupGestureId: Int64 = 7
//let GestureEventId: Int64 = 8
//let TapHandlerId: Int64 = 9
//let LongPressHandlerId: Int64 = 10
//let PanHandlerId: Int64 = 11
//let PinchHandlerId: Int64 = 12
//let RotationHandlerId: Int64 = 13
//let SwipeHandlerId: Int64 = 14
//let GestureJudgeId: Int64 = 15
//
//extend SourceTool {
//    public func toString(): String {
//        match(this) {
//            case SourceTool.Unknown => "Unknown"
//            case SourceTool.Finger => "Finger"
//            case SourceTool.Pen => "Pen"
//            case SourceTool.Mouse => "Mouse"
//            case SourceTool.Touchpad => "Touchpad"
//            case SourceTool.Joystick => "Joystick"
//            case _ => "Unknown"
//        }
//    }
//}
//
//extend EventTarget {
//    public func toString(): String {
//        return "EventTarget: { area: { width: ${this.area.width.toString()}, height: ${this.area.height.toString()}, position: { x: ${this.area.position.x.toString()}, y: ${this.area.position.y.toString()}, globalPosition: { x: ${this.area.globalPosition.x.toString()}, y: ${this.area.globalPosition.y.toString()} } } }"
//    }
//}
//
//extend FingerInfo {
//    public func toString(): String {
//        return "FingerInfo: { id: ${this.id.toString()}, globalX: ${this.globalX.toString()}, globalY: ${this.globalX.toString()}, localX: ${this.localX.toString()}, localY: ${this.localY.toString()}}"
//    }
//}
//
//extend GestureTypes {
//    public func toString(): String {
//        match (this) {
//            case TAP_GESTURE => "TAP_GESTURE"
//            case LONG_PRESS_GESTURE => "LONG_PRESS_GESTURE"
//            case PAN_GESTURE => "PAN_GESTURE"
//            case PINCH_GESTURE => "PINCH_GESTURE"
//            case SWIPE_GESTURE => "SWIPE_GESTURE"
//            case ROTATION_GESTURE => "ROTATION_GESTURE"
//            case DRAG => "DRAG"
//            case CLICK => "CLICK"
//            case _ => "TAP_GESTURE"
//        }
//    }
//}
//
//@Component
//class TapGesture_View {
//    @State var tapGestureText1: String = "TapGesture1"
//    @State var tapGestureText2: String = "TapGesture2"
//    @State var tapGestureText3: String = "TapGesture3"
//
//    func build() {
//        List() {
//            ListItem() {
//                Text(tapGestureText1)
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture()
//                    .onAction({ evt =>
//                        tapGestureText1 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("TapGesture1")
//            }
//
//            ListItem() {
//                Text(tapGestureText2)
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture(fingers: 2)
//                    .onAction({ evt =>
//                        tapGestureText2 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("TapGesture2")
//            }
//
//            ListItem() {
//                Text(tapGestureText3)
//                .fontColor(Color(0x182431))
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture(count: 2)
//                    .onAction({ evt =>
//                        tapGestureText3 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("TapGesture3")
//            }
//        }
//    }
//}
//
//@Component
//class PanGesture_View {
//    @State var panGestureText1: String = "PanGesture1"
//    @State var panGestureText2: String = "PanGesture2"
//    @State var panGestureText3: String = "PanGesture3"
//    @State var panGestureText4: String = "PanGesture4"
//    @State var panGestureText5: String = "PanGesture5"
//    @State var panGestureText6: String = "PanGesture6"
//    @State var panGestureText7: String = "PanGesture7"
//    @State var panGestureText8: String = "PanGesture8"
//    @State var panGestureText9: String = "PanGesture9"
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(panGestureText1).id("PanGestureText1")
//                    Text(panGestureText2).id("PanGestureText2")
//                    Text(panGestureText3).id("PanGestureText3")
//                    Text(panGestureText4).id("PanGestureText4")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture()
//                    .onActionStart({ evt =>
//                        panGestureText1 = "onActionStart"
//                    })
//                    .onActionUpdate({ evt =>
//                        panGestureText2 = "onActionUpdate"
//                    })
//                    .onActionEnd({ evt =>
//                        panGestureText3 = "onActionEnd"
//                    })
//                    .onActionCancel({ =>
//                        panGestureText4 = "onActionCancel"
//                    }),
//                    GestureMask.Normal
//                ).id("PanGesture1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(panGestureText5).id("PanGestureText5")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture(fingers: 2)
//                    .onActionStart({ evt =>
//                        panGestureText5 = "onActionStart"
//                    }),
//                    GestureMask.Normal
//                ).id("PanGesture2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(panGestureText6).id("PanGestureText6")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture(direction: PanDirection.Horizontal)
//                    .onActionStart({ evt =>
//                        panGestureText6 = "onActionStart"
//                    }),
//                    GestureMask.Normal
//                ).id("PanGesture3")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(panGestureText7).id("PanGestureText7")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture(direction: PanDirection.Vertical)
//                    .onActionStart({ evt =>
//                        panGestureText7 = "onActionStart"
//                    }),
//                    GestureMask.Normal
//                ).id("PanGesture4")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(panGestureText8).id("PanGestureText8")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture(distance: 50.0)
//                    .onActionStart({ evt =>
//                        panGestureText8 = "onActionStart"
//                    }),
//                    GestureMask.Normal
//                ).id("PanGesture5")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(panGestureText9).id("PanGestureText9")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture(distance: -1.0)
//                    .onActionStart({ evt =>
//                        panGestureText9 = "onActionStart"
//                    }),
//                    GestureMask.Normal
//                ).id("PanGesture6")
//            }
//        }
//    }
//}
//
//@Component
//class LongPressGesture_View {
//    @State var longPressGestureText1: String = "LongPressGestureText1"
//    @State var longPressGestureText2: String = "LongPressGestureText2"
//    @State var longPressGestureText3: String = "LongPressGestureText3"
//    @State var longPressGestureText4: String = "LongPressGestureText4"
//    @State var longPressGestureText5: Int64 = 0
//    @State var longPressGestureText6: Int64 = 0
//    @State var longPressGestureText7: String = "LongPressGestureText7"
//    @State var longPressGestureText8: String = "LongPressGestureText8"
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(longPressGestureText1).id("LongPressGestureText1")
//                    Text(longPressGestureText2).id("LongPressGestureText2")
//                    Text(longPressGestureText3).id("LongPressGestureText3")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture()
//                    .onAction({ evt =>
//                        longPressGestureText1 = "onAction"
//                    })
//                    .onActionEnd({ evt =>
//                        longPressGestureText2 = "onActionEnd"
//                    })
//                    .onActionCancel({ =>
//                        longPressGestureText3 = "onActionCancel"
//                    }),
//                    GestureMask.Normal
//                ).id("LongPressGesture1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(longPressGestureText4).id("LongPressGestureText4")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture(fingers: 2)
//                    .onAction({ evt =>
//                        longPressGestureText4 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("LongPressGesture2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(longPressGestureText5.toString()).id("LongPressGestureText5")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture(repeat: true)
//                    .onAction({ evt =>
//                        longPressGestureText5 ++
//                    }),
//                    GestureMask.Normal
//                ).id("LongPressGesture3")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(longPressGestureText6.toString()).id("LongPressGestureText6")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture(repeat: false)
//                    .onAction({ evt =>
//                        longPressGestureText6 ++
//                    }),
//                    GestureMask.Normal
//                ).id("LongPressGesture4")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(longPressGestureText7).id("LongPressGestureText7")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture(duration: 1000)
//                    .onAction({ evt =>
//                        longPressGestureText7 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("LongPressGesture5")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(longPressGestureText8).id("LongPressGestureText8")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture(duration: -1)
//                    .onAction({ evt =>
//                        longPressGestureText8 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("LongPressGesture6")
//            }
//        }
//    }
//}
//
//@Component
//class PinchGesture_View {
//    @State var pinchGestureText1: String = "PinchGestureText1"
//    @State var pinchGestureText2: String = "PinchGestureText2"
//    @State var pinchGestureText3: String = "PinchGestureText3"
//    @State var pinchGestureText4: String = "PinchGestureText4"
//    @State var pinchGestureText5: String = "PinchGestureText5"
//    @State var pinchGestureText6: String = "PinchGestureText6"
//    @State var pinchGestureText7: String = "PinchGestureText7"
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(pinchGestureText1).id("PinchGestureText1")
//                    Text(pinchGestureText2).id("PinchGestureText2")
//                    Text(pinchGestureText3).id("PinchGestureText3")
//                    Text(pinchGestureText4).id("PinchGestureText4")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PinchGesture()
//                    .onActionStart({ evt =>
//                        pinchGestureText1 = "onActionStart"
//                    })
//                    .onActionUpdate({ evt =>
//                        pinchGestureText2 = "onActionUpdate"
//                    })
//                    .onActionEnd({ evt =>
//                        pinchGestureText3 = "onActionEnd"
//                    })
//                    .onActionCancel({ =>
//                        pinchGestureText4 = "onActionCancel"
//                    }),
//                    GestureMask.Normal
//                ).id("PinchGesture1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(pinchGestureText5).id("PinchGestureText5")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PinchGesture(fingers: 3)
//                    .onActionStart({ evt =>
//                        pinchGestureText5 = "onActionStart"
//                    })
//                    ,
//                    GestureMask.Normal
//                ).id("PinchGesture2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(pinchGestureText6).id("PinchGestureText6")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PinchGesture(distance: -1.0)
//                    .onActionStart({ evt =>
//                        pinchGestureText6 = "onActionStart"
//                    })
//                    ,
//                    GestureMask.Normal
//                ).id("PinchGesture3")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(pinchGestureText7).id("PinchGestureText7")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PinchGesture(distance: 10.0)
//                    .onActionStart({ evt =>
//                        pinchGestureText7 = "onActionStart"
//                    })
//                    ,
//                    GestureMask.Normal
//                ).id("PinchGesture4")
//            }
//        }
//    }
//}
//
//@Component
//class RotationGesture_View {
//    @State var rotationGestureText1: String = "RotationGestureText1"
//    @State var rotationGestureText2: String = "RotationGestureText2"
//    @State var rotationGestureText3: String = "RotationGestureText3"
//    @State var rotationGestureText4: String = "RotationGestureText4"
//    @State var rotationGestureText5: String = "RotationGestureText5"
//    @State var rotationGestureText6: String = "RotationGestureText6"
//    @State var rotationGestureText7: String = "RotationGestureText7"
//    @State var rotationGestureText8: String = "RotationGestureText8"
//    @State var rotationGestureText9: String = "RotationGestureText9"
//    @State var rotationGestureText10: String = "RotationGestureText10"
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(rotationGestureText1).id("RotationGestureText1")
//                    Text(rotationGestureText2).id("RotationGestureText2")
//                    Text(rotationGestureText3).id("RotationGestureText3")
//                    Text(rotationGestureText4).id("RotationGestureText4")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    RotationGesture()
//                    .onActionStart({ evt =>
//                        rotationGestureText1 = "onActionStart"
//                    })
//                    .onActionUpdate({ evt =>
//                        rotationGestureText2 = "onActionUpdate"
//                    })
//                    .onActionEnd({ evt =>
//                        rotationGestureText3 = "onActionEnd"
//                    })
//                    .onActionCancel({ =>
//                        rotationGestureText4 = "onActionCancel"
//                    }),
//                    GestureMask.Normal
//                ).id("RotationGesture1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(rotationGestureText5).id("RotationGestureText5")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    RotationGesture(fingers: 3)
//                    .onActionStart({ evt =>
//                        rotationGestureText5 = "onActionStart"
//                    })
//                    ,
//                    GestureMask.Normal
//                ).id("RotationGesture2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(rotationGestureText6).id("RotationGestureText6")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    RotationGesture(angle: 60.0)
//                    .onActionStart({ evt =>
//                        rotationGestureText6 = "onActionStart"
//                    })
//                    ,
//                    GestureMask.Normal
//                ).id("RotationGesture3")
//            }
//        }
//    }
//}
//
//@Component
//class SwipeGesture_View {
//    @State var swipeGestureText1: String = "SwipeGestureText1"
//    @State var swipeGestureText2: String = "SwipeGestureText2"
//    @State var swipeGestureText3: String = "SwipeGestureText3"
//    @State var swipeGestureText4: String = "SwipeGestureText4"
//    @State var swipeGestureText5: String = "SwipeGestureText5"
//    @State var swipeGestureText6: String = "SwipeGestureText6"
//    @State var swipeGestureText7: String = "SwipeGestureText7"
//
//    func build() {
//        List() {
//             ListItem() {
//                Column() {
//                    Text(swipeGestureText1).id("SwipeGestureText1")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture()
//                    .onAction({ evt =>
//                        swipeGestureText1 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureText2).id("SwipeGestureText2")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture(fingers: 2)
//                    .onAction({ evt =>
//                        swipeGestureText2 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureText3).id("SwipeGestureText3")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture(direction: SwipeDirection.Horizontal)
//                    .onAction({ evt =>
//                        swipeGestureText3 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture3")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureText4).id("SwipeGestureText4")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture(direction: SwipeDirection.Vertical)
//                    .onAction({ evt =>
//                        swipeGestureText4 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture4")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureText5).id("SwipeGestureText5")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture(direction: SwipeDirection.None)
//                    .onAction({ evt =>
//                        swipeGestureText5 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture5")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureText6).id("SwipeGestureText6")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture(speed: 200.0)
//                    .onAction({ evt =>
//                        swipeGestureText6 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture6")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureText7).id("SwipeGestureText7")
//                }
//                .width(200.vp)
//                .height(100.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture(speed: -1.0)
//                    .onAction({ evt =>
//                        swipeGestureText7 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("SwipeGesture7")
//            }
//        }
//    }
//}
//
//@Component
//class BindGesture_View {
//    @State var gestureChildText1: String = "GestureChildText1"
//    @State var gestureFatherText1: String = "GestureFatherText1"
//    @State var gestureChildText2: String = "GestureChildText2"
//    @State var gestureFatherText2: String = "GestureFatherText3"
//    @State var gestureChildText3: String = "GestureChildText3"
//    @State var gestureFatherText3: String = "GestureFatherText3"
//    @State var gestureChildText4: String = "GestureChildText4"
//    @State var gestureFatherText4: String = "GestureFatherText4"
//    @State var gestureChildText5: String = "GestureChildText5"
//    @State var gestureFatherText5: String = "GestureFatherText5"
//
//    func build() {
//        List() {
//             ListItem() {
//                Column() {
//                    Column() {
//                        Text(gestureChildText1).id("GestureChildText1")
//                    }
//                    .borderWidth(1)
//                    .width(200.vp)
//                    .height(100.vp)
//                    .gesture(
//                        TapGesture()
//                        .onAction({ evt =>
//                            gestureChildText1 = "onAction"
//                        }),
//                        GestureMask.Normal
//                    ).id("GestureChild1")
//                    Text(gestureFatherText1).id("GestureFatherText1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture()
//                    .onAction({ evt =>
//                        gestureFatherText1 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("GestureFather1")
//            }
//
//             ListItem() {
//                Column() {
//                    Column() {
//                        Text(gestureChildText2).id("GestureChildText2")
//                    }
//                    .borderWidth(1)
//                    .width(200.vp)
//                    .height(100.vp)
//                    .gesture(
//                        TapGesture()
//                        .onAction({ evt =>
//                            gestureChildText2 = "onAction"
//                        }),
//                        GestureMask.Normal
//                    ).id("GestureChild2")
//                    Text(gestureFatherText2).id("GestureFatherText2")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture()
//                    .onAction({ evt =>
//                        gestureFatherText2 = "onAction"
//                    }),
//                    GestureMask.IgnoreInternal
//                ).id("GestureFather2")
//            }
//
//            ListItem() {
//                Column() {
//                    Column() {
//                        Text(gestureChildText3).id("GestureChildText3")
//                    }
//                    .borderWidth(1)
//                    .width(200.vp)
//                    .height(100.vp)
//                    .gesture(
//                        TapGesture()
//                        .onAction({ evt =>
//                            gestureChildText3 = "onAction"
//                        }),
//                        GestureMask.Normal
//                    ).id("GestureChild3")
//                    Text(gestureFatherText3).id("GestureFatherText3")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .priorityGesture(
//                    TapGesture()
//                    .onAction({ evt =>
//                        gestureFatherText3 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("GestureFather3")
//            }
//
//            ListItem() {
//                Column() {
//                    Column() {
//                        Text(gestureChildText4).id("GestureChildText4")
//                    }
//                    .borderWidth(1)
//                    .width(200.vp)
//                    .height(100.vp)
//                    .gesture(
//                        TapGesture()
//                        .onAction({ evt =>
//                            gestureChildText4 = "onAction"
//                        }),
//                        GestureMask.Normal
//                    ).id("GestureChild4")
//                    Text(gestureFatherText4).id("GestureFatherText4")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .parallelGesture(
//                    TapGesture()
//                    .onAction({ evt =>
//                        gestureFatherText4 = "onAction"
//                    }),
//                    GestureMask.Normal
//                ).id("GestureFather4")
//            }
//        }
//    }
//}
//
//@Component
//class GroupGesture_View {
//    @State var GroupGestureText1: String = "GroupGestureText1"
//    @State var GroupGestureText2: String = "GroupGestureText2"
//    @State var GroupGestureText3: String = "GroupGestureText3"
//    @State var GroupGestureText4: String = "GroupGestureText4"
//    @State var GroupGestureText5: String = "GroupGestureText5"
//    @State var GroupGestureText6: String = "GroupGestureText6"
//    @State var GroupGestureText7: String = "GroupGestureText7"
//    @State var GroupGestureText8: String = "GroupGestureText8"
//    @State var GroupGestureText9: String = "GroupGestureText9"
//    @State var GroupGestureText10: String = "GroupGestureText10"
//    @State var GroupGestureText11: String = "GroupGestureText11"
//    @State var GroupGestureText12: String = "GroupGestureText12"
//    @State var GroupGestureText13: String = "GroupGestureText13"
//    @State var GroupGestureText14: String = "GroupGestureText14"
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(GroupGestureText1).id("GroupGestureText1")
//                }
//                .width(200.vp)
//                .height(20.vp)
//                .borderWidth(1)
//                .gesture(
//                    GestureGroup(GestureMode.Sequence, []),
//                    GestureMask.Normal
//                ).id("GroupGesture1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GroupGestureText2).id("GroupGestureText2")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    GestureGroup(GestureMode.Sequence, [
//                        TapGesture().onAction({ evt =>
//                            GroupGestureText2 = "onAction"
//                        })
//                    ]),
//                    GestureMask.Normal
//                ).id("GroupGesture2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GroupGestureText3).id("GroupGestureText3")
//                    Text(GroupGestureText4).id("GroupGestureText4")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    GestureGroup(GestureMode.Sequence, [
//                        LongPressGesture().onAction({ evt =>
//                            GroupGestureText3 = "onAction"
//                        }),
//                        PanGesture().onActionStart({ evt =>
//                            GroupGestureText4 = "onAction"
//                        })
//                    ]),
//                    GestureMask.Normal
//                ).id("GroupGesture3")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GroupGestureText5).id("GroupGestureText5")
//                    Text(GroupGestureText6).id("GroupGestureText6")
//                    Text(GroupGestureText7).id("GroupGestureText7")
//                    Text(GroupGestureText8).id("GroupGestureText8")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    GestureGroup(GestureMode.Sequence, [
//                        LongPressGesture().onAction({ evt =>
//                            GroupGestureText5 = "onAction"
//                        }),
//                        PanGesture().onActionStart({ evt =>
//                            GroupGestureText6 = "onAction"
//                        }),
//                        RotationGesture().onActionStart({ evt =>
//                            GroupGestureText7 = "onAction"
//                        })
//                    ])
//                    .onCancel({ =>
//                        GroupGestureText8 = "onCancel"
//                    }),
//                    GestureMask.Normal
//                ).id("GroupGesture4")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GroupGestureText9).id("GroupGestureText9")
//                    Text(GroupGestureText10).id("GroupGestureText10")
//                    Text(GroupGestureText11).id("GroupGestureText11")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    GestureGroup(GestureMode.Parallel, [
//                        PanGesture().onActionStart({ evt =>
//                            GroupGestureText10 = "onAction"
//                        }),
//                        RotationGesture().onActionStart({ evt =>
//                            GroupGestureText11 = "onAction"
//                        }),
//                        LongPressGesture().onAction({ evt =>
//                            GroupGestureText9 = "onAction"
//                        })
//                    ]),
//                    GestureMask.Normal
//                ).id("GroupGesture5")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GroupGestureText12).id("GroupGestureText12")
//                    Text(GroupGestureText13).id("GroupGestureText13")
//                    Text(GroupGestureText14).id("GroupGestureText14")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    GestureGroup(GestureMode.Exclusive, [
//                        LongPressGesture().onAction({ evt =>
//                            GroupGestureText12 = "onAction"
//                        }),
//                        PanGesture().onActionStart({ evt =>
//                            GroupGestureText13 = "onAction"
//                        }),
//                        RotationGesture().onActionStart({ evt =>
//                            GroupGestureText14 = "onAction"
//                        })
//                    ]),
//                    GestureMask.Normal
//                ).id("GroupGesture6")
//            }
//        }
//    }
//}
//
//@Component
//class GestureEvent_View {
//    @State var GestureEventTimeStamp: String = "GestureEventTimeStamp"
//    @State var GestureEventSoure: String = "GestureEventSoure"
//    @State var GestureEventSourceTool: String = "GestureEventSourceTool"
//    @State var GestureEventOffsetX: String = "GestureEventOffsetX"
//    @State var GestureEventOffsetY: String = "GestureEventOffsetY"
//    @State var GestureEventVelocityX: String = "GestureEventVelocityX"
//    @State var GestureEventVelocityY: String = "GestureEventVelocityY"
//    @State var GestureEventVelocity: String = "GestureEventVelocity"
//    @State var GestureEventRepeat: String = "GestureEventRepeat"
//    @State var GestureEventScale: String = "GestureEventScale"
//    @State var GestureEventPinchCenterX: String = "GestureEventPinchCenterX"
//    @State var GestureEventPinchCenterY: String = "GestureEventPinchCenterY"
//    @State var GestureEventAngle: String = "GestureEventAngle"
//    @State var GestureEventAngle2: String = "GestureEventAngle2"
//    @State var GestureEventSpeed: String = "GestureEventSpeed"
//    @State var GestureEventText14: String = "GestureEventText14"
//    @State var GestureEventDeviceId: String = "GestureEventDeviceId"
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(GestureEventTimeStamp).id("GestureEventTimeStamp")
//                    Text(GestureEventSoure).id("GestureEventSoure")
//                    Text(GestureEventSourceTool).id("GestureEventSourceTool")
//                    Text(GestureEventDeviceId).id("GestureEventDeviceId")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture().onAction({ evt: GestureEvent =>
//                        GestureEventTimeStamp = evt.timestamp.toString()
//                        GestureEventSoure = evt.source.toString()
//                        GestureEventSourceTool = evt.sourceTool.toString()
//                        GestureEventDeviceId = evt.deviceId.toString()
//                    }),
//                    GestureMask.Normal
//                ).id("GestureEvent1")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GestureEventOffsetX).id("GestureEventOffsetX")
//                    Text(GestureEventOffsetY).id("GestureEventOffsetY")
//                    Text(GestureEventVelocityX).id("GestureEventVelocityX")
//                    Text(GestureEventVelocityY).id("GestureEventVelocityY")
//                    Text(GestureEventVelocity).id("GestureEventVelocity")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PanGesture().onActionStart({ evt: GestureEvent =>
//                        GestureEventOffsetX = evt.offsetX.toString()
//                        GestureEventOffsetY = evt.offsetY.toString()
//                        GestureEventVelocityX = evt.velocityX.toString()
//                        GestureEventVelocityY = evt.velocityY.toString()
//                        GestureEventVelocity = evt.velocity.toString()
//                    }),
//                    GestureMask.Normal
//                ).id("GestureEvent2")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GestureEventRepeat).id("GestureEventRepeat")
//                }
//                .width(200.vp)
//                .height(20.vp)
//                .borderWidth(1)
//                .gesture(
//                    LongPressGesture(repeat: true).onAction({ evt: GestureEvent =>
//                        GestureEventRepeat = evt.repeat.toString()
//                    }),
//                    GestureMask.Normal
//                ).id("GestureEvent3")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GestureEventScale).id("GestureEventScale")
//                    Text(GestureEventPinchCenterX).id("GestureEventPinchCenterX")
//                    Text(GestureEventPinchCenterY).id("GestureEventPinchCenterY")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    PinchGesture().onActionEnd({ evt: GestureEvent =>
//                        GestureEventScale = evt.scale.toString()
//                        GestureEventPinchCenterX = evt.pinchCenterX.toString()
//                        GestureEventPinchCenterY = evt.pinchCenterY.toString()
//                        BaseLog.info(evt.target.toString())
//                        BaseLog.info("Fingers")
//                        for (finger in evt.fingerList) {
//                            BaseLog.info(finger.toString())
//                        }
//                    }),
//                    GestureMask.Normal
//                ).id("GestureEvent4")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GestureEventAngle).id("GestureEventAngle")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    RotationGesture().onActionEnd({ evt: GestureEvent =>
//                        GestureEventAngle = evt.angle.toString()
//                    }),
//                    GestureMask.Normal
//                ).id("GestureEvent5")
//            }
//
//            ListItem() {
//                Column() {
//                    Text(GestureEventAngle2).id("GestureEventAngle2")
//                    Text(GestureEventSpeed).id("GestureEventSpeed")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gesture(
//                    SwipeGesture().onAction({ evt: GestureEvent =>
//                        GestureEventAngle2 = evt.angle.toString()
//                        GestureEventSpeed = evt.speed.toString()
//                    }),
//                    GestureMask.Normal
//                ).id("GestureEvent6")
//            }
//        }
//    }
//}
//
//class Tap_Count_1_Figers_1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.clearGestures()
//        event.addGesture(
//            TapGestureHandler().tag("addGesture")
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Tap_Count_1_Figers_1 onAction")
//            }), priority: GesturePriority.High
//        )
//        event.addParallelGesture(
//            TapGestureHandler().tag("addParallelGesture")
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Tap_Count_1_Figers_1 onAction")
//            })
//        )
//        event.removeGestureByTag("addParallelGesture")
//    }
//}
//
//class Tap_Count_2_Figers_1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            TapGestureHandler(count: 2, fingers: 1)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Tap_Count_2_Figers_1 onAction")
//            })
//        )
//    }
//}
//
//class Tap_Count_1_Figers_2 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            TapGestureHandler(count: 1, fingers: 2)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Tap_Count_1_Figers_2 onAction")
//            })
//        )
//    }
//}
//
//@Component
//class TapGestureHandler_View {
//    @State var tap_count_1_figers_1: Tap_Count_1_Figers_1 = Tap_Count_1_Figers_1()
//    @State var tap_count_2_figers_1: Tap_Count_2_Figers_1 = Tap_Count_2_Figers_1()
//    @State var tap_count_1_figers_2: Tap_Count_1_Figers_2 = Tap_Count_1_Figers_2()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text("Tap_Count_1_Figers_1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.tap_count_1_figers_1)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("Tap_Count_2_Figers_1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.tap_count_2_figers_1)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("Tap_Count_1_Figers_2")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.tap_count_1_figers_2)
//            }
//        }
//    }
//}
//
//class LongPress_Default <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            LongPressGestureHandler()
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Default onAction")
//            })
//        )
//    }
//}
//
//class LongPress_Repeat_True <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            LongPressGestureHandler(repeat: true)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Repeat_True onAction")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Repeat_True onActionEnd")
//            })
//            .onActionCancel({ =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Repeat_True onActionCancel")
//            })
//        )
//    }
//}
//
//class LongPress_Repeat_False <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            LongPressGestureHandler(repeat: false)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Repeat_True onAction")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Repeat_True onActionEnd")
//            })
//        )
//    }
//}
//
//class LongPress_Duration_2000 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            LongPressGestureHandler(duration: 2000)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Duration_1000 onAction")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Duration_1000 onActionEnd")
//            })
//        )
//    }
//}
//
//class LongPress_Duration_Negative1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            LongPressGestureHandler(duration: -1)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Duration_Negative1 onAction")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "LongPress_Duration_Negative1 onActionEnd")
//            })
//        )
//    }
//}
//
//@Component
//class LongPressGestureHandler_View {
//    @State var longpress_default: LongPress_Default = LongPress_Default()
//    @State var longpress_repeat_true: LongPress_Repeat_True = LongPress_Repeat_True()
//    @State var longpress_repeat_false: LongPress_Repeat_False = LongPress_Repeat_False()
//    @State var longpress_duration_1000: LongPress_Duration_2000 = LongPress_Duration_2000()
//    @State var longpress_duration_negative1: LongPress_Duration_Negative1 = LongPress_Duration_Negative1()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text("LongPress_Default")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.longpress_default)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("LongPress_Repeat_True")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.longpress_repeat_true)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("LongPress_Repeat_False")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.longpress_repeat_false)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("LongPress_Duration_1000")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.longpress_duration_1000)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("LongPress_Duration_Negative1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.longpress_duration_negative1)
//            }
//        }
//    }
//}
//
//class Pan_Default <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PanGestureHandler()
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Default onActionStart")
//            })
//            .onActionUpdate({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Default onActionUpdate")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Default onActionEnd")
//            })
//            .onActionCancel({ =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Default onActionEnd")
//            })
//        )
//    }
//}
//
//class Pan_Finger_2 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PanGestureHandler(fingers: 2)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Finger_2 onActionStart")
//            })
//        )
//    }
//}
//
//class Pan_Horizontal <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PanGestureHandler(direction: PanDirection.Horizontal)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Horizontal onActionStart")
//            })
//        )
//    }
//}
//
//class Pan_Vertical <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PanGestureHandler(direction: PanDirection.Vertical)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Vertical onActionStart")
//            })
//        )
//    }
//}
//
//class Pan_Distance_50 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PanGestureHandler(distance: 50.0)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Distance_50 onActionStart")
//            })
//        )
//    }
//}
//
//class Pan_Distance_Negative_1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PanGestureHandler(distance: -1.0)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pan_Distance_Negative_1 onActionStart")
//            })
//        )
//    }
//}
//
//@Component
//class PanGestureHandler_View {
//    @State var pan_Default: Pan_Default = Pan_Default()
//    @State var pan_Finger_2: Pan_Finger_2 = Pan_Finger_2()
//    @State var pan_Horizontal: Pan_Horizontal = Pan_Horizontal()
//    @State var pan_Vertical: Pan_Vertical = Pan_Vertical()
//    @State var pan_Distance_50: Pan_Distance_50 = Pan_Distance_50()
//    @State var pan_Distance_Negative_1: Pan_Distance_Negative_1 = Pan_Distance_Negative_1()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text("Pan_Default")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pan_Default)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("Pan_Finger_2")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pan_Finger_2)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("Pan_Horizontal")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pan_Horizontal)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("pan_Vertical")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pan_Vertical)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("pan_Distance_50")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pan_Distance_50)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("pan_Distance_Negative_1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pan_Distance_Negative_1)
//            }
//        }
//    }
//}
//
//class Pinch_Default <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PinchGestureHandler()
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_Default onActionStart")
//            })
//            .onActionUpdate({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_Default onActionUpdate")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_Default onActionEnd")
//            })
//            .onActionCancel({ =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_Default onActionCancel")
//            })
//        )
//    }
//}
//
//class Pinch_Fingers_3 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PinchGestureHandler(fingers: 3)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_Default onActionStart")
//            })
//        )
//    }
//}
//
//class Pinch_distance_Negative_1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PinchGestureHandler(distance: -1.0)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_distance_Negative_1 onActionStart")
//            })
//        )
//    }
//}
//
//class Pinch_distance_10 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            PinchGestureHandler(distance: 10.0)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Pinch_distance_10 onActionStart")
//            })
//        )
//    }
//}
//
//@Component
//class PinchGestureHandler_View {
//    @State var pinch_Default: Pinch_Default = Pinch_Default()
//    @State var pinch_Fingers_3: Pinch_Fingers_3 = Pinch_Fingers_3()
//    @State var pinch_distance_Negative_1: Pinch_distance_Negative_1 = Pinch_distance_Negative_1()
//    @State var pinch_distance_10: Pinch_distance_10 = Pinch_distance_10()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text("pinch_Default")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(pinch_Default)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("pinch_Fingers_3")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(pinch_Fingers_3)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("pinch_distance_Negative_1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pinch_distance_Negative_1)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("pinch_distance_10")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.pinch_distance_10)
//            }
//        }
//    }
//}
//
//class Rotation_Default <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            RotationGestureHandler()
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Default onActionStart")
//            })
//            .onActionUpdate({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Default onActionUpdate")
//            })
//            .onActionEnd({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Default onActionEnd")
//            })
//            .onActionCancel({ =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Default onActionCancel")
//            })
//        )
//    }
//}
//
//class Rotation_Fingers_3 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            RotationGestureHandler(fingers: 3)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Fingers_3 onActionStart")
//            })
//        )
//    }
//}
//
//class Rotation_Angle_60 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            RotationGestureHandler(angle: 60.0)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Fingers_3 onActionStart")
//            })
//        )
//    }
//}
//
//class Rotation_Angle_Negative_1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            RotationGestureHandler(angle: -1.0)
//            .onActionStart({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Rotation_Angle_Negative_1 onActionStart")
//            })
//        )
//    }
//}
//
//@Component
//class RotationGestureHandler_View {
//    @State var rotation_Default: Rotation_Default = Rotation_Default()
//    @State var rotation_Fingers_3: Rotation_Fingers_3 = Rotation_Fingers_3()
//    @State var rotation_Angle_60: Rotation_Angle_60 = Rotation_Angle_60()
//    @State var rotation_Angle_Negative_1: Rotation_Angle_Negative_1 = Rotation_Angle_Negative_1()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text("rotation_Default")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(rotation_Default)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("rotation_Fingers_3")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(rotation_Fingers_3)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("rotation_Angle_60")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.rotation_Angle_60)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("rotation_Angle_Negative_1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.rotation_Angle_Negative_1)
//            }
//        }
//    }
//}
//
//class Swipe_Default <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler()
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_Default onAction")
//            })
//        )
//    }
//}
//
//class Swipe_Fingers_2 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler(fingers: 2)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_Default onAction")
//            })
//        )
//    }
//}
//
//class Swipe_Horizontal <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler(direction: SwipeDirection.Horizontal)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_Horizontal onAction")
//            })
//        )
//    }
//}
//
//class Swipe_Vertical <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler(direction: SwipeDirection.Vertical)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_Vertical onAction")
//            })
//        )
//    }
//}
//
//class Swipe_All <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler(direction: SwipeDirection.All)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_All onAction")
//            })
//        )
//    }
//}
//
//class Swipe_Speed_200 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler(speed: 200.0)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_Speed_200 onAction")
//            })
//        )
//    }
//}
//
//class Swipe_Negative_1 <: GestureModifier {
//    public func applyGesture(event: UIGestureEvent): Unit {
//        event.addGesture(
//            SwipeGestureHandler(speed: -1.0)
//            .onAction({ evt =>
//                Hilog.info(1,"1","Cangjie-App", "Swipe_Negative_1 onAction")
//            })
//        )
//    }
//}
//
//@Component
//class SwipeGestureHandler_View {
//    @State var swipe_Default: Swipe_Default = Swipe_Default()
//    @State var swipe_Fingers_2: Swipe_Fingers_2 = Swipe_Fingers_2()
//    @State var swipe_Horizontal: Swipe_Horizontal = Swipe_Horizontal()
//    @State var swipe_Vertical: Swipe_Vertical = Swipe_Vertical()
//    @State var swipe_All: Swipe_All = Swipe_All()
//    @State var swipe_Speed_200: Swipe_Speed_200 = Swipe_Speed_200()
//    @State var swipe_Negative_1: Swipe_Negative_1 = Swipe_Negative_1()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text("swipe_Default")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(swipe_Default)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("swipe_Fingers_2")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(swipe_Fingers_2)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("swipe_Horizontal")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.swipe_Horizontal)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("swipe_Vertical")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.swipe_Vertical)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("swipe_All")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.swipe_All)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("swipe_Speed_200")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.swipe_Speed_200)
//            }
//
//            ListItem() {
//                Column() {
//                    Text("swipe_Negative_1")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .gestureModifier(this.swipe_Negative_1)
//            }
//        }
//    }
//}
//
//@Component
//class GestureJudge_View {
//    @State var tag: String = "tagText"
//    @State var gestureType: String = "gestureTypeText"
//    @State var isSystemGesture: String = "isSystemGestureText"
//    @State var timestamp: String = "timestampText"
//    @State var source: String = "sourceText"
//    @State var pressure: String = "pressureText"
//    @State var tiltX: String = "tiltXText"
//    @State var tiltY: String = "tiltYText"
//    @State var sourceTool: String = "sourceToolText"
//    @State var target: String = "targetText"
//    @State var fingerList: String = "fingerListText"
//    @State var tapGestureOnAction: String = "tapGestureOnActionText"
//    @State var repeat: String = "repeatText"
//    @State var longPressGestureOnAction: String = "longPressGestureOnActionText"
//    @State var offsetX: String = "offsetXText"
//    @State var offsetY: String = "offsetYText"
//    @State var velocityX: String = "velocityXText"
//    @State var velocityY: String = "velocityYText"
//    @State var velocity: String = "velocityText"
//    @State var panGestureOnAction: String = "panGestureOnActionText"
//    @State var scale: String = "scaleText"
//    @State var pinchCenterX: String = "pinchCenterXText"
//    @State var pinchCenterY: String = "pinchCenterYText"
//    @State var pinchGestureOnAction: String = "pinchGestureOnActionText"
//    @State var rotationAngle: String = "rotationAngleText"
//    @State var rotationGestureOnAction: String = "rotationGestureOnActionText"
//    @State var swipeAngle: String = "swipeAngleText"
//    @State var speed: String = "speedText"
//    @State var swipeGestureOnAction: String = "swipeGestureOnActionText"
//    @State var deviceId: String = "deviceId"
//    let panGestureOptions: PanGestureOptions = PanGestureOptions()
//
//    func build() {
//        List() {
//            ListItem() {
//                Column() {
//                    Text(tag).fontSize(14).id("tagText")
//                    Text(gestureType).fontSize(14).id("gestureTypeText")
//                    Text(isSystemGesture).fontSize(14).id("isSystemGestureText")
//                    Text(timestamp).fontSize(14).id("timestampText")
//                    Text(source).fontSize(14).id("sourceText")
//                    Text(pressure).fontSize(14).id("pressureText")
//                    Text(tiltX).fontSize(14).id("tiltXText")
//                    Text(tiltY).fontSize(14).id("tiltYText")
//                    Text(sourceTool).fontSize(14).id("sourceToolText")
//                    Text(target).fontSize(14).id("targetText")
//                    Text(fingerList).fontSize(14).id("fingerListText")
//                    Text(deviceId).fontSize(14).id(deviceId)
//                }
//                .id("GestureJudge_Tap_CONTINUE")
//                .width(100.percent)
//                .height(200.vp)
//                .borderWidth(1)
//                .gesture(
//                    TapGesture()
//                    .tag("TagGesture_Default")
//                    .onAction({ evt =>
//                        tapGestureOnAction = "onAction"
//                    })
//                )
//                .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
//                    this.tag = gestureInfo.tag
//                    this.gestureType = gestureInfo.`type`.toString()
//                    this.isSystemGesture = gestureInfo.isSystemGesture.toString()
//                    this.timestamp = event.timestamp.toString()
//                    this.source = event.source.toString()
//                    this.pressure = event.pressure.toString()
//                    this.tiltX = event.tiltX.toString()
//                    this.tiltY = event.tiltY.toString()
//                    this.sourceTool = event.sourceTool.toString()
//                    this.target = event.target.toString()
//                    this.deviceId = event.deviceId.toString()
//                    for (finger in event.fingerList) {
//                        BaseLog.info("fingerinfo: ${finger.toString()}" )
//                    }
//
//                    return GestureJudgeResult.CONTINUE
//                })
//            }
//
//            ListItem() {
//                Column() {
//                    Text(longPressGestureOnAction).id("longPressGestureOnActionText")
//                    Text(repeat).id("repeatText")
//                }
//                .width(200.vp)
//                .height(80.vp)
//                .borderWidth(1)
//                .id("GestureJudge_LongPress_REJECT")
//                .gesture(
//                    LongPressGesture(repeat: true)
//                    .onAction({ evt =>
//                        longPressGestureOnAction = "onAction"
//                    })
//                )
//                .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
//                    if(event is LongPressGestureEvent) {
//                        let longPressGesture = (event as LongPressGestureEvent).getOrThrow()
//                        repeat = longPressGesture.repeat.toString()
//                    }
//                    return GestureJudgeResult.REJECT
//                })
//            }
//
//            ListItem() {
//                Column() {
//                    Text(panGestureOnAction).id("panGestureOnActionText")
//                    Text(offsetX).id("offsetXText")
//                    Text(offsetY).id("offsetYText")
//                    Text(velocityX).id("velocityXText")
//                    Text(velocityY).id("velocityYText")
//                    Text(velocity).id("velocityText")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .id("GestureJudge_Pan_CONTINUE")
//                .gesture(
//                    PanGesture(this.panGestureOptions)
//                    .onActionStart({ evt =>
//                        this.panGestureOptions.setDirection(PanDirection.Right)
//                        this.panGestureOptions.setDistance(5.0)
//                        this.panGestureOptions.setFingers(1)
//                        panGestureOnAction = "onActionStart"
//                    })
//                )
//                .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
//                    if(event is PanGestureEvent) {
//                        let panPressGesture = (event as PanGestureEvent).getOrThrow()
//                        offsetX = panPressGesture.offsetX.toString()
//                        offsetY = panPressGesture.offsetY.toString()
//                        velocityX = panPressGesture.velocityX.toString()
//                        velocityY = panPressGesture.velocityY.toString()
//                        velocity = panPressGesture.velocity.toString()
//                    }
//                    return GestureJudgeResult.CONTINUE
//                })
//            }
//
//            ListItem() {
//                Column() {
//                    Text(pinchGestureOnAction).id("pinchGestureOnActionText")
//                    Text(scale).id("scaleIdText")
//                    Text(pinchCenterX).id("pinchCenterXText")
//                    Text(pinchCenterY).id("pinchCenterYText")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .id("GestureJudge_Pinch_CONTINUE")
//                .gesture(
//                    PinchGesture()
//                    .onActionStart({ evt =>
//                        pinchGestureOnAction = "onActionStart"
//                    })
//                )
//                .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
//                    if(event is PinchGestureEvent) {
//                        let pinchGesture = (event as PinchGestureEvent).getOrThrow()
//                        scale = pinchGesture.scale.toString()
//                        pinchCenterX = pinchGesture.pinchCenterX.toString()
//                        pinchCenterY = pinchGesture.pinchCenterY.toString()
//                    }
//                    return GestureJudgeResult.CONTINUE
//                })
//            }
//
//            ListItem() {
//                Column() {
//                    Text(rotationGestureOnAction).id("rotationGestureOnActionText")
//                    Text(rotationAngle).id("rotationAngleText")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .id("GestureJudge_Rotation_CONTINUE")
//                .gesture(
//                    RotationGesture()
//                    .onActionStart({ evt =>
//                        rotationGestureOnAction = "onActionStart"
//                    })
//                )
//                .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
//                    if(event is RotationGestureEvent) {
//                        let rotationGesture = (event as RotationGestureEvent).getOrThrow()
//                        rotationAngle = rotationGesture.angle.toString()
//                    }
//                    return GestureJudgeResult.CONTINUE
//                })
//            }
//
//            ListItem() {
//                Column() {
//                    Text(swipeGestureOnAction).id("swipeGestureOnActionText")
//                    Text(swipeAngle).id("swipeAngleText")
//                    Text(speed).id("speedText")
//                }
//                .width(200.vp)
//                .height(120.vp)
//                .borderWidth(1)
//                .id("GestureJudge_Swipe_Continue")
//                .gesture(
//                    SwipeGesture()
//                    .onAction({ evt =>
//                        swipeGestureOnAction = "onAction"
//                    })
//                )
//                .onGestureJudgeBegin({ gestureInfo: GestureInfo, event: BaseGestureEvent =>
//                    if(event is SwipeGestureEvent) {
//                        let swipeGesture = (event as SwipeGestureEvent).getOrThrow()
//                        swipeAngle = swipeGesture.angle.toString()
//                        speed = swipeGesture.speed.toString()
//                    }
//                    return GestureJudgeResult.CONTINUE
//                })
//            }
//        }
//    }
//}
//
//@Entry
//@Component
//class View_Gesture {
//    @State var currentGesture: Int64 = 0;
//
//    func build() {
//        Column () {
//            Button ("Next Gesture")
//            .onClick({ e =>
//                currentGesture ++
//            }).id("NextButton")
//            if (currentGesture == TapGestureId) {
//                TapGesture_View()
//            } else if(currentGesture == LongPressGestureId) {
//                LongPressGesture_View()
//            } else if(currentGesture == PanGestureId) {
//                PanGesture_View()
//            } else if(currentGesture == PinchGestureId) {
//                PinchGesture_View()
//            } else if(currentGesture == RotateGestureId) {
//                RotationGesture_View()
//            } else if(currentGesture == SwipeGestureId) {
//                SwipeGesture_View()
//            } else if(currentGesture == BindGestureId) {
//                BindGesture_View()
//            } else if(currentGesture == GroupGestureId) {
//                GroupGesture_View()
//            } else if(currentGesture == GestureEventId) {
//                GestureEvent_View()
//            } else if(currentGesture == TapHandlerId) {
//                TapGestureHandler_View()
//            } else if(currentGesture == LongPressHandlerId) {
//                LongPressGestureHandler_View()
//            } else if(currentGesture == PanHandlerId) {
//                PanGestureHandler_View()
//            } else if(currentGesture == PinchHandlerId) {
//                PinchGestureHandler_View()
//            } else if(currentGesture == RotationHandlerId) {
//                RotationGestureHandler_View()
//            } else if(currentGesture == SwipeHandlerId) {
//                SwipeGestureHandler_View()
//            } else if(currentGesture == GestureJudgeId) {
//                GestureJudge_View()
//            } else {
//                Text("End")
//            }
//        }
//    }
//}
