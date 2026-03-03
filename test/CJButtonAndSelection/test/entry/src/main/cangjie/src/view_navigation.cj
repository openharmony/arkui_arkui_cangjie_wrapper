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

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Builder
func pageMap(name: String, param: Any) {
    if (name == "pageOne") {
        PageOne()
    } else if (name == "pageTwo") {
        PageTwo()
    } else if (name == "pageThree"){
        PageThree()
    } else if (name == "pageFour"){
        PageFour()
    } else {
        PageFive()
    }
}

@Entry
@Component
class ViewNavigation {
    @Provide
    var stack: NavPathStack = NavPathStack()

    @Builder
    func childNavigationTitle() {
        Text("ChildNavigation1")
          .fontSize(20)
          .height(30)
          .fontWeight(FontWeight.Bold)
          .width(100.percent)
          .padding(left: 16, right: 16)
    }

    func build() {
        Navigation(this.stack) {
            Stack(alignContent: Alignment.Center) {
                Button("push PageOne", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .onClick({ evt =>
                    this.stack.pushPath(NavPathInfo(name: "pageOne", param: "pageOne test"))
                })
                .id("pageHomeButton")
            }
            .width(100.percent)
            .height(50.percent)
            Navigation()
                .title({=> bind(this.childNavigationTitle, this)()},
                    options: NavigationTitleOptions(
                        backgroundColor: Color.Green,
                        backgroundBlurStyle: BlurStyle.ComponentThick,
                        barStyle: BarStyle.Standard,
                        paddingStart: 20,
                        paddingEnd: 100))
                .hideTitleBar(Option.None)
                .id("childNavigation1")
            Navigation()
                .title(Option<CustomBuilder>.None, options: Option.None)
                .hideTitleBar(true, animated: true)
                .id("childNavigation2")
            Navigation()
                .title(Option<ResourceStr>.None)
                .id("childNavigation3")
        }
        .title("PageHome", options: NavigationTitleOptions(
                        backgroundColor: Color.Green,
                        backgroundBlurStyle: BlurStyle.ComponentThick,
                        barStyle: BarStyle.Standard,
                        paddingStart: 20,
                        paddingEnd: 100))
        .navDestination(bind(pageMap, this))
        .id("parentNavigation")
    }
}

@Component
class PageOne {
    @Consume
    var stack: NavPathStack

    func build() {
        NavDestination() {
            Stack(alignContent: Alignment.Center) {
                Button("push PageTwo", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .onClick({ evt =>
                    this.stack.pushPathByName("pageTwo", "pageTwo test")
                })
                .id("pageOneButton")
            }
            .width(100.percent)
            .height(50.percent)
        }
        .title("PageOne", options: NavigationTitleOptions(backgroundColor: Color.Blue, backgroundBlurStyle: BlurStyle.Thin, barStyle: BarStyle.Stack, paddingStart: 20.vp, paddingEnd: 90.vp))
        .hideTitleBar(Option.None)
        .backgroundColor(Color.Red)
        .id("navDestinationOne")
    }
}

@Component
class PageTwo {
    private var pathStack: NavPathStack = NavPathStack()

    func build() {
        NavDestination() {
            Stack(alignContent: Alignment.Center) {
                Button("push PageThree", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .onClick({ evt =>
                    this.pathStack.pushPathByName("pageThree", "pageThree test")
                })
                .id("pageTwoButton")
            }
            .width(100.percent)
            .height(50.percent)
        }
        .title(Option<ResourceStr>.None)
        .id("navDestinationTwo")
        .onReady({ context =>
            this.pathStack = context.pathStack
        })
        .onBackPressed({ =>
            this.pathStack.pop(animated: false)
            return true
        })
    }
}

@Component
class PageThree {
    private var pathStack: NavPathStack = NavPathStack()

    func build() {
        NavDestination() {
            Column() {
                Button("pop PageTwo", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .margin(10)
                .onClick({ evt =>
                    this.pathStack.pop()
                })
                .id("pageThreePopTwoButton")
                Button("push PageFour", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .margin(10)
                .onClick({ evt =>
                    this.pathStack.pushPathByName("pageFour", "pageThree test")
                })
                .id("pageThreePushFourButton")
            }
            .justifyContent(FlexAlign.Center)
            .width(100.percent)
            .height(50.percent)
        }
        .title("PageThree")
        .hideTitleBar(true)
        .id("navDestinationThree")
        .backgroundColor(Option<ResourceColor>.None)
        .onReady({ context =>
            this.pathStack = context.pathStack
        })
        .onBackPressed({ =>
            this.pathStack.pop()
            return true
        })
    }
}

@Component
class PageFour {
    private var pathStack: NavPathStack = NavPathStack()

    @Builder
    func pageFourTitle() {
        Text("PageFour")
          .fontSize(20)
          .height(55)
          .fontWeight(FontWeight.Bold)
          .width(100.percent)
          .padding(left: 16, right: 16)
    }

    func build() {
        NavDestination() {
            Column() {
                Button("pop PageThree", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .margin(10)
                .onClick({ evt =>
                    this.pathStack.pop()
                })
                .id("pageFourPopThreeButton")
                Button("push PageFive", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .margin(10)
                .onClick({ evt =>
                    this.pathStack.pushPathByName("pageFive", "pageFive test")
                })
                .id("pageThreePushFiveButton")
            }
            .justifyContent(FlexAlign.Center)
            .width(100.percent)
            .height(50.percent)
        }
        .title({=> bind(this.pageFourTitle, this)()}, options: NavigationTitleOptions(backgroundColor: Color.Green, backgroundBlurStyle: BlurStyle.Thick, barStyle: BarStyle.Standard, paddingStart: 20.vp, paddingEnd: 90.vp))
        .id("navDestinationFour")
        .hideTitleBar(false)
        .backgroundColor(Option<ResourceColor>.None)
        .onReady({ context =>
            this.pathStack = context.pathStack
        })
        .onBackPressed({ =>
            this.pathStack.pop()
            return true
        })
    }
}

@Component
class PageFive {
    private var pathStack: NavPathStack = NavPathStack()

    func build() {
        NavDestination() {
            Stack(alignContent: Alignment.Center) {
                Button("pop PageFour", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .onClick({ evt =>
                    this.pathStack.pop()
                })
                .id("pageFivePopFourButton")
            }
            .width(100.percent)
            .height(50.percent)
        }
        .title(Option<CustomBuilder>.None)
        .id("navDestinationFive")
        .backgroundColor(Option<ResourceColor>.None)
        .onReady({ context =>
            this.pathStack = context.pathStack
        })
        .onBackPressed({ =>
            this.pathStack.pop()
            return true
        })
    }
}