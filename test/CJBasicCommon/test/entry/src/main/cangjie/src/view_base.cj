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
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Base {
    @State
    var isOn: Bool = false

    let state = ItemState.Waiting.toString()

    @Builder
    func builder() {
        Column {
            Text("CustomPopupOptions usages")
        }.width(300.px)
    }

    func build() {
        Column() {
            Row() {
                // 宽度80 ,高度80 ,外边距20（蓝色区域），内边距10（白色区域）
                Row() {
                    Row().size(width: 100.percent, height: 100.percent).backgroundColor(Color.Green)
                }
                    .width(80)
                    .height(80)
                    .padding(@r(app.integer.test_cjResource))
                    .margin(@r(app.integer.test_cjResource))
                    .backgroundColor(Color.White)
            }.backgroundColor(Color.Blue)

            Text("margin cjresource and constraintSize ")
                .fontSize(12)
                .fontColor(0xCCCCCC)
                .width(90.percent)
                .margin(top: 5.0, right: 5.0, bottom: 5.0, left: 5.0)
                .constraintSize()
                .id("cjresource")

            //flexBasis  work when its parent component  is  column , row ,

            Row {
                Text("flexBasis(100.0)")
                    .flexBasis(100.0)
                    .saturate(2.0)
                    .keyboardShortcut(FunctionKey.ESC, [ModifierKey.ALT])
                    .renderFit(RenderFit.BOTTOM_RIGHT) // 这里表示宽度为100vp
                Text("flexBasis(100 cjresource")
                    .flexBasis(@r(app.integer.test_cjResource))
                    .shadow(radius: 2.0)
                    .grayscale(2.0)
                    .invert(2.0)
                    .keyboardShortcut(FunctionKey.F12, [ModifierKey.ALT])
                    .renderFit(RenderFit.RESIZE_FILL)
                Text("flexGrow(2)")
                    .flexGrow(2.0)
                    .colorBlend(0xAFEEEE)
                    .shadow(radius: 2.0)
                    .renderFit(RenderFit.RESIZE_CONTAIN) // 父容器分配给该Text的宽度为剩余宽度的2/3
                Text("flexShrink(0)")
                    .flexShrink(0.0)
                    .borderRadius(@r(app.integer.test_cjResource))
                    .colorBlend(@r(app.color.blue_color))
                    .renderFit(RenderFit.RESIZE_CONTAIN_TOP_LEFT)
                    .renderFit(RenderFit.CENTER)
                    .renderFit(RenderFit.TOP)
                    .renderFit(RenderFit.BOTTOM)
                    .renderFit(RenderFit.LEFT)
                    .renderFit(RenderFit.RIGHT)
                    .renderFit(RenderFit.TOP_LEFT)
                    .renderFit(RenderFit.TOP_RIGHT)
                    .renderFit(RenderFit.BOTTOM_LEFT)

                // add  usage for cjResources
                //TODO: 将其修改为 Cjresources 类型的
                Text("dotted")
                    .border(width: 5.px, color: @r(app.color.blue_color), style: BorderStyle.Dotted)
                    .contrast(2.0)
                    .invert(2.0)
                    .backgroundImageSize(ImageSize.Cover)
                    .bindPopup(false,
                        CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.LeftBottom))
                    .renderFit(RenderFit.RESIZE_CONTAIN_BOTTOM_RIGHT)

                Text("dashed")
                    .borderStyle(BorderStyle.Dashed)
                    .borderWidth(@r(app.integer.test_cjResource))
                    .borderColor(0xAFEEEE)
                    .borderRadius(10)
                    .width(120)
                    .height(120)
                    .textAlign(TextAlign.Center)
                    .fontSize(16)
                    .backgroundImageSize(ImageSize.Contain)
                    .bindPopup(false,
                        CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.RightTop))
                    .renderFit(RenderFit.RESIZE_COVER)

                // add borderWidth and borderColor usages  添加默认的值
                Text("dashed2")
                    .borderStyle(BorderStyle.Dashed)
                    .borderWidth(EdgeWidths())
                    .borderColor(@r(app.color.blue_color))
                    .borderRadius()
                    .width(120)
                    .height(120)
                    .textAlign(TextAlign.Center)
                    .fontSize(16)
                    .sepia(2.0)
                    .bindPopup(false,
                        CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.RightBottom))
                    .keyboardShortcut(FunctionKey.F11, [ModifierKey.ALT])
                    .renderFit(RenderFit.RESIZE_COVER_TOP_LEFT)

                Text("add image usages")
                    .backgroundImage(@r(app.media.icon), ImageRepeat.X)
                    .backgroundImageSize(ImageSize.Auto)
                    .backgroundImagePosition(x: @r(app.integer.test_cjResource), y: @r(app.integer.test_cjResource))
                    .keyboardShortcut(FunctionKey.F10, [ModifierKey.ALT])
                    .renderFit(RenderFit.RESIZE_COVER_BOTTOM_RIGHT)

                Text("add image usages")
                    .backgroundImage(@r(app.media.icon), ImageRepeat.Y)
                    .backgroundImageSize(width: 10.0, height: 10.0)
                    .backgroundImagePosition(x: 0.0, y: 2.0)
                    .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false,
                        placement: Placement.None))
                    .keyboardShortcut(FunctionKey.F9, [ModifierKey.ALT])

                Text("add image usages")
                    .backgroundImage(@r(app.media.icon), ImageRepeat.XY)
                    .backgroundImageSize(width: @r(app.integer.test_cjResource), height: @r(app.integer.test_cjResource))
                    .backgroundImagePosition(Alignment.Center)
                    .keyboardShortcut(FunctionKey.F8, [ModifierKey.ALT])
                // TODO :  foregroundBlurStyle

                Text("rotate")
                    .width(90.percent)
                    .fontColor(0xCCCCCC)
                    .padding(15)
                    .fontSize(14)
                    .rotate(x: 1.0, y: 1.0, z: 1.0, angle: 300.0) // 组件以矢量(1,1,1)为旋转轴，绕中心点顺时针旋转300度
                    .width(100)
                    .height(100)
                    .backgroundColor(0xAFEEEE)
                    .transition(TransitionEffect.OPACITY)
            }
            Button("button4")

            Button("button5")
                .keyboardShortcut(FunctionKey.F1, [ModifierKey.ALT])
                .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.LeftTop))
            Button("button6")
                .keyboardShortcut(FunctionKey.F7, [ModifierKey.SHIFT], {=>})
                .bindPopup(false,
                    CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.BottomRight))

            Button("button7")
                .keyboardShortcut("line 2358", [ModifierKey.CTRL], {=>})
                .bindPopup(false,
                    CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.BottomLeft))
            Text("add overlay usages")
                .overlay(value: "hello")
                .sweepGradient((100.0.px, 100.0.px))
                .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false,
                    placement: Placement.TopRight))
                .keyboardShortcut(FunctionKey.F6, [ModifierKey.ALT])

            Text("add overlay usages")
                .overlay(value: "hello")
                .radialGradient((100.0.px, 100.0.px), 120.0)
                .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.TopLeft))
                .keyboardShortcut(FunctionKey.F5, [ModifierKey.ALT])
                .sharedTransition(
                    "SharedEffectExchange",
                    options: SharedTransitionOptions(effectType: SharedTransitionEffectType.SharedEffectExchange)
                )
            Text("add overlay usages")
                .overlay(value: "hello")
                .radialGradient((100.0.px, 100.0.px), 120.vp)
                .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.Top))
                .keyboardShortcut(FunctionKey.F4, [ModifierKey.ALT])
                .sharedTransition(
                    "SharedEffectStatic",
                    options: SharedTransitionOptions(effectType: SharedTransitionEffectType.SharedEffectStatic)
                )
            // add popup usages
            Row {
                Button("BindPopup").bindPopup(
                    false,
                    PopupOptions(showInSubWindow: false, message: "确定将此项删除吗？")
                )
                Button("BindPopup-Custom").bindPopup(
                    false,
                    CustomPopupOptions(enableArrow: true, showInSubWindow: false, builder: bind(builder, this))
                )
            }
            // add color
            Text("linearGradient Repeat")
                .fontSize(24.px)
                .width(90.percent)
                .fontColor(Color(0xCCCCCC))
                .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.Right))
                .keyboardShortcut(FunctionKey.F3, [ModifierKey.ALT])
            Row().width(100.percent).height(100.px).linearGradient(repeating: true)
            // add color
            Text("linearGradient Repeat")
                .fontSize(24.px)
                .width(90.percent)
                .fontColor(Color(0xCCCCCC))
                .bindPopup(false, CustomPopupOptions(builder: {=>}, showInSubWindow: false, placement: Placement.Left))
                .keyboardShortcut(FunctionKey.F2, [ModifierKey.ALT])
                .foregroundBlurStyle(BlurStyle.Thin)
            Text("ForegroundBlurStyleOptions")
                .foregroundBlurStyle(BlurStyle.Regular, ForegroundBlurStyleOptions())
                .keyboardShortcut(FunctionKey.ESC, [ModifierKey.ALT])
            Text("SYSTEM").foregroundBlurStyle(BlurStyle.ComponentUltraThin, ForegroundBlurStyleOptions())
            Text("LIGHT").foregroundBlurStyle(BlurStyle.ComponentRegular,
                ForegroundBlurStyleOptions(colorMode: ThemeColorMode.Light, adaptiveColor: AdaptiveColor.Default))
            Text("DARK").foregroundBlurStyle(
                BlurStyle.ComponentRegular,
                ForegroundBlurStyleOptions(
                    colorMode: ThemeColorMode.Dark,
                    adaptiveColor: AdaptiveColor.Average
                )
            )

            // foregroundBlurStyleTest
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

            Row().width(100.percent).height(100.px).linearGradient(repeating: true)
            Row()
                .height(100.percent)
                .width(100.percent)
                .expandSafeArea(
                    types: [SafeAreaType.SYSTEM, SafeAreaType.KEYBOARD, SafeAreaType.CUTOUT],
                    edges: [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]
                )
        }
    }
}
