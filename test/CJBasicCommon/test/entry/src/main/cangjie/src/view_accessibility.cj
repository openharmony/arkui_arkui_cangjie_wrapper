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
class ViewAccessibility {
    @Builder
    func customAccessibilityNode() {
        Text("虚拟节点")
    }

    func build() {
        Column {
            Column {
                Text("文本1")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                Text("文本2")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
            }
                .width(100.percent)
                .id("accessibility_id")
            Column {}
                .width(100.percent)
                .height(50.vp)
                .backgroundColor(Color.Red)

                .id("accessibility_id2")
            Button("PrintAccessibilityAttr1").onClick { e =>
                let c_id = "accessibility_id"

                let Inspector = getInspectorByKey(c_id)
                let obj = JsonValue
                    .fromStr(Inspector)
                    .asObject()
                    .get("$attrs")
                    .getOrThrow()
                    .asObject()

                let des = getTextFromJSonObj(obj, "accessibilityDescription")
                Hilog.info(1, "Cangjie-App", des)

                let ttt = getTextFromJSonObj(obj, "accessibilityText")
                Hilog.info(1, "Cangjie-App", ttt)

                let group = getTextFromJSonObj(obj, "accessibilityGroup")
                Hilog.info(1, "Cangjie-App", group)
            }

            Button("PrintAccessibilityAttr2").onClick { e =>
                let c_id = "accessibility_id2"

                let Inspector = getInspectorByKey(c_id)
                let obj = JsonValue
                    .fromStr(Inspector)
                    .asObject()
                    .get("$attrs")
                    .getOrThrow()
                    .asObject()

                let accessibilityText = getTextFromJSonObj(obj, "accessibilityText")
                Hilog.info(1, "Cangjie-App", accessibilityText)

                let des = getTextFromJSonObj(obj, "accessibilityDescription")
                Hilog.info(1, "Cangjie-App", des)

                let accessibilityVirtualNode = getTextFromJSonObj(obj, "accessibilityVirtualNode")
                Hilog.info(1, "Cangjie-App", accessibilityVirtualNode)
            }
        }.height(100.percent)
    }

    func getTextFromJSonObj(obj: JsonObject, attr_name: String): String {
        let value = obj
            .get(attr_name)
            .getOrThrow()
            .toString()
        let texts = "getText11,${attr_name}: ${value}\n"
        texts
    }
}
