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

package ohos.arkui.component.common

import ohos.arkui.component.util.*
import ohos.arkui.shape.*
import ohos.base.*

public interface CommonMethod<T> {
    // Common Event
    func onClick(event: ?(ClickEvent) -> Unit): T

    func onAppear(event: ?() -> Unit): T

    func onDisAppear(event: ?() -> Unit): T

    func onTouch(event: ?(TouchEvent) -> Unit): T

    func onHover(event: ?(Bool) -> Unit): T

    func onAreaChange(event: ?(Area, Area) -> Unit): T

    func onVisibleAreaChange(raitos: ?Array<Float64>, event: ?(Bool, Float64) -> Unit): T

    func onMouse(event: ?(MouseEvent) -> Unit): T

    func onKeyEvent(event: ?(KeyEvent) -> Unit): T

    func onFocus(event: ?() -> Unit): T

    func onBlur(event: ?() -> Unit): T

    func onDragStart(event: ?(DragInfo) -> DragItemInfo): T

    func onDragStart(event: ?(DragInfo) -> CustomBuilder): T

    func onDragStart(event: ?(DragInfo) -> Unit): T

    func onDragEnter(event: ?(DragInfo) -> Unit): T

    func onDragMove(event: ?(DragInfo) -> Unit): T

    func onDragLeave(event: ?(DragInfo) -> Unit): T

    func onDrop(event: ?(DragInfo) -> Unit): T

    // Common Attribute
    func width(value: Option<Length>): T

    func height(value: Option<Length>): T

    func size(width!: ?Length, height!: ?Length): T

    func padding(value: ?Length): T

    func padding(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    func margin(value: ?Length): T

    func margin(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    func layoutWeight(value: ?Int32): T

    func constraintSize(minWidth!: ?Length, maxWidth!: ?Length,
        minHeight!: ?Length, maxHeight!: ?Length): T

    func align(value: ?Alignment): T

    func direction(value: ?Direction): T

    func position(x!: ?Length, y!: ?Length): T

    func markAnchor(x!: ?Length, y!: ?Length): T

    func offset(x!: ?Length, y!: ?Length): T

    func alignRules(value: ?AlignRuleOptions): T

    func aspectRatio(value: ?Float64): T

    func displayPriority(value: ?Int32): T

    func flexBasis(value: ?Length): T

    func flexGrow(value: ?Float64): T

    func flexGrow(value: ?Int64): T

    func flexShrink(value: ?Float64): T

    func flexShrink(value: ?Int64): T

    func alignSelf(value: ?ItemAlign): T

    func responseRegion(value: ?Rectangle): T

    func responseRegion(value: ?Array<Rectangle>): T

    func border(width!: ?Length, color!: ?ResourceColor, radius!: ?Length,
        style!: ?BorderStyle): T

    func borderWidth(value: ?Length): T

    func borderWidth(value: ?EdgeWidths): T

    func borderColor(value: ?ResourceColor): T

    func borderRadius(topLeft!: ?Length, topRight!: ?Length, bottomLeft!: ?Length,
        bottomRight!: ?Length): T

    func borderRadius(value: ?Length): T

    func borderStyle(value: ?BorderStyle): T

    func foregroundBlurStyle(value: ?BlurStyle): T

    func foregroundBlurStyle(value: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T

    func foregroundColor(value: ?ColoringStrategy): T

    func foregroundColor(value: ?ResourceColor): T

    func backgroundColor(value: ?ResourceColor): T

    func backgroundImage(src: ?ResourceStr): T

    func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T

    func backgroundImageSize(value: ?ImageSize): T

    func backgroundImageSize(width!: ?Length, height!: ?Length): T

    func backgroundImagePosition(value: ?Alignment): T

    func backgroundImagePosition(x!: ?Length, y!: ?Length): T

    func scale(x!: ?Float32, y!: ?Float32, z!: ?Float32, centerX!: ?Length,
        centerY!: ?Length): T

    func opacity(value: ?Float64): T

    func rotate(x!: ?Float32, y!: ?Float32, z!: ?Float32, angle!: ?Float32,
        centerX!: ?Length, centerY!: ?Length): T

    func translate(x!: ?Length, y!: ?Length, z!: ?Length): T

    func enabled(value: ?Bool): T

    func sharedTransition(id: ?String, options!: ?SharedTransitionOptions): T

    func geometryTransition(id: ?String, followWithoutTransition!: ?Bool): T

    func blur(value: ?Float64): T

    func colorBlend(value: ?ResourceColor): T

    func backdropBlur(value: ?Float64): T

    func shadow(radius!: ?Float64, color!: ?ResourceColor, offsetX!: ?Float64,
        offsetY!: ?Float64): T

    func grayscale(value: ?Float64): T

    func brightness(value: ?Float64): T

    func saturate(value: ?Float64): T

    func contrast(value: ?Float64): T

    func invert(value: ?Float64): T

    func invert(low!: ?Float64, high!: ?Float64, threshold!: ?Float64, thresholdRange!: ?Float64): T

    func sepia(value: ?Float64): T

    func hueRotate(value: ?Float32): T

    func zIndex(value: ?Int32): T

    func visibility(value: ?Visibility): T

    func clip(value: ?Bool): T

    func clipShape(value: ?BaseShape): T

    func maskShape(value: ?BaseShape): T

    func overlay(value!: ?String, align!: ?Alignment,
        offset!: ?OverlayOffset): T

    func bindPopup(show: ?Bool, popup: ?PopupOptions): T

    func bindPopup(show: ?Bool, popup: ?CustomPopupOptions): T

    func bindMenu(content: ?Array<MenuElement>): T

    func bindMenu(builder!: ?CustomBuilder): T

    func bindContextMenu(builder!: ?CustomBuilder, responseType!: ?ResponseType,
        options!: ?ContextMenuOptions): T

    func linearGradient(angle!: ?Float64, direction!: ?GradientDirection,
        colors!: ?Array<(ResourceColor, Float64)>, repeating!: ?Bool): T

    func sweepGradient(center: ?(Length, Length), start!: ?Float64, end!: ?Float64,
        rotation!: ?Float64, colors!: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    func radialGradient(center: ?(Length, Length), radius: ?Length, colors: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>): T

    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>): T

    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    func key(value: ?String): T

    func renderFit(fitMode: ?RenderFit): T

    func id(value: ?String): T

    func expandSafeArea(types!: ?Array<SafeAreaType>, edges!: ?Array<SafeAreaEdge>): T

    func bindContentCover(isShow: ?Bool, builder: ?CustomBuilder,
        options!: ?ContentCoverOptions): T

    func animationStart(value: ?AnimateParam): T

    func animationEnd(): T

    func transition(value: ?TransitionEffect): T
    
    func transition(value: ?TransitionEffect, onFinish: ?TransitionFinishCallback): T

    func focusable(value: ?Bool): T

    func tabIndex(index: ?Int32): T

    func defaultFocus(value: ?Bool): T

    func groupDefaultFocus(value: ?Bool): T

    func focusOnTouch(value: ?Bool): T

    func bindSheet(isShow: ?Bool, builder: ?CustomBuilder, options!: ?SheetOptions): T

    func dragPreview(value: ?String): T
}

