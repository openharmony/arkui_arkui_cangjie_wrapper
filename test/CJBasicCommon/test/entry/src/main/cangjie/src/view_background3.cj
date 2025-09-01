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
class View_Background3 {
    func build() {
        Column {
            Column {
                Row {
                    Text("Thin Material")
                }.width(50.percent).height(50.percent)
            }.height(50.percent).width(100.percent).backgroundImageSize(ImageSize.Cover)

            Text("测试backgroundBlurStyle")
                //            .size(width:100.percent,height:100.percent)
                .backgroundImage(@r(app.media.media1)).id("background_id_01")

            Text("测试backgroundBrightness").id("background_id_02")

            Text("测试backgroundBrightness")

            // foregroundBlurStyleTest
            Text("测试fourgroundblurstyle")
            Text("foregroundBlurStyleTest1").foregroundBlurStyle(BlurStyle.Thin)
            Text("foregroundBlurStyleTest2").foregroundBlurStyle(BlurStyle.Thick)
            Text("foregroundBlurStyleTest3").foregroundBlurStyle(BlurStyle.BackgroundRegular)
            Text("foregroundBlurStyleTest4").foregroundBlurStyle(BlurStyle.ComponentThick)
            Text("foregroundBlurStyleTest5").foregroundBlurStyle(BlurStyle.None)
            Text("foregroundBlurStyleTest6").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light))
            Text("foregroundBlurStyleTest7").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Dark))
            Text("foregroundBlurStyleTest7").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.System))
            Text("foregroundBlurStyleTest8").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default))
            Text("foregroundBlurStyleTest9").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Average))
            Text("foregroundBlurStyleTest10")
                .fontColor(Color.Red)
                .foregroundBlurStyle(BlurStyle.Thin,
                    ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Average))
            Text("foregroundBlurStyleTest11").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default,
                    blurOptions: BlurOptions([0.0, 0.0])))
            Text("foregroundBlurStyleTest12").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default,
                    blurOptions: BlurOptions([33.0, 33.0])))
            Text("foregroundBlurStyleTest13").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default,
                    blurOptions: BlurOptions([100.0, 100.0])))
            Text("foregroundBlurStyleTest14").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default,
                    blurOptions: BlurOptions([0.0, 0.0]), scale: 0.1))
            Text("foregroundBlurStyleTest15").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default,
                    blurOptions: BlurOptions([0.0, 0.0]), scale: 0.5))
            Text("foregroundBlurStyleTest16").foregroundBlurStyle(BlurStyle.Thin,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default,
                    blurOptions: BlurOptions([0.0, 0.0]), scale: 1.0))

            Button("打印Background属性").onClick {
                e =>
                let c_id = "background_id_02"

                let Inspector = getInspectorByKey(c_id)
                let obj = JsonValue.fromStr(Inspector).asObject().get("$attrs").getOrThrow().asObject()

                let backgroundBlurStyle = getTextFromJSonObj(obj, "backgroundBlurStyle")
                Hilog.info(1, "1", "Cangjie-App", backgroundBlurStyle)
            }
        }
    }
    func getTextFromJSonObj(obj: JsonObject, attr_name: String): String {
        let value = obj.get(attr_name).getOrThrow().toString()
        let texts = "getText11,${attr_name}: ${value}\n"
        texts
    }
}
