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
class ViewCovCommonComponent {
    @State var isShow = false
    let fonts = Fonts()

    @Builder
    public func myBuilder() {
        Column() {
            Text("myBuilder")
        }
    }


    func build() {
        Column {
            // test SharedTransitionOptions 
            Text("add overlay usages").sharedTransition(
                "SharedEffectStatic",
                options: SharedTransitionOptions(
                    duration: 1000,
                    curve: Curve.Linear,
                    delay: 2,
                    zIndex: 1,
                    motionPath: MotionPathOptions(path: "", from: 1.0, to: 2.0, rotatable: true),
                    effectType: SharedTransitionEffectType.Static)
            ).alignRules(
                AlignRuleOption(
                    left: HorizontalAlignParam(Option<String>.None, HorizontalAlign.End),
                    right: HorizontalAlignParam(Option<String>.None, Option<HorizontalAlign>.None),
                    top: VerticalAlignParam(Option<String>.None, VerticalAlign.Center),
                    bottom: VerticalAlignParam(Option<String>.None, Option<VerticalAlign>.None)
                )
            ).id("SharedTransitionOptions")

            Button("Test CustomDialogOptions").onClick({ e =>
                let customDialogOptions = CustomDialogOptions(
                    builder: { => },
                    cornerRadius: BorderRadiuses(topLeft: 0)
                )
                getUIContext().getPromptAction().openCustomDialog(customDialogOptions, {_ =>})
            }).id("CustomDialogOptions")

            Button("ContextMenuOptionsNoneValue").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions()
                ).id("ContextMenuOptionsNoneValue")

            Button("ContextMenuOptionsWithOption").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(
                        layoutRegionMargin: Margin(),
                        borderRadius: BorderRadiuses(),
                        previewAnimationOptions: ContextMenuAnimationOptions(
                            scale: [0.2, 0.7],
                            transition: TransitionEffect
                                .OPACITY.animation(AnimateParam(duration: 4000, curve: Curve.Ease)),
                            hoverScale: [1.0, 0.5]
                        )
                    )
                ).id("ContextMenuOptionsWithOption")
            
            Button("BindSheet").onAppear({
                    => this.isShow = true
                })
                .fontSize(20).margin(10)
                .bindSheet(
                    this.isShow,
                    myBuilder,
                    options: SheetOptions(
                        backgroundColor: Color.Gray,
                        onAppear: { => },
                        onDisappear: { => },
                        onWillAppear: { => },
                        onWillDisappear: { => },
                        height: SheetSize.Large,
                        detents: [SheetSize.Medium, SheetSize.Large],
                        preferType: SheetType.Center,
                        showClose: true,
                        dragBar: true,
                        blurStyle: BlurStyle.Regular,
                        maskColor: Color.Red,
                        title: {=>},
                        enableOutsideInteractive: false,
                        shouldDismiss: { v => },
                        onWillDismiss: {
                            action => match (action.reason) {
                                case PRESS_BACK => Hilog.info(1, "Cangjie-Test", "onWillDismiss: PRESS_BACK")
                                case TOUCH_OUTSIDE => action.dismiss()
                                case CLOSE_BUTTON => Hilog.info(1, "Cangjie-Test", "onWillDismiss: CLOSE_BUTTON")
                                case SLIDE_DOWN => Hilog.info(1, "Cangjie-Test", "onWillDismiss: SLIDE_DOWN")
                                case _ => Hilog.info(1, "Cangjie-Test", "onWillDismiss: _")
                            }
                        },
                        onWillSpringBackWhenDismiss: { v => },
                        onHeightDidChange: {v =>},
                        onDetentsDidChange: {v =>},
                        onWidthDidChange: {v =>},
                        onTypeDidChange: {v =>},
                        borderWidth: 10.vp,
                        borderColor: Color.Red,
                        borderStyle: EdgeStyles(),
                        width: 400.vp,
                        shadow: ShadowOptions(radius: 10.0, shadowType: ShadowType.Color, offsetX: 10.0, offsetY: 0.0, color: Color.Red),
                        mode: SheetMode.Embedded,
                        scrollSizeMode: ScrollSizeMode.Continuous)
                ).id("bindsheet")

                Button("BindSheet")
                    .fontSize(20).margin(10)
                    .bindSheet(
                        true,
                        myBuilder,
                        options: SheetOptions(
                            preferType: SheetType.Bottom,
                            height: SheetSize.Medium
                        ))
                Button("Overlay").overlay(
                    value: "test",
                    align: Alignment.Bottom,
                    offset: OverlayOffset()
                ).id("Overlay")

