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
import ohos.labels.APILevel
import ohos.base.*

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CommonMethod<T> {
    // Common Event
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onClick(event: ?(ClickEvent) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAppear(event: ?() -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDisAppear(event: ?() -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onTouch(event: ?(TouchEvent) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onHover(event: ?(Bool) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAreaChange(event: ?(Area, Area) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onVisibleAreaChange(raitos: ?Array<Float64>, event: ?(Bool, Float64) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onMouse(event: ?(MouseEvent) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onKeyEvent(event: ?(KeyEvent) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFocus(event: ?() -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onBlur(event: ?() -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> DragItemInfo): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> CustomBuilder): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragEnter(event: ?(DragInfo) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragMove(event: ?(DragInfo) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragLeave(event: ?(DragInfo) -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDrop(event: ?(DragInfo) -> Unit): T

    // Common Attribute
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func width(value: Option<Length>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func height(value: Option<Length>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func size(width!: ?Length, height!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(value: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(value: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func layoutWeight(value: ?Int32): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func constraintSize(minWidth!: ?Length, maxWidth!: ?Length,
        minHeight!: ?Length, maxHeight!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func align(value: ?Alignment): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func direction(value: ?Direction): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func position(x!: ?Length, y!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func markAnchor(x!: ?Length, y!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func offset(x!: ?Length, y!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignRules(value: ?AlignRuleOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aspectRatio(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func displayPriority(value: ?Int32): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexBasis(value: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Int64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Int64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignSelf(value: ?ItemAlign): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Rectangle): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Array<Rectangle>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func border(width!: ?Length, color!: ?ResourceColor, radius!: ?Length,
        style!: ?BorderStyle): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?EdgeWidths): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderColor(value: ?ResourceColor): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(topLeft!: ?Length, topRight!: ?Length, bottomLeft!: ?Length,
        bottomRight!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(value: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderStyle(value: ?BorderStyle): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ColoringStrategy): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ResourceColor): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundColor(value: ?ResourceColor): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(value: ?ImageSize): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(width!: ?Length, height!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(value: ?Alignment): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(x!: ?Length, y!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scale(x!: ?Float32, y!: ?Float32, z!: ?Float32, centerX!: ?Length,
        centerY!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func opacity(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rotate(x!: ?Float32, y!: ?Float32, z!: ?Float32, angle!: ?Float32,
        centerX!: ?Length, centerY!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func translate(x!: ?Length, y!: ?Length, z!: ?Length): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enabled(value: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sharedTransition(id: ?String, options!: ?SharedTransitionOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func geometryTransition(id: ?String, followWithoutTransition!: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func blur(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colorBlend(value: ?ResourceColor): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backdropBlur(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func shadow(radius!: ?Float64, color!: ?ResourceColor, offsetX!: ?Float64,
        offsetY!: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func grayscale(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func brightness(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func saturate(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contrast(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(low!: ?Float64, high!: ?Float64, threshold!: ?Float64, thresholdRange!: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sepia(value: ?Float64): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func hueRotate(value: ?Float32): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func zIndex(value: ?Int32): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func visibility(value: ?Visibility): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clip(value: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clipShape(value: ?BaseShape): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maskShape(value: ?BaseShape): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func overlay(value!: ?String, align!: ?Alignment,
        offset!: ?OverlayOffset): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?PopupOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?CustomPopupOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(content: ?Array<MenuElement>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(builder!: ?CustomBuilder): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindContextMenu(builder!: ?CustomBuilder, responseType!: ?ResponseType,
        options!: ?ContextMenuOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func linearGradient(angle!: ?Float64, direction!: ?GradientDirection,
        colors!: ?Array<(ResourceColor, Float64)>, repeating!: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sweepGradient(center: ?(Length, Length), start!: ?Float64, end!: ?Float64,
        rotation!: ?Float64, colors!: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radialGradient(center: ?(Length, Length), radius: ?Length, colors: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func key(value: ?String): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func renderFit(fitMode: ?RenderFit): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func id(value: ?String): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func expandSafeArea(types!: ?Array<SafeAreaType>, edges!: ?Array<SafeAreaEdge>): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindContentCover(isShow: ?Bool, builder: ?CustomBuilder,
        options!: ?ContentCoverOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationStart(value: ?AnimateParam): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationEnd(): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect): T
    
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect, onFinish: ?TransitionFinishCallback): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusable(value: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabIndex(index: ?Int32): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func defaultFocus(value: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func groupDefaultFocus(value: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusOnTouch(value: ?Bool): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindSheet(isShow: ?Bool, builder: ?CustomBuilder, options!: ?SheetOptions): T

    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func dragPreview(value: ?String): T
}

