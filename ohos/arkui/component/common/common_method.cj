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
import ohos.labels.{APILevel, Hide}
import ohos.base.{ResourceColor, Length, ResourceStr}

/**
 * CommonMethod interface.
 * This interface defines common methods that can be applied to UI components.
 * It provides a generic type T that represents the return type of the methods,
 * allowing for method chaining in fluent APIs.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CommonMethod<T> {
    /**
     * Registers a callback function that is triggered when the component is clicked.
     *
     * @param { ?(ClickEvent) -> Unit } event - The callback function to be executed on click
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onClick(event: ?(ClickEvent) -> Unit): T

    /**
     * Registers a callback function that is triggered when the component appears on the screen.
     *
     * @param { ?() -> Unit } event - The callback function to be executed when the component appears
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAppear(event: ?() -> Unit): T

    /**
     * This callback is triggered when component uninstallation disappears.
     * Registers a callback function that is triggered when the component disappears from the screen.
     *
     * @param { ?() -> Unit } event - The callback function triggered when the component tree disappears
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDisAppear(event: ?() -> Unit): T

    /**
     * Invoked when a touch event is triggered.
     * Registers a callback function that is triggered when touch events occur on the component.
     *
     * @param { ?(TouchEvent) -> Unit } event - The callback function to be executed on touch events
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onTouch(event: ?(TouchEvent) -> Unit): T

    /**
     * Registers a callback function that is triggered when the mouse pointer enters or leaves the component.
     *
     * @param { ?(Bool) -> Unit } event - The callback function to be executed on hover events.
     *                                   The boolean parameter indicates whether the pointer is hovering over the component.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onHover(event: ?(Bool) -> Unit): T

    /**
     * This callback is triggered when the size or position of this component change finished.
     * Registers a callback function that is triggered when the component's size or position changes.
     *
     * @param { ?(Area, Area) -> Unit } event - The callback function to be executed when the area changes.
     *                                        The first parameter is the old area, the second is the new area.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAreaChange(event: ?(Area, Area) -> Unit): T

    /**
     * Registers a callback function that is triggered when the visible area of the component changes.
     *
     * @param { ?Array<Float64> } ratios - Array of visibility ratios that trigger the callback
     * @param { ?(Bool, Float64) -> Unit } event - The callback function to be executed when visibility changes.
     *                                           The boolean indicates if the component is visible, and the float is the visibility ratio.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onVisibleAreaChange(ratios: ?Array<Float64>, event: ?(Bool, Float64) -> Unit): T

    /**
     * Triggered when the component is clicked by a mouse button or the mouse pointer moves on the component.
     * Registers a callback function that is triggered when mouse events occur on the component.
     *
     * @param { ?(MouseEvent) -> Unit } event - The callback function to be executed on mouse events
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onMouse(event: ?(MouseEvent) -> Unit): T

    /**
     * Registers a callback function that is triggered when keyboard events occur.
     *
     * @param { ?(KeyEvent) -> Unit } event - The callback function to be executed on key events
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onKeyEvent(event: ?(KeyEvent) -> Unit): T

    /**
     * Registers a callback function that is triggered when the component receives focus.
     *
     * @param { ?() -> Unit } event - The callback function to be executed when the component gets focus
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onFocus(event: ?() -> Unit): T

    /**
     * Registers a callback function that is triggered when the component loses focus.
     *
     * @param { ?() -> Unit } event - The callback function to be executed when the component loses focus
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onBlur(event: ?() -> Unit): T

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     * Registers a callback function that is triggered when a drag operation starts, providing a DragItemInfo.
     *
     * @param { ?(DragInfo) -> DragItemInfo } event - The callback function to be executed when drag starts
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> DragItemInfo): T

    /**
     * Registers a callback function that is triggered when a drag operation starts, providing a CustomBuilder.
     *
     * @param { ?(DragInfo) -> CustomBuilder } event - The callback function to be executed when drag starts
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> CustomBuilder): T

    /**
     * Registers a callback function that is triggered when a drag operation starts, with no return value.
     *
     * @param { ?(DragInfo) -> Unit } event - The callback function to be executed when drag starts
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragStart(event: ?(DragInfo) -> Unit): T

    /**
     * Registers a callback function that is triggered when a dragged item enters the component's area.
     *
     * @param { ?(DragInfo) -> Unit } event - The callback function to be executed when drag enters
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragEnter(event: ?(DragInfo) -> Unit): T

    /**
     * After binding, a callback is triggered when the drag moves within the range of a placeable component.
     * Registers a callback function that is triggered when a dragged item moves within the component's area.
     *
     * @param { ?(DragInfo) -> Unit } event - The callback function to be executed when drag moves
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragMove(event: ?(DragInfo) -> Unit): T

    /**
     * After binding, a callback is triggered when the component is dragged out of the component range.
     * Registers a callback function that is triggered when a dragged item leaves the component's area.
     *
     * @param { ?(DragInfo) -> Unit } event - The callback on drag leave
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDragLeave(event: ?(DragInfo) -> Unit): T

    /**
     * The component bound to this event can be used as the drag release target.
     * This callback is triggered when the drag behavior is stopped within the scope of the component.
     * Registers a callback function that is triggered when a dragged item is dropped on the component.
     *
     * @param { ?(DragInfo) -> Unit } event - The callback function to be executed when drag drops
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onDrop(event: ?(DragInfo) -> Unit): T

    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used. If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Option<Length> } value - The width of the component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func width(value: Option<Length>): T

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Option<Length> } value - The height of the component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func height(value: Option<Length>): T

    /**
     * Sets both the width and height of the component.
     *
     * @param { Option<Length> } width - The width of the component
     * @param { Option<Length> } height - The height of the component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func size(width!: ?Length, height!: ?Length): T

    /**
     * Sets the padding of the component.
     * Sets uniform padding for all sides of the component.
     *
     * @param { ?Length } value - The padding value for all sides
     * @default 0
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(value: ?Length): T

    /**
     * Sets the padding of the component. Default value: **0**.
     * Sets individual padding values for each side of the component.
     *
     * @param { ?Length } top - Padding for the top side
     * @param { ?Length } right - Padding for the right side
     * @param { ?Length } bottom - Padding for the bottom side
     * @param { ?Length } left - Padding for the left side
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func padding(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    /**
     * Sets uniform margin for all sides of the component.
     *
     * @param { ?Length } value - The margin value for all sides
     * @default 0
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(value: ?Length): T

    /**
     * Sets individual margin values for each side of the component.
     *
     * @param { ?Length } top - Margin for the top side
     * @param { ?Length } right - Margin for the right side
     * @param { ?Length } bottom - Margin for the bottom side
     * @param { ?Length } left - Margin for the left side
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func margin(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T

    /**
     * Sets the weight of the component during layout. A component with this attribute is allocated space
     * along the main axis of its parent container (Row, Column, or Flex) based on its specified weight.
     * Sets the layout weight of the component.
     *
     * @param { ?Int32 } value - The layout weight of the component
     * @default 0
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func layoutWeight(value: ?Int32): T

    /**
     * Sets the constraint size of the component, which is used to limit the size range during component layout.
     * Default value: **minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity**.
     * Sets the constraint size of the component.
     *
     * @param { ?Length } minWidth - Minimum width of the component
     * @param { ?Length } maxWidth - Maximum width of the component
     * @param { ?Length } minHeight - Minimum height of the component
     * @param { ?Length } maxHeight - Maximum height of the component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func constraintSize(minWidth!: ?Length, maxWidth!: ?Length,
        minHeight!: ?Length, maxHeight!: ?Length): T

    /**
     * Sets the alignment mode of the component content in the drawing area.
     * Sets the alignment of the component within its container.
     *
     * @param { ?Alignment } value - The alignment mode
     * @default Alignment.Center.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func align(value: ?Alignment): T

    /**
     * Sets how elements are laid out along the main axis of the container.
     *
     * @param { ?Direction } value - The layout direction
     * @default Direction.Auto.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func direction(value: ?Direction): T

    /**
     * Sets the absolute position of the component relative to the position of the parent component.
     * The attribute is not available for a layout container whose width and height are zero.
     * Sets the absolute position of the component.
     *
     * @param { ?Length } x - X coordinate relative to the parent component
     * @param { ?Length } y - Y coordinate relative to the parent component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func position(x!: ?Length, y!: ?Length): T

    /**
     * Sets the anchor for locating the component, which is used to move the component
     * further away from the position specified by position or offset.
     * Sets the anchor point for the component.
     *
     * @param { ?Length } x - X coordinate of the anchor point
     * @param { ?Length } y - Y coordinate of the anchor point
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func markAnchor(x!: ?Length, y!: ?Length): T

    /**
     * Sets the offset of the component relative to its original position.
     * <br>The offset attribute does not affect the layout of the parent container.
     * It adjusts the component position only during drawing.
     * Sets the offset of the component.
     *
     * @param { ?Length } x - X offset from the original position
     * @param { ?Length } y - Y offset from the original position
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func offset(x!: ?Length, y!: ?Length): T

    /**
     * Sets the alignment rules in the relative container.
     * This API is valid only when the container is RelativeContainer.
     * Sets the alignment rules for the component in a RelativeContainer.
     *
     * @param { ?AlignRuleOptions } value - The alignment rules
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignRules(value: ?AlignRuleOptions): T

    /**
     * Sets the aspect ratio of the component, which can be obtained using the following formula: width/height.
     * If only width and aspectRatio are set, the height is calculated using the following formula: width/aspectRatio.
     * If only height and aspectRatio are set, the width is calculated using the following formula: height x aspectRatio.
     * If width, height, and aspectRatio are all set, the explicitly set height is ignored, and the effective height is calculated using the following formula: width/aspectRatio.
     * This parameter takes effect only when a valid value greater than 0 is specified.
     * Sets the aspect ratio of the component.
     *
     * @param { Float64 } value - The aspect ratio (width/height)
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func aspectRatio(value: Float64): T

    /**
     * Sets the display priority for the component in the layout container.
     * This parameter is only effective in Row, Column, and Flex (single-line) container components.
     * Sets the display priority of the component.
     *
     * @param { ?Int32 } value - The display priority
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func displayPriority(value: ?Int32): T

    /**
     * Sets the base size of the component in the main axis of the parent container.
     * Sets the flex basis of the component.
     *
     * @param { ?Length } value - The base size in the main axis
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexBasis(value: ?Length): T

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Sets the flex grow factor of the component.
     *
     * @param { ?Float64 } value - The flex grow factor
     * @default 0.0
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Float64): T

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Sets the flex grow factor of the component.
     *
     * @param { ?Int64 } value - The flex grow factor
     * @default 0
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexGrow(value: ?Int64): T

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     * Sets the flex shrink factor of the component.
     *
     * @param { ?Float64 } value - The flex shrink factor
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Float64): T

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     * Sets the flex shrink factor of the component.
     *
     * @param { ?Int64 } value - The flex shrink factor
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func flexShrink(value: ?Int64): T

    /**
     * Sets the alignment mode of the child components along the cross axis of the parent container.
     * Sets the alignment of the component along the cross axis.
     *
     * @param { ?ItemAlign } value - The alignment mode along the cross axis
     * @default ItemAlign.Auto
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignSelf(value: ?ItemAlign): T

    /**
     * Sets the response region of the current component.
     *
     * @param { ?Rectangle } value - The response region rectangle
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Rectangle): T

    /**
     * Sets the response region of the current component.
     *
     * @param { ?Array<Rectangle> } value - Array of response region rectangles
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func responseRegion(value: ?Array<Rectangle>): T

    /**
     * Sets all border properties at once.
     *
     * @param { ?Length } width - Border width
     * @param { ?ResourceColor } color - Border color
     * @param { ?Length } radius - Border radius
     * @param { ?BorderStyle } style - Border style
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func border(width!: ?Length, color!: ?ResourceColor, radius!: ?Length,
        style!: ?BorderStyle): T

    /**
     * Sets uniform border width for all sides.
     *
     * @param { ?Length } value - Border width for all sides
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?Length): T

    /**
     * Sets individual border widths for each side.
     *
     * @param { ?EdgeWidths } value - Border widths for each side
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderWidth(value: ?EdgeWidths): T

    /**
     * Sets the border color.
     *
     * @param { ?ResourceColor } value - Border color
     * @default Color.Black
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderColor(value: ?ResourceColor): T

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     * Sets individual border radius values for each corner.
     *
     * @param { ?Length } topLeft - Radius of the top-left corner
     * @param { ?Length } topRight - Radius of the top-right corner
     * @param { ?Length } bottomLeft - Radius of the bottom-left corner
     * @param { ?Length } bottomRight - Radius of the bottom-right corner
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(topLeft!: ?Length, topRight!: ?Length, bottomLeft!: ?Length,
        bottomRight!: ?Length): T

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     * Sets uniform border radius for all corners.
     *
     * @param { ?Length } value - Border radius for all corners
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderRadius(value: ?Length): T

    /**
     * Sets the border style.
     *
     * @param { ?BorderStyle } value - Border style
     * @default BorderStyle.Solid
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func borderStyle(value: ?BorderStyle): T

    /**
     * Applies a foreground blur effect.
     *
     * @param { ?BlurStyle } value - The blur style
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle): T

    /**
     * Applies a foreground blur effect with additional options.
     *
     * @param { ?BlurStyle } value - The blur style
     * @param { ?ForegroundBlurStyleOptions } options - Additional blur options
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundBlurStyle(value: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T

    /**
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     * Sets the foreground color using a coloring strategy.
     *
     * @param { ?ColoringStrategy } value - Foreground color strategy
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ColoringStrategy): T

    /**
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     * Sets the foreground color using a specific color.
     *
     * @param { ?ResourceColor } value - Foreground color
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func foregroundColor(value: ?ResourceColor): T

    /**
     * Background color.
     * Sets the background color of the component.
     *
     * @param { ?ResourceColor } value - Background color
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundColor(value: ?ResourceColor): T

    /**
     * Sets the background image of the component.
     *
     * @param { ?ResourceStr } src - The background image source
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr): T

    /**
     * Background image.
     * Sets the background image of the component with repeat options.
     *
     * @param { ?ResourceStr } src - The background image source
     * @param { ?ImageRepeat } repeat - How to repeat the background image
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T

    /**
     * Sets the size of the background image using ImageSize.
     *
     * @param { ?ImageSize } value - The width and height of the background image
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(value: ?ImageSize): T

    /**
     * Sets the size of the background image using width and height.
     *
     * @param { ?Length } width - Width of the background image
     * @param { ?Length } height - Height of the background image
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImageSize(width!: ?Length, height!: ?Length): T

    /**
     * Background image position.
     * Sets the position of the background image using Alignment.
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { ?Alignment } value - Alignment of the background image
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(value: ?Alignment): T

    /**
     * Background image position.
     * Sets the position of the background image using coordinates.
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { ?Length } x - Horizontal coordinate
     * @param { ?Length } y - Vertical coordinate
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func backgroundImagePosition(x!: ?Length, y!: ?Length): T

    /**
     * Scale ratio along the x-, y-, and z-axis. The default value is **1**.
     * centerX and centerY are used to set the scale center point.
     * default:{x:1,y:1,z:1,centerX:'50%',centerY:'50%'}
     * Sets the scale transformation of the component.
     *
     * @param { ?Float32 } x - Scale ratio along the x-axis
     * @param { ?Float32 } y - Scale ratio along the y-axis
     * @param { ?Float32 } z - Scale ratio along the z-axis
     * @param { ?Length } centerX - X coordinate of the scale center point
     * @param { ?Length } centerY - Y coordinate of the scale center point
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scale(x!: ?Float32, y!: ?Float32, z!: ?Float32, centerX!: ?Length,
        centerY!: ?Length): T

    /**
     * Sets the opacity of the component.
     *
     * @param { ?Float64 } value - Opacity of the component. The value ranges from 0 to 1
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func opacity(value: ?Float64): T

    /**
     * Set component rotation.
     * Sets the rotation transformation of the component.
     *
     * @param { ?Float64 } x - X component of the rotation vector
     * @param { ?Float64 } y - Y component of the rotation vector
     * @param { ?Float64 } z - Z component of the rotation vector
     * @param { ?Float64 } angle - Rotation angle in degrees
     * @param { ?Length } centerX - X coordinate of the rotation center point
     * @param { ?Length } centerY - Y coordinate of the rotation center point
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func rotate(x!: ?Float64, y!: ?Float64, z!: ?Float64, angle!: ?Float64,
        centerX!: ?Length, centerY!: ?Length): T

    /**
     * Sets the translation transformation of the component.
     *
     * @param { ?Length } x - Translation distance along the x-axis
     * @param { ?Length } y - Translation distance along the y-axis
     * @param { ?Length } z - Translation distance along the z-axis
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func translate(x!: ?Length, y!: ?Length, z!: ?Length): T

    /**
     * If the value is true, the component is available and can respond to operations such as clicking.
     * If it is set to false, click operations are not responded.
     * Sets whether the component is enabled.
     *
     * @param { ?Bool } value - Whether the component is enabled
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func enabled(value: ?Bool): T

    /**
     * If the components of the two pages are configured with the same ID.
     * The shared element transition is performed during transition.
     * If the parameter is set to an empty string, the shared element transition does not occur.
     * For details about the options parameter, see the options parameter description.
     * Sets a shared transition for the component.
     *
     * @param { String } id - The shared transition ID
     * @param { ?SharedTransitionOptions } options - Shared transition options
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sharedTransition(id: String, options!: ?SharedTransitionOptions): T

    /**
     * Sets a geometry transition for the component.
     *
     * @param { ?String } id - Geometry transition ID
     * @param { ?Bool } followWithoutTransition - Whether to follow without transition
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func geometryTransition(id: ?String, followWithoutTransition!: ?Bool): T

    /**
     * Adds the content blurring effect for the current component. The input parameter is the blurring radius.
     * The larger the blurring radius, the more blurring the content.
     * If the value is 0, the content blurring effect is not blurring.
     * Applies a blur effect to the component.
     *
     * @param { ?Float64 } value - The blurring radius
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func blur(value: ?Float64): T

    /**
     * Applies a color blend effect to the component.
     *
     * @param { ?ResourceColor } value - The blend color
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func colorBlend(value: ?ResourceColor): T

    /**
     * Applies a background blur effect to the component. You can customize the blur radius and grayscale parameters.
     *
     * @param { ?Float64 } value - The blurring radius
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func shadow(radius!: ?Float64, color!: ?ResourceColor, offsetX!: ?Float64,
        offsetY!: ?Float64): T

    /**
     * Applies a grayscale effect to the component.
     *
     * @param { ?Float64 } value - Grayscale value (0.0 to 1.0)
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func brightness(value: ?Float64): T

    /**
     * Applies a saturation effect to the component.
     *
     * @param { ?Float64 } value - Saturation value
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func contrast(value: ?Float64): T

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { ?Float64 } value - Value indicates the scale of the conversion or the options of invert
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func invert(low!: ?Float64, high!: ?Float64, threshold!: ?Float64, thresholdRange!: ?Float64): T

    /**
     * Applies a sepia effect to the component.
     *
     * @param { ?Float64 } value - Sepia conversion ratio of the component. If the value is **1**, the image
     * <br> is completely sepia. If the value is **0**, the component remains unchanged.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sepia(value: ?Float64): T

    /**
     * Applies a hue rotation effect to the component.
     *
     * @param { ?Float32 } value - Hue rotation angle of the component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func hueRotate(value: ?Float32): T

    /**
     * The sibling components in the same container are hierarchically displayed. A larger value of z indicates a higher display level.
     *
     * @param { ?Int32 } value - The z-index value
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func zIndex(value: ?Int32): T

    /**
     * Controls the display or hide of the current component.
     *
     * @param { ?Visibility } value - The visibility state
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func visibility(value: ?Visibility): T

    /**
     * Sets whether to clip the areas of child components that extend beyond this component's boundaries,
     * That is, whether to perform clipping based on the edge contour of the parent container.
     * Sets whether to clip the component's content.
     *
     * @param { ?Bool } value - Whether to perform clipping based on the edge contour of the parent container.
     * <br>Default value: **false**.
     * <br>**true**: Perform clipping. **false**: Do not perform clipping.
     * <br>If this parameter is set to **true**.
     * <br>child components exceeding the current component's bounds will not respond to bound gesture events.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clip(value: ?Bool): T

    /**
     * Clips this component based on the given shape.
     *
     * @param { ?BaseShape } value - Shape that the component to be clipped into. The clipped area remains responsive to bound gesture events.
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func clipShape(value: ?BaseShape): T

    /**
     * Adds a mask to the component using a specific shape.
     *
     * @param { BaseShape } value - Mask of the specified shape to add to the component
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func maskShape(value: BaseShape): T

    /**
     * Add mask text to the current component. The layout is the same as that of the current component.
     *
     * @param { ?String } value - The overlay text
     * @param { ?Alignment } align - The alignment of the overlay
     * @param { ?OverlayOffset } offset - The offset of the overlay
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindPopup(show: ?Bool, popup: ?CustomPopupOptions): T

    /**
     * Binds a menu to the component.
     *
     * @param { ?Array<MenuElement> } content - Indicates the content of menu
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(content: ?Array<MenuElement>): T

    /**
     * Binds a custom menu to the component.
     *
     * @param { ?CustomBuilder } builder - Custom menu builder
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindMenu(builder!: ?CustomBuilder): T

    /**
     * Binds a context menu to the component, whose visibility is subject to the isShown settings.
     *
     * @param { ?CustomBuilder } builder - Indicates the content of context menu
     * @param { ?ResponseType } responseType - Indicates response type of context menu, Long pressing with a mouse device is not supported
     * @param { ?ContextMenuOptions } options - Indicates the options of context menu
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func linearGradient(angle!: ?Float64, direction!: ?GradientDirection,
        colors!: ?Array<(ResourceColor, Float64)>, repeating!: ?Bool): T

    /**
     * Applies a sweep gradient to the component.
     *
     * @param { ?(Length, Length) } center - Defines center point for angle gradient
     * @param { ?Float64 } start - Defines the starting point of angle gradient. The default value is 0
     * @param { ?Float64 } end - Defines end point of angle gradient. The default value is 0
     * @param { ?Float64 } rotation - Defines the rotation angle of the gradient. The default value is 0
     * @param { ?Array<(ResourceColor, Float64)> } colors - Defines color description for gradients
     * @param { ?Bool } repeating - Defines gradient colors with repeated coloring. The default value is false
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sweepGradient(center: ?(Length, Length), start!: ?Float64, end!: ?Float64,
        rotation!: ?Float64, colors!: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    /**
     * Applies a radial gradient to the component.
     *
     * @param { ?(Length, Length) } center - Defines center point for radial gradient
     * @param { ?Length } radius - Defines radius of the radial gradient
     * @param { ?Array<(ResourceColor, Float64)> } colors - Defines color description for gradients
     * @param { ?Bool } repeating - Defines gradient colors with repeated coloring. The default value is false
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radialGradient(center: ?(Length, Length), radius: ?Length, colors: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool): T

    /**
     * Sets a keyboard shortcut using a FunctionKey.
     *
     * @param { ?FunctionKey } value - The function key
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>): T

    /**
     * Sets a keyboard shortcut using a string.
     *
     * @param { ?String } value - The key string
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>): T

    /**
     * Sets a keyboard shortcut using a FunctionKey with a custom action.
     *
     * @param { ?FunctionKey } value - The function key
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @param { ?() -> Unit } action - Custom action to execute
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    /**
     * Sets a keyboard shortcut using a string with a custom action.
     *
     * @param { ?String } value - The key string
     * @param { ?Array<ModifierKey> } keys - Modifier keys
     * @param { ?() -> Unit } action - Custom action to execute
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>, action: ?() -> Unit): T

    /**
     * Key. User can set an key to the component to identify it.
     *
     * @param { ?String } value - The key value
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func key(value: ?String): T

    /**
     * How the final state of the component's content is rendered during its width and height animation process.
     *
     * @param { ?RenderFit } fitMode - How the final state of the component's content is rendered during.
     * @default RenderFit.TopLeft
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func renderFit(fitMode: ?RenderFit): T

    /**
     * Id. User can set an id to the component to identify it.
     *
     * @param { ?String } value - The ID value
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
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
     * @returns { T } - Returns the component itself
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func expandSafeArea(types!: ?Array<SafeAreaType>, edges!: ?Array<SafeAreaEdge>): T

    /**
     * Binds a modal page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { ?Bool } isShow - true means display content, false means hide content
     * @param { ?CustomBuilder } builder - the content to be displayed
     * @param { ?ContentCoverOptions } options - options of content cover
     * @returns { T } - Returns the component itself
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindContentCover(isShow: ?Bool, builder: ?CustomBuilder,
        options!: ?ContentCoverOptions): T

    /**
     * animation
     *
     * @param { ?AnimateParam } value - The animation parameters
     * @returns { T } - Returns the component itself
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    func animationStart(value: ?AnimateParam): T

    /**
     * animation
     *
     * @returns { T } - Returns the component itself
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    func animationEnd(): T

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @param { ?TransitionEffect } value - The transition effect
     * @returns { T } - Returns the component itself
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect): T

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @param { ?TransitionEffect } value - The transition effect
     * @param { ?TransitionFinishCallback } onFinish - Callback when transition finishes
     * @returns { T } - Returns the component itself
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func transition(value: ?TransitionEffect, onFinish: ?TransitionFinishCallback): T

    /**
     * Set focusable.
     * Components that have default interaction logic, such as Button and TextInput, are focusable by default. Other
     * components, such as Text and Image, are not focusable by default. Only focusable components can trigger a focus event.
     * Sets whether the component is focusable.
     *
     * @param { ?Bool } value - Whether the component is focusable
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusable(value: ?Bool): T

    /**
     * The tabIndex and focusScopeId cannot be used together.
     * Sets the tab index of the component.
     *
     * @param { ?Int32 } index - The tab index
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabIndex(index: ?Int32): T

    /**
     * Sets whether the component is the default focus when the page is created.
     *
     * @param { ?Bool } value - Whether the component is the default focus
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func defaultFocus(value: ?Bool): T

    /**
     * Sets whether the component is the default focus within a focus group.
     *
     * @param { ?Bool } value - Whether the component is the group default focus
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func groupDefaultFocus(value: ?Bool): T

    /**
     * Sets whether the component should receive focus when touched.
     *
     * @param { ?Bool } value - Whether to focus on touch
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func focusOnTouch(value: ?Bool): T

    /**
     * Binds a sheet page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { ?Bool } isShow - true means display sheet, false means hide sheet
     * @param { CustomBuilder } builder - the sheet to be displayed
     * @param { ?SheetOptions } options - options of sheet
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func bindSheet(isShow: ?Bool, builder: CustomBuilder, options!: ?SheetOptions): T

    /**
     * Set preview of the component for dragging process.
     *
     * @param { String } value - preview of the component for dragging process
     * @returns { T } - Returns the component itself.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func dragPreview(value: String): T
}
