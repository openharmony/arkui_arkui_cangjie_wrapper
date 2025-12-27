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
    } else {
        PageThree()
    }
}

@Entry
@Component
class ViewNavigation {
    @Provide
    var stack: NavPathStack = NavPathStack()

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
        }
        .title("PageHome")
        .navDestination(bind(pageMap, this))
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
                    this.stack.pushPathByName("pageTwo", "pageOne test")
                })
                .id("pageOneButton")
            }
            .width(100.percent)
            .height(50.percent)
        }
        .title("PageOne")
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
                    this.pathStack.pushPathByName("pageThree", "pageTwo test")
                })
                .id("pageTwoButton")
            }
            .width(100.percent)
            .height(50.percent)
        }
        .title("PageTwo")
        .id("navDestinationTwo")
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
class PageThree {
    private var pathStack: NavPathStack = NavPathStack()

    func build() {
        NavDestination() {
            Stack(alignContent: Alignment.Center) {
                Button("pop PageTwo", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .onClick({ evt =>
                    this.pathStack.pop()
                })
                .id("pageThree")
            }
            .width(100.percent)
            .height(50.percent)
        }
        .title("PageThree")
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