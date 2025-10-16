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

/**
 * CommonMethod.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CommonMethod<T> {
    // Common Event
    /*
     * Called when a click event occurs.
     *
     * @param { ?(ClickEvent) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onClick(event: ?(ClickEvent) -> Unit): T

    /*
     * This callback is triggered when a component mounts a display.
     *
     * @param { ?() -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAppear(event: ?() -> Unit): T

    /*
     * This callback is triggered when component uninstallation disappears.
     *
     * @param { ?() -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDisAppear(event: ?() -> Unit): T

    /*
     * Invoked when a touch event is triggered.
     *
     * @param { ?(TouchEvent) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onTouch(event: ?(TouchEvent) -> Unit): T

    /*
     * Trigger a hover event.
     *
     * @param { ?(Bool) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onHover(event: ?(Bool) -> Unit): T

    /*
     * This callback is triggered when the size or position of this component change finished.
     *
     * @param { ?(Area, Area) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAreaChange(event: ?(Area, Area) -> Unit): T

    /*
     * Trigger a visible area change event.
     *
     * @param { ?Array<Float64> } raitos
     * @param { ?(Bool, Float64) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onVisibleAreaChange(raitos: ?Array<Float64>, event: ?(Bool, Float64) -> Unit): T

    /*
     * Triggered when the component is clicked by a mouse button or the mouse pointer moves on the component.
     *
     * @param { ?(MouseEvent) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onMouse(event: ?(MouseEvent) -> Unit): T

    /*
     * Keyboard input
     *
     * @param { ?(KeyEvent) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onKeyEvent(event: ?(KeyEvent) -> Unit): T

    /*
     * Trigger a event when got focus.
     *
     * @param { ?() -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFocus(event: ?() -> Unit): T

    /*
     * Triggered when the current component loses focus.
     *
     * @param { ?() -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onBlur(event: ?() -> Unit): T

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { ?(DragInfo) -> DragItemInfo } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> DragItemInfo): T

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { ?(DragInfo) -> CustomBuilder } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> CustomBuilder): T

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { ?(DragInfo) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> Unit): T

    /**
     * After binding, a callback is triggered when the component is dragged to the range of the component.
     *
     * @param { ?(DragInfo) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragEnter(event: ?(DragInfo) -> Unit): T

    /**
     * After binding, a callback is triggered when the drag moves within the range of a placeable component.
     *
     * @param { ?(DragInfo) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragMove(event: ?(DragInfo) -> Unit): T

    /**
     * After binding, a callback is triggered when the component is dragged out of the component range.
     *
     * @param { ?(DragInfo) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragLeave(event: ?(DragInfo) -> Unit): T

    /**
     * The component bound to this event can be used as the drag release target.
     * This callback is triggered when the drag behavior is stopped within the scope of the component.
     *
     * @param { ?(DragInfo) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDrop(event: ?(DragInfo) -> Unit): T

    // Common Attribute
    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used.If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Option<Length> } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func width(value: Option<Length>): T

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Option<Length> } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func height(value: Option<Length>): T

    /**
     * The size of the current component.
     *
     * @param { Option<Length> } width
     * @param { Option<Length> } height
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func size(width!: ?Length, height!: ?Length): T

    /**
     * Sets the padding of the component.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(value: ?Length): T

    /**
     * Sets the padding of the component.
     *
     * @param { ?Length, ?Length, ?Length, ?Length } Indicates safeArea padding values.
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    /**
     * Sets the margin of the component.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(value: ?Length): T

    /**
     * Sets the margin of the component.
     *
     * @param { ?Length } top.
     * @param { ?Length } right.
     * @param { ?Length } bottom.
     * @param { ?Length } left.
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    /**
     * Sets the weight of the component during layout. A component with this attribute is allocated space
     * along the main axis of its parent container (Row, Column, or Flex) based on its specified weight.
     *
     * @param { ?Int32 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func layoutWeight(value: ?Int32): T

    /**
     * Sets the constraint size of the component, which is used to limit the size range during component layout.
     * Default value: **{minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity}**.
     *
     * @param { ?Length } minWidth
     * @param { ?Length } maxWidth
     * @param { ?Length } minHeight
     * @param { ?Length } maxHeight
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func constraintSize(minWidth!: ?Length, maxWidth!: ?Length,
        minHeight!: ?Length, maxHeight!: ?Length): T

    /**
     * Sets the alignment mode of the component content in the drawing area.
     * Default value: **Alignment.Center**.
     *
     * @param { ?Alignment } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func align(value: ?Alignment): T

    /**
     * Sets how elements are laid out along the main axis of the container.
     * Default value: **Direction.Auto**.
     *
     * @param { ?Direction } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func direction(value: ?Direction): T

    /**
     * Sets the absolute position of the component relative to the position of the parent component.
     * The attribute is not available for a layout container whose width and height are zero.
     *
     * @param { ?Length } x
     * @param { ?Length } y
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func position(x!: ?Length, y!: ?Length): T

    /**
     * Sets the anchor for locating the component, which is used to move the component
     * further away from the position specified by position or offset.
     *
     * @param { ?Length } x
     * @param { ?Length } y
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func markAnchor(x!: ?Length, y!: ?Length): T

    /**
     * Sets the offset of the component relative to its original position.
     * <br>The offset attribute does not affect the layout of the parent container.
     * It adjusts the component position only during drawing.
     *
     * @param { ?Length } x
     * @param { ?Length } y
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func offset(x!: ?Length, y!: ?Length): T

    /**
     * Sets the alignment rules in the relative container.
     * This API is valid only when the container is RelativeContainer.
     *
     * @param { ?AlignRuleOptions } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignRules(value: ?AlignRuleOptions): T

    /**
     * Sets the aspect ratio of the component, which can be obtained using the following formula: width/height.
     * If only width and aspectRatio are set, the height is calculated using the following formula: width/aspectRatio.
     * If only height and aspectRatio are set, the width is calculated using the following formula: height x aspectRatio.
     * If width, height, and aspectRatio are all set, the explicitly set height is ignored, and the effective height is calculated using the following formula: width/aspectRatio.
     * This parameter takes effect only when a valid value greater than 0 is specified.
     *
     * @param { Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aspectRatio(value: Float64): T

    /**
     * Sets the display priority for the component in the layout container.
     * This parameter is only effective in Row, Column, and Flex (single-line) container components.
     *
     * @param { ?Int32 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func displayPriority(value: ?Int32): T

    /**
     * Sets the base size of the component in the main axis of the parent container.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexBasis(value: ?Length): T

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Float64): T

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @param { ?Int64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Int64): T

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Float64): T

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @param { ?Int64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Int64): T

    /**
     * Sets the alignment mode of the child components along the cross axis of the parent container.
     * Default value: **ItemAlign.Auto**.
     *
     * @param { ?ItemAlign } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignSelf(value: ?ItemAlign): T

    /**
     * Sets the response region of the current component.
     *
     * @param { ?Rectangle } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Rectangle): T

    /**
     * Sets the response region of the current component.
     *
     * @param { ?Array<Rectangle> } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Array<Rectangle>): T

    /**
     * Sets the border.
     *
     * @param { ?Length } width
     * @param { ?ResourceColor } color
     * @param { ?Length } radius
     * @param { ?BorderStyle } style
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func border(width!: ?Length, color!: ?ResourceColor, radius!: ?Length,
        style!: ?BorderStyle): T

    /**
     * Sets the border width.
     * Percentage values are not supported.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?Length): T

    /**
     * Sets the border width.
     *
     * @param { ?EdgeWidths } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?EdgeWidths): T

    /**
     * Sets the border color.
     * Default value: **Color.Black**.
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderColor(value: ?ResourceColor): T

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { ?Length } topLeft
     * @param { ?Length } topRight
     * @param { ?Length } bottomLeft
     * @param { ?Length } bottomRight
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(topLeft!: ?Length, topRight!: ?Length, bottomLeft!: ?Length,
        bottomRight!: ?Length): T

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(value: ?Length): T

    /**
     * Sets the border style.
     * Default value: **BorderStyle.Solid**.
     *
     * @param { ?BorderStyle } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderStyle(value: ?BorderStyle): T

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { ?BlurStyle } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle): T

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { ?BlurStyle } value
     * @param { ?ForegroundBlurStyleOptions } options
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ?ColoringStrategy } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ColoringStrategy): T

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ResourceColor): T

    /**
     * Background color
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundColor(value: ?ResourceColor): T

    /**
     * Background image
     *
     * @param { ?ResourceStr } src
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr): T

    /**
     * Background image
     * @param { ?ResourceStr } src
     * @param { ?ImageRepeat } repeat
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T

    /**
     * Background image size
     *
     * @param { ?ImageSize } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(value: ?ImageSize): T

    /**
     * Background image size
     *
     * @param { ?Length } width
     * @param { ?Length } height
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(width!: ?Length, height!: ?Length): T

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { ?Alignment } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(value: ?Alignment): T

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { ?Length } x
     * @param { ?Length } y
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(x!: ?Length, y!: ?Length): T

    /**
     * Scales the component.
     * Scale ratio along the x-, y-, and z-axis. The default value is **1**.
     * centerX and centerY are used to set the scale center point.
     * default:{x:1,y:1,z:1,centerX:'50%',centerY:'50%'}
     *
     * @param { ?Float32 } x
     * @param { ?Float32 } y
     * @param { ?Float32 } z
     * @param { ?Length } centerX
     * @param { ?Length } centerY
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scale(x!: ?Float32, y!: ?Float32, z!: ?Float32, centerX!: ?Length,
        centerY!: ?Length): T

    /**
     * Sets the opacity of the component.
     *
     * @param { ?Float64 } value - Opacity of the component. The value ranges from 0 to 1.
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func opacity(value: ?Float64): T

    /**
     * Set component rotation.
     *
     * @param { ?Float32 } x
     * @param { ?Float32 } y
     * @param { ?Float32 } z
     * @param { ?Float32 } angle
     * @param { ?Length } centerX
     * @param { ?Length } centerY
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rotate(x!: ?Float32, y!: ?Float32, z!: ?Float32, angle!: ?Float32,
        centerX!: ?Length, centerY!: ?Length): T

    /**
     * Sets the translation effect for page transitions.
     *
     * @param { ?Length } x
     * @param { ?Length } y
     * @param { ?Length } z
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func translate(x!: ?Length, y!: ?Length, z!: ?Length): T

    /**
     * If the value is true, the component is available and can respond to operations such as clicking.
     * If it is set to false, click operations are not responded.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enabled(value: ?Bool): T

    /**
     * If the components of the two pages are configured with the same ID.
     * The shared element transition is performed during transition.
     * If the parameter is set to an empty string, the shared element transition does not occur.
     * For details about the options parameter, see the options parameter description.
     *
     * @param { String } id
     * @param { ?SharedTransitionOptions } options
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sharedTransition(id: String, options!: ?SharedTransitionOptions): T

    /**
     * Shared geometry transition
     *
     * @param { ?String } id
     * @param { ?Bool } followWithoutTransition
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func geometryTransition(id: ?String, followWithoutTransition!: ?Bool): T

    /**
     * Adds the content blurring effect for the current component. The input parameter is the blurring radius.
     * The larger the blurring radius, the more blurring the content.
     * If the value is 0, the content blurring effect is not blurring.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func blur(value: ?Float64): T

    /**
     * Applies a color blend effect to the component.
     *
     * @param { ?ResourceColor } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colorBlend(value: ?ResourceColor): T

    /**
     * Applies a background blur effect to the component. You can customize the blur radius and grayscale parameters.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backdropBlur(value: ?Float64): T

    /**
     * Applies a shadow effect to the component.
     *
     * @param { ?Float64 } radius
     * @param { ?ResourceColor } color
     * @param { ?Float64 } offsetX
     * @param { ?Float64 } offsetY
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func shadow(radius!: ?Float64, color!: ?ResourceColor, offsetX!: ?Float64,
        offsetY!: ?Float64): T

    /**
     * Applies a grayscale effect to the component.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func grayscale(value: ?Float64): T

    /**
     * Applies a brightness effect to the component.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func brightness(value: ?Float64): T

    /**
     * Applies a saturation effect to the component.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func saturate(value: ?Float64): T

    /**
     * Applies a contrast effect to the component.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contrast(value: ?Float64): T

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(value: ?Float64): T

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { ?Float64 } low
     * @param { ?Float64 } high
     * @param { ?Float64 } threshold
     * @param { ?Float64 } thresholdRange
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(low!: ?Float64, high!: ?Float64, threshold!: ?Float64, thresholdRange!: ?Float64): T

    /**
     * Sepia conversion ratio of the component.
     *
     * @param { ?Float64 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sepia(value: ?Float64): T

    /**
     * Rotates the hue of the component.
     *
     * @param { ?Float32 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func hueRotate(value: ?Float32): T

    /**
     * The sibling components in the same container are hierarchically displayed. A larger value of z indicates a higher display level.
     *
     * @param { ?Int32 } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func zIndex(value: ?Int32): T

    /**
     * Controls the display or hide of the current component.
     *
     * @param { ?Visibility } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func visibility(value: ?Visibility): T

    /**
     * Sets whether to clip the areas of child components that extend beyond this component's boundaries,
     * That is, whether to perform clipping based on the edge contour of the parent container.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clip(value: ?Bool): T

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { ?BaseShape } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clipShape(value: ?BaseShape): T

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { BaseShape } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maskShape(value: BaseShape): T

    /**
     * Add mask text to the current component. The layout is the same as that of the current component.
     *
     * @param { ?String } value
     * @param { ?Alignment } align
     * @param { ?OverlayOffset } offset
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func overlay(value!: ?String, align!: ?Alignment,
        offset!: ?OverlayOffset): T

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @param { ?Bool } show
     * @param { ?PopupOptions } popup
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?PopupOptions): T

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @param { ?Bool } show
     * @param { ?CustomPopupOptions } popup
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?CustomPopupOptions): T

    /**
     * Menu control
     *
     * @param { ?Array<MenuElement> } content
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(content: ?Array<MenuElement>): T

    /**
     * Menu control
     *
     * @param { ?CustomBuilder } builder
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(builder!: ?CustomBuilder): T

    /**
     * Binds a context menu to the component, whose visibility is subject to the isShown settings.
     *
     * @param { ?CustomBuilder } builder
     * @param { ?ResponseType } responseType
     * @param { ?ContextMenuOptions } options
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindContextMenu(builder!: ?CustomBuilder, responseType!: ?ResponseType,
        options!: ?ContextMenuOptions): T

    /**
     * Linear Gradient
     * angle: Angle of Linear Gradient. The default value is 180;
     * direction: Direction of Linear Gradient. The default value is GradientDirection.Bottom;
     * colors: Color description for gradients.
     * repeating: repeating. The default value is false
     *
     * @param { ?Float64 } angle
     * @param { ?GradientDirection } direction
     * @param { ?Array<(ResourceColor, Float64)> } colors
     * @param { ?Bool } repeating
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func linearGradient(angle!: ?Float64, direction!: ?GradientDirection,
        colors!: ?Array<(ResourceColor, Float64)>, repeating!: ?Bool): T

    /**
     * Creates a sweep gradient.
     *
     * @param { ?(Length, Length) } center
     * @param { ?Float64 } start
     * @param { ?Float64 } end
     * @param { ?Float64 } rotation
     * @param { ?Array<(ResourceColor, Float64)> } colors
     * @param { ?Bool } repeating
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sweepGradient(center: ?(Length, Length), start!: ?Float64, end!: ?Float64,
        rotation!: ?Float64, colors!: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    /**
     * Creates a radial gradient.
     *
     * @param { ?(Length, Length) } center
     * @param { ?Length } radius
     * @param { ?Array<(ResourceColor, Float64)> } colors
     * @param { ?Bool } repeating
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radialGradient(center: ?(Length, Length), radius: ?Length, colors: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    /**
     * Sets hot keys
     *
     * @param { ?FunctionKey } value
     * @param { ?Array<ModifierKey> } keys
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>): T

    /**
     * Sets hot keys
     *
     * @param { ?String } value
     * @param { ?Array<ModifierKey> } keys
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>): T

    /**
     * Sets hot keys
     *
     * @param { ?FunctionKey } value
     * @param { ?Array<ModifierKey> } keys
     * @param { ?() -> Unit } action
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    /**
     * Sets hot keys
     *
     * @param { ?String } value
     * @param { ?Array<ModifierKey> } keys
     * @param { ?() -> Unit } action
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    /**
     * Key. User can set an key to the component to identify it.
     *
     * @param { ?String } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func key(value: ?String): T

    /**
     * How the final state of the component's content is rendered during its width and height animation process.
     *
     * @param { ?RenderFit } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func renderFit(fitMode: ?RenderFit): T

    /**
     * Id. User can set an id to the component to identify it.
     *
     * @param { ?String } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func id(value: ?String): T

    /**
     * Sets the safe area to be expanded to.
     *
     * @param { ?Array<SafeAreaType> } types
     * @param { ?Array<SafeAreaEdge> } edges
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func expandSafeArea(types!: ?Array<SafeAreaType>, edges!: ?Array<SafeAreaEdge>): T

    /**
     * Binds a modal page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { ?Bool } isShow
     * @param { ?CustomBuilder } builder
     * @param { ?ContentCoverOptions } options
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindContentCover(isShow: ?Bool, builder: ?CustomBuilder,
        options!: ?ContentCoverOptions): T

    /**
     * animation
     *
     * @param { ?AnimateParam } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationStart(value: ?AnimateParam): T

    /**
     * animation
     *
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationEnd(): T

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @param { ?TransitionEffect } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect): T
    
    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @param { ?TransitionEffect } value
     * @param { ?TransitionFinishCallback } onFinish
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect, onFinish: ?TransitionFinishCallback): T

    /**
     * Set focusable.
     * Components that have default interaction logic, such as Button and TextInput, are focusable by default. Other
     * components, such as Text and Image, are not focusable by default. Only focusable components can trigger a focus event.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusable(value: ?Bool): T

    /**
     * Set focus index by key tab.
     * The tabIndex and focusScopeId cannot be used together.
     *
     * @param { ?Int32 } index
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabIndex(index: ?Int32): T

    /**
     * Set default focused component when a page create.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func defaultFocus(value: ?Bool): T

    /**
     * Set default focused component when focus on a focus group.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func groupDefaultFocus(value: ?Bool): T

    /**
     * Set a component focused when the component be touched.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusOnTouch(value: ?Bool): T

    /**
     * Binds a sheet page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { ?Bool } isShow - true means display sheet, false means hide sheet.
     * @param { CustomBuilder } builder - the sheet to be displayed.
     * @param { ?SheetOptions } options - options of sheet.
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindSheet(isShow: ?Bool, builder: CustomBuilder, options!: ?SheetOptions): T

    /**
     * Set preview of the component for dragging process
     *
     * @param { String } value - preview of the component for dragging process
     * @returns { This }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func dragPreview(value: String): T
}