                Button("CustomPopupOptions")
                .bindPopup(true,
                    CustomPopupOptions(
                        builder: { => },
                        autoCancel: false,
                        onStateChange: {event => },
                        onWillDismiss: {action => },
                        backgroundColor: Color.Red,
                        radius: 10.0,
                        showInSubWindow: true,
                        shadow: ShadowStyle.OuterDefaultXS,
                        followTransformOfTarget: true
                    )
                ).id("CustomPopupOptions")

                Button("PopupOptions")
                .bindPopup(true,
                    PopupOptions(
                        message: "test",
                        width: 10.0,
                        followTransformOfTarget: true
                    )
                ).id("PopupOptions")

                TestCommonMethods()
        }
    }
}

@Component
class TestCommonMethods {
    func build() {
        Column() {
            Button("NoneValue")
                // 事件方法
                .onClick(Option<((ClickEvent) -> Unit)>.None)
                .onAppear(Option<(() -> Unit)>.None)
                .onDisAppear(Option<(() -> Unit)>.None)
                .onTouch(Option<((TouchEvent) -> Unit)>.None)
                .onHover(Option<((Bool) -> Unit)>.None)
                .onAreaChange(Option<((Area, Area) -> Unit)>.None)
                .onVisibleAreaChange(Option<Array<Float64>>.None, Option<((Bool, Float64) -> Unit)>.None)
                .onMouse(Option<((MouseEvent) -> Unit)>.None)
                .onKeyEvent(Option<((KeyEvent) -> Unit)>.None)
                .onFocus(Option<(() -> Unit)>.None)
                .onBlur(Option<(() -> Unit)>.None)
                // 布局属性
                .width(Option<Length>.None)
                .height(Option<Length>.None)
                .size(width: Option<Length>.None, height: Option<Length>.None)
                .padding(Option<Length>.None)
                .padding(top: Option<Length>.None, right: Option<Length>.None, left: Option<Length>.None, bottom: Option<Length>.None)
                .margin(Option<Length>.None)
                .margin(top: Option<Length>.None, right: Option<Length>.None, left: Option<Length>.None, bottom: Option<Length>.None)
                .layoutWeight(Option<Int32>.None)
                .constraintSize(minWidth: Option<Length>.None, maxWidth: Option<Length>.None, minHeight: Option<Length>.None, maxHeight: Option<Length>.None)
                .align(Option<Alignment>.None)
                .direction(Option<Direction>.None)
                .position(x: Option<Length>.None, y: Option<Length>.None)
                .markAnchor(x: Option<Length>.None, y: Option<Length>.None)
                .offset(x: Option<Length>.None, y: Option<Length>.None)
                .alignRules(Option<AlignRuleOption>.None)
                // aspectRatio 有非可选参数 Float64
                .displayPriority(Option<Int32>.None)
                .flexBasis(Option<Length>.None)
                .flexGrow(Option<Float64>.None)
                .flexGrow(Option<Int64>.None)
                .flexShrink(Option<Float64>.None)
                .flexShrink(Option<Int64>.None)
                .alignSelf(Option<ItemAlign>.None)
                .responseRegion(Option<Rectangle>.None)
                .responseRegion(Option<Array<Rectangle>>.None)
                // 边框和样式
                .border(width: Option<Length>.None, color: Option<ResourceColor>.None, radius: Option<Length>.None, style: Option<BorderStyle>.None)
                .borderWidth(Option<Length>.None)
                .borderWidth(Option<EdgeWidths>.None)
                .borderColor(Option<ResourceColor>.None)
                .borderRadius(topLeft: Option<Length>.None, topRight: Option<Length>.None, bottomLeft: Option<Length>.None, bottomRight: Option<Length>.None)
                .borderRadius(Option<Length>.None)
                .borderStyle(Option<BorderStyle>.None)
                // 前景和背景
                .foregroundBlurStyle(Option<BlurStyle>.None)
                .foregroundBlurStyle(Option<BlurStyle>.None, Option<ForegroundBlurStyleOptions>.None)
                .foregroundColor(Option<ColoringStrategy>.None)
                .foregroundColor(Option<ResourceColor>.None)
                .backgroundColor(Option<ResourceColor>.None)
                .backgroundImage(Option<ResourceStr>.None)
                .backgroundImage(Option<ResourceStr>.None, Option<ImageRepeat>.None)
                .backgroundImageSize(Option<ImageSize>.None)
                .backgroundImageSize(width: Option<Length>.None, height: Option<Length>.None)
                .backgroundImagePosition(Option<Alignment>.None)
                .backgroundImagePosition(x: Option<Length>.None, y: Option<Length>.None)
                // 变换
                .scale(x: Option<Float32>.None, y: Option<Float32>.None, z: Option<Float32>.None, centerX: Option<Length>.None, centerY: Option<Length>.None)
                .opacity(Option<Float64>.None)
                .rotate(x: Option<Float32>.None, y: Option<Float32>.None, z: Option<Float32>.None, angle: Option<Float32>.None, centerX: Option<Length>.None, centerY: Option<Length>.None)
                .translate(x: Option<Length>.None, y: Option<Length>.None, z: Option<Length>.None)
                // 其他属性
                .enabled(Option<Bool>.None)
                // sharedTransition 有非可选参数 String id
                .geometryTransition(Option<String>.None, follow: Option<Bool>.None)
                .blur(Option<Float64>.None)
                .colorBlend(Option<ResourceColor>.None)
                .backdropBlur(Option<Float64>.None)
                .shadow(radius: Option<Float64>.None, color: Option<ResourceColor>.None, offsetX: Option<Float64>.None, offsetY: Option<Float64>.None)
                .grayscale(Option<Float64>.None)
                .brightness(Option<Float64>.None)
                .saturate(Option<Float64>.None)
                .contrast(Option<Float64>.None)
                .invert(Option<Float64>.None)
                .invert(low: Option<Float64>.None, high: Option<Float64>.None, threshold: Option<Float64>.None, thresholdRange: Option<Float64>.None)
                .sepia(Option<Float64>.None)
                .hueRotate(Option<Float32>.None)
                .zIndex(Option<Int32>.None)
                .visibility(Option<Visibility>.None)
                .clip(Option<Bool>.None)
                .clipShape(Option<BaseShape>.None)
                // maskShape 有非可选参数 BaseShape
                .overlay(value: Option<String>.None, align: Option<Alignment>.None, offset: Option<OverlayOffset>.None)
                .bindPopup(Option<Bool>.None, Option<PopupOptions>.None)
                .bindPopup(Option<Bool>.None, Option<CustomPopupOptions>.None)
                .bindMenu(Option<Array<MenuElement>>.None)
                // .bindMenu(builder: Option<CustomBuilder>.None)
                // .bindContextMenu(builder: Option<CustomBuilder>.None, responseType:Option<ResponseType>.None, options: Option<ContextMenuOptions>.None)
                .linearGradient(angle: Option<Float64>.None, direction: Option<GradientDirection>.None, colors: Option<Array<(ResourceColor, Float64)>>.None, repeating: Option<Bool>.None)
                .sweepGradient(Option<(Length, Length)>.None, start: Option<Float64>.None, end: Option<Float64>.None, rotation: Option<Float64>.None, colors: Option<Array<(ResourceColor, Float64)>>.None, repeating: Option<Bool>.None)
                .radialGradient(Option<(Length, Length)>.None, Option<Length>.None, Option<Array<(ResourceColor, Float64)>>.None, repeating: Option<Bool>.None)
                .keyboardShortcut(Option<FunctionKey>.None, Option<Array<ModifierKey>>.None)
                .keyboardShortcut(Option<String>.None, Option<Array<ModifierKey>>.None)
                .keyboardShortcut(Option<FunctionKey>.None, Option<Array<ModifierKey>>.None, Option<(() -> Unit)>.None)
                .keyboardShortcut(Option<String>.None, Option<Array<ModifierKey>>.None, Option<(() -> Unit)>.None)
                .key(Option<String>.None)
                .renderFit(Option<RenderFit>.None)
                .id(Option<String>.None)
                .expandSafeArea(types: Option<Array<SafeAreaType>>.None, edges: Option<Array<SafeAreaEdge>>.None)
                // .bindContentCover(Option<Bool>.None, Option<CustomBuilder>.None,options:  Option<ContentCoverOptions>.None)
                .animationStart(Option<AnimateParam>.None)
                .animationEnd()
                .transition(Option<TransitionEffect>.None)
                .transition(Option<TransitionEffect>.None, Option<TransitionFinishCallback>.None)
                .focusable(Option<Bool>.None)
                .tabIndex(Option<Int32>.None)
                .defaultFocus(Option<Bool>.None)
                .groupDefaultFocus(Option<Bool>.None)
                .focusOnTouch(Option<Bool>.None)
        }
    }
}