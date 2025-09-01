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

func parseBool(x: Bool): String {
    if (x == true) {
        return "true"
    }
    "false"
}

func parseColor(color: ColorMode): String {
    return match (color) {
        case ColorMode.Light => "Light"
        case _ => "Dark"
    }
}

func parseLayout(layout: LayoutDirection): String {
    return match (layout) {
        case LayoutDirection.Ltr => "Ltr"
        case _ => "Rtl"
    }
}

@Entry
@Component
// TODO Environment.cj
// 模拟步进测试@StorageProp注解功能
// 回退
// fontScale取消注释后报错文件在桌面t.txt
class View_Environment {
    let d0 = Environment.aboutToBeDeleted()
    // 初始化 清除应用AppStorage
    let d1 = AppStorage.delete("accessibilityEnabled")
    let d2 = AppStorage.delete("colorMode")
    //    let d3 = AppStorage.delete("fontScale")
    //    let d4 = AppStorage.delete("fontWeightScale")
    let d5 = AppStorage.delete("layoutDirection")
    let d6 = AppStorage.delete("languageCode")

    // 都是 true
    let SysAccessibilityEnabled = Environment.envProp<Bool>("accessibilityEnabled", false)
    let SysAccessibilityEnabled2 = Environment.envProp<Bool>("accessibilityEnabled", false)
    let SysColorMode = Environment.envProp<ColorMode>("colorMode", ColorMode.Light)
    let SysFontScale = Environment.envProp<Float64>("fontScale", 1.30)
    let SysFontWeightScale = Environment.envProp<Float64>("fontWeightScale", 1.40)
    let SysLayoutDirection = Environment.envProp<LayoutDirection>("layoutDirection", LayoutDirection.Ltr)
    let SysLanguageCode = Environment.envProp<String>("languageCode", "en")
    // 失配 false
    let SysInvalidKey = Environment.envProp<String>("InvalidKey", "-")

    // @StorageProp 链接到 Component
    // 注释关联的 环境参数可以在本地更改，但不能同步回 AppStorage，环境变量参数不可写，只能在 Environment中查询
    @StorageProp["accessibilityEnabled"]
    let _accessibility: Bool = false

    @StorageProp["colorMode"]
    let _color: ColorMode = ColorMode.Light

    //    添加以下代码 app会在打开environment用例页面的时候崩溃

    //    @StorageProp["fontScale"]
    //    let _fontScale: Float64 = 1.3
    //
    //    @StorageProp["fontWeightScale"]
    //    let _fontWeightScale: Float64 = 1.4

    @StorageProp["layoutDirection"]
    let _layoutDirection: LayoutDirection = LayoutDirection.Ltr

    @StorageProp["languageCode"]
    let _languageCode: String = "en"

    // keys() cov
    let EnvironmentKeys = Environment.keys()

    func build() {
        Column(space: 10) {
            Text("AccessibilityEnable => ")
            Text("  ${parseBool(_accessibility)}").id("accessibilityText")
            Text("  SystemProvided: ${this.SysAccessibilityEnabled}").id("System?1")

            Text("Color Mode => ")
            Text("  ${parseColor(_color)}").id("colorModeText")
            Text("  SystemProvided: ${this.SysColorMode}").id("System?2")

            Text("FontScale => ")
            //             Text("  ${this._fontScale}").id("fontScaleText")
            Text("  SystemProvided: ${this.SysFontScale}").id("System?3")

            Text("FontWeightScale => ")
            //             Text("  ${this._fontWeightScale}").id("fontWeightScale")
            Text("  SystemProvided: ${this.SysFontWeightScale}").id("System?4")

            Text("LayoutDirection => ")
            Text("  ${parseLayout(_layoutDirection)}").id("layoutDirection")
            Text("  SystemProvided: ${this.SysLayoutDirection}").id("System?5")

            Text("LanguageCode => ")
            Text("  ${this._languageCode}").id("languageCode")
            Text("  SystemProvided: ${this.SysLanguageCode}").id("System?6")

            Text("InvalidKey => ")
            Text("  SystemProvided: ${this.SysInvalidKey}")
        }
    }
    // 组件渲染前调用的方法
    protected override func aboutToAppear() {
    }

    protected override func aboutToDisappear() {
        Environment.aboutToBeDeleted()
    }
}
