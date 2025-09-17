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

import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.hi_trace_meter.*
import ohos.labels.APILevel
import ohos.arkui.shape.*
import std.regex.*
import std.math.*
import std.convert.*

protected open class CommonMethodComponent<T> <: UINodeBase & CommonMethod<T> {
    protected init(id: Int64){
        super(id)
    }

    protected init(){
        super()
    }

    protected var child: ?() -> Unit = None

    protected open func pop(): Unit {
        unsafe {
            if (child.isNone()) {
                FfiOHOSAceFrameworkViewAbstractPop()
            } else {
                FfiOHOSAceFrameworkContainerBasePop()
            }
        }
    }

    protected open func genChild(): Unit {
        if (let Some(v) <- child) {
            v()
        }
    }

    protected open func initial(): Unit {
        genChild()
        pop()
    }

    protected open func update(): Unit {
        pop()
    }

    /*
     * Called when a click event occurs.
     *
     * @param { function } event
     * @returns { This }
     * @relation onClick(event: (event: ClickEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(event: (ClickEvent) -> Unit): T {
        onClickInner(event)
    }

    protected open func onClickInner(callback: (ClickEvent) -> Unit): T {
        let wrapper = {
            evt: CJClickEvent => callback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnClick(lambdaData.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * This callback is triggered when a component mounts a display.
     *
     * @param { function } event
     * @returns { This }
     * @relation onAppear(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAppear(event: () -> Unit): T {
        onAppearInner(event)
    }

    protected open func onAppearInner(callback: () -> Unit): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAppear(Callback0Param<Unit>(callback).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * This callback is triggered when component uninstallation disappears.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDisAppear(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDisAppear(event: () -> Unit): T {
        onDisAppearInner(event)
    }

    protected open func onDisAppearInner(callback: () -> Unit): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDisAppear(Callback0Param<Unit>(callback).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Invoked when a touch event is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onTouch(event: (event: TouchEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTouch(event: (TouchEvent) -> Unit): T {
        onTouchInner(event)
    }

    protected open func onTouchInner(event: (TouchEvent) -> Unit): T {
        let wrapper = {
            evt: CJTouchEvent =>
            var resolved = parseCJTouchEvent(evt)
            event(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnTouch(CallbackCJTouchEvent(wrapper).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Trigger a hover event.
     *
     * @param { function } event
     * @returns { This }
     * @relation onHover(event: (isHover: boolean, event: HoverEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onHover(event: (Bool) -> Unit): T {
        onHoverInner(event)
    }

    protected open func onHoverInner(callback: (Bool) -> Unit): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnHover(Callback1Param<Bool, Unit>(callback).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * This callback is triggered when the size or position of this component change finished.
     *
     * @param { function } event
     * @returns { This }
     * @relation onAreaChange(event: (oldValue: Area, newValue: Area) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAreaChange(event: (Area, Area) -> Unit): T {
        onAreaChangeInner(event)
    }

    protected open func onAreaChangeInner(callback: (Area, Area) -> Unit): T {
        let wrapper = {
            lastArea: CJArea, area: CJArea => callback(parseCJArea(lastArea), parseCJArea(area))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAreaChanged(CallbackCJAreaChangedEvent(wrapper).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Trigger a visible area change event.
     *
     * @param { function } event
     * @returns { This }
     * @relation onVisibleAreaChange(ratios: Array<number>, event: VisibleAreaChangeCallback): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onVisibleAreaChange(raitos: Array<Float64>, event: (Bool, Float64) -> Unit): T {
        onVisibleAreaChangeInner(raitos, event)
    }

    protected open func onVisibleAreaChangeInner(raitos: Array<Float64>, callback: (Bool, Float64) -> Unit): T {
        let wrapper = {
            isVisible: Bool, currentRatio: Float64 => callback(isVisible, currentRatio)
        }
        let valuesHandle = FFIVectorFloat64(raitos.size)
        for (i in 0..raitos.size) {
            valuesHandle.setElement(i, raitos[i])
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnVisibleAreaChange(valuesHandle.getNativeHandle(),
                CallbackCJVisibleAreaChangeEvent(wrapper).getID())
        }
        valuesHandle.free()
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Triggered when the component is clicked by a mouse button or the mouse pointer moves on the component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onMouse(event: (event: MouseEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onMouse(event: (MouseEvent) -> Unit): T {
        onMouseInner(event)
    }

    protected open func onMouseInner(event: (MouseEvent) -> Unit): T {
        let wrapper = {
            evt: CJMouseEvent =>
            var resolved = parseCJMouseEvent(evt)
            event(resolved)
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnMouse(CallbackCJMouseEvent(wrapper).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Keyboard input
     *
     * @param { function } event
     * @returns { This }
     * @relation onKeyEvent(event: (event: KeyEvent) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onKeyEvent(event: (KeyEvent) -> Unit): T {
        onKeyEventInner(event)
    }

    protected open func onKeyEventInner(callback: (KeyEvent) -> Unit): T {
        let wrapper = {
            evt: CJKeyEvent =>
            let resolved = parseCJKeyEvent(evt)
            callback(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnKey(CallbackCJKeyEvent(wrapper).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Trigger a event when got focus.
     *
     * @param { function } event
     * @returns { This }
     * @relation onFocus(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFocus(event: () -> Unit): T {
        onFocusInner(event)
    }

    protected open func onFocusInner(callback: () -> Unit): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnFocus(Callback0Param<Unit>(callback).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /*
     * Triggered when the current component loses focus.
     *
     * @param { function } event
     * @returns { This }
     * @relation onBlur(event: () => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBlur(event: () -> Unit): T {
        onBlurInner(event)
    }

    protected open func onBlurInner(callback: () -> Unit): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnBlur(Callback0Param<Unit>(callback).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragStart(event: (event: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: (DragInfo) -> DragItemInfo): T {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: (DragInfo) -> DragItemInfo): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        let ret = callback(parseCJDragEvent(evt))
                        let pixelMapId = ret.pixelMap.getID()
                        let builderId = Callback0Param<Unit>(ret.builder).getID()
                        return CJDragItemInfo(
                            pixelMapId: pixelMapId,
                            builderId: builderId,
                            extraInfo: LibC.mallocCString(ret.extraInfo)
                        )
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragStart(event: (event: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: (DragInfo) -> CustomBuilder): T {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: (DragInfo) -> CustomBuilder): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        let ret = callback(parseCJDragEvent(evt))
                        return CJDragItemInfo(builderId: Callback0Param<Unit>(ret).getID())
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragStart(event: (event: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: (DragInfo) -> Unit): T {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: (DragInfo) -> Unit): T {
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        callback(parseCJDragEvent(evt))
                        return CJDragItemInfo()
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * After binding, a callback is triggered when the component is dragged to the range of the component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragEnter(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragEnter(event: (DragInfo) -> Unit): T {
        onDragEnterInner(event)
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func onDragEnterInner(callback: (DragInfo) -> Unit): T {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragEnter(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * After binding, a callback is triggered when the drag moves within the range of a placeable component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragMove(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragMove(event: (DragInfo) -> Unit): T {
        onDragMoveInner(event)
    }

    protected open func onDragMoveInner(callback: (DragInfo) -> Unit): T {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragMove(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * After binding, a callback is triggered when the component is dragged out of the component range.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDragLeave(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragLeave(event: (DragInfo) -> Unit): T {
        onDragLeaveInner(event)
    }

    protected open func onDragLeaveInner(callback: (DragInfo) -> Unit): T {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragLeave(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * The component bound to this event can be used as the drag release target.
     * This callback is triggered when the drag behavior is stopped within the scope of the component.
     *
     * @param { function } event
     * @returns { This }
     * @relation onDrop(event: (event: DragEvent, extraParams?: string) => void): T;
     */
    @!APILevel[
        21,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDrop(event: (DragInfo) -> Unit): T {
        onDropInenr(event)
    }
    /*
     * Note: the DragInfo is diff with DragEvent.
     */
    protected open func onDropInenr(callback: (DragInfo) -> Unit): T {
        let wrapper = {
            info: CJDragInfo => callback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDrop(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used.If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Length } value
     * @returns { This }
     * @relation width(value: Length): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(value: Option<Length>): T {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => widthInner(i64)
                case f64: Float64 => widthInner(f64)
                case res: AppResource => widthInner(res)
                case length: Length => widthInner(length)
            }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func widthInner(value: Length): T {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetWidth(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @param { Length } value
     * @returns { This }
     * @relation height(value: Length): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(value: Option<Length>): T {
        match (value) {
            case Some(v) => match (v) {
                case i64: Int64 => heightInner(i64)
                case f64: Float64 => heightInner(f64)
                case res: AppResource => heightInner(res)
                case length: Length => heightInner(length)
            }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func heightInner(value: Length): T {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHeight(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * The size of the current component.
     *
     * @param { Length } width
     * @param { Length } height
     * @returns { This }
     * @relation size(value: SizeOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: Length, height!: Length): T {
        sizeInner(width, height)
    }

    protected open func sizeInner(width: Length, height: Length) {
        var w = transAppResourceToLength(width)
        var h = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSize(w.value, w.unitType.getValue(), h.value, h.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the padding of the component.
     *
     * @param { Length } value
     * @returns { This }
     * @relation padding(value: Padding | Length | LocalizedPadding): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: Length): T {
        paddingInner(value)
    }

    protected open func paddingInner(value: Length): T {
        unsafe {
            var v = transAppResourceToLength(value)
            FfiOHOSAceFrameworkViewAbstractSetPadding(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the padding of the component.
     *
     * @param { Length, Length, Length, Length } Indicates safeArea padding values.
     * @returns { This }
     * @relation padding(value: Padding | Length | LocalizedPadding): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): T {
        paddingInner(top, right, bottom, left)
    }

    protected open func paddingInner(top: Length, right: Length, bottom: Length, left: Length): T {
        var topInner = transAppResourceToLength(top)
        var rightInner = transAppResourceToLength(right)
        var bottomInner = transAppResourceToLength(bottom)
        var leftInner = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPaddings(
                CJEdge(
                    topInner.value,
                    topInner.unitType.getValue(),
                    rightInner.value,
                    rightInner.unitType.getValue(),
                    bottomInner.value,
                    bottomInner.unitType.getValue(),
                    leftInner.value,
                    leftInner.unitType.getValue()
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the margin of the component.
     *
     * @param { Length } value
     * @returns { This }
     * @relation margin(value: Margin | Length | LocalizedMargin): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(value: Length): T {
        marginInner(value)
    }

    protected open func marginInner(value: Length): T {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargin(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the margin of the component.
     *
     * @param { Length, Length, Length, Length } Indicates safeArea margin values.
     * @returns { This }
     * @relation margin(value: Margin | Length | LocalizedMargin): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): T {
        marginInner(top: top, right: right, bottom: bottom, left: left)
    }

    protected open func marginInner(top!: Length, right!: Length, bottom!: Length, left!: Length): T {
        var topInner = transAppResourceToLength(top)
        var rightInner = transAppResourceToLength(right)
        var bottomInner = transAppResourceToLength(bottom)
        var leftInner = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargins(
                CJEdge(
                    topInner.value,
                    topInner.unitType.getValue(),
                    rightInner.value,
                    rightInner.unitType.getValue(),
                    bottomInner.value,
                    bottomInner.unitType.getValue(),
                    leftInner.value,
                    leftInner.unitType.getValue()
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }
    /**
     * Sets the weight of the component during layout. A component with this attribute is allocated space
     * along the main axis of its parent container (Row, Column, or Flex) based on its specified weight.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation layoutWeight(value: number | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func layoutWeight(value: Int32): T {
        layoutWeightInner(value)
    }

    protected open func layoutWeightInner(value: Int32): T {
        // Note: ViewAbstract::SetLayoutWeight(float value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutWeight(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the constraint size of the component, which is used to limit the size range during component layout.
     * Default value: **{minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity}**.
     *
     * @returns { This }
     * @relation constraintSize(value: ConstraintSizeOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func constraintSize(minWidth!: Length = 0.vp, maxWidth!: Length = (Float64.Inf).vp,
        minHeight!: Length = 0.vp, maxHeight!: Length = (Float64.Inf).vp): T {
        constraintSizeInner(minWidth, maxWidth, minHeight, maxHeight)
    }

    protected open func constraintSizeInner(minWidth: Length, maxWidth: Length, minHeight: Length, maxHeight: Length): T {
        var minWidthInner = transAppResourceToLength(minWidth)
        var maxWidthInner = transAppResourceToLength(maxWidth)
        var minHeightInner = transAppResourceToLength(minHeight)
        var maxHeightInner = transAppResourceToLength(maxHeight)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetConstraintSize(
                CJConstraintSize(
                    minWidthInner.value,
                    minWidthInner.unitType.getValue(),
                    maxWidthInner.value,
                    maxWidthInner.unitType.getValue(),
                    minHeightInner.value,
                    minHeightInner.unitType.getValue(),
                    maxHeightInner.value,
                    maxHeightInner.unitType.getValue()
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the alignment mode of the component content in the drawing area.
     * Default value: **Alignment.Center**.
     *
     * @param { Alignment } value
     * @returns { This }
     * @relation align(value: Alignment): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func align(value: Alignment): T {
        alignInner(value)
    }

    protected open func alignInner(value: Alignment): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlign(value.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets how elements are laid out along the main axis of the container.
     * Default value: **Direction.Auto**.
     *
     * @param { Direction } value
     * @returns { This }
     * @relation direction(value: Direction): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func direction(value: Direction): T {
        directionInner(value)
    }

    protected open func directionInner(value: Direction): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDirection(value.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the absolute position of the component relative to the position of the parent component.
     * The attribute is not available for a layout container whose width and height are zero.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation position(value: Position | Edges | LocalizedEdges): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func position(x!: Length, y!: Length): T {
        positionInner(x, y)
    }

    protected open func positionInner(xAxis: Length, yAxis: Length): T {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPosition(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the anchor for locating the component, which is used to move the component
     * further away from the position specified by position or offset.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation markAnchor(value: Position | LocalizedPosition): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func markAnchor(x!: Length, y!: Length): T {
        markAnchorInner(x, y)
    }

    protected open func markAnchorInner(xAxis: Length, yAxis: Length): T {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMarkAnchor(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the offset of the component relative to its original position.
     * <br>The offset attribute does not affect the layout of the parent container.
     * It adjusts the component position only during drawing.
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation offset(value: Position | Edges | LocalizedEdges): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offset(x!: Length, y!: Length): T {
        offsetInner(x, y)
    }

    protected open func offsetInner(xAxis: Length, yAxis: Length): T {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOffset(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the alignment rules in the relative container.
     * This API is valid only when the container is RelativeContainer.
     *
     * @param { AlignRuleOptions } value
     * @returns { This }
     * @relation alignRules(value: AlignRuleOption): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignRules(value: AlignRuleOptions): T {
        alignRulesInner(value)
    }

    protected open func alignRulesInner(value: AlignRuleOptions): T {
        let option = CJAlignRuleOption(value)
        unsafe { FfiOHOSAceFrameworkViewAbstractSetAlignRules(option) }
        option.free()
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the aspect ratio of the component, which can be obtained using the following formula: width/height.
     * If only width and aspectRatio are set, the height is calculated using the following formula: width/aspectRatio.
     * If only height and aspectRatio are set, the width is calculated using the following formula: height x aspectRatio.
     * If width, height, and aspectRatio are all set, the explicitly set height is ignored, and the effective height is calculated using the following formula: width/aspectRatio.
     * This parameter takes effect only when a valid value greater than 0 is specified.
     *
     * @relation aspectRatio(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aspectRatio(value: Float64): T {
        aspectRatioInner(value)
    }

    protected open func aspectRatioInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAspectRatio(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the display priority for the component in the layout container.
     * This parameter is only effective in Row, Column, and Flex (single-line) container components.
     *
     * @relation displayPriority(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayPriority(value: Int32): T {
        displayPriorityInner(value)
    }

    protected open func displayPriorityInner(value: Int32): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDisplayPriority(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the base size of the component in the main axis of the parent container.
     *
     * @relation flexBasis(value: number | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexBasis(value: Length): T {
        flexBasisInner(value)
    }

    protected open func flexBasisInner(value: Length): T {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexBasis(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @relation flexGrow(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexGrow(value: Float64): T {
        flexGrowInner(value)
    }

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @relation flexGrow(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexGrow(value: Int64): T {
        flexGrowInner(Float64(value))
    }

    protected open func flexGrowInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @relation flexShrink(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexShrink(value: Float64): T {
        flexShrinkInner(value)
    }

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @relation flexShrink(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexShrink(value: Int64): T {
        flexShrinkInner(Float64(value))
    }

    protected open func flexShrinkInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the alignment mode of the child components along the cross axis of the parent container.
     * Default value: **ItemAlign.Auto**.
     *
     * @param { ItemAlign } value
     * @returns { This }
     * @relation flexShrink(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignSelf(value: ItemAlign): T {
        alignSelfInner(value)
    }

    protected open func alignSelfInner(value: ItemAlign): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlignSelf(value.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the response region of the current component.
     *
     * @param { Rectangle } value
     * @returns { This }
     * @relation responseRegion(value: Array<Rectangle> | Rectangle): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(value: Rectangle): T {
        responseRegionInner(value)
    }

    protected open func responseRegionInner(value: Rectangle): T {
        let cjRect = value.parseToNative()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegion(
                CJResponseRegion(
                    cjRect.x,
                    cjRect.xUnit,
                    cjRect.y,
                    cjRect.yUnit,
                    cjRect.width,
                    cjRect.widthUnit,
                    cjRect.height,
                    cjRect.heightUnit
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the response region of the current component.
     *
     * @param { Array<Rectangle> } value
     * @returns { This }
     * @relation responseRegion(value: Array<Rectangle> | Rectangle): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(value: Array<Rectangle>): T {
        responseRegionInner(value)
    }

    protected open func responseRegionInner(value: Array<Rectangle>): T {
        let vecFFi = FFIVectorNativeRectangle(value.size)
        var index = 0
        for (rect in value) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the border.
     *
     * @param { Length } width
     * @param { ResourceColor } color
     * @param { Length } radius
     * @param { BorderStyle } style
     * @returns { This }
     * @relation border(value: BorderOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func border(width!: Length, color!: ResourceColor = Color.Black, radius!: Length = 0.vp,
        style!: BorderStyle = BorderStyle.Solid): T {
        borderInner(width, color, radius, style)
    }

    protected open func borderInner(width: Length, color: ResourceColor, radius: Length, style: BorderStyle): T {
        var w = transAppResourceToLength(width)
        var r = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorder(
                CJBorder(w.value, w.unitType.getValue(), transAppResourceToResourceColor(color), r.value,
                    r.unitType.getValue(), style.getValue()))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the border width.
     * Percentage values are not supported.
     *
     * @param { Length } value
     * @returns { This }
     * @throws { IllegalArgumentException } Percentage values are not supported.
     * @relation borderWidth(value: Length | EdgeWidths | LocalizedEdgeWidths): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderWidth(value: Length): T {
        borderWidthInner(value)
    }

    protected open func borderWidthInner(value: Length): T {
        var v = transAppResourceToLength(value)
        if (v.unitType.getValue() == LENGTH_PERCENT) {
            throw IllegalArgumentException("Percentage values are not supported.")
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidth(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the border width.
     *
     * @param { EdgeWidths } value
     * @returns { This }
     * @relation borderWidth(value: Length | EdgeWidths | LocalizedEdgeWidths): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderWidth(value: EdgeWidths): T {
        borderWidthInner(value)
    }

    protected open func borderWidthInner(edgeWidths: EdgeWidths) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidthWithCJEdge(
                CJEdge(edgeWidths.top.value, edgeWidths.top.unitType.getValue(), edgeWidths.right.value,
                    edgeWidths.right.unitType.getValue(), edgeWidths.bottom.value, edgeWidths
                        .bottom
                        .unitType
                        .getValue(), edgeWidths.left.value, edgeWidths.left.unitType.getValue()))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the border color.
     * Default value: **Color.Black**.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation borderColor(value: ResourceColor | EdgeColors | LocalizedEdgeColors): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderColor(value: ResourceColor): T {
        borderColorInner(value)
    }

    protected open func borderColorInner(value: ResourceColor) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderColor(transAppResourceToResourceColor(value))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { Length } topLeft
     * @param { Length } topRight
     * @param { Length } bottomLeft
     * @param { Length } bottomRight
     * @returns { This }
     * @relation borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp): T {
        borderRadiusInner(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
    }

    protected open func borderRadiusInner(topLeft!: Length, topRight!: Length, bottomLeft!: Length, bottomRight!: Length): T {
        var topLeftInner = transAppResourceToLength(topLeft)
        var topRightInner = transAppResourceToLength(topRight)
        var bottomLeftInner = transAppResourceToLength(bottomLeft)
        var bottomRightInner = transAppResourceToLength(bottomRight)
        unsafe {
            let value = CJBorderRadius(
                topLeftInner.value,
                topLeftInner.unitType.getValue(),
                topRightInner.value,
                topRightInner.unitType.getValue(),
                bottomLeftInner.value,
                bottomLeftInner.unitType.getValue(),
                bottomRightInner.value,
                bottomRightInner.unitType.getValue()
            )
            FfiOHOSAceFrameworkViewAbstractSetAllBorderRadius(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @param { Length } value
     * @returns { This }
     * @relation borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(value: Length): T {
        borderRadiusInner(value)
    }

    protected open func borderRadiusInner(value: Length): T {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderRadius(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the border style.
     * Default value: **BorderStyle.Solid**.
     *
     * @param { BorderStyle } value
     * @returns { This }
     * @relation borderStyle(value: BorderStyle | EdgeStyles): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderStyle(value: BorderStyle): T {
        borderStyleInner(value)
    }

    protected open func borderStyleInner(value: BorderStyle): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderStyle(value.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { BlurStyle } value
     * @returns { This }
     * @relation foregroundBlurStyle(value: BlurStyle, options?: ForegroundBlurStyleOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: BlurStyle): T {
        foregroundBlurStyleInner(value, Option<ForegroundBlurStyleOptions>.None)
    }

    /**
     * Applies a foreground blur style to the component.
     *
     * @param { BlurStyle } value
     * @param { ForegroundBlurStyleOptions } options
     * @returns { This }
     * @relation foregroundBlurStyle(value: BlurStyle, options?: ForegroundBlurStyleOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: BlurStyle, options: ForegroundBlurStyleOptions): T {
        foregroundBlurStyleInner(value, options)
    }

    protected open func foregroundBlurStyleInner(style: BlurStyle, options: ?ForegroundBlurStyleOptions): T {
        unsafe {
            if (let Some(v) <- options) {
                let ret = CJForegroundBlurStyleOptions(v.colorMode.getValue(), v.adaptiveColor.getValue(),
                    CJBlurOptions(v.blurOptions.grayscale), v.scale)
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyleOption(style.getValue(), ret)
            } else {
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyle(style.getValue())
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ColoringStrategy } value
     * @returns { This }
     * @relation foregroundColor(value: ResourceColor | ColoringStrategy): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundColor(value: ColoringStrategy): T {
        foregroundColorInner(value)
    }

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation foregroundColor(value: ResourceColor | ColoringStrategy): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundColor(value: ResourceColor): T {
        foregroundColorInner(value)
    }

    protected open func foregroundColorInner(value: ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetForegroundResourceColor(transAppResourceToResourceColor(value))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func foregroundColorInner(value: ColoringStrategy): T {
        unsafe {
            try (strategy = LibC.mallocCString(value.getValue()).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetForegroundColor(strategy.value)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Background color
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation backgroundColor(value: ResourceColor): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundColor(value: ResourceColor): T {
        backgroundColorInner(value)
    }

    protected open func backgroundColorInner(value: ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(transAppResourceToResourceColor(value))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Background image
     *
     * @param { ResourceColor } src
     * @returns { This }
     * @relation backgroundImage(src: ResourceStr | PixelMap, options?: BackgroundImageOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src: ResourceStr): T {
        backgroundImageInner(src, ImageRepeat.NoRepeat)
    }

    /**
     * Background image
     * @param { ResourceColor } src
     * @param { ImageRepeat } repeat
     * @returns { This }
     * @relation backgroundImage(src: ResourceStr | PixelMap, options?: BackgroundImageOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src: ResourceStr, repeat: ImageRepeat): T {
        backgroundImageInner(src, repeat)
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func backgroundImageInner(src: ResourceStr, repeat: ?ImageRepeat): T {
        var repeatUnit = if (let Some(v) <- repeat) {
            v.getValue()
        } else {
            ImageRepeat.NoRepeat.getValue()
        }
        var srcMedia = match (src) {
            case v: String => v
            case v: AppResource => getResourceMedia(v)
            case _ => throw IllegalArgumentException("Invaild type.")
        }
        unsafe {
            try (unsafeSrc = LibC.mallocCString(srcMedia).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetBackgroundImage(unsafeSrc.value, repeatUnit)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Background image size
     *
     * @param { ImageSize } value
     * @returns { This }
     * @relation backgroundImageSize(value: SizeOptions | ImageSize): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(value: ImageSize): T {
        backgroundImageSizeInner(value)
    }

    /**
     * Background image size
     *
     * @param { Length } width
     * @param { Length } height
     * @returns { This }
     * @relation backgroundImageSize(value: SizeOptions | ImageSize): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): T {
        backgroundImageSizeInner(width, height)
    }

    protected open func backgroundImageSizeInner(width: Length, height: Length): T {
        var w = transAppResourceToLength(width)
        var h = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSize(w.value, w.unitType.getValue(), h.value,
                h.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func backgroundImageSizeInner(imageSize: ImageSize): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSizeType(imageSize.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { Alignment } value
     * @returns { This }
     * @relation backgroundImagePosition(value: Position | Alignment): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(value: Alignment): T {
        backgroundImagePositionInner(value)
    }

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @param { Length } x
     * @param { Length } y
     * @returns { This }
     * @relation backgroundImagePosition(value: Position | Alignment): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): T {
        backgroundImagePositionInner(x, y)
    }

    protected open func backgroundImagePositionInner(xAxis: Length, yAxis: Length): T {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionXY(x.value, x.unitType.getValue(), y.value,
                y.unitType.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func backgroundImagePositionInner(value: Alignment): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionAlign(value.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Scales the component.
     * Scale ratio along the x-, y-, and z-axis. The default value is **1**.
     * centerX and centerY are used to set the scale center point.
     * default:{x:1,y:1,z:1,centerX:'50%',centerY:'50%'}
     *
     * @param { Float32 } x
     * @param { Float32 } y
     * @param { Float32 } z
     * @param { Length } centerX
     * @param { Length } centerY
     * @returns { This }
     * @relation scale(value: ScaleOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent): T {
        scaleInner(x, y, z, centerX, centerY)
    }

    protected open func scaleInner(x: Float32, y: Float32, z: Float32, centerX: Length, centerY: Length) {
        var cx = transAppResourceToLength(centerX)
        var cy = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScale(
                CJSetScale(x, y, z, cx.value, cx.unitType.getValue(), cy.value, cy.unitType.getValue()))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the opacity of the component.
     *
     * @param { Float64 } value - Opacity of the component. The value ranges from 0 to 1.
     * @returns { This }
     * @relation opacity(value: number | Resource): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func opacity(value: Float64): T {
        opacityInner(value)
    }

    protected open func opacityInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOpacity(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set component rotation.
     *
     * @relation rotate(value: RotateOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 1.0, angle!: Float32 = 0.0,
        centerX!: Length = 50.percent, centerY!: Length = 50.percent): T {
        rotateInner(x, y, z, angle, centerX, centerY)
    }

    protected open func rotateInner(x: Float32, y: Float32, z: Float32, angle: Float32, centerX: Length, centerY: Length): T {
        var cx = transAppResourceToLength(centerX)
        var cy = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotate(
                CJSetRotate(x, y, z, angle, cx.value, cx.unitType.getValue(), cy.value, cy.unitType.getValue()))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the translation effect for page transitions.
     *
     * @relation translate(value: TranslateOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): T {
        translateInner(x, y, z)
    }

    protected open func translateInner(xAxis: Length, yAxis: Length, zAxis: Length): T {
        var x = transAppResourceToLength(xAxis)
        var y = transAppResourceToLength(yAxis)
        var z = transAppResourceToLength(zAxis)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslate(
                CJTranslate(x.value, x.unitType.getValue(), y.value, y.unitType.getValue(), z.value,
                    z.unitType.getValue()))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * If the value is true, the component is available and can respond to operations such as clicking.
     * If it is set to false, click operations are not responded.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation enabled(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enabled(value: Bool): T {
        enabledInner(value)
    }

    protected open func enabledInner(value: Bool): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetEnabled(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * If the components of the two pages are configured with the same ID.
     * The shared element transition is performed during transition.
     * If the parameter is set to an empty string, the shared element transition does not occur.
     * For details about the options parameter, see the options parameter description.
     *
     * @relation sharedTransition(id: string, options?: sharedTransitionOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sharedTransition(id: String, options!: SharedTransitionOptions = SharedTransitionOptions()): T {
        sharedTransitionInner(id, options)
    }

    protected open func sharedTransitionInner(id: String, options: SharedTransitionOptions): T {
        unsafe {
            try (unsafeId = LibC.mallocCString(id).asResource(), unsafeCurve = LibC
                .mallocCString(options.curve.getValue())
                .asResource(), unsafeMotionPath = LibC.mallocCString(options.motionPath.path).asResource()) {
                let unsafeOptions = CJSharedTransitionOptions(
                    options.duration,
                    options.delay,
                    options.zIndex,
                    unsafeCurve.value,
                    CJMotionPathOptions(unsafeMotionPath.value, options.motionPath.from, options.motionPath.to,
                        options.motionPath.rotatable),
                    options.effectType.getValue()
                )
                FfiOHOSAceFrameworkViewAbstractSetSharedTransition(unsafeId.value, unsafeOptions)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Shared geometry transition
     *
     * @param { String } id
     * @param { Bool } followWithoutTransition
     * @returns { This }
     * @relation geometryTransition(id: string, options?: GeometryTransitionOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func geometryTransition(id: String, followWithoutTransition!: Bool = false): T {
        geometryTransitionInner(id, followWithoutTransition)
    }

    protected open func geometryTransitionInner(id: String, value: Bool): T {
        unsafe {
            try (idCString = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetGeometryTransition(idCString.value, value)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Adds the content blurring effect for the current component. The input parameter is the blurring radius.
     * The larger the blurring radius, the more blurring the content.
     * If the value is 0, the content blurring effect is not blurring.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation blur(value: number, options?: BlurOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blur(value: Float64): T {
        blurInner(value)
    }

    protected open func blurInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBlur(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a color blend effect to the component.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation colorBlend(value: Color | string | Resource): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colorBlend(value: ResourceColor): T {
        colorBlendInner(value)
    }

    protected open func colorBlendInner(value: ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetColorBlend(transAppResourceToResourceColor(value))
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a background blur effect to the component. You can customize the blur radius and grayscale parameters.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation backdropBlur(value: number, options?: BlurOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backdropBlur(value: Float64): T {
        backdropBlurInner(value)
    }

    protected open func backdropBlurInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackdropBlur(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a shadow effect to the component.
     *
     * @relation shadow(value: ShadowOptions | ShadowStyle): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadow(radius!: Float64, color!: ResourceColor = Color(0x666666), offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0): T {
        shadowInner(radius, color, offsetX, offsetY)
    }

    protected open func shadowInner(radius: Float64, color: ResourceColor, offsetX: Float64, offsetY: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetShadow(radius, transAppResourceToResourceColor(color), offsetX, offsetY)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a grayscale effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation grayscale(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func grayscale(value: Float64): T {
        grayscaleInner(value)
    }

    protected open func grayscaleInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGrayScale(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a brightness effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation grayscale(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func brightness(value: Float64): T {
        brightnessInner(value)
    }

    protected open func brightnessInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBrightness(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a saturation effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation saturate(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func saturate(value: Float64): T {
        saturateInner(value)
    }

    protected open func saturateInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSaturate(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Applies a contrast effect to the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation saturate(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contrast(value: Float64): T {
        contrastInner(value)
    }

    protected open func contrastInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetContrast(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation invert(value: number | InvertOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(value: Float64): T {
        invertInner(value)
    }

    protected open func invertInner(value: Float64): T {
        var realValue = if (value > 1.0) {
            1.0
        } else {
            value
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvert(realValue)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @relation invert(value: number | InvertOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): T {
        invertInner(low, high, threshold, thresholdRange)
    }

    protected open func invertInner(low: Float64, high: Float64, threshold: Float64, thresholdRange: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvertWithOptions(low, high, threshold, thresholdRange)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func pixelStretchEffectInner(top: Length, right: Length, bottom: Length, left: Length): T {
        var top_ = transAppResourceToLength(top);
        var right_ = transAppResourceToLength(right);
        var bottom_ = transAppResourceToLength(bottom);
        var left_ = transAppResourceToLength(left);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPixelStretchEffect(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func outlineWidthInner(top: Length, right: Length, bottom: Length, left: Length): T {
        var top_ = transAppResourceToLength(top);
        var right_ = transAppResourceToLength(right);
        var bottom_ = transAppResourceToLength(bottom);
        var left_ = transAppResourceToLength(left);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineWidths(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func outlineColorInner(top: ResourceColor, right: ResourceColor, bottom: ResourceColor,
        left: ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineColors(
                transAppResourceToResourceColor(top),
                transAppResourceToResourceColor(right),
                transAppResourceToResourceColor(bottom),
                transAppResourceToResourceColor(left)
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func outlineRadiusInner(topLeft: Length, topRight: Length, bottomLeft: Length, bottomRight: Length): T {
        var topLeft_ = transAppResourceToLength(topLeft);
        var topRight_ = transAppResourceToLength(topRight);
        var bottomLeft_ = transAppResourceToLength(bottomLeft);
        var bottomRight_ = transAppResourceToLength(bottomRight);
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOutlineRadiuses(
                CJBorderRadius(
                    topLeft_.value,
                    topLeft_.unitType.getValue(),
                    topRight_.value,
                    topRight_.unitType.getValue(),
                    bottomLeft_.value,
                    bottomLeft_.unitType.getValue(),
                    bottomRight_.value,
                    bottomRight_.unitType.getValue()
                )
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sepia conversion ratio of the component.
     *
     * @param { Float64 } value
     * @returns { This }
     * @relation sepia(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sepia(value: Float64): T {
        sepiaInner(value)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func sepiaInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSepia(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Rotates the hue of the component.
     *
     * @param { Float32 } value
     * @returns { This }
     * @relation hueRotate(value: number | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hueRotate(value: Float32): T {
        hueRotateInner(value)
    }

    protected open func hueRotateInner(value: Float32): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHueRotate(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * The sibling components in the same container are hierarchically displayed. A larger value of z indicates a higher display level.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation zIndex(value: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func zIndex(value: Int32): T {
        zIndexInner(value)
    }

    protected open func zIndexInner(value: Int32): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetZIndex(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Controls the display or hide of the current component.
     *
     * @param { Visibility } value
     * @returns { This }
     * @relation visibility(value: Visibility): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func visibility(value: Visibility): T {
        visibilityInner(value)
    }

    protected open func visibilityInner(value: Visibility): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetVisibility(value.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets whether to clip the areas of child components that extend beyond this component's boundaries,
     * That is, whether to perform clipping based on the edge contour of the parent container.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation clip(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(value: Bool): T {
        clipInner(value)
    }

    protected open func clipInner(isClip: Bool): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClip(isClip)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { BaseShape } value
     * @returns { This }
     * @relation clipShape(value: CircleShape | EllipseShape | PathShape | RectShape): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipShape(value: BaseShape): T {
        clipShapeInner(value)
    }

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @param { BaseShape } value
     * @returns { This }
     * @relation maskShape(value: CircleShape | EllipseShape | PathShape | RectShape): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maskShape(value: BaseShape): T {
        maskShapeInner(value)
    }

    protected open func clipShapeInner(value: BaseShape): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClipByShape(value.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func maskShapeInner(value: BaseShape): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMaskByShape(value.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Add mask text to the current component. The layout is the same as that of the current component.
     *
     * @relation overlay(value: string | CustomBuilder | ComponentContent, options?: OverlayOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func overlay(value!: String, align!: Alignment = Alignment.Center,
        offset!: OverlayOffset = OverlayOffset(x: 0.0, y: 0.0)): T {
        overlayInner(value, align, offset)
    }

    protected open func overlayInner(title: String, align: Alignment, offset: OverlayOffset): T {
        unsafe {
            try (titleCString = LibC.mallocCString(title).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetOverlay(titleCString.value, align.getValue(), offset.x,
                    offset.y)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    func parseToDismissPopupAction(reason: Int32): DismissPopupAction {
        return DismissPopupAction(reason: DismissReason.toEnum(reason))
    }

    func callFFIBindPopup(popup: PopupOptions, primaryActionId: Int64, secondaryActionId: Int64, onStateChangeId: Int64,
        nativeOnWillDismiss: NativeOptionCallBack, nativeTransition: NativeOptionInt64, nativePlacement: Int32,
        show: Bool): Unit {
        unsafe {
            let nativeArrowPointPosition = match (popup.arrowPointPosition) {
                case Some(value) => LibC.mallocCString(value.getValue())
                case None => LibC.mallocCString("")
            }
            let message = LibC.mallocCString(popup.message)
            let primaryValue = LibC.mallocCString(popup.primaryButton.value)
            let secondaryValue = LibC.mallocCString(popup.secondaryButton.value)
            let messageOptions = popup.messageOptions
            let placementOnTop = popup.placement.getValue() == 2
            let fontWeight = LibC.mallocCString((messageOptions.font.weight ?? FontWeight.Normal).getValue())
            let fontSize = messageOptions.font.size ?? 16.fp
            let fontStyle = messageOptions.font.style ?? FontStyle.Normal
            FfiOHOSAceFrameworkViewAbstractBindPopupV2(
                show,
                CJBindPopupParamsV2(message, placementOnTop, primaryValue, primaryActionId, secondaryValue,
                    secondaryActionId, onStateChangeId, messageOptions.textColor.toUInt32(), fontWeight,
                    fontSize.value, fontSize.unitType.getValue(),
                    fontStyle.getValue(), popup.arrowOffset.value, popup
                        .arrowOffset
                        .unitType
                        .getValue(), popup.showInSubWindow, popup.mask.toUInt32(), popup.targetSpace.value,
                    popup.targetSpace.unitType.getValue(), nativePlacement, popup.offset.y.value, popup.offset.x.value,
                    popup.enableArrow, popup.popupColor.toUInt32(), popup.autoCancel, popup.width.value,
                    popup.width.unitType.getValue(), nativeArrowPointPosition, popup.arrowWidth.value,
                    popup.arrowWidth.unitType.getValue(), popup.arrowHeight.value, popup
                        .arrowHeight
                        .unitType
                        .getValue(), popup.radius.value, popup.radius.unitType.getValue(), popup.shadow.getValue(),
                    popup.backgroundBlurStyle.getValue(), nativeTransition, nativeOnWillDismiss,
                    popup.followTransformOfTarget)
            )
            LibC.free(message)
            LibC.free(primaryValue)
            LibC.free(secondaryValue)
            LibC.free(nativeArrowPointPosition)
            LibC.free(fontWeight)
        }
    }

    func callFFIBindCustomPopup(popup: CustomPopupOptions, onStateChangeId: Int64,
        nativeOnWillDismiss: NativeOptionCallBack, nativeTransition: NativeOptionInt64, nativePopupColor: UInt32,
        nativeMask: UInt32, show: Bool): Unit {
        unsafe {
            let nativeArrowPointPosition = match (popup.arrowPointPosition) {
                case Some(value) => LibC.mallocCString(value.getValue())
                case None => LibC.mallocCString("")
            }
            FfiOHOSAceFrameworkViewAbstractBindCustomPopupV2(
                CJBindCustomPopupV2(show, Callback0Param<Unit>(popup.builder).getID(), popup.placement.getValue(),
                    popup.maskColor.toUInt32(), popup.backgroundColor.toUInt32(), popup.enableArrow, popup.autoCancel,
                    onStateChangeId, nativePopupColor, popup.arrowOffset.value, popup.arrowOffset.unitType.getValue(),
                    popup.showInSubWindow, nativeMask, popup.targetSpace.value, popup.targetSpace.unitType.getValue(),
                    popup.offset.x.value, popup.offset.y.value, popup.width.value, popup.width.unitType.getValue(),
                    nativeArrowPointPosition, popup.arrowWidth.value, popup.arrowWidth.unitType.getValue(),
                    popup.arrowHeight.value, popup.arrowHeight.unitType.getValue(), popup.radius.value,
                    popup.radius.unitType.getValue(), popup.shadow.getValue(), popup.backgroundBlurStyle.getValue(),
                    popup.focusable, nativeTransition, nativeOnWillDismiss, popup.followTransformOfTarget))
            LibC.free(nativeArrowPointPosition)
        }
    }

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @relation bindPopup(show: boolean, popup: PopupOptions | CustomPopupOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindPopup(show: Bool, popup: PopupOptions): T {
        bindPopupInner(show, popup)
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func bindPopupInner(show: Bool, popup: PopupOptions): T {
        var primaryActionId: Int64 = if (!popup.primaryButton.value.isEmpty()) {
            Callback0Param<Unit>(popup.primaryButton.action).getID()
        } else {
            INVALID_CALLBACK_ID
        }
        var secondaryActionId: Int64 = if (!popup.secondaryButton.value.isEmpty()) {
            Callback0Param<Unit>(popup.secondaryButton.action).getID()
        } else {
            INVALID_CALLBACK_ID
        }
        var onStateChangeId: Int64 = if (let Some(v) <- popup.onStateChange) {
            let lambda = {isVisible: Bool => v(PopupStateChangeParam(isVisible))}
            Callback1Param<Bool, Unit>(lambda).getID()
        } else {
            INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss: NativeOptionCallBack = if (let Some(v) <- popup.onWillDismiss) {
            let wrapper = {action: Int32 => v(parseToDismissPopupAction(action))}
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            NativeOptionCallBack(true, lambdaData.getID())
        } else {
            NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition: NativeOptionInt64 = if (let Some(v) <- popup.transition) {
            NativeOptionInt64(true, v.getID())
        } else {
            NativeOptionInt64(false, 0)
        }

        let nativePlacement: Int32 = popup.placement.getValue()
        callFFIBindPopup(popup, primaryActionId, secondaryActionId, onStateChangeId, nativeOnWillDismiss,
            nativeTransition, nativePlacement, show)
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @relation bindPopup(show: boolean, popup: PopupOptions | CustomPopupOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindPopup(show: Bool, popup: CustomPopupOptions): T {
        bindPopupInner(show, popup)
    }

    protected open func bindPopupInner(show: Bool, popup: CustomPopupOptions): T {
        var onStateChangeId = match (popup.onStateChange) {
            case Some(v) =>
                let lambda = {
                    isVisible: Bool => v(PopupStateChangeParam(isVisible))
                }
                Callback1Param<Bool, Unit>(lambda).getID()
            case None => INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss = match (popup.onWillDismiss) {
            case Some(value) =>
                let wrapper = {
                    action: Int32 => value(parseToDismissPopupAction(action))
                }
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                NativeOptionCallBack(true, lambdaData.getID())
            case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition = match (popup.transition) {
            case Some(value) => NativeOptionInt64(true, value.getID())
            case None => NativeOptionInt64(false, 0)
        }

        let nativePopupColor = match (popup.popupColor) {
            case Some(value) => value.toUInt32()
            case None => popup.backgroundColor.toUInt32()
        }

        let nativeMask = match (popup.mask) {
            case Some(value) => value.toUInt32()
            case None => popup.maskColor.toUInt32()
        }
        callFFIBindCustomPopup(popup, onStateChangeId, nativeOnWillDismiss, nativeTransition, nativePopupColor,
            nativeMask, show)
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Menu control
     *
     * @relation bindMenu(content: Array<MenuElement> | CustomBuilder, options?: MenuOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindMenu(content: Array<MenuElement>): T {
        bindMenuInner(content)
    }

    protected open func bindMenuInner(content: Array<MenuElement>): T {
        let valueVecFFi = FFIVectorString(content.size)
        var index = 0
        for (menuElement in content) {
            valueVecFFi.setElement(index, menuElement.value)
            index++
        }
        let data = MenuActionData(content)
        let callback = {
            actionName: CString => data.actionHandle(actionName.toString())
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindMenu(
                valueVecFFi.getNativeHandle(),
                Callback1Param<CString, Unit>(callback).getID()
            )
            valueVecFFi.free()
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Menu control
     *
     * @relation bindMenu(content: Array<MenuElement> | CustomBuilder, options?: MenuOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindMenu(builder!: CustomBuilder): T {
        bindMenuInner(builder)
    }

    protected open func bindMenuInner(builder: CustomBuilder): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindCustomMenu(Callback0Param<Unit>(builder).getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Binds a context menu to the component, whose visibility is subject to the isShown settings.
     *
     * @relation bindContextMenu(isShown: boolean, content: CustomBuilder, options?: ContextMenuOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindContextMenu(builder!: CustomBuilder, responseType!: ResponseType,
        options!: ContextMenuOptions = ContextMenuOptions()): T {
        bindContextMenuInner(builder, responseType, options)
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func bindContextMenuInner(builder: CustomBuilder, responseType: ResponseType,
        options: ContextMenuOptions): T {
        var optionElement: CJContextMenuOptions = options.parseContextMenuOptions()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(
                Callback0Param<Unit>(builder).getID(),
                responseType.getValue(),
                optionElement
            )
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Linear Gradient
     * angle: Angle of Linear Gradient. The default value is 180;
     * direction: Direction of Linear Gradient. The default value is GradientDirection.Bottom;
     * colors: Color description for gradients.
     * repeating: repeating. The default value is false
     *
     * @relation linearGradient(value: LinearGradientOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func linearGradient(angle!: ?Float64 = None, direction!: GradientDirection = GradientDirection.Bottom,
        colors!: Array<(ResourceColor, Float64)> = [(Color.Transparent, 0.0)], repeating!: Bool = false): T {
        linearGradientInner(angle, direction, colors, repeating)
    }

    protected open func linearGradientInner(angle: ?Float64, direction: GradientDirection,
        colors: Array<(ResourceColor, Float64)>, repeating: Bool): T {
        let directionValue = direction.getValue()
        let cColorsArr = toCArrCColors(colors)
        unsafe {
            var cAnglePoint = CPointer<Float64>()
            if (let Some(v) <- angle) {
                cAnglePoint = LibC.malloc<Float64>(count: 1)
                cAnglePoint.write(v)
            }
            let linearGradientParam = LinearGradientParam(cAnglePoint, directionValue, cColorsArr, repeating)
            FfiOHOSAceFrameworkViewAbstractLinearGradient(linearGradientParam)
            LibC.free(cAnglePoint)
            LibC.free(cColorsArr.head)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Creates a sweep gradient.
     *
     * @relation sweepGradient(value: SweepGradientOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sweepGradient(center: (Length, Length), start!: Float64 = 0.0, end!: Float64 = 0.0,
        rotation!: Float64 = 0.0, colors!: Array<(ResourceColor, Float64)> = [(Color.Transparent, 0.0)],
        repeating!: Bool = false): T {
        sweepGradientInner(center, start, end, rotation, colors, repeating)
    }

    protected open func sweepGradientInner(center: (Length, Length), start: Float64, end: Float64, rotation: Float64,
        colors: Array<(ResourceColor, Float64)>, repeating: Bool): T {
        let cCenter = CTupleLength(center[0].value, center[0].unitType.getValue(), center[1].value,
            center[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors)
        let sweepGradientParam = SweepGradientParam(cCenter, start, end, rotation, cColorsArr, repeating)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSweepGradient(sweepGradientParam)
            LibC.free(cColorsArr.head)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Creates a radial gradient.
     *
     * @relation radialGradient(value: RadialGradientOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radialGradient(center: (Length, Length), radius: Length, colors: Array<(ResourceColor, Float64)>,
        repeating!: Bool = false): T {
        radialGradientInner(center, radius, colors, repeating)
    }

    protected open func radialGradientInner(center: (Length, Length), radius: Length,
        colors: Array<(ResourceColor, Float64)>, repeating: Bool): T {
        var radius_ = transAppResourceToLength(radius)
        let cCenter = CTupleLength(center[0].value, center[0].unitType.getValue(), center[1].value,
            center[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors)
        let radialGradientParam = RadialGradientParam(cCenter, radius_.value, radius_.unitType.getValue(), cColorsArr,
            repeating)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRadialGradient(radialGradientParam)
            LibC.free(cColorsArr.head)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    func toCArrCColors(colors: Array<(ResourceColor, Float64)>): CArrCColors {
        let colorSize = colors.size
        let colorsArr = Array<CColors>(
            colorSize,
            {
                index =>
                let color = colors[index][0].toUInt32()
                let location = colors[index][1]
                CColors(color, location)
            }
        )
        let arr: CPointer<CColors> = unsafe { LibC.malloc<CColors>(count: colorSize) }
        for (i in 0..colorSize) {
            unsafe {
                arr.write(i, colorsArr[i])
            }
        }
        return CArrCColors(arr, colorSize)
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>): T {
        keyboardShortcutInner(value, keys, action: None)
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: String, keys: Array<ModifierKey>): T {
        keyboardShortcutInner(value, keys, action: None)
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>, action: () -> Unit): T {
        keyboardShortcutInner(value, keys, action: action)
    }

    /**
     * Sets hot keys
     *
     * @relation keyboardShortcut(value: string | FunctionKey, keys: Array<ModifierKey>, action?: () => void): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: String, keys: Array<ModifierKey>, action: () -> Unit): T {
        keyboardShortcutInner(value, keys, action: action)
    }

    protected open func keyboardShortcutInner(value: CombinationKeyType, keys: Array<ModifierKey>, action!: ?() -> Unit): T {
        unsafe {
            let modifierKeys = LibC.malloc<Int32>(count: keys.size)
            for (i in 0..keys.size) {
                modifierKeys.write(i, keys[i].getValue())
            }
            if (let Some(v) <- (value as String)) {
                try (cValue = LibC.mallocCString(v).asResource()) {
                    if (let Some(actionFunc) <- action) {
                        FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue.value, modifierKeys, keys.size,
                            Callback0Param<Unit>(actionFunc).getID())
                    } else {
                        FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue.value, modifierKeys, keys.size, 0)
                    }
                } finally {
                    LibC.free<Int32>(modifierKeys)
                }
                return (this as T) ?? throw IllegalArgumentException("Type error")
            }
            if (let Some(v) <- (value as FunctionKey)) {
                if (let Some(actionFunc) <- action) {
                    FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(v.getValue(), modifierKeys, keys.size,
                        Callback0Param<Unit>(actionFunc).getID())
                } else {
                    FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(v.getValue(), modifierKeys, keys.size, 0)
                }
                LibC.free<Int32>(modifierKeys)
            }
        }
        return (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Key. User can set an key to the component to identify it.
     *
     * @relation key(value: string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func key(value: String): T {
        keyInner(value)
    }

    protected open func keyInner(value: String): T {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetInspectorKey(unsafeValue.value)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * How the final state of the component's content is rendered during its width and height animation process.
     *
     * @relation renderFit(fitMode: RenderFit): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func renderFit(fitMode: RenderFit): T {
        renderFitInner(fitMode)
    }

    protected func renderFitInner(fitMode: RenderFit): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRenderFit(fitMode.getValue())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Id. User can set an id to the component to identify it.
     *
     * @relation id(value: string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(value: String): T {
        idInner(value)
    }

    protected open func idInner(value: String): T {
        unsafe {
            let unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkViewAbstractSetId(unsafeValue)
            LibC.free(unsafeValue)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Sets the safe area to be expanded to.
     *
     * @relation expandSafeArea(types?: Array<SafeAreaType>, edges?: Array<SafeAreaEdge>): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func expandSafeArea(types!: ?Array<SafeAreaType> = None, edges!: ?Array<SafeAreaEdge> = None): T {
        expandSafeAreaInner(types, edges)
    }

    protected open func expandSafeAreaInner(types: ?Array<SafeAreaType>, edges: ?Array<SafeAreaEdge>) {
        var typesArray = if (let Some(tys) <- types) {
            tys
        } else {
            [SafeAreaType.System, SafeAreaType.Cutout, SafeAreaType.Keyboard]
        }
        var edgesArray = if (let Some(edge) <- edges) {
            edge
        } else {
            [SafeAreaEdge.Top, SafeAreaEdge.Bottom, SafeAreaEdge.Start, SafeAreaEdge.End]
        }
        var safeAreaType: UInt32 = 0
        for (i in 0..typesArray.size) {
            safeAreaType |= typesArray[i].getValue()
        }
        var safeAreaEdge: UInt32 = 0
        for (i in 0..edgesArray.size) {
            safeAreaEdge |= edgesArray[i].getValue()
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractExpandSafeArea(safeAreaType, safeAreaEdge)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Binds a modal page to the component, whose visibility is subject to the isShow settings.
     *
     * @relation bindContentCover(isShow: boolean, builder: CustomBuilder, options?: ContentCoverOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindContentCover(isShow: Bool, builder: CustomBuilder,
        options!: ContentCoverOptions = ContentCoverOptions()): T {
        bindContentCoverInner(isShow, builder, options)
    }

    protected open func bindContentCoverInner(isShow: Bool, builder: CustomBuilder, options: ContentCoverOptions): T {
        let cjBindCustomPopup = options.parseCJContentCoverOptions(options)
        unsafe {
            FFIOHOSAceFrameworkBindContentCoverV2(isShow, Callback0Param<Unit>(builder).getID(), cjBindCustomPopup)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * animation
     *
     * @relation animation(value: AnimateParam): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationStart(value: AnimateParam): T {
        animationStartInner(value)
    }

    protected open func animationStartInner(value: AnimateParam): T {
        unsafe {
            let param = NativeOptionAnimateParam(true, parseAnimateParam(value))
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * animation
     *
     * @relation animation(value: AnimateParam): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationEnd(): T {
        animationEndInner()
    }

    protected open func animationEndInner(): T {
        unsafe {
            let param = NativeOptionAnimateParam(false, NativeAnimateParam())
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @relation transition(value: TransitionEffect): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transition(value: TransitionEffect): T {
        transitionInner(value)
    }

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @relation transition(value: TransitionEffect): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transition(value: TransitionEffect, onFinish: ?TransitionFinishCallback): T {
        return if (let Some(v) <- onFinish) {
            transitionInner(value, v)
        } else {
            transitionInner(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func transitionInner(value: TransitionEffect, onFinish: TransitionFinishCallback): T {
        let lambdaData = Callback1Param<Bool, Unit>(onFinish)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransitionWithBack(value.getID(), lambdaData.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    protected open func transitionInner(value: TransitionEffect): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransition(value.getID())
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set focusable.
     * Components that have default interaction logic, such as Button and TextInput, are focusable by default. Other
     * components, such as Text and Image, are not focusable by default. Only focusable components can trigger a focus event.
     *
     * @relation focusable(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusable(value: Bool): T {
        focusableInner(value)
    }

    protected open func focusableInner(value: Bool): T {
        unsafe {
            FFIOHOSAceFrameworkFocusable(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set focus index by key tab.
     * The tabIndex and focusScopeId cannot be used together.
     *
     * @relation tabIndex(index: number): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabIndex(index: Int32): T {
        tabIndexInner(index)
    }

    protected open func tabIndexInner(index: Int32): T {
        unsafe {
            FFIOHOSAceFrameworkTabIndex(index)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set default focused component when a page create.
     *
     * @relation defaultFocus(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func defaultFocus(value: Bool): T {
        defaultFocusInner(value)
    }

    protected open func defaultFocusInner(value: Bool): T {
        unsafe {
            FFIOHOSAceFrameworkDefaultFocus(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set default focused component when focus on a focus group.
     *
     * @relation groupDefaultFocus(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func groupDefaultFocus(value: Bool): T {
        groupDefaultFocusInner(value)
    }

    protected open func groupDefaultFocusInner(value: Bool): T {
        unsafe {
            FFIOHOSAceFrameworkGroupDefaultFocus(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set a component focused when the component be touched.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation focusOnTouch(value: boolean): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusOnTouch(value: Bool): T {
        focusOnTouchInner(value)
    }

    protected open func focusOnTouchInner(value: Bool): T {
        unsafe {
            FFIOHOSAceFrameworkFocusOnTouch(value)
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Binds a sheet page to the component, whose visibility is subject to the isShow settings.
     *
     * @param { Bool } isShow - true means display sheet, false means hide sheet.
     * @param { CustomBuilder } builder - the sheet to be displayed.
     * @param { SheetOptions } options - options of sheet.
     * @returns { This }
     * @relation bindSheet(isShow: boolean, builder: CustomBuilder, options?: SheetOptions): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSheet(isShow: Bool, builder: CustomBuilder, options!: SheetOptions = SheetOptions()): T {
        bindSheetInner(isShow, builder, options)
    }

    protected open func bindSheetInner(isShow: Bool, builder: CustomBuilder, options: SheetOptions): T {
        let cBuilder = Callback0Param<Unit>(builder).getID()
        let cSheetOption = SheetOptions.parse(options)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractbindSheetParamV2(isShow, cBuilder, cSheetOption)
            if (cSheetOption.detents.hasValue) {
                LibC.free<Int32>(cSheetOption.detents.value.head)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }

    /**
     * Set preview of the component for dragging process
     *
     * @param { String } value - preview of the component for dragging process
     * @returns { This }
     * @relation dragPreview(value: CustomBuilder | DragItemInfo | string): T;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dragPreview(value: String): T {
        dragPreviewInner(value)
    }

    protected open func dragPreviewInner(value: String): T {
        unsafe {
            try (unsafeSrc = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetDragPreviewWithString(unsafeSrc.value)
            }
        }
        (this as T) ?? throw IllegalArgumentException("Type error")
    }
}

