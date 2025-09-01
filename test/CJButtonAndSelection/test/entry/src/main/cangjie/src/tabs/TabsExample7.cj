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

package ohos_app_cangjie_entry.tabs

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

struct ItemType {
    public ItemType(public let text: String, public let backgroundColor: Color) {}
}

@Entry
@Component
class TabsExample7 {
    @State
    var data: Array<ItemType> = [
        ItemType('Red', Color(0xff0000)),
        ItemType('Yellow', Color(0xFFBF00)),
        ItemType('Blue', Color(0x007DFF))
    ]
    @State
    var opacityList: ObservedArrayList<Float64> = ObservedArrayList<Float64>([1.0, 1.0, 1.0])
    @State
    var scaleList: ObservedArrayList<Float32> = ObservedArrayList<Float32>([1.0, 1.0, 1.0])

    var durationList: Array<Int32> = Array<Int32>()
    var timeoutList: Array<Int32> = Array<Int32>()

    @State
    var barPositionDefaultValue: String = ""
    @State
    var indexDefaultValue: String = ""
    @State
    var verticalDefaultValue: String = ""
    @State
    var scrollableDefaultValue: String = ""
    @State
    var barModeDefaultValue: String = ""
    @State
    var barWidthDefaultValue: String = ""
    @State
    var tabsWidth: String = ""
    @State
    var barHeightDefaultValue: String = ""
    @State
    var animationDurationDefaultValue: String = ""
    @State
    var animationModeDefaultValue: String = ""
    @State
    var dividerDefaultValue: String = ""
    @State
    var fadingEdgeDefaultValue: String = ""
    @State
    var barOverlapDefaultValue: String = ""
    @State
    var barBackgroundColorDefaultValue: String = ""
    @State
    var barBackgroundBlurStyleDefaultValue: String = ""
    @State
    var barGridAlignDefaultValue: String = ""
    @State
    var edgeEffectDefaultValue: String = ""
    @State
    var barBackgroundEffectDefaultValue: String = ""

    @State
    var from: Int32 = 0;
    @State
    var to: Int32 = 0;
    @State
    var proxyFrom: Int32 = 0;
    @State
    var proxyTo: Int32 = 0;

    protected override func aboutToAppear() {
        this.durationList = [1000, 2000, 3000]
        this.timeoutList = [1000, 2000, 3000]
    }

    func build() {
        Column() {
            Tabs() {
                ForEach(this.data,
                    itemGeneratorFunc: {
                        item: ItemType, index: Int64 => TabContent() {}
                            .tabBar(item.text)
                            .backgroundColor(item.backgroundColor)
                            // 自定义动画变化透明度、缩放页面等
                            .opacity(this.opacityList[index])
                            .scale(x: this.scaleList[index], y: this.scaleList[index])
                    })
            }.id("TabsExample7").backgroundColor(0xf1f3f5).width(100.percent).height(200)

            Button("defaultValue:").id("defaultValue").onClick({
                e => setDefaultValue()
            })

            Text(this.barPositionDefaultValue).id("barPositionDefaultValue")
            Text(this.indexDefaultValue).id("indexDefaultValue")
            Text(this.verticalDefaultValue).id("verticalDefaultValue")
            Text(this.scrollableDefaultValue).id("scrollableDefaultValue")
            Text(this.barModeDefaultValue).id("barModeDefaultValue")
            Text(this.barWidthDefaultValue).id("barWidthDefaultValue")
            Text(this.tabsWidth).id("tabsWidth")
            Text(this.barHeightDefaultValue).id("barHeightDefaultValue")
            Text(this.animationDurationDefaultValue).id("animationDurationDefaultValue")
            Text(this.animationModeDefaultValue).id("animationModeDefaultValue")
            Text(this.dividerDefaultValue).id("dividerDefaultValue")
            Text(this.fadingEdgeDefaultValue).id("fadingEdgeDefaultValue")
            Text(this.barOverlapDefaultValue).id("barOverlapDefaultValue")
            Text(this.barBackgroundColorDefaultValue).id("barBackgroundColorDefaultValue")
            Text(this.barBackgroundBlurStyleDefaultValue).id("barBackgroundBlurStyleDefaultValue")
            Text(this.barGridAlignDefaultValue).id("barGridAlignDefaultValue")
            Text(this.edgeEffectDefaultValue).id("edgeEffectDefaultValue")
            Text(this.barBackgroundEffectDefaultValue).id("barBackgroundEffectDefaultValue")

            Text("${this.from}").id("from")
            Text("${this.to}").id("to")
            Text("${this.proxyFrom}").id("proxyFrom")
            Text("${this.proxyTo}").id("proxyTo")
        }
    }

    func setDefaultValue() {
        this.barPositionDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barPosition")
            .getOrThrow()
            .toString()
        this.indexDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("index")
            .getOrThrow()
            .toString()
        this.verticalDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("vertical")
            .getOrThrow()
            .toString()
        this.scrollableDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("scrollable")
            .getOrThrow()
            .toString()
        this.barModeDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barMode")
            .getOrThrow()
            .toString()
        this.barWidthDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barWidth")
            .getOrThrow()
            .toString()
        this.tabsWidth = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("width")
            .getOrThrow()
            .toString()
        this.barHeightDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barHeight")
            .getOrThrow()
            .toString()
        this.animationDurationDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("animationDuration")
            .getOrThrow()
            .toString()
        this.animationModeDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("animationMode")
            .getOrThrow()
            .toString()
        this.dividerDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("divider")
            .getOrThrow()
            .toString()
        this.fadingEdgeDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("fadingEdge")
            .getOrThrow()
            .toString()
        this.barOverlapDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barOverlap")
            .getOrThrow()
            .toString()
        this.barBackgroundColorDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barBackgroundColor")
            .getOrThrow()
            .toString()
        this.barBackgroundBlurStyleDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barBackgroundBlurStyle")
            .getOrThrow()
            .toString()
        this.barGridAlignDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barGridAlign")
            .getOrThrow()
            .toString()
        this.edgeEffectDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("edgeEffect")
            .getOrThrow()
            .toString()
        this.barBackgroundEffectDefaultValue = JsonValue
            .fromStr(getInspectorByKey('TabsExample7'))
            .asObject()
            .get("$attrs")
            .getOrThrow()
            .asObject()
            .get("barBackgroundEffect")
            .getOrThrow()
            .toString()
    }
}
