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
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

let emptybarrierstyle: Array<BarrierStyle> = []
let emptyguideline: Array<GuideLineStyle> = []

@Entry
@Component
class View_Relative_Container {
    func build() {
        Scroll() {
            Column() {
                RelativeContainer() {
                    Row() {
                        Text("Row1")
                    }
                        .width(100.px)
                        .height(100.px)
                        .alignRules(AlignRuleOption(top: VerticalAlignment("guideline1", VerticalAlign.Top),))
                        .backgroundColor(0xff3333)
                        .id("row1")
                }
                    .id("relative1")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .guideLine([GuideLineStyle("guideline1", Axis.Horizontal, GuideLinePosition(start: 100.px))])

                RelativeContainer() {
                    Row() {
                        Text("Row2")
                    }
                        .width(100.px)
                        .height(100.px)
                        .alignRules(AlignRuleOption(left: HorizontalAlignment("guideline2", HorizontalAlign.End),))
                        .backgroundColor(0xff3333)
                        .id("row2")
                }
                    .id("relative2")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .guideLine([GuideLineStyle("guideline2", Axis.Vertical, GuideLinePosition(start: 100.px))])

                RelativeContainer() {
                    Row() {
                        Text("Row3")
                    }
                        .width(100.px)
                        .height(100.px)
                        .alignRules(AlignRuleOption(top: VerticalAlignment("guideline3", VerticalAlign.Top),))
                        .backgroundColor(0xff3333)
                        .id("row3")
                }
                    .id("relative3")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .guideLine([GuideLineStyle("guideline3", Axis.Horizontal, GuideLinePosition(end: 100.px))])

                RelativeContainer() {
                    Row() {
                        Text("Row4")
                    }
                        .width(100.px)
                        .height(100.px)
                        .alignRules(AlignRuleOption(left: HorizontalAlignment("guideline4", HorizontalAlign.End),))
                        .backgroundColor(0xff3333)
                        .id("row4")
                }
                    .id("relative4")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .guideLine([GuideLineStyle("guideline4", Axis.Vertical, GuideLinePosition(end: 100.px))])

                RelativeContainer() {
                    Row() {
                        Text("Row5")
                    }.width(100.px).height(100.px).backgroundColor(0xff3333).id("row5")

                    Row() {
                        Text("Row6")
                    }
                        .width(100.px)
                        .height(100.px)
                        .backgroundColor(0xFFCC00)
                        .alignRules(AlignRuleOption(left: HorizontalAlignment("barrier1", HorizontalAlign.End)))
                        .id("row6")
                }
                    .id("relative5")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .barrier([BarrierStyle("barrier1", BarrierDirection.LEFT, ["row5"])])

                RelativeContainer() {
                    Row() {
                        Text("Row7")
                    }.width(100.px).height(100.px).backgroundColor(0xff3333).id("row7")

                    Row() {
                        Text("Row8")
                    }
                        .width(100.px)
                        .height(100.px)
                        .backgroundColor(0xFFCC00)
                        .alignRules(AlignRuleOption(left: HorizontalAlignment("barrier2", HorizontalAlign.End)))
                        .id("row8")
                }
                    .id("relative6")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .barrier([BarrierStyle("barrier2", BarrierDirection.RIGHT, ["row7"])])

                RelativeContainer() {
                    Row() {
                        Text("Row9")
                    }.width(100.px).height(100.px).backgroundColor(0xff3333).id("row9")

                    Row() {
                        Text("Row10")
                    }
                        .width(100.px)
                        .height(100.px)
                        .backgroundColor(0xFFCC00)
                        .alignRules(AlignRuleOption(top: VerticalAlignment("barrier3", VerticalAlign.Bottom)))
                        .id("row10")
                }
                    .id("relative7")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .barrier([BarrierStyle("barrier3", BarrierDirection.TOP, ["row9"])])

                RelativeContainer() {
                    Row() {
                        Text("Row11")
                    }.width(100.px).height(100.px).backgroundColor(0xff3333).id("row11")

                    Row() {
                        Text("Row12")
                    }
                        .width(100.px)
                        .height(100.px)
                        .backgroundColor(0xFFCC00)
                        .alignRules(AlignRuleOption(top: VerticalAlignment("barrier4", VerticalAlign.Bottom)))
                        .id("row12")
                }
                    .id("relative8")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .barrier([BarrierStyle("barrier4", BarrierDirection.BOTTOM, ["row11"])])

                RelativeContainer() {
                    Row() {
                        Text("Row13")
                    }
                        .width(100.px)
                        .height(100.px)
                        .alignRules(
                            AlignRuleOption(
                                top: VerticalAlignment("guideline5", VerticalAlign.Top),
                                left: HorizontalAlignment("guideline6", HorizontalAlign.End)
                            )
                        )
                        .backgroundColor(0xff3333)
                        .id("row13")
                }
                    .id("relative9")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .guideLine(
                        [
                            GuideLineStyle("guideline5", Axis.Horizontal, GuideLinePosition(start: 100.px)),
                            GuideLineStyle("guideline6", Axis.Vertical, GuideLinePosition(start: 100.px))
                        ]
                    )

                RelativeContainer() {
                    Row() {
                        Text("row17")
                    }.width(100.px).height(100.px).backgroundColor(0xff3333).id("row17")

                    Row() {
                        Text("row18")
                    }
                        .width(100.px)
                        .height(100.px)
                        .backgroundColor(0xFFCC00)
                        .alignRules(
                            AlignRuleOption(
                                top: VerticalAlignment("row17", VerticalAlign.Bottom),
                                middle: HorizontalAlignment("row17", HorizontalAlign.End)
                            )
                        )
                        .id("row18")

                    Row() {
                        Text("row19")
                    }
                        .height(100.px)
                        .width(100.px)
                        .backgroundColor(0xFF6633)
                        .alignRules(
                            AlignRuleOption(
                                top: VerticalAlignment("row17", VerticalAlign.Top),
                                left: HorizontalAlignment("barrier5", HorizontalAlign.End)
                            )
                        )
                        .id("row19")

                    Row() {
                        Text("row20")
                    }
                        .width(100.px)
                        .height(100.px)
                        .backgroundColor(0xFF9966)
                        .alignRules(
                            AlignRuleOption(
                                top: VerticalAlignment("barrier6", VerticalAlign.Bottom),
                                left: HorizontalAlignment("row17", HorizontalAlign.Start),
                            )
                        )
                        .id("row20")
                }
                    .id("relative10")
                    .width(400.px)
                    .height(400.px)
                    .backgroundColor(0xDDDDDD)
                    .barrier(
                        [
                            BarrierStyle("barrier5", BarrierDirection.RIGHT, ["row17", "row18"]),
                            BarrierStyle("barrier6", BarrierDirection.BOTTOM, ["row17", "row18"])
                        ]
                    )

                RelativeContainer() {
                    Row() {
                        Text("row21")
                    }.width(300.px).height(300.px).backgroundColor(0xFF9966).id("row21")

                    Row() {
                        Text("row22")
                    }.width(200.px).height(200.px).backgroundColor(0xff3333).id("row22")
                }.id("relative11").width(400.px).height(400.px).backgroundColor(0xDDDDDD)

                RelativeContainer()
                    .width(100.px)
                    .height(100.px)
                    .backgroundColor(0xDDDDDD)
                    .id('relative12_1')
                    .barrier(emptybarrierstyle)
                RelativeContainer()
                    .width(100.px)
                    .height(100.px)
                    .backgroundColor(0xDDDDDD)
                    .id('relative12_2')
                    .guideLine(emptyguideline)
            }.width(100.percent).alignItems(HorizontalAlign.Start)
        }.height(100.percent).width(100.percent)
    }
}
