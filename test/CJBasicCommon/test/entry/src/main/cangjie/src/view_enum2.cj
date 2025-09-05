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
 * Created on 2025/7/22
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
import std.collection.*

@Entry
@Component
class ViewEnum2 {
    func build() {
        Column(space: 10) {
            EnumSon2()
            EnumTypes2()
        }
    }
}

@Component
class EnumTypes2 {
    // PanDirection
    var panDirection1: PanDirection = PanDirection.Computed(1)

    // SourceTool
    var sourceTool1: SourceTool = SourceTool.Unknown
    var sourceTool2: SourceTool = SourceTool.Pen
    var sourceTool3: SourceTool = SourceTool.Mouse
    var sourceTool4: SourceTool = SourceTool.Touchpad
    var sourceTool5: SourceTool = SourceTool.Joystick

    // ScrollSource 
    // 滚动操作的来源
    var scrollSource1: ScrollSource = ScrollSource.ScrollBar // 拖拽事件
    var scrollSource2: ScrollSource = ScrollSource.ScrollBarFling // 惯性滑动

    // TitleHeight
    var titleHeight1: TitleHeight = TitleHeight.MainWithSub

    @Builder
    func tempBuilder() {
        Text("tempBuilder")
    }

    var arr: ObservedArrayList<String> = ObservedArrayList<String>(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])

    @State
    var text2: String = ""

    func build() {
        Column {
            Text("APILevel19 Enum Types")
            Button("panDirection1").onClick{ e =>

            }.id("panDirection1")

            Button("sourceTool").onClick{ e =>
                var p1 = Area(30.0, 30.0, Position(x: 200.0, y: 200.0), Position(x: 200.0, y: 200.0))
                var v1 = EventTarget(p1)
                var v2 = SourceType.TouchScreen
            }.id("sourceTool1")

            Scroll() {
                Column {
                    ForEach(
                        this.arr,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 => Text(item)
                                .width(90.percent)
                                .height(150)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(15)
                                .textAlign(TextAlign.Center)
                                .fontSize(16)
                                .margin(top: 10)
                        }
                    )
                }
            }.onWillScroll({
                v1,v2,v3 =>
                match(v3) {
                    case ScrollSource.ScrollBar => Hilog.info(1, "Cangjie-App", "scrollSource == SCROLL_BAR")
                    case ScrollSource.ScrollBarFling => Hilog.info(1, "Cangjie-App", "scrollSource == SCROLL_BAR_FLING")
                    case _ => Hilog.info(1, "Cangjie-App", "scrollSource == unmatched type")
                }
                ()
            })
        }
    }
}

@Component
class EnumSon2{
    @State
    var clickCount: Int32 = 0
    func build(){
        Column {
            Text("${clickCount}").id("enumClickCount")
            Row{
                Button("menuPreviewMode").onClick{ e =>
                    clickCount++
                }.width(20.percent).height(20).id("menuPreviewMode")

                Button("panDirection").onClick{ e =>
                    var t: PanDirection = PanDirection.Computed(1)
                    clickCount++
                }.width(20.percent).height(20).id("panDirection")

                Button("sourceTool").onClick{ e =>
                    var t: SourceTool = SourceTool.Unknown
                    t = SourceTool.Pen
                    t = SourceTool.Mouse
                    t = SourceTool.Touchpad
                    t = SourceTool.Joystick
                    clickCount++
                }.width(20.percent).height(20).id("sourceTool")

                Button("scrollSource").onClick{ e =>
                    var t: ScrollSource = ScrollSource.ScrollBar
                    t = ScrollSource.ScrollBarFling
                    clickCount++
                }.width(20.percent).height(20).id("scrollSource")
            }
            Row{
                Button("week").onClick{ e =>
                    clickCount++
                }.width(20.percent).height(20).id("week")

                Button("titleHeight").onClick{ e =>
                    var t: TitleHeight = TitleHeight.MainWithSub
                    clickCount++
                }.width(20.percent).height(20).id("titleHeight")
            }
            Row{
                Button("foldStatus").onClick{ e =>
                    clickCount++
                }.width(20.percent).height(20).id("foldStatus")
            }
            Row{
                Button("layoutSafeAreaType").onClick{ e =>
                    clickCount++
                }.width(20.percent).height(20).id("layoutSafeAreaType")
            }
            Row{
                Button("richEditorResponseType").onClick{ e =>
                    clickCount++
                }.width(20.percent).height(20).id("richEditorResponseType")
            }
        }
    }
}