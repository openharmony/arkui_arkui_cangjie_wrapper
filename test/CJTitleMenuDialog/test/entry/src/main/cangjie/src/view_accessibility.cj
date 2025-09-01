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
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import ohos.resource_manager.{AppResource}

@Entry
@Component
class View_Accessibility {
    @Builder
    func customAccessibilityNode() {
        Text("虚拟节点")
    }

    func build() {
        Column {
            Column {
                Text("文本1").fontSize(50).fontWeight(FontWeight.Bold)
                Text("文本2").fontSize(50).fontWeight(FontWeight.Bold)
            //                    .accessibilityText("内部")
            }.width(100.percent)
                //                .accessibilityGroup(true)  // 设置成false: 点Text读Text，点外面空白区域读Column的；设置成true: 当成整体，点Text也读Column的，不读Text内部的（如果Column自己没有accessibilityText，才念内部Text的）
                //                .accessibilityLevel("yes") // yes,no,no-hide-descendants都生效  // 设置成no就不会朗读，不会有绿色选中
                //                .accessibilityText("分组")
                //                .accessibilityDescription("Column组件可以被选中，播报的内容是“分组”")
                //                .accessibilityTextHint("TextHint")
                .id("accessibility_id")
            Column {}.width(100.percent).height(50.vp).backgroundColor(Color.Red)
                //                .accessibilityText(@r(app.string.contentName1))
                //                .accessibilityDescription(@r(app.string.contentName))
                //                .accessibilityLevel("hi") // 异常值测验
                //                .accessibilityVirtualNode({=> customAccessibilityNode}) //打印出来是false

                .id("accessibility_id2")
            Button("PrintAccessibilityAttr1").onClick {
                e =>
                let c_id = "accessibility_id"

                let Inspector = getInspectorByKey(c_id)
                let obj = JsonValue.fromStr(Inspector).asObject().get("$attrs").getOrThrow().asObject()

                let des = getTextFromJSonObj(obj, "accessibilityDescription")
                Hilog.info(1, "1", "1", des)

                let ttt = getTextFromJSonObj(obj, "accessibilityText")
                Hilog.info(1, "1", "1", ttt)

                let group = getTextFromJSonObj(obj, "accessibilityGroup")
                Hilog.info(1, "1", "1", group)

                let level = getTextFromJSonObj(obj, "accessibilityLevel")
                Hilog.info(1, "1", "1", level)

                let textHint = getTextFromJSonObj(obj, "accessibilityTextHint")
                Hilog.info(1, "1", "1", textHint)

                let accessibilityVirtualNode = getTextFromJSonObj(obj, "accessibilityVirtualNode")
                Hilog.info(1, "1", "1", accessibilityVirtualNode)
            }

            Button("PrintAccessibilityAttr2").onClick {
                e =>
                let c_id = "accessibility_id2"

                let Inspector = getInspectorByKey(c_id)
                let obj = JsonValue.fromStr(Inspector).asObject().get("$attrs").getOrThrow().asObject()

                let accessibilityText = getTextFromJSonObj(obj, "accessibilityText")
                Hilog.info(1, "1", "1", accessibilityText)

                let des = getTextFromJSonObj(obj, "accessibilityDescription")
                Hilog.info(1, "1", "1", des)

                let accessibilityVirtualNode = getTextFromJSonObj(obj, "accessibilityVirtualNode")
                Hilog.info(1, "1", "1", accessibilityVirtualNode)
            }
        }.height(100.percent)
    }

    func getTextFromJSonObj(obj: JsonObject, attr_name: String): String {
        let value = obj.get(attr_name).getOrThrow().toString()
        let texts = "getText11,${attr_name}: ${value}\n"
        texts
    }
}
