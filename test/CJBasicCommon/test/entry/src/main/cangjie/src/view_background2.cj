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

internal import ohos.base.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import std.unittest.fail
import ohos.resource_manager.{AppResource, __GenerateResource__}

@Entry
@Component
class View_Background2 {
    @Builder
    public func renderBackground() {
        Column() {
            Image(@r(app.media.background))
        }
    }

    func build() {
        Row {
            Column {
                Button("PrintBackgroundAttr").onClick {
                    e =>
                    let c_id = "background_id_01"

                    let Inspector = getInspectorByKey(c_id)
                    let obj = JsonValue.fromStr(Inspector).asObject().get("$attrs").getOrThrow().asObject()
                    Hilog.info(1, "1", "Cangjie-App", obj.toString().split("direction")[1])
                    let backgroundBlurStyle = getTextFromJSonObj(obj, "backgroundBlurStyle")
                    Hilog.info(1, "1", "Cangjie-App", backgroundBlurStyle)

                    let backgroundBrightness = getTextFromJSonObj(obj, "BackgroundBrightness")
                    Hilog.info(1, "1", "Cangjie-App", backgroundBrightness)

                    let backgroundEffect = getTextFromJSonObj(obj, "backgroundEffect")
                    Hilog.info(1, "1", "Cangjie-App", backgroundEffect)

                    let backgroundImageResizable = getTextFromJSonObj(obj, "backgroundImageResizable")
                    Hilog.info(1, "1", "Cangjie-App", backgroundImageResizable)

                    //                    let background = getTextFromJSonObj(obj, "background")
                    //                    Hilog.info(1,"1","Cangjie-App", background)
                }
            }.width(100.percent)
        }.height(100.percent)
    }

    func getTextFromJSonObj(obj: JsonObject, attr_name: String): String {
        let value = obj.get(attr_name).getOrThrow().toString()
        let texts = "getText11,${attr_name}: ${value}\n"
        texts
    }
}
