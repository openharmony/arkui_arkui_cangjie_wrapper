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
 * WITHOUT WARRANTIES OR CONDITIONS, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * 分支覆盖触发页：在 onAppear 中调用各 @Derive[Equatable] 枚举的 == 比较，
 * 确保带覆盖率运行时能执行到 wrapper 内派生代码，稳定复现分支覆盖。
 */
package ohos_app_cangjie_entry

import ohos.arkui.component.button.{ButtonType, ButtonRole, ButtonStyleMode}
import ohos.arkui.component.badge.BadgePosition
import ohos.arkui.component.progress.ProgressStatus
import ohos.base.LengthUnit
import ohos.arkui.state_management.{ColorMode, LayoutDirection}
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewCovEnumEquatable {
    func cov4EnumEquatableBranches() {
        // ButtonType: 4 变体 → 4×4=16 分支
        let _ = ButtonType.Normal == ButtonType.Normal
        let _ = ButtonType.Capsule == ButtonType.Capsule
        let _ = ButtonType.Circle == ButtonType.Circle
        let _ = ButtonType.RoundedRectangle == ButtonType.RoundedRectangle
        let _ = ButtonType.Normal == ButtonType.Capsule
        let _ = ButtonType.Capsule == ButtonType.Normal

        // ButtonRole: 2 变体 → 4×2=8 分支
        let _ = ButtonRole.Normal == ButtonRole.Normal
        let _ = ButtonRole.Error == ButtonRole.Error
        let _ = ButtonRole.Normal == ButtonRole.Error
        let _ = ButtonRole.Error == ButtonRole.Normal

        // ButtonStyleMode: 3 变体 → 4×3=12 分支
        let _ = ButtonStyleMode.Normal == ButtonStyleMode.Normal
        let _ = ButtonStyleMode.Emphasized == ButtonStyleMode.Emphasized
        let _ = ButtonStyleMode.Textual == ButtonStyleMode.Textual
        let _ = ButtonStyleMode.Normal == ButtonStyleMode.Emphasized

        // BadgePosition: 3 变体 → 4×3=12 分支
        let _ = BadgePosition.RightTop == BadgePosition.RightTop
        let _ = BadgePosition.Right == BadgePosition.Right
        let _ = BadgePosition.Left == BadgePosition.Left
        let _ = BadgePosition.RightTop == BadgePosition.Left

        // ProgressStatus: 2 变体 → 4×2=8 分支
        let _ = ProgressStatus.Loading == ProgressStatus.Loading
        let _ = ProgressStatus.Progressing == ProgressStatus.Progressing
        let _ = ProgressStatus.Loading == ProgressStatus.Progressing

        // LengthUnit: 5 变体 → 4×5=20 分支
        let _ = LengthUnit.Px == LengthUnit.Px
        let _ = LengthUnit.Vp == LengthUnit.Vp
        let _ = LengthUnit.Fp == LengthUnit.Fp
        let _ = LengthUnit.Percent == LengthUnit.Percent
        let _ = LengthUnit.Lpx == LengthUnit.Lpx
        let _ = LengthUnit.Px == LengthUnit.Vp

        // ColorMode: 2 变体 → 8 分支
        let _ = ColorMode.Light == ColorMode.Light
        let _ = ColorMode.Dark == ColorMode.Dark
        let _ = ColorMode.Light == ColorMode.Dark

        // LayoutDirection: 3 变体 → 12 分支
        let _ = LayoutDirection.Ltr == LayoutDirection.Ltr
        let _ = LayoutDirection.Rtl == LayoutDirection.Rtl
        let _ = LayoutDirection.Auto == LayoutDirection.Auto
        let _ = LayoutDirection.Ltr == LayoutDirection.Rtl
    }

    func build() {
        Column() {
            Text("Enum Equatable 分支覆盖触发页").fontSize(18)
            Text("onAppear 中会执行各枚举 == 比较以触发 wrapper 内 @Derive[Equatable] 分支")
                .fontSize(14)
                .margin(top: 8)
        }
        .width(100.percent)
        .padding(16)
        .onAppear({ => cov4EnumEquatableBranches() })
    }
}
