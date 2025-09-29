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
import ohos.multimedia.image.PixelMap
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
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onClick(event: ?(ClickEvent) -> Unit): T {
        onClickInner(event)
    }

    protected open func onClickInner(callback: ?(ClickEvent) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            evt: CJClickEvent => tmpCallback(parseCJClickEvent(evt))
        }
        let lambdaData = CallbackCJClickEvent(wrapper)
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnClick(lambdaData.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * This callback is triggered when a component mounts a display.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAppear(event: ?() -> Unit): T {
        onAppearInner(event)
    }

    protected open func onAppearInner(callback: ?() -> Unit): T {
        let tmpCallback = callback ?? { => }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAppear(Callback0Param<Unit>(tmpCallback).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * This callback is triggered when component uninstallation disappears.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDisAppear(event: ?() -> Unit): T {
        onDisAppearInner(event)
    }

    protected open func onDisAppearInner(callback: ?() -> Unit): T {
        let tmpCallback = callback ?? { => }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDisAppear(Callback0Param<Unit>(tmpCallback).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Invoked when a touch event is triggered.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTouch(event: ?(TouchEvent) -> Unit): T {
        onTouchInner(event)
    }

    protected open func onTouchInner(event: ?(TouchEvent) -> Unit): T {
        let tmpEvent = event ?? { _: TouchEvent => }
        let wrapper = {
            evt: CJTouchEvent =>
            var resolved = parseCJTouchEvent(evt)
            tmpEvent(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnTouch(CallbackCJTouchEvent(wrapper).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Trigger a hover event.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onHover(event: ?(Bool) -> Unit): T {
        onHoverInner(event)
    }

    protected open func onHoverInner(callback: ?(Bool) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnHover(Callback1Param<Bool, Unit>(tmpCallback).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * This callback is triggered when the size or position of this component change finished.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onAreaChange(event: ?(Area, Area) -> Unit): T {
        onAreaChangeInner(event)
    }

    protected open func onAreaChangeInner(callback: ?(Area, Area) -> Unit): T {
        let tmpCallback = callback ?? { _, _ => }
        let wrapper = {
            lastArea: CJArea, area: CJArea => tmpCallback(parseCJArea(lastArea), parseCJArea(area))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnAreaChanged(CallbackCJAreaChangedEvent(wrapper).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Trigger a visible area change event.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onVisibleAreaChange(raitos: ?Array<Float64>, event: ?(Bool, Float64) -> Unit): T {
        onVisibleAreaChangeInner(raitos, event)
    }

    protected open func onVisibleAreaChangeInner(raitos: ?Array<Float64>, callback: ?(Bool, Float64) -> Unit): T {
        let tmpRaitos = raitos ?? [0.0, 1.0]
        let tmpCallback = callback ?? { _: Bool, _: Float64 => }
        let wrapper = {
            isVisible: Bool, currentRatio: Float64 => tmpCallback(isVisible, currentRatio)
        }
        let valuesHandle = FFIVectorFloat64(tmpRaitos.size)
        for (i in 0..tmpRaitos.size) {
            valuesHandle.setElement(i, tmpRaitos[i])
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnVisibleAreaChange(valuesHandle.getNativeHandle(),
                CallbackCJVisibleAreaChangeEvent(wrapper).getID())
        }
        valuesHandle.free()
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Triggered when the component is clicked by a mouse button or the mouse pointer moves on the component.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onMouse(event: ?(MouseEvent) -> Unit): T {
        onMouseInner(event)
    }

    protected open func onMouseInner(event: ?(MouseEvent) -> Unit): T {
        let tmpEvent = event ?? { _: MouseEvent => }
        let wrapper = {
            evt: CJMouseEvent =>
            var resolved = parseCJMouseEvent(evt)
            tmpEvent(resolved)
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnMouse(CallbackCJMouseEvent(wrapper).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Keyboard input
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onKeyEvent(event: ?(KeyEvent) -> Unit): T {
        onKeyEventInner(event)
    }

    protected open func onKeyEventInner(callback: ?(KeyEvent) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            evt: CJKeyEvent =>
            let resolved = parseCJKeyEvent(evt)
            tmpCallback(resolved)
            return resolved.isStopPropagation
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnKey(CallbackCJKeyEvent(wrapper).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Trigger a event when got focus.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFocus(event: ?() -> Unit): T {
        onFocusInner(event)
    }

    protected open func onFocusInner(callback: ?() -> Unit): T {
        let tmpCallback = callback ?? { => }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnFocus(Callback0Param<Unit>(tmpCallback).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /*
     * Triggered when the current component loses focus.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBlur(event: ?() -> Unit): T {
        onBlurInner(event)
    }

    protected open func onBlurInner(callback: ?() -> Unit): T {
        let tmpCallback = callback ?? { => }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnBlur(Callback0Param<Unit>(tmpCallback).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: ?(DragInfo) -> DragItemInfo): T {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: ?(DragInfo) -> DragItemInfo): T {
        if (let Some(tmpCallback)<- callback) {
            unsafe {
                FfiOHOSAceFrameworkInteractableViewOnDragStart(
                    CallbackCJDragInfoVCDragItemInfo(
                        {
                            evt =>
                            let ret = tmpCallback(parseCJDragEvent(evt))
                            let pixelMapId = (ret.pixelMap ?? PixelMap(0)).getID()
                            let builderId = Callback0Param<Unit>(ret.builder ?? {=>}).getID()
                            return CJDragItemInfo(
                                pixelMapId: pixelMapId,
                                builderId: builderId,
                                extraInfo: LibC.mallocCString(ret.extraInfo ?? "")
                            )
                        }
                    ).getID(), DragComponent.DragCommon.getValue())
            }
        } else {
            return onDragStartInner({ _: DragInfo => })
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: ?(DragInfo) -> CustomBuilder): T {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: ?(DragInfo) -> CustomBuilder): T {
        if (let Some(tmpCallback)<- callback) {
            unsafe {
                FfiOHOSAceFrameworkInteractableViewOnDragStart(
                    CallbackCJDragInfoVCDragItemInfo(
                        {
                            evt =>
                            let ret = tmpCallback(parseCJDragEvent(evt))
                            return CJDragItemInfo(builderId: Callback0Param<Unit>(ret).getID())
                        }
                    ).getID(), DragComponent.DragCommon.getValue())
            }
        } else {
            return onDragStartInner({ _: DragInfo => })
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * After a listener is bound, the component can be dragged. After the drag occurs, a callback is triggered.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragStart(event: ?(DragInfo) -> Unit): T {
        onDragStartInner(event)
    }

    protected open func onDragStartInner(callback: ?(DragInfo) -> Unit): T {
        let tmpCallback = callback ?? { _: DragInfo => }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragStart(
                CallbackCJDragInfoVCDragItemInfo(
                    {
                        evt =>
                        tmpCallback(parseCJDragEvent(evt))
                        return CJDragItemInfo()
                    }
                ).getID(), DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * After binding, a callback is triggered when the component is dragged to the range of the component.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragEnter(event: ?(DragInfo) -> Unit): T {
        onDragEnterInner(event)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func onDragEnterInner(callback: ?(DragInfo) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            info: CJDragInfo => tmpCallback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragEnter(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * After binding, a callback is triggered when the drag moves within the range of a placeable component.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.     
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragMove(event: ?(DragInfo) -> Unit): T {
        onDragMoveInner(event)
    }

    protected open func onDragMoveInner(callback: ?(DragInfo) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            info: CJDragInfo => tmpCallback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragMove(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * After binding, a callback is triggered when the component is dragged out of the component range.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDragLeave(event: ?(DragInfo) -> Unit): T {
        onDragLeaveInner(event)
    }

    protected open func onDragLeaveInner(callback: ?(DragInfo) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            info: CJDragInfo => tmpCallback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDragLeave(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The component bound to this event can be used as the drag release target.
     * This callback is triggered when the drag behavior is stopped within the scope of the component.
     *
     * @params { function } event
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BusinessException } 190002 - The callback function is invalid.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDrop(event: ?(DragInfo) -> Unit): T {
        onDropInner(event)
    }
    /*
     * Note: the DragInfo is diff with DragEvent.
     */
    protected open func onDropInner(callback: ?(DragInfo) -> Unit): T {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            info: CJDragInfo => tmpCallback(parseCJDragEvent(info))
        }
        unsafe {
            FfiOHOSAceFrameworkInteractableViewOnDrop(CallbackCJDragInfo(wrapper).getID(),
                DragComponent.DragCommon.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the width of the component. By default, the width required to fully hold the
     * component content is used.If the width of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @params { Length } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func width(value: Option<Length>): T {
        widthInner(value)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func widthInner(value: ?Length): T {
        match (value) {
            case Some(v) => 
                unsafe {
                    let val = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkViewAbstractSetWidth(val.value, val.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the height of the component. By default, the height required to fully hold the
     * component content is used. If the height of the component is greater than that of
     * the parent container, the component will be drawn beyond the parent container scope.
     *
     * @params { Length } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func height(value: Option<Length>): T {
        heightInner(value)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func heightInner(value: ?Length): T {
        match (value) {
            case Some(v) => 
                unsafe {
                    let val = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkViewAbstractSetHeight(val.value, val.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The size of the current component.
     *
     * @params { Length } width
     * @params { Length } height
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(width!: ?Length, height!: ?Length): T {
        sizeInner(width, height)
    }

    protected open func sizeInner(width: ?Length, height: ?Length) {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            var w = transAppResourceToLength(width ?? 0.0.vp)
            var h = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkViewAbstractSetSize(w.value, w.unitType.getValue(), h.value, h.unitType.getValue())
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the padding of the component.
     *
     * @params { Length } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(value: ?Length): T {
        paddingInner(value)
    }

    protected open func paddingInner(value: ?Length): T {
        unsafe {
            var v = transAppResourceToLength(value ?? 0.0.vp)
            FfiOHOSAceFrameworkViewAbstractSetPadding(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the padding of the component.
     *
     * @params { Length, Length, Length, Length } Indicates safeArea padding values.
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func padding(top!: ?Length = None, right!: ?Length = None, bottom!: ?Length = None, left!: ?Length = None): T {
        paddingInner(top, right, bottom, left)
    }

    protected open func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): T {
        var topInner = transAppResourceToLength(top ?? 0.vp)
        var rightInner = transAppResourceToLength(right ?? 0.vp)
        var bottomInner = transAppResourceToLength(bottom ?? 0.vp)
        var leftInner = transAppResourceToLength(left ?? 0.vp)
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the margin of the component.
     *
     * @params { Length } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(value: ?Length): T {
        marginInner(value)
    }

    protected open func marginInner(value: ?Length): T {
        var v = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMargin(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the margin of the component.
     *
     * @params { Length, Length, Length, Length } Indicates safeArea margin values.
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func margin(top!: ?Length = None, right!: ?Length = None, bottom!: ?Length = None, left!: ?Length = None): T {
        marginInner(top: top, right: right, bottom: bottom, left: left)
    }

    protected open func marginInner(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): T {
        var topInner = transAppResourceToLength(top ?? 0.vp)
        var rightInner = transAppResourceToLength(right ?? 0.vp)
        var bottomInner = transAppResourceToLength(bottom ?? 0.vp)
        var leftInner = transAppResourceToLength(left ?? 0.vp)
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }
    /**
     * Sets the weight of the component during layout. A component with this attribute is allocated space
     * along the main axis of its parent container (Row, Column, or Flex) based on its specified weight.
     *
     * @params { Int32 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func layoutWeight(value: ?Int32): T {
        layoutWeightInner(value)
    }

    protected open func layoutWeightInner(value: ?Int32): T {
        // Note: ViewAbstract::SetLayoutWeight(float value)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetLayoutWeight(value ?? 0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the constraint size of the component, which is used to limit the size range during component layout.
     * Default value: **{minWidth: 0, maxWidth: Infinity, minHeight: 0, maxHeight: Infinity}**.
     *
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func constraintSize(minWidth!: ?Length = None, maxWidth!: ?Length = None,
        minHeight!: ?Length = None, maxHeight!: ?Length = None): T {
        constraintSizeInner(minWidth, maxWidth, minHeight, maxHeight)
    }

    protected open func constraintSizeInner(minWidth: ?Length, maxWidth: ?Length, minHeight: ?Length, maxHeight: ?Length): T {
        var minWidthInner = transAppResourceToLength(minWidth ?? 0.vp)
        var maxWidthInner = transAppResourceToLength(maxWidth ?? (Float64.Inf).vp)
        var minHeightInner = transAppResourceToLength(minHeight ?? 0.vp)
        var maxHeightInner = transAppResourceToLength(maxHeight ?? (Float64.Inf).vp)
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the alignment mode of the component content in the drawing area.
     * Default value: **Alignment.Center**.
     *
     * @params { Alignment } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func align(value: ?Alignment): T {
        alignInner(value)
    }

    protected open func alignInner(value: ?Alignment): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlign((value ?? Alignment.Center).getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets how elements are laid out along the main axis of the container.
     * Default value: **Direction.Auto**.
     *
     * @params { Direction } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func direction(value: ?Direction): T {
        directionInner(value)
    }

    protected open func directionInner(value: ?Direction): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDirection((value ?? Direction.Auto).getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the absolute position of the component relative to the position of the parent component.
     * The attribute is not available for a layout container whose width and height are zero.
     *
     * @params { Length } x
     * @params { Length } y
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func position(x!: ?Length, y!: ?Length): T {
        positionInner(x, y)
    }

    protected open func positionInner(xAxis: ?Length, yAxis: ?Length): T {
        var x = transAppResourceToLength(xAxis ?? 0.0.vp)
        var y = transAppResourceToLength(yAxis ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetPosition(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the anchor for locating the component, which is used to move the component
     * further away from the position specified by position or offset.
     *
     * @params { Length } x
     * @params { Length } y
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func markAnchor(x!: ?Length, y!: ?Length): T {
        markAnchorInner(x, y)
    }

    protected open func markAnchorInner(xAxis: ?Length, yAxis: ?Length): T {
        let tmpX = xAxis ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpY = yAxis ?? throw IllegalArgumentException("The type now is not supported.")
        var x = transAppResourceToLength(tmpX)
        var y = transAppResourceToLength(tmpY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMarkAnchor(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the offset of the component relative to its original position.
     * <br>The offset attribute does not affect the layout of the parent container.
     * It adjusts the component position only during drawing.
     *
     * @params { Length } x
     * @params { Length } y
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offset(x!: ?Length, y!: ?Length): T {
        offsetInner(x, y)
    }

    protected open func offsetInner(xAxis: ?Length, yAxis: ?Length): T {
        var x = transAppResourceToLength(xAxis ?? 0.0.vp)
        var y = transAppResourceToLength(yAxis ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOffset(x.value, x.unitType.getValue(), y.value, y.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the alignment rules in the relative container.
     * This API is valid only when the container is RelativeContainer.
     *
     * @params { AlignRuleOptions } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     * @throws { BussnessException } - 100001 - Internal error. Possible causes: Failed to allocate memory.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignRules(value: ?AlignRuleOptions): T {
        alignRulesInner(value)
    }

    protected open func alignRulesInner(value: ?AlignRuleOptions): T {
        let option = CJAlignRuleOption(value ?? AlignRuleOptions())
        unsafe { FfiOHOSAceFrameworkViewAbstractSetAlignRules(option) }
        option.free()
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the aspect ratio of the component, which can be obtained using the following formula: width/height.
     * If only width and aspectRatio are set, the height is calculated using the following formula: width/aspectRatio.
     * If only height and aspectRatio are set, the width is calculated using the following formula: height x aspectRatio.
     * If width, height, and aspectRatio are all set, the explicitly set height is ignored, and the effective height is calculated using the following formula: width/aspectRatio.
     * This parameter takes effect only when a valid value greater than 0 is specified.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aspectRatio(value: Float64): T {
        aspectRatioInner(value)
    }

    protected open func aspectRatioInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAspectRatio(value)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the display priority for the component in the layout container.
     * This parameter is only effective in Row, Column, and Flex (single-line) container components.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func displayPriority(value: ?Int32): T {
        displayPriorityInner(value)
    }

    protected open func displayPriorityInner(value: ?Int32): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetDisplayPriority(value ?? 1)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the base size of the component in the main axis of the parent container.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexBasis(value: ?Length): T {
        flexBasisInner(value)
    }

    protected open func flexBasisInner(value: ?Length): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexBasis(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexGrow(value: ?Float64): T {
        flexGrowInner(value)
    }

    /**
     * Sets the percentage of the parent container's remaining space that is allocated to the component.
     * Default value: **0**.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexGrow(value: ?Int64): T {
        flexGrowInner(Float64(value ?? 0))
    }

    protected open func flexGrowInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexGrow(value ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexShrink(value: ?Float64): T {
        flexShrinkInner(value)
    }

    /**
     * Sets the percentage of the parent container's shrink size that is allocated to the component.
     * Default value: 0 when the parent container is Column or Row, 1 when the parent container is Flex.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flexShrink(value: ?Int64): T {
        flexShrinkInner(Float64(value ?? 0))
    }

    protected open func flexShrinkInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetFlexShrink(value ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the alignment mode of the child components along the cross axis of the parent container.
     * Default value: **ItemAlign.Auto**.
     *
     * @params { ItemAlign } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func alignSelf(value: ?ItemAlign): T {
        alignSelfInner(value)
    }

    protected open func alignSelfInner(value: ?ItemAlign): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetAlignSelf((value ?? ItemAlign.Auto).getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the response region of the current component.
     *
     * @params { Rectangle } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(value: ?Rectangle): T {
        responseRegionInner(value)
    }

    protected open func responseRegionInner(value: ?Rectangle): T {
        let cjRect = (value ?? Rectangle()).parseToNative()
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the response region of the current component.
     *
     * @params { Array<Rectangle> } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(value: ?Array<Rectangle>): T {
        responseRegionInner(value)
    }

    protected open func responseRegionInner(value: ?Array<Rectangle>): T {
        let tmpValue = value ?? [Rectangle()]
        let vecFFi = FFIVectorNativeRectangle(tmpValue.size)
        var index = 0
        for (rect in tmpValue) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the border.
     *
     * @params { Length } width
     * @params { ResourceColor } color
     * @params { Length } radius
     * @params { BorderStyle } style
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func border(width!: ?Length, color!: ?ResourceColor = None, radius!: ?Length = None,
        style!: ?BorderStyle = Option.None): T {
        borderInner(width, color, radius, style)
    }

    protected open func borderInner(width: ?Length, color: ?ResourceColor, radius: ?Length, style: ?BorderStyle): T {
        var w = transAppResourceToLength(width ?? 0.vp)
        var r = transAppResourceToLength(radius ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorder(
                CJBorder(w.value, w.unitType.getValue(), transAppResourceToResourceColor(color ?? Color.Black), r.value,
                    r.unitType.getValue(), (style ?? BorderStyle.Solid).getValue()))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the border width.
     * Percentage values are not supported.
     *
     * @params { Length } value
     * @returns { This }
     * @throws { BusinessException } 100023 - Percentage values are not supported.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderWidth(value: ?Length): T {
        borderWidthInner(value)
    }

    protected open func borderWidthInner(value: ?Length): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        if (v.unitType.getValue() == LENGTH_PERCENT) {
            throw BusinessException(100023, "Percentage values are not supported.")
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidth(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the border width.
     *
     * @params { EdgeWidths } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderWidth(value: ?EdgeWidths): T {
        borderWidthInner(value)
    }

    protected open func borderWidthInner(edgeWidths: ?EdgeWidths): T {
        let tmpedgeWidths = edgeWidths ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderWidthWithCJEdge(
                CJEdge((tmpedgeWidths.top ?? 0.vp).value, (tmpedgeWidths.top ?? 0.vp).unitType.getValue(), (tmpedgeWidths.right ?? 0.vp).value,
                    (tmpedgeWidths.right ?? 0.vp).unitType.getValue(), (tmpedgeWidths.bottom ?? 0.vp).value, (tmpedgeWidths.bottom ?? 0.vp).unitType.getValue(), 
                    (tmpedgeWidths.left ?? 0.vp).value, (tmpedgeWidths.left ?? 0.vp).unitType.getValue()))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the border color.
     * Default value: **Color.Black**.
     *
     * @params { ResourceColor } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderColor(value: ?ResourceColor): T {
        borderColorInner(value)
    }

    protected open func borderColorInner(value: ?ResourceColor) {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderColor(transAppResourceToResourceColor(value ?? Color.Black))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @params { Length } topLeft
     * @params { Length } topRight
     * @params { Length } bottomLeft
     * @params { Length } bottomRight
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(topLeft!: ?Length = None, topRight!: ?Length = None, bottomLeft!: ?Length = None,
        bottomRight!: ?Length = None): T {
        borderRadiusInner(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
    }

    protected open func borderRadiusInner(topLeft!: ?Length, topRight!: ?Length, bottomLeft!: ?Length, bottomRight!: ?Length): T {
        var topLeftInner = transAppResourceToLength(topLeft ?? 0.vp)
        var topRightInner = transAppResourceToLength(topRight ?? 0.vp)
        var bottomLeftInner = transAppResourceToLength(bottomLeft ?? 0.vp)
        var bottomRightInner = transAppResourceToLength(bottomRight ?? 0.vp)
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the radius of the border rounded corners.
     * The radius is restricted by the component size. The maximum value is half of the component width or height.
     *
     * @params { Length } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderRadius(value: ?Length): T {
        borderRadiusInner(value)
    }

    protected open func borderRadiusInner(value: ?Length): T {
        var v = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderRadius(v.value, v.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the border style.
     * Default value: **BorderStyle.Solid**.
     *
     * @params { BorderStyle } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderStyle(value: ?BorderStyle): T {
        borderStyleInner(value)
    }

    protected open func borderStyleInner(value: ?BorderStyle): T {
        let tmpValue = value ?? BorderStyle.Solid
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBorderStyle(tmpValue.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a foreground blur style to the component.
     *
     * @params { BlurStyle } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: ?BlurStyle): T {
        foregroundBlurStyleInner(value, Option<ForegroundBlurStyleOptions>.None)
    }

    /**
     * Applies a foreground blur style to the component.
     *
     * @params { BlurStyle } value
     * @params { ForegroundBlurStyleOptions } options
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundBlurStyle(value: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T {
        foregroundBlurStyleInner(value, options)
    }

    protected open func foregroundBlurStyleInner(style: ?BlurStyle, options: ?ForegroundBlurStyleOptions): T {
        let tmpStyle = style ?? BlurStyle.None
        unsafe {
            if (let Some(v) <- options) {
                let ret = CJForegroundBlurStyleOptions((v.colorMode ?? ThemeColorMode.System).getValue(), (v.adaptiveColor ?? AdaptiveColor.Default).getValue(),
                    CJBlurOptions((v.blurOptions ?? BlurOptions([0.0, 0.0])).grayscale ?? [0.0, 0.0]), v.scale ?? 1.0)
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyleOption(tmpStyle.getValue(), ret)
            } else {
                FfiOHOSAceFrameworkViewAbstractSetForegroundBlurStyle(tmpStyle.getValue())
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @params { ColoringStrategy } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundColor(value: ?ColoringStrategy): T {
        foregroundColorInner(value)
    }

    /**
     * Sets the foreground color of the component.
     * If the component does not have a foreground color set, it inherits the color from its parent component by default.
     *
     * @params { ResourceColor } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func foregroundColor(value: ?ResourceColor): T {
        foregroundColorInner(value)
    }

    protected open func foregroundColorInner(value: ?ResourceColor): T {
        let tmpValue = value ?? Color.Transparent
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetForegroundResourceColor(transAppResourceToResourceColor(tmpValue))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func foregroundColorInner(value: ?ColoringStrategy): T {
        match (value) {
            case Some(v) => 
                unsafe {
                    try (strategy = LibC.mallocCString(v.getValue()).asResource()) {
                        FfiOHOSAceFrameworkViewAbstractSetForegroundColor(strategy.value)
                    }
                }
            case None => foregroundColorInner(Color.Transparent)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Background color
     *
     * @params { ResourceColor } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundColor(value: ?ResourceColor): T {
        backgroundColorInner(value)
    }

    protected open func backgroundColorInner(value: ?ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundColor(transAppResourceToResourceColor(value ?? Color.Transparent))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Background image
     *
     * @params { ResourceColor } src
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src: ?ResourceStr): T {
        backgroundImageInner(src, ImageRepeat.NoRepeat)
    }

    /**
     * Background image
     * @params { ResourceColor } src
     * @params { ImageRepeat } repeat
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T {
        backgroundImageInner(src, repeat ?? ImageRepeat.NoRepeat)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func backgroundImageInner(src: ?ResourceStr, repeat: ?ImageRepeat): T {
        let tmpSrc = src ?? ""
        var repeatUnit = if (let Some(v) <- repeat) {
            v.getValue()
        } else {
            ImageRepeat.NoRepeat.getValue()
        }
        var srcMedia = match (tmpSrc) {
            case v: String => v
            case v: AppResource => getResourceMedia(v)
            case _ => throw BusinessException(100001, "Internal error: Invaild type.")
        }
        unsafe {
            try (unsafeSrc = LibC.mallocCString(srcMedia).asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetBackgroundImage(unsafeSrc.value, repeatUnit)
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Background image size
     *
     * @params { ImageSize } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(value: ?ImageSize): T {
        backgroundImageSizeInner(value)
    }

    /**
     * Background image size
     *
     * @params { Length } width
     * @params { Length } height
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImageSize(width!: ?Length = None, height!: ?Length = None): T {
        backgroundImageSizeInner(width, height)
    }

    protected open func backgroundImageSizeInner(width: ?Length, height: ?Length): T {
        var w = transAppResourceToLength(width ?? 0.vp)
        var h = transAppResourceToLength(height ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSize(w.value, w.unitType.getValue(), h.value,
                h.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func backgroundImageSizeInner(imageSize: ?ImageSize): T {
        let tmpImageSize = imageSize ?? ImageSize.Auto
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImageSizeType(tmpImageSize.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @params { Alignment } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(value: ?Alignment): T {
        backgroundImagePositionInner(value)
    }

    /**
     * Background image position
     * x: Horizontal coordinate;
     * y: Vertical axis coordinate;
     *
     * @params { Length } x
     * @params { Length } y
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backgroundImagePosition(x!: ?Length = None, y!: ?Length = None): T {
        backgroundImagePositionInner(x, y)
    }

    protected open func backgroundImagePositionInner(xAxis: ?Length, yAxis: ?Length): T {
        var x = transAppResourceToLength(xAxis ?? 0.vp)
        var y = transAppResourceToLength(yAxis ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionXY(x.value, x.unitType.getValue(), y.value,
                y.unitType.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func backgroundImagePositionInner(value: ?Alignment): T {
        match (value) {
            case Some(v) => 
                unsafe {
                    FfiOHOSAceFrameworkViewAbstractSetBackgroundImagePositionAlign(v.getValue())
                }
            case None => backgroundImagePosition()
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Scales the component.
     * Scale ratio along the x-, y-, and z-axis. The default value is **1**.
     * centerX and centerY are used to set the scale center point.
     * default:{x:1,y:1,z:1,centerX:'50%',centerY:'50%'}
     *
     * @params { Float32 } x
     * @params { Float32 } y
     * @params { Float32 } z
     * @params { Length } centerX
     * @params { Length } centerY
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(x!: ?Float32 = None, y!: ?Float32 = None, z!: ?Float32 = None, centerX!: ?Length = None,
        centerY!: ?Length = None): T {
        scaleInner(x ?? 1.0, y ?? 1.0, z ?? 1.0, centerX ?? 50.percent, centerY ?? 50.percent)
    }

    protected open func scaleInner(x: Float32, y: Float32, z: Float32, centerX: Length, centerY: Length) {
        var cx = transAppResourceToLength(centerX)
        var cy = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetScale(
                CJSetScale(x, y, z, cx.value, cx.unitType.getValue(), cy.value, cy.unitType.getValue()))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the opacity of the component.
     *
     * @params { Float64 } value - Opacity of the component. The value ranges from 0 to 1.
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func opacity(value: ?Float64): T {
        opacityInner(value)
    }

    protected open func opacityInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetOpacity(value ?? 1.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set component rotation.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(x!: ?Float32 = None, y!: ?Float32 = None, z!: ?Float32 = None, angle!: ?Float32 = None,
        centerX!: ?Length = None, centerY!: ?Length = None): T {
        rotateInner(x ?? 0.0, y ?? 0.0, z ?? 1.0, angle ?? 0.0, centerX ?? 50.percent, centerY ?? 50.percent)
    }

    protected open func rotateInner(x: Float32, y: Float32, z: Float32, angle: Float32, centerX: Length, centerY: Length): T {
        var cx = transAppResourceToLength(centerX)
        var cy = transAppResourceToLength(centerY)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetRotate(
                CJSetRotate(x, y, z, angle, cx.value, cx.unitType.getValue(), cy.value, cy.unitType.getValue()))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the translation effect for page transitions.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x!: ?Length = None, y!: ?Length = None, z!: ?Length = None): T {
        translateInner(x, y, z)
    }

    protected open func translateInner(xAxis: ?Length, yAxis: ?Length, zAxis: ?Length): T {
        var x = transAppResourceToLength(xAxis ?? 0.vp)
        var y = transAppResourceToLength(yAxis ?? 0.vp)
        var z = transAppResourceToLength(zAxis ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetTranslate(
                CJTranslate(x.value, x.unitType.getValue(), y.value, y.unitType.getValue(), z.value,
                    z.unitType.getValue()))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * If the value is true, the component is available and can respond to operations such as clicking.
     * If it is set to false, click operations are not responded.
     *
     * @params { Bool } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enabled(value: ?Bool): T {
        enabledInner(value)
    }

    protected open func enabledInner(value: ?Bool): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetEnabled(value ?? true)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * If the components of the two pages are configured with the same ID.
     * The shared element transition is performed during transition.
     * If the parameter is set to an empty string, the shared element transition does not occur.
     * For details about the options parameter, see the options parameter description.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sharedTransition(id: String, options!: ?SharedTransitionOptions = None): T {
        sharedTransitionInner(id, options)
    }

    protected open func sharedTransitionInner(id: String, options: ?SharedTransitionOptions): T {
        let tmpOptions = options ?? SharedTransitionOptions()
        unsafe {
            try (unsafeId = LibC.mallocCString(id).asResource(), unsafeCurve = LibC
                .mallocCString((tmpOptions.curve ?? Curve.Linear).getValue())
                .asResource(), unsafeMotionPath = LibC.mallocCString((tmpOptions.motionPath ?? MotionPathOptions(path: "")).path ?? "").asResource()) {
                let unsafeOptions = CJSharedTransitionOptions(
                    tmpOptions.duration ?? 1000,
                    tmpOptions.delay ?? 0,
                    tmpOptions.zIndex ?? 0,
                    unsafeCurve.value,
                    CJMotionPathOptions(unsafeMotionPath.value, (tmpOptions.motionPath ?? MotionPathOptions(path: "")).from ?? 0.0, 
                    (tmpOptions.motionPath ?? MotionPathOptions(path: "")).to ?? 1.0, (tmpOptions.motionPath ?? MotionPathOptions(path: "")).rotatable ?? false),
                    (tmpOptions.effectType ?? SharedTransitionEffectType.Exchange).getValue()
                )
                FfiOHOSAceFrameworkViewAbstractSetSharedTransition(unsafeId.value, unsafeOptions)
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Shared geometry transition
     *
     * @params { String } id
     * @params { Bool } followWithoutTransition
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func geometryTransition(id: ?String, followWithoutTransition!: ?Bool = None): T {
        geometryTransitionInner(id, followWithoutTransition)
    }

    protected open func geometryTransitionInner(id: ?String, value: ?Bool): T {
        unsafe {
            try (idCString = LibC.mallocCString(id ?? "").asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetGeometryTransition(idCString.value, value ?? false)
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Adds the content blurring effect for the current component. The input parameter is the blurring radius.
     * The larger the blurring radius, the more blurring the content.
     * If the value is 0, the content blurring effect is not blurring.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func blur(value: ?Float64): T {
        blurInner(value)
    }

    protected open func blurInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBlur(value ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a color blend effect to the component.
     *
     * @params { ResourceColor } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func colorBlend(value: ?ResourceColor): T {
        colorBlendInner(value)
    }

    protected open func colorBlendInner(value: ?ResourceColor): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetColorBlend(transAppResourceToResourceColor(value ?? Color.Transparent))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a background blur effect to the component. You can customize the blur radius and grayscale parameters.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backdropBlur(value: ?Float64): T {
        backdropBlurInner(value)
    }

    protected open func backdropBlurInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBackdropBlur(value ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a shadow effect to the component.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func shadow(radius!: ?Float64, color!: ?ResourceColor = None, offsetX!: ?Float64 = None,
        offsetY!: ?Float64 = None): T {
        shadowInner(radius, color, offsetX, offsetY)
    }

    protected open func shadowInner(radius: ?Float64, color: ?ResourceColor, offsetX: ?Float64, offsetY: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetShadow(radius ?? 0.0, transAppResourceToResourceColor(color ?? Color(0x666666)),
                offsetX ?? 0.0, offsetY ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a grayscale effect to the component.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func grayscale(value: ?Float64): T {
        grayscaleInner(value)
    }

    protected open func grayscaleInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetGrayScale(value ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a brightness effect to the component.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func brightness(value: ?Float64): T {
        brightnessInner(value)
    }

    protected open func brightnessInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetBrightness(value ?? 1.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a saturation effect to the component.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func saturate(value: ?Float64): T {
        saturateInner(value)
    }

    protected open func saturateInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSaturate(value ?? 1.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Applies a contrast effect to the component.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contrast(value: ?Float64): T {
        contrastInner(value)
    }

    protected open func contrastInner(value: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetContrast(value ?? 1.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(value: ?Float64): T {
        invertInner(value)
    }

    protected open func invertInner(value: ?Float64): T {
        let tmpValue = value ?? 0.0
        var realValue = if (tmpValue > 1.0) {
            1.0
        } else {
            tmpValue
        }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvert(realValue)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Invert the input image. Value defines the scale of the conversion. 100% of the value is a complete reversal.
     * A value of 0% does not change the image. (Percentage)
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(low!: ?Float64, high!: ?Float64, threshold!: ?Float64, thresholdRange!: ?Float64): T {
        invertInner(low, high, threshold, thresholdRange)
    }

    protected open func invertInner(low: ?Float64, high: ?Float64, threshold: ?Float64, thresholdRange: ?Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetInvertWithOptions(low ?? 0.0, high ?? 0.0, threshold ?? 0.0, thresholdRange ?? 0.0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sepia conversion ratio of the component.
     *
     * @params { Float64 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sepia(value: ?Float64): T {
        let tmpValue = value ?? 0.0
        sepiaInner(tmpValue)
    }

    protected open func sepiaInner(value: Float64): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetSepia(value)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Rotates the hue of the component.
     *
     * @params { Float32 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hueRotate(value: ?Float32): T {
        let tmpValue = value ?? 0.0
        hueRotateInner(tmpValue)
    }

    protected open func hueRotateInner(value: Float32): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetHueRotate(value)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * The sibling components in the same container are hierarchically displayed. A larger value of z indicates a higher display level.
     *
     * @params { Int32 } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func zIndex(value: ?Int32): T {
        zIndexInner(value)
    }

    protected open func zIndexInner(value: ?Int32): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetZIndex(value ?? 0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Controls the display or hide of the current component.
     *
     * @params { Visibility } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func visibility(value: ?Visibility): T {
        visibilityInner(value)
    }

    protected open func visibilityInner(value: ?Visibility): T {
        let tmpValue = value ?? Visibility.Visible
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetVisibility(tmpValue.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets whether to clip the areas of child components that extend beyond this component's boundaries,
     * That is, whether to perform clipping based on the edge contour of the parent container.
     *
     * @params { Bool } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clip(value: ?Bool): T {
        clipInner(value)
    }

    protected open func clipInner(isClip: ?Bool): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClip(isClip ?? false)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @params { BaseShape } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clipShape(value: ?BaseShape): T {
        clipShapeInner(value)
    }

    /**
     * Adds a mask of the specified shape to the component.
     *
     * @params { BaseShape } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maskShape(value: BaseShape): T {
        maskShapeInner(value)
    }

    protected open func clipShapeInner(value: ?BaseShape): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetClipByShape(tmpValue.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func maskShapeInner(value: BaseShape): T {
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSetMaskByShape(value.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Add mask text to the current component. The layout is the same as that of the current component.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func overlay(value!: ?String, align!: ?Alignment = Option.None,
        offset!: ?OverlayOffset = None): T {
        overlayInner(value, align, offset)
    }

    protected open func overlayInner(title: ?String, align: ?Alignment, offset: ?OverlayOffset): T {
        let tmpOffset = offset ?? OverlayOffset(x: 0.0, y: 0.0)
        unsafe {
            try (titleCString = LibC.mallocCString(title  ?? "").asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetOverlay(titleCString.value, (align ?? Alignment.Center).getValue(), tmpOffset.x ?? 0.0,
                    tmpOffset.y ?? 0.0)
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
            let message = LibC.mallocCString(popup.message ?? "")
            let primaryValue = LibC.mallocCString((popup.primaryButton ?? PopupButton(value: "", action: {=>})).value)
            let secondaryValue = LibC.mallocCString((popup.secondaryButton ?? PopupButton(value: "", action: {=>})).value)
            let messageOptions = popup.messageOptions ?? PopupMessageOptions()
            let placementOnTop = (popup.placement ?? Placement.BottomLeft).getValue() == 2
            let fontWeight = LibC.mallocCString(((messageOptions.font ?? Font()).weight ?? FontWeight.Normal).getValue())
            let fontSize = (messageOptions.font ?? Font()).size ?? 16.fp
            let fontStyle = (messageOptions.font ?? Font()).style ?? FontStyle.Normal
            FfiOHOSAceFrameworkViewAbstractBindPopupV2(
                show,
                CJBindPopupParamsV2(message, placementOnTop, primaryValue, primaryActionId, secondaryValue,
                    secondaryActionId, onStateChangeId, (messageOptions.textColor ?? Color(0x000000)).toUInt32(), fontWeight,
                    fontSize.value, fontSize.unitType.getValue(),
                    fontStyle.getValue(), (popup.arrowOffset ?? 0.vp).value, (popup.arrowOffset ?? 0.vp)
                        .unitType
                        .getValue(), popup.showInSubWindow ?? false, (popup.mask ?? Color(0x1000000)).toUInt32(), (popup.targetSpace ?? 0.vp).value,
                    (popup.targetSpace ?? 0.vp).unitType.getValue(), nativePlacement, ((popup.offset ?? Position(x:0.0, y: 0.0)).y ?? 0.0).value, ((popup.offset ?? Position(x:0.0, y: 0.0)).x ?? 0.0).value,
                    (popup.enableArrow ?? true), (popup.popupColor ?? Color(0x1000000)).toUInt32(), popup.autoCancel ?? true, (popup.width ?? 0.vp).value,
                    (popup.width ?? 0.vp).unitType.getValue(), nativeArrowPointPosition, (popup.arrowWidth ?? 16.vp).value,
                    (popup.arrowWidth ?? 16.vp).unitType.getValue(), (popup.arrowHeight ?? 8.vp).value, (popup.arrowHeight ?? 8.vp)
                        .unitType
                        .getValue(), (popup.radius ?? 20.vp).value, (popup.radius ?? 20.vp).unitType.getValue(), (popup.shadow ?? ShadowStyle.OuterDefaultMD).getValue(),
                    (popup.backgroundBlurStyle ?? BlurStyle.ComponentUltraThick).getValue(), nativeTransition, nativeOnWillDismiss,
                    popup.followTransformOfTarget ?? false)
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
                CJBindCustomPopupV2(show, Callback0Param<Unit>(popup.builder).getID(), (popup.placement ?? Placement.Bottom).getValue(),
                    (popup.maskColor ?? Color(0x1000000)).toUInt32(), (popup.backgroundColor ?? Color(0x1000000)).toUInt32(), popup.enableArrow ?? true, popup.autoCancel ?? true,
                    onStateChangeId, nativePopupColor, (popup.arrowOffset ?? 0.vp).value, (popup.arrowOffset ?? 0.vp).unitType.getValue(),
                    popup.showInSubWindow ?? false, nativeMask, (popup.targetSpace ?? 0.vp).value, (popup.targetSpace ?? 0.vp).unitType.getValue(),
                    ((popup.offset ?? Position(x: 0.0, y: 0.0)).x ?? 0.0).value, ((popup.offset ?? Position(x: 0.0, y: 0.0)).y ?? 0.0).value, (popup.width ?? 0.vp).value, (popup.width ?? 0.vp).unitType.getValue(),
                    nativeArrowPointPosition, (popup.arrowWidth ?? 16.vp).value, (popup.arrowWidth ?? 16.vp).unitType.getValue(),
                    (popup.arrowHeight ?? 16.vp).value, (popup.arrowHeight ?? 16.vp).unitType.getValue(), (popup.radius ?? 20.vp).value,
                    (popup.radius ?? 20.vp).unitType.getValue(), (popup.shadow ?? ShadowStyle.OuterDefaultMD).getValue(), (popup.backgroundBlurStyle ?? BlurStyle.ComponentUltraThick).getValue(),
                    popup.focusable ?? false, nativeTransition, nativeOnWillDismiss, popup.followTransformOfTarget ?? false))
            LibC.free(nativeArrowPointPosition)
        }
    }

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindPopup(show: ?Bool, popup: ?PopupOptions): T {
        bindPopupInner(show, popup)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func bindPopupInner(show: ?Bool, popup: ?PopupOptions): T {
        let tmpShow = show ?? false
        let tmpPopup = popup ?? PopupOptions(message: "")
        var primaryActionId: Int64 = if (!(tmpPopup.primaryButton ?? PopupButton(value: "", action: {=>})).value.isEmpty()) {
            Callback0Param<Unit>((tmpPopup.primaryButton ?? PopupButton(value: "", action: {=>})).action).getID()
        } else {
            INVALID_CALLBACK_ID
        }
        var secondaryActionId: Int64 = if (!(tmpPopup.secondaryButton ?? PopupButton(value: "", action: {=>})).value.isEmpty()) {
            Callback0Param<Unit>((tmpPopup.secondaryButton ?? PopupButton(value: "", action: {=>})).action).getID()
        } else {
            INVALID_CALLBACK_ID
        }
        var onStateChangeId: Int64 = if (let Some(v) <- tmpPopup.onStateChange) {
            let lambda = {isVisible: Bool => v(PopupStateChangeParam(isVisible))}
            Callback1Param<Bool, Unit>(lambda).getID()
        } else {
            INVALID_CALLBACK_ID
        }

        let nativeOnWillDismiss: NativeOptionCallBack = if (let Some(v) <- tmpPopup.onWillDismiss) {
            let wrapper = {action: Int32 => v(parseToDismissPopupAction(action))}
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            NativeOptionCallBack(true, lambdaData.getID())
        } else {
            NativeOptionCallBack(false, INVALID_CALLBACK_ID)
        }

        let nativeTransition: NativeOptionInt64 = if (let Some(v) <- tmpPopup.transition) {
            NativeOptionInt64(true, v.getID())
        } else {
            NativeOptionInt64(false, 0)
        }

        let nativePlacement: Int32 = (tmpPopup.placement ?? Placement.BottomLeft).getValue()
        callFFIBindPopup(tmpPopup, primaryActionId, secondaryActionId, onStateChangeId, nativeOnWillDismiss,
            nativeTransition, nativePlacement, tmpShow)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Popup control
     * NOTE:
     * The popup can be displayed only after the entire page is fully constructed. Therefore, to avoid incorrect
     * display positions and shapes, do not set this parameter to true while the page is still being constructed.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindPopup(show: ?Bool, popup: ?CustomPopupOptions): T {
        bindPopupInner(show, popup)
    }

    protected open func bindPopupInner(show: ?Bool, popup: ?CustomPopupOptions): T {
        let tmpShow = show ?? false
        if (let Some(tmpPopup)<- popup){
            var onStateChangeId = match (tmpPopup.onStateChange) {
                case Some(v) =>
                    let lambda = {
                        isVisible: Bool => v(PopupStateChangeParam(isVisible))
                    }
                    Callback1Param<Bool, Unit>(lambda).getID()
                case None => INVALID_CALLBACK_ID
            }

            let nativeOnWillDismiss = match (tmpPopup.onWillDismiss) {
                case Some(value) =>
                    let wrapper = {
                        action: Int32 => value(parseToDismissPopupAction(action))
                    }
                    let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                    NativeOptionCallBack(true, lambdaData.getID())
                case None => NativeOptionCallBack(false, INVALID_CALLBACK_ID)
            }

            let nativeTransition = match (tmpPopup.transition) {
                case Some(value) => NativeOptionInt64(true, value.getID())
                case None => NativeOptionInt64(false, 0)
            }

            let nativePopupColor = match (tmpPopup.popupColor) {
                case Some(value) => value.toUInt32()
                case None => (tmpPopup.backgroundColor ?? Color(0x1000000)).toUInt32()
            }

            let nativeMask = match (tmpPopup.mask) {
                case Some(value) => value.toUInt32()
                case None => (tmpPopup.maskColor ?? Color(0x1000000)).toUInt32()
            }
            callFFIBindCustomPopup(tmpPopup, onStateChangeId, nativeOnWillDismiss, nativeTransition, nativePopupColor,
                nativeMask, tmpShow)
        } else {
            bindPopupInner(show, PopupOptions(message: ""))
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Menu control
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindMenu(content: ?Array<MenuElement>): T {
        bindMenuInner(content)
    }

    protected open func bindMenuInner(content: ?Array<MenuElement>): T {
        let tmpContent = content ?? []
        let valueVecFFi = FFIVectorString(tmpContent.size)
        var index = 0
        for (menuElement in tmpContent) {
            valueVecFFi.setElement(index, menuElement.value)
            index++
        }
        let data = MenuActionData(tmpContent)
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Menu control
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindMenu(builder!: ?CustomBuilder): T {
        bindMenuInner(builder)
    }

    protected open func bindMenuInner(builder: ?CustomBuilder): T {
        let tmpBuilder = builder ?? { => }
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindCustomMenu(Callback0Param<Unit>(tmpBuilder).getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Binds a context menu to the component, whose visibility is subject to the isShown settings.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindContextMenu(builder!: ?CustomBuilder, responseType!: ?ResponseType,
        options!: ?ContextMenuOptions = None): T {
        bindContextMenuInner(builder, responseType, options)
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func bindContextMenuInner(builder: ?CustomBuilder, responseType: ?ResponseType,
        options: ?ContextMenuOptions): T {
        let tmpResponseType = responseType ?? ResponseType.LongPress
        var optionElement: CJContextMenuOptions = (options ?? ContextMenuOptions()).parseContextMenuOptions()
        unsafe {
            FfiOHOSAceFrameworkViewAbstractBindContextMenuOption(
                Callback0Param<Unit>(builder ?? { => }).getID(),
                tmpResponseType.getValue(),
                optionElement
            )
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Linear Gradient
     * angle: Angle of Linear Gradient. The default value is 180;
     * direction: Direction of Linear Gradient. The default value is GradientDirection.Bottom;
     * colors: Color description for gradients.
     * repeating: repeating. The default value is false
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func linearGradient(angle!: ?Float64 = None, direction!: ?GradientDirection = Option.None,
        colors!: ?Array<(ResourceColor, Float64)> = None, repeating!: ?Bool = None): T {
        linearGradientInner(angle, direction ?? GradientDirection.Bottom, colors ?? [(Color.Transparent, 0.0)], repeating ?? false)
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Creates a sweep gradient.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sweepGradient(center: ?(Length, Length), start!: ?Float64 = None, end!: ?Float64 = None,
        rotation!: ?Float64 = None, colors!: ?Array<(ResourceColor, Float64)> = None,
        repeating!: ?Bool = None): T {
        sweepGradientInner(center, start, end, rotation , colors, repeating)
    }

    protected open func sweepGradientInner(center: ?(Length, Length), start: ?Float64, end: ?Float64, rotation: ?Float64,
        colors: ?Array<(ResourceColor, Float64)>, repeating: ?Bool): T {
        let tmpCenter = center ?? (0.0.vp, 0.0.vp)
        let cCenter = CTupleLength(tmpCenter[0].value, tmpCenter[0].unitType.getValue(), tmpCenter[1].value,
            tmpCenter[1].unitType.getValue())
        let cColorsArr = toCArrCColors(colors ?? [(Color.Transparent, 0.0)])
        let sweepGradientParam = SweepGradientParam(cCenter, start ?? 0.0, end ?? 0.0, rotation ?? 0.0, cColorsArr, repeating ?? false)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractSweepGradient(sweepGradientParam)
            LibC.free(cColorsArr.head)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Creates a radial gradient.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func radialGradient(center: ?(Length, Length), radius: ?Length, colors: ?Array<(ResourceColor, Float64)>,
        repeating!: ?Bool = None): T {
        radialGradientInner(center, radius, colors, repeating)
    }

    protected open func radialGradientInner(center: ?(Length, Length), radius: ?Length,
        colors: ?Array<(ResourceColor, Float64)>, repeating: ?Bool): T {
        let tmpCenter = center ?? (0.0.px, 0.0.px)
        let tmpRadius = radius ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpColors = colors ?? []
        var radius_ = transAppResourceToLength(tmpRadius)
        let cCenter = CTupleLength(tmpCenter[0].value, tmpCenter[0].unitType.getValue(), tmpCenter[1].value,
            tmpCenter[1].unitType.getValue())
        let cColorsArr = toCArrCColors(tmpColors)
        let radialGradientParam = RadialGradientParam(cCenter, radius_.value, radius_.unitType.getValue(), cColorsArr,
            repeating ?? false)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRadialGradient(radialGradientParam)
            LibC.free(cColorsArr.head)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
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
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>): T {
        match (value) {
            case Some(v) => 
                keyboardShortcutInner(v, keys, action: Option.None)
            case None => keyboardShortcutInner("", keys, action: Option.None)
        }
        
    }

    /**
     * Sets hot keys
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>): T {
        keyboardShortcutInner(value ?? "", keys, action: Option.None)
    }

    /**
     * Sets hot keys
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: ?FunctionKey, keys: ?Array<ModifierKey>, action: ?() -> Unit): T {
        match (value) {
            case Some(v) => 
                keyboardShortcutInner(v, keys, action: action)
            case None => keyboardShortcutInner("", keys, action: action)
        }
        
    }

    /**
     * Sets hot keys
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keyboardShortcut(value: ?String, keys: ?Array<ModifierKey>, action: ?() -> Unit): T {
        keyboardShortcutInner(value ?? "", keys, action: action)
    }

    protected open func keyboardShortcutInner(value: CombinationKeyType, keys: ?Array<ModifierKey>, action!: ?() -> Unit): T {
        let tmpKeys = keys ?? []
        unsafe {
            let modifierKeys = LibC.malloc<Int32>(count: tmpKeys.size)
            for (i in 0..tmpKeys.size) {
                modifierKeys.write(i, tmpKeys[i].getValue())
            }
            if (let Some(v) <- (value as String)) {
                try (cValue = LibC.mallocCString(v).asResource()) {
                    if (let Some(actionFunc) <- action) {
                        FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue.value, modifierKeys, tmpKeys.size,
                            Callback0Param<Unit>(actionFunc).getID())
                    } else {
                        FfiOHOSAceFrameworkViewAbstractKeyShortcutByChar(cValue.value, modifierKeys, tmpKeys.size, 0)
                    }
                } finally {
                    LibC.free<Int32>(modifierKeys)
                }
                return (this as T) ?? throw BusinessException(100001, "Internal error.")
            }
            if (let Some(v) <- (value as FunctionKey)) {
                if (let Some(actionFunc) <- action) {
                    FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(v.getValue(), modifierKeys, tmpKeys.size,
                        Callback0Param<Unit>(actionFunc).getID())
                } else {
                    FfiOHOSAceFrameworkViewAbstractKeyShortcutByFuncKey(v.getValue(), modifierKeys, tmpKeys.size, 0)
                }
                LibC.free<Int32>(modifierKeys)
            }
        }
        return (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Key. User can set an key to the component to identify it.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func key(value: ?String): T {
        keyInner(value)
    }

    protected open func keyInner(value: ?String): T {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value ?? "").asResource()) {
                FfiOHOSAceFrameworkViewAbstractSetInspectorKey(unsafeValue.value)
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * How the final state of the component's content is rendered during its width and height animation process.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func renderFit(fitMode: ?RenderFit): T {
        renderFitInner(fitMode)
    }

    protected func renderFitInner(fitMode: ?RenderFit): T {
        let tmpFitMode = fitMode ?? RenderFit.TopLeft
        unsafe {
            FfiOHOSAceFrameworkViewAbstractRenderFit(tmpFitMode.getValue())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Id. User can set an id to the component to identify it.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(value: ?String): T {
        idInner(value)
    }

    protected open func idInner(value: ?String): T {
        unsafe {
            let unsafeValue = LibC.mallocCString(value ?? "")
            FfiOHOSAceFrameworkViewAbstractSetId(unsafeValue)
            LibC.free(unsafeValue)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Sets the safe area to be expanded to.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Binds a modal page to the component, whose visibility is subject to the isShow settings.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindContentCover(isShow: ?Bool, builder: ?CustomBuilder,
        options!: ?ContentCoverOptions = None): T {
        bindContentCoverInner(isShow, builder, options)
    }

    protected open func bindContentCoverInner(isShow: ?Bool, builder: ?CustomBuilder, options: ?ContentCoverOptions): T {
        let tmpIsShow = isShow ?? false
        let tmpOptions = options ?? ContentCoverOptions()
        let cjBindCustomPopup = tmpOptions.parseCJContentCoverOptions(tmpOptions)
        unsafe {
            FFIOHOSAceFrameworkBindContentCoverV2(tmpIsShow, Callback0Param<Unit>(builder ?? { => }).getID(), cjBindCustomPopup)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * animation
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animationStart(value: ?AnimateParam): T {
        animationStartInner(value)
    }

    protected open func animationStartInner(value: ?AnimateParam): T {
        let tmpValue = value ?? AnimateParam()
        unsafe {
            let param = NativeOptionAnimateParam(true, parseAnimateParam(tmpValue))
            FfiOHOSAceFrameworkViewContextAnimation(param)
            param.free()
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * animation
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transition(value: ?TransitionEffect): T {
        transitionInner(value)
    }

    /**
     * Set the transition effect of component when it appears and disappears.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transition(value: ?TransitionEffect, onFinish: ?TransitionFinishCallback): T {
        return if (let Some(v) <- onFinish) {
            transitionInner(value, v)
        } else {
            transitionInner(value)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func transitionInner(value: ?TransitionEffect, onFinish: TransitionFinishCallback): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let lambdaData = Callback1Param<Bool, Unit>(onFinish)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransitionWithBack(tmpValue.getID(), lambdaData.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    protected open func transitionInner(value: ?TransitionEffect): T {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkViewAbstractTransition(tmpValue.getID())
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set focusable.
     * Components that have default interaction logic, such as Button and TextInput, are focusable by default. Other
     * components, such as Text and Image, are not focusable by default. Only focusable components can trigger a focus event.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusable(value: ?Bool): T {
        focusableInner(value)
    }

    protected open func focusableInner(value: ?Bool): T {
        unsafe {
            FFIOHOSAceFrameworkFocusable(value ?? true)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set focus index by key tab.
     * The tabIndex and focusScopeId cannot be used together.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func tabIndex(index: ?Int32): T {
        tabIndexInner(index)
    }

    protected open func tabIndexInner(index: ?Int32): T {
        unsafe {
            FFIOHOSAceFrameworkTabIndex(index ?? 0)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set default focused component when a page create.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func defaultFocus(value: ?Bool): T {
        defaultFocusInner(value)
    }

    protected open func defaultFocusInner(value: ?Bool): T {
        unsafe {
            FFIOHOSAceFrameworkDefaultFocus(value ?? false)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set default focused component when focus on a focus group.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func groupDefaultFocus(value: ?Bool): T {
        groupDefaultFocusInner(value)
    }

    protected open func groupDefaultFocusInner(value: ?Bool): T {
        unsafe {
            FFIOHOSAceFrameworkGroupDefaultFocus(value ?? false)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set a component focused when the component be touched.
     *
     * @params { Bool } value
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func focusOnTouch(value: ?Bool): T {
        focusOnTouchInner(value)
    }

    protected open func focusOnTouchInner(value: ?Bool): T {
        unsafe {
            FFIOHOSAceFrameworkFocusOnTouch(value ?? false)
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Binds a sheet page to the component, whose visibility is subject to the isShow settings.
     *
     * @params { Bool } isShow - true means display sheet, false means hide sheet.
     * @params { CustomBuilder } builder - the sheet to be displayed.
     * @params { SheetOptions } options - options of sheet.
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSheet(isShow: ?Bool, builder: CustomBuilder, options!: ?SheetOptions = None): T {
        bindSheetInner(isShow, builder, options)
    }

    protected open func bindSheetInner(isShow: ?Bool, builder: CustomBuilder, options: ?SheetOptions): T {
        let tmpOptions = options ?? SheetOptions()
        let cBuilder = Callback0Param<Unit>(builder).getID()
        let cSheetOption = SheetOptions.parse(tmpOptions)
        unsafe {
            FfiOHOSAceFrameworkViewAbstractbindSheetParamV2(isShow ?? false, cBuilder, cSheetOption)
            if (cSheetOption.detents.hasValue) {
                LibC.free<Int32>(cSheetOption.detents.value.head)
            }
        }
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }

    /**
     * Set preview of the component for dragging process
     *
     * @params { String } value - preview of the component for dragging process
     * @returns { This }
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
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
        (this as T) ?? throw BusinessException(100001, "Internal error.")
    }
}
