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

internal import ohos.hilog.*
internal import ohos.app.ability.ui_ability.UIAbility
internal import ohos.app.ability.ability_stage.AbilityStage
internal import ohos.app.ability.ability_constant.LaunchReason
internal import ohos.app.ability.ui_ability.UIAbilityContext
internal import ohos.resource_manager.{AppResource}
import std.sync.*
import ohos.window.WindowStage
import ohos.window.Window
import ohos.resource_manager.*
import kit.TestKit.*

class MainAbility <: UIAbility {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        Hilog.info(1, "Cangjie-App", "MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.StartAbility => Hilog.info(1, "Cangjie-App", "START_ABILITY")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        Hilog.info(1, "Cangjie-App", "MainAbility onWindowStageCreate.")
        Global.windowStage = windowStage
        windowStage.loadContent("MyView")
        AppStorage.setOrCreate<UIAbilityContext>("abilityContext", this.context) //适配新getContextStage, AbilityContext存在AppStorage
        AppStorage.setOrCreate<WindowStage>("windowStage", windowStage)
//        windowStage.loadContentByName("MyView")
        let promise = windowStage.getSubWindow()
    }
}
public class Global {
    public static let initialized = Monitor()
    public static var abilityContext: Option<UIAbilityContext> = None
    public static var windowStage: Option<WindowStage> = None
    public static var _driver: Option<Driver> = None
    public static prop driver: Driver {
        get() {
            match (Global._driver) {
                case Some(driver) => driver
                case None =>
                    let newDriver = Driver.create()
                    newDriver.delayMs(2000)
                    Global._driver = newDriver
                    newDriver
            }
        }
    }

    public static func getAbilityContext() {
        abilityContext.getOrThrow()
    }

    public static func getWindowStage() {
        windowStage.getOrThrow()
    }
    public static func getMainWindow() {
        getWindowStage().getMainWindow()
    }
}
