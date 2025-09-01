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

internal import ohos.app.ability.ui_ability.Ability
internal import ohos.app.ability.want.Want
internal import ohos.app.ability.ability_constant.LaunchParam
internal import ohos.window.WindowStage
import ohos.hilog.Hilog

class MyAbilityStage <: AbilityStage {
    public override func onCreate(): Unit {
        Hilog.info(1, "1", "1", "MyAbilityStage onCreated.")
    }
}
