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

import ohos.arkui.shape.{BaseShape}
import ohos.business_exception.BusinessException
import ohos.labels.APILevel
import ohos.base.{ResourceColor, Length, ResourceStr}

/**
 * CommonMethod.
 */
@!APILevel[
    22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAreaChange(event: ?(Area, Area) -> Unit): T

    /*
     * Trigger a visible area change event.
     *
     * @param { ?Array<Float64> } ratios
     * @param { ?(Bool, Float64) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onVisibleAreaChange(ratios: ?Array<Float64>, event: ?(Bool, Float64) -> Unit): T

    /*
     * Triggered when the component is clicked by a mouse button or the mouse pointer moves on the component.
     *
     * @param { ?(MouseEvent) -> Unit } event
     * @returns { This }
     */
    @!APILevel[
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
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
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDrop(event: ?(DragInfo) -> Unit): T

    // Common Attribute
    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used. If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Option<Length> } value - The width of the component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func width(value: Option<Length>): T

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Option<Length> } value - The height of the component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func height(value: Option<Length>): T

    /**
     * The size of the current component.
     *
     * @param { Option<Length> } width - The width of the component
     * @param { Option<Length> } height - The height of the component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func size(width!: ?Length, height!: ?Length): T

    /**
     * Sets the padding of the component.
     *
     * @param { ?Length } value - The padding value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(value: ?Length): T

    /**
     * Sets the padding of the component.
     *
     * @param { ?Length } top - Top padding value
     * @param { ?Length } right - Right padding value
     * @param { ?Length } bottom - Bottom padding value
     * @param { ?Length } left - Left padding value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    /**
     * Sets the margin of the component.
     *
     * @param { ?Length } value - The margin value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(value: ?Length): T

    /**
     * Sets the margin of the component.
     *
     * @param { ?Length } top - Top margin value
     * @param { ?Length } right - Right margin value
     * @param { ?Length } bottom - Bottom margin value
     * @param { ?Length } left - Left margin value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    /**
     * Sets the weight of the component during layout. A component with this attribute is allocated space
     * along the main axis of its parent container (Row, Column, or Flex) based on its specified weight.
     *
     * @param { ?Int32 } value - The layout weight
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func layoutWeight(value: ?Int32): T

    /**
     * Sets the constraint size of the component, which is used to limit the size range during component layout.
     * Default value: **{minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity}**.
     *
     * @param { ?Length } minWidth - The minimum width of the component
     * @param { ?Length } maxWidth - The maximum width of the component
     * @param { ?Length } minHeight - The minimum height of the component
     * @param { ?Length } maxHeight - The maximum height of the component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func constraintSize(minWidth!: ?Length, maxWidth!: ?Length,
        minHeight!: ?Length, maxHeight!: ?Length): T

    /**
     * Sets the alignment mode of the component content in the drawing area.
     * Default value: **Alignment.Center**.
     *
     * @param { ?Alignment } value - The alignment mode
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func align(value: ?Alignment): T

    /**
     * Sets how elements are laid out along the main axis of the container.
     * Default value: **Direction.Auto**.
     *
     * @param { ?Direction } value - The layout direction
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func direction(value: ?Direction): T

    /**
     * Sets the absolute position of the component relative to the position of the parent component.
     * The attribute is not available for a layout container whose width and height are zero.
     *
     * @param { ?Length } x - The x-coordinate relative to the parent component
     * @param { ?Length } y - The y-coordinate relative to the parent component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func position(x!: ?Length, y!: ?Length): T

    /**
     * Sets the anchor for locating the component, which is used to move the component
     * further away from the position specified by position or offset.
     *
     * @param { ?Length } x - The x-coordinate of the anchor
     * @param { ?Length } y - The y-coordinate of the anchor
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func markAnchor(x!: ?Length, y!: ?Length): T

    /**
     * Sets the offset of the component relative to its original position.
     * <br>The offset attribute does not affect the layout of the parent container.
     * It adjusts the component position only during drawing.
     *
     * @param { ?Length } x - The x-coordinate offset
     * @param { ?Length } y - The y-coordinate offset
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func offset(x!: ?Length, y!: ?Length): T

    /**
     * Sets the alignment rules in the relative container.
     * This API is valid only when the container is RelativeContainer.
     *
     * @param { ?AlignRuleOptions } value - The alignment rules
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
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
     * @param { Float64 } value - The aspect ratio
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aspectRatio(value: Float64): T

    /**
     * Sets the display priority for the component in the layout container.
     * This parameter is only effective in Row, Column, and Flex (single-line) container components.
     *
     * @param { ?Int32 } value - The display priority
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func displayPriority(value: ?Int32): T

    /**
     * Sets the base size of the component in the main axis of the parent container.
     *
     * @param { ?Length } value - The base size
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexBasis(value: ?Length): T

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @param { ?Float64 } value - The percentage of remaining space
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Float64): T

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @param { ?Int64 } value - The percentage of remaining space
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Int64): T

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @param { ?Float64 } value - The percentage of shrink size
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Float64): T

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @param { ?Int64 } value - The percentage of shrink size
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Int64): T

    /**
     * Sets the alignment mode of the child components along the cross axis of the parent container.
     * Default value: **ItemAlign.Auto**.
     *
     * @param { ?ItemAlign } value - The alignment mode
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignSelf(value: ?ItemAlign): T

    /**
     * Sets the response region of the current component.
     *
     * @param { ?Rectangle } value - The response region
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Rectangle): T

    /**
     * Sets the response region of the current component.
     *
     * @param { ?Array<Rectangle> } value - The response regions
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Array<Rectangle>): T

    /**
     * Sets the border.
     *
     * @param { ?Length } width - The border width
     * @param { ?ResourceColor } color - The border color
     * @param { ?Length } radius - The border radius
     * @param { ?BorderStyle } style - The border style
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func border(width!: ?Length, color!: ?ResourceColor, radius!: ?Length,
        style!: ?BorderStyle): T

    /**
     * Sets the border width.
     * Percentage values are not supported.
     *
     * @param { ?Length } value - The border width
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?Length): T

    /**
     * Sets the border width.
     *
     * @param { ?EdgeWidths } value - The border widths
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?EdgeWidths): T

    /**
     * Sets the border color.
     * Default value: **Color.Black**.
     *
     * @param { ?ResourceColor } value - The border color
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderColor(value: ?ResourceColor): T

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { ?Length } topLeft - The top-left corner radius
     * @param { ?Length } topRight - The top-right corner radius
     * @param { ?Length } bottomLeft - The bottom-left corner radius
     * @param { ?Length } bottomRight - The bottom-right corner radius
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(topLeft!: ?Length, topRight!: ?Length, bottomLeft!: ?Length,
        bottomRight!: ?Length): T

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { ?Length } value - The border radius
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(value: ?Length): T

    /**
     * Sets the border style.
     * Default value: **BorderStyle.Solid**.
     *
     * @param { ?BorderStyle } value - The border style
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderStyle(value: ?BorderStyle): T

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { ?BlurStyle } value - The blur style
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle): T

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { ?BlurStyle } value - The blur style
     * @param { ?ForegroundBlurStyleOptions } options - The blur style options
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ?ColoringStrategy } value - The foreground color strategy
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ColoringStrategy): T

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ?ResourceColor } value - The foreground color
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ResourceColor): T

    /**
     * Background color
     *
     * @param { ?ResourceColor } value - The background color
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundColor(value: ?ResourceColor): T

    /**
     * Background image
     *
     * @param { ?ResourceStr } src - The background image source
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr): T

    /**
     * Background image
     * @param { ?ResourceStr } src - The background image source
     * @param { ?ImageRepeat } repeat - How to repeat the background image
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T

    /**
     * Background image size
     *
     * @param { ?ImageSize } value - The width and height of the background image
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(value: ?ImageSize): T

    /**
     * Background image size
     *
     * @param { ?Length } width - The width of the background image
     * @param { ?Length } height - The height of the background image
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(width!: ?Length, height!: ?Length): T

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { ?Alignment } value - The alignment of the background image
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(value: ?Alignment): T

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { ?Length } x - The x-coordinate
     * @param { ?Length } y - The y-coordinate
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(x!: ?Length, y!: ?Length): T

    /**
     * Scales the component.
     * Scale ratio along the x-, y-, and z-axis. The default value is **1**.
     * centerX and centerY are used to set the scale center point.
     * default:{x:1,y:1,z:1,centerX:'50%',centerY:'50%'}
     *
     * @param { ?Float32 } x - Scale ratio along the x-axis
     * @param { ?Float32 } y - Scale ratio along the y-axis
     * @param { ?Float32 } z - Scale ratio along the z-axis
     * @param { ?Length } centerX - X coordinate of the scale center point
     * @param { ?Length } centerY - Y coordinate of the scale center point
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scale(x!: ?Float32, y!: ?Float32, z!: ?Float32, centerX!: ?Length,
        centerY!: ?Length): T

    /**
     * Sets the opacity of the component.
     *
     * @param { ?Float64 } value - Opacity of the component. The value ranges from 0 to 1.
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func opacity(value: ?Float64): T

    /**
     * Set component rotation.
     *
     * @param { ?Float64 } x - X component of the rotation vector
     * @param { ?Float64 } y - Y component of the rotation vector
     * @param { ?Float64 } z - Z component of the rotation vector
     * @param { ?Float64 } angle - Rotation angle in degrees
     * @param { ?Length } centerX - X coordinate of the rotation center point
     * @param { ?Length } centerY - Y coordinate of the rotation center point
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rotate(x!: ?Float64, y!: ?Float64, z!: ?Float64, angle!: ?Float64,
        centerX!: ?Length, centerY!: ?Length): T

    /**
     * Sets the translation effect for page transitions.
     *
     * @param { ?Length } x - Translation distance along the x-axis
     * @param { ?Length } y - Translation distance along the y-axis
     * @param { ?Length } z - Translation distance along the z-axis
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func translate(x!: ?Length, y!: ?Length, z!: ?Length): T

    /**
     * If the value is true, the component is available and can respond to operations such as clicking.
     * If it is set to false, click operations are not responded.
     *
     * @param { ?Bool } value - Whether the component is enabled
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enabled(value: ?Bool): T

    /**
     * If the components of the two pages are configured with the same ID.
     * The shared element transition is performed during transition.
     * If the parameter is set to an empty string, the shared element transition does not occur.
     * For details about the options parameter, see the options parameter description.
     *
     * @param { String } id - The shared transition ID
     * @param { ?SharedTransitionOptions } options - Shared transition options
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sharedTransition(id: String, options!: ?SharedTransitionOptions): T

    /**
     * Shared geometry transition
     *
     * @param { ?String } id - Geometry transition ID
     * @param { ?Bool } followWithoutTransition - Whether to follow without transition
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func geometryTransition(id: ?String, followWithoutTransition!: ?Bool): T

    /**
     * Adds the content blurring effect for the current component. The input parameter is the blurring radius.
     * The larger the blurring radius, the more blurring the content.
     * If the value is 0, the content blurring effect is not blurring.
     *
     * @param { ?Float64 } value - The blurring radius
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func blur(value: ?Float64): T

    /**
     * Applies a color blend effect to the component.
     *
     * @param { ?ResourceColor } value - The blend color
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colorBlend(value: ?ResourceColor): T

    /**
     * Applies a background blur effect to the component. You can customize the blur radius and grayscale parameters.
     *
     * @param { ?Float64 } value - The blurring radius
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backdropBlur(value: ?Float64): T

    /**
     * Applies a shadow effect to the component.
     *
     * @param { ?Float64 } radius - Shadow radius
     * @param { ?ResourceColor } color - Shadow color
     * @param { ?Float64 } offsetX - Shadow offset on the x-axis
     * @param { ?Float64 } offsetY - Shadow offset on the y-axis
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func shadow(radius!: ?Float64, color!: ?ResourceColor, offsetX!: ?Float64,
        offsetY!: ?Float64): T

    /**
     * Applies a grayscale effect to the component.
     *
     * @param { ?Float64 } value - Grayscale value (0.0 to 1.0)
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func grayscale(value: ?Float64): T

    /**
     * Applies a brightness effect to the component.
     *
     * @param { ?Float64 } value - Brightness of the component. Default value: **1.0**.
     * <br> The value **1** indicates no effects.
     * <br> The value **0** indicates the complete darkness. If the value is less than **1**, the brightness decreases.
     * <br> If the value is greater than **1**, the brightness increases.
     * <br> A larger value indicates a higher brightness. A brightness of 2 turns the component completely white.
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func brightness(value: ?Float64): T

    /**
     * Applies a saturation effect to the component.
     *
     * @param { ?Float64 } value - Saturation value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func saturate(value: ?Float64): T

    /**
     * Applies a contrast effect to the component.
     *
     * @param { ?Float64 } value - Contrast of the component. Default value: **1.0**.
     * <br> The input parameter is a contrast value.
     * <br> If the value is **1**, the source image is displayed.
     * <br> If the value is greater than 1, a larger value indicates a higher contrast and a clearer image.
     * <br> If the value is less than 1, a smaller value indicates a lower contrast is.
     * <br> If the value is **0**, the image becomes all gray. The unit is percentage.
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contrast(value: ?Float64): T

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { ?Float64 } value - Value indicates the scale of the conversion or the options of invert
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(value: ?Float64): T

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { ?Float64 } low - Defines the low value of threshold
     * @param { ?Float64 } high - Defines the high value of threshold
     * @param { ?Float64 } threshold - Defines the threshold
     * @param { ?Float64 } thresholdRange - Defines the threshold range
     * @returns { This } - Returns the component itself
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(low!: ?Float64, high!: ?Float64, threshold!: ?Float64, thresholdRange!: ?Float64): T

    /**
     * Sepia conversion ratio of the component.
     *
     * @param { ?Float64 } value - Sepia conversion ratio of the component. If the value is **1**, the image
     * <br> is completely sepia. If the value is **0**, the component remains unchanged.
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sepia(value: ?Float64): T

    /**
     * Rotates the hue of the component.
     *
     * @param { ?Float32 } value - Hue rotation angle of the component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func hueRotate(value: ?Float32): T

    /**
     * The sibling components in the same container are hierarchically displayed. A larger value of z indicates a higher display level.
     *
     * @param { ?Int32 } value - The z-index value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func zIndex(value: ?Int32): T

    /**
     * Controls the display or hide of the current component.
     *
     * @param { ?Visibility } value - The visibility state
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func visibility(value: ?Visibility): T

    /**
     * Sets whether to clip the areas of child components that extend beyond this component's boundaries,
     * That is, whether to perform clipping based on the edge contour of the parent container.
     *
     * @param { ?Bool } value - Whether to perform clipping based on the edge contour of the parent container.
     * <br>Default value: **false**.
     * <br>**true**: Perform clipping. **false**: Do not perform clipping.
     * <br>If this parameter is set to **true**.
     * <br>child components exceeding the current component's bounds will not respond to bound gesture events.
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clip(value: ?Bool): T

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { ?BaseShape } value - Shape that the component to be clipped into. The clipped area remains responsive to bound gesture events.
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clipShape(value: ?BaseShape): T

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { BaseShape } value - Mask of the specified shape to add to the component
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maskShape(value: BaseShape): T

    /**
     * Add mask text to the current component. The layout is the same as that of the current component.
     *
     * @param { ?String } value - The overlay text
     * @param { ?Alignment } align - The alignment of the overlay
     * @param { ?OverlayOffset } offset - The offset of the overlay
     * @returns { This } - Returns the component itself
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
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
     * @param { ?Bool } show - Whether to show the popup, default value is false
     * @param { ?PopupOptions } popup - Popup options
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?PopupOptions): T

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @param { ?Bool } show - Whether to show the popup, default value is false
     * @param { ?CustomPopupOptions } popup - Custom popup options
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?CustomPopupOptions): T

    /**
     * Menu control
     *
     * @param { ?Array<MenuElement> } content - Indicates the content of menu
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(content: ?Array<MenuElement>): T

    /**
     * Menu control
     *
     * @param { ?CustomBuilder } builder - Custom menu builder
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(builder!: ?CustomBuilder): T

    /**
     * Binds a context menu to the component, whose visibility is subject to the isShown settings.
     *
     * @param { ?CustomBuilder } builder - Indicates the content of context menu
     * @param { ?ResponseType } responseType - Indicates response type of context menu, Long pressing with a mouse device is not supported
     * @param { ?ContextMenuOptions } options - Indicates the options of context menu
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
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
     * @param { ?Float64 } angle - Defines starting angle of linear gradient. The default value is 180
     * @param { ?GradientDirection } direction - Defines the direction of linear gradient. The default value is GradientDirection.Bottom
     * @param { ?Array<(ResourceColor, Float64)> } colors - Defines color description for gradients
     * @param { ?Bool } repeating - Defines gradient colors with repeated coloring. The default value is false
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func linearGradient(angle!: ?Float64, direction!: ?GradientDirection,
        colors!: ?Array<(ResourceColor, Float64)>, repeating!: ?Bool): T

    /**
     * Creates a sweep gradient.
     *
     * @param { ?(Length, Length) } center - Defines center point for angle gradient
     * @param { ?Float64 } start - Defines the starting point of angle gradient. The default value is 0
     * @param { ?Float64 } end - Defines end point of angle gradient. The default value is 0
     * @param { ?Float64 } rotation - Defines the rotation angle of the gradient. The default value is 0
     * @param { ?Array<(ResourceColor, Float64)> } colors - Defines color description for gradients
     * @param { ?Bool } repeating - Defines gradient colors with repeated coloring. The default value is false
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sweepGradient(center: ?(Length, Length), start!: ?Float64, end!: ?Float64,
        rotation!: ?Float64, colors!: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    /**
     * Creates a radial gradient.
     *
     * @param { ?(Length, Length) } center - Defines center point for radial gradient
     * @param { ?Length } radius - Defines radius of the radial gradient
     * @param { ?Array<(ResourceColor, Float64)> } colors - Defines color description for gradients
     * @param { ?Bool } repeating - Defines gradient colors with repeated coloring. The default value is false
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radialGradient(center: ?(Length, Length), radius: ?Length, colors: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    /**
     * Sets hot keys
     *
     * @param { ?FunctionKey } value - The function key
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>): T

    /**
     * Sets hot keys
     *
     * @param { ?String } value - The key string
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>): T

    /**
     * Sets hot keys
     *
     * @param { ?FunctionKey } value - The function key
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @param { ?() -> Unit } action - Custom action to execute
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    /**
     * Sets hot keys
     *
     * @param { ?String } value - The key string
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @param { ?() -> Unit } action - Custom action to execute
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    /**
     * Key. User can set an key to the component to identify it.
     *
     * @param { ?String } value - The key value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func key(value: ?String): T

    /**
     * How the final state of the component's content is rendered during its width and height animation process.
     *
     * @param { ?RenderFit } value - How the final state of the component's content is rendered during.
     * @default RenderFit.TopLeft
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func renderFit(fitMode: ?RenderFit): T

    /**
     * Id. User can set an id to the component to identify it.
     *
     * @param { ?String } value - The ID value
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func id(value: ?String): T

    /**
     * Sets the safe area to be expanded to.
     * <br>default value:
     * <br>types: [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD],
     * <br>edges: [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END]
     * Expands the safe area of the component.
     *
     * @param { ?Array<SafeAreaType> } types - Indicates the types of the safe area
     * @param { ?Array<SafeAreaEdge> } edges - Indicates the edges of the safe area
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func expandSafeArea(types!: ?Array<SafeAreaType>, edges!: ?Array<SafeAreaEdge>): T

    /**
     * Binds a modal page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { ?Bool } isShow - true means display content, false means hide content
     * @param { ?CustomBuilder } builder - the content to be displayed
     * @param { ?ContentCoverOptions } options - options of content cover
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindContentCover(isShow: ?Bool, builder: ?CustomBuilder,
        options!: ?ContentCoverOptions): T

    /**
     * animation
     *
     * @param { ?AnimateParam } value - The animation parameters
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationStart(value: ?AnimateParam): T

    /**
     * animation
     *
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationEnd(): T

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @param { ?TransitionEffect } value - The transition effect
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect): T

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @param { ?TransitionEffect } value - The transition effect
     * @param { ?TransitionFinishCallback } onFinish - Callback when transition finishes
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect, onFinish: ?TransitionFinishCallback): T

    /**
     * Set focusable.
     * Components that have default interaction logic, such as Button and TextInput, are focusable by default. Other
     * components, such as Text and Image, are not focusable by default. Only focusable components can trigger a focus event.
     *
     * @param { ?Bool } value - Whether the component is focusable
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusable(value: ?Bool): T

    /**
     * Set focus index by key tab.
     * The tabIndex and focusScopeId cannot be used together.
     *
     * @param { ?Int32 } index - The tab index
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabIndex(index: ?Int32): T

    /**
     * Set default focused component when a page create.
     *
     * @param { ?Bool } value - Whether the component is the default focus
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func defaultFocus(value: ?Bool): T

    /**
     * Set default focused component when focus on a focus group.
     *
     * @param { ?Bool } value - Whether the component is the group default focus
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func groupDefaultFocus(value: ?Bool): T

    /**
     * Set a component focused when the component be touched.
     *
     * @param { ?Bool } value - Whether to focus on touch
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusOnTouch(value: ?Bool): T

    /**
     * Binds a sheet page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { ?Bool } isShow - true means display sheet, false means hide sheet
     * @param { CustomBuilder } builder - the sheet to be displayed
     * @param { ?SheetOptions } options - options of sheet
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindSheet(isShow: ?Bool, builder: CustomBuilder, options!: ?SheetOptions): T

    /**
     * Set preview of the component for dragging process
     *
     * @param { String } value - preview of the component for dragging process
     * @returns { This } - Returns the component itself
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func dragPreview(value: String): T
}
