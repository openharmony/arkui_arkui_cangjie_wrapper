/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/*
 * Note: This page is designed for branch coverage to ensure the application runs normally,
 * without concern for specific test results.
 */
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewCovCommonComponent2 {
    protected func aboutToAppear() {

        let cDefault = Color(255, 0, 0)

        let cHigh = Color(255, 0, 0, alpha: 2.0)

        let cNeg = Color(255, 0, 0, alpha: -1.0)

        let cHalf = Color(255, 0, 0, alpha: 0.5)

        let cAdapt = Color(0x00ff0000)

        let cNoAdapt = Color(0xff00ff00)

        let params = ReuseParams([("key1", "value1" as Any), ("key2", 42 as Any)])

        let val1: ?String = params.get<String>("key1")

        let val2: ?Int64 = params.get<Int64>("key1")

        let val3: ?String = params.get<String>("nonexistent")

        let ap = AnimateParam()
    }

    protected func onDidBuild() {
        let resultNone = FocusControl.requestFocus(Option<String>.None)

        let resultSome = FocusControl.requestFocus("CovVisibleLabel")
    }
    func build() {
        Column {
            TestCoverageSupplement()
            TestDataClassCoverage()
            TestNativeStructCoverage()
            TestCustomViewCoverage()
            TestRemainingCoverage()
        }
    }
}


/*
 * 覆盖率补充: common_component.cj 中 TestCommonMethods 未覆盖的 ?? 默认值分支
 * 策略: 构造 Options 对象后在 aboutToAppear 中将字段设为 None,
 * 使 Inner/FFI 方法中的 ?? defaultValue 分支被执行
 */
@Component
class TestCoverageSupplement {
    var stOpts: SharedTransitionOptions = SharedTransitionOptions()
    var popupOpts: PopupOptions = PopupOptions(message: "coverage")
    var customPopupOpts: ?CustomPopupOptions = Option<CustomPopupOptions>.None
    var ewOpts: EdgeWidths = EdgeWidths()
    var fbsOpts: ForegroundBlurStyleOptions = ForegroundBlurStyleOptions()

    protected func aboutToAppear() {
        stOpts.motionPath = None

        popupOpts.showInSubWindow = None
        popupOpts.offset = None
        popupOpts.width = None
        popupOpts.targetSpace = None
        popupOpts.enableArrow = None
        popupOpts.popupColor = None
        popupOpts.autoCancel = None
        popupOpts.mask = None
        popupOpts.arrowWidth = None
        popupOpts.arrowHeight = None
        popupOpts.radius = None
        popupOpts.shadow = None
        popupOpts.backgroundBlurStyle = None
        popupOpts.messageOptions = None
        popupOpts.primaryButton = None
        popupOpts.secondaryButton = None
        popupOpts.followTransformOfTarget = None
        popupOpts.arrowOffset = None
        popupOpts.placement = None

        let cp = CustomPopupOptions(builder: { => })
        cp.placement = None
        cp.backgroundColor = None
        cp.enableArrow = None
        cp.autoCancel = None
        cp.showInSubWindow = None
        cp.targetSpace = None
        cp.offset = None
        cp.width = None
        cp.arrowWidth = None
        cp.arrowHeight = None
        cp.radius = None
        cp.shadow = None
        cp.backgroundBlurStyle = None
        cp.focusable = None
        cp.followTransformOfTarget = None
        cp.arrowOffset = None
        customPopupOpts = cp

        ewOpts.top = None
        ewOpts.right = None
        ewOpts.bottom = None
        ewOpts.left = None

        fbsOpts.blurOptions = None
        fbsOpts.scale = None
    }

    func build() {
        Column {
            Text("CoverageSTNoneMP")
                .sharedTransition("coverageStNoneMP", options: stOpts)
                .id("CoverageSTNoneMP")

            Button("CoveragePopupNone")
                .bindPopup(true, popupOpts)
                .id("CoveragePopupNone")

            Button("CoverageCustomPopupNone")
                .bindPopup(true, customPopupOpts)
                .id("CoverageCustomPopupNone")

            Text("CoverageBorderWidthNone")
                .borderWidth(ewOpts)
                .id("CoverageBorderWidthNone")

            Text("CoverageFgBlurStyleNone")
                .foregroundBlurStyle(BlurStyle.None, fbsOpts)
                .id("CoverageFgBlurStyleNone")

            Text("CoverageExpandSafeAreaNonEmpty")
                .expandSafeArea(types: [SafeAreaType.System], edges: [SafeAreaEdge.Top, SafeAreaEdge.Bottom])
                .id("CoverageExpandSafeAreaNonEmpty")

            Text("CoverageOnVisibleAreaChangeNonEmpty")
                .onVisibleAreaChange([0.0, 1.0], { _, _ => })
                .id("CoverageOnVisibleAreaChangeNonEmpty")
        }
    }
}