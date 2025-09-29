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

package ohos.arkui.component.grid

import ohos.arkui.component.common.*
import ohos.arkui.component.scroll.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.resource.*
import ohos.business_exception.BusinessException

import std.convert.*

foreign {
    func FfiOHOSAceFrameworkGridCreate(): Unit

    func FfiOHOSAceFrameworkGridCreateScroller(scroller: Int64): Unit

    func FfiOHOSAceFrameworkGridColumnsTemplate(value: CString): Unit

    func FfiOHOSAceFrameworkGridRowsTemplate(value: CString): Unit

    func FfiOHOSAceFrameworkGridColumnsGapWithString(value: CString): Unit

    func FfiOHOSAceFrameworkGridColumnsGapWithNum(value: Int32): Unit

    func FfiOHOSAceFrameworkGridRowsGapWithString(value: CString): Unit

    func FfiOHOSAceFrameworkGridRowsGapWithNum(value: Int32): Unit

    func FfiOHOSAceFrameworkGridScrollBar(value: Int32): Unit

    func FfiOHOSAceFrameworkGridScrollBarColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkGridScrollBarWidth(value: Float64, valueUnit: Int32): Unit

    func FfiOHOSAceFrameworkGridCachedCount(cacheCount: Int32, show: Bool): Unit

    func FfiOHOSAceFrameworkGridEditMode(isEditMode: Bool): Unit

    func FfiOHOSAceFrameworkGridLayoutDirection(value: Int32): Unit

    func FfiOHOSAceFrameworkGridMaxCount(value: Int32): Unit

    func FfiOHOSAceFrameworkGridMinCount(value: Int32): Unit

    func FfiOHOSAceFrameworkGridCellLength(value: Int32): Unit

    func FfiOHOSAceFrameworkGridMultiSelectable(isSelectable: Bool): Unit

    func FfiOHOSAceFrameworkGridSupportAnimation(isSupportAnimation: Bool): Unit

    func FfiOHOSAceFrameworkGridEdgeEffect(value: Int32, isEnabled: Bool): Unit

    func FfiOHOSAceFrameworkGridEnableScrollInteraction(isEnable: Bool): Unit

    func FfiOHOSAceFrameworkGridNestedScroll(forward: Int32, backward: Int32): Unit

    func FfiOHOSAceFrameworkGridFriction(value: Float64): Unit

    func FfiOHOSAceFrameworkGridAlignItems(value: Int32): Unit

    func FfiOHOSAceFrameworkGridOnScrollIndex(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollIndex2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragStartWithBack(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragEnter(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragMove(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDragLeave(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnItemDrop(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollBarUpdate(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnReachStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnReachEnd(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollFrameBegin(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkGridOnScrollStop(callback: Int64): Unit
}

/**
 * Defines Grid Component.
 * It is recommended to use LazyForEach or Repeat to generate child components.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Grid <: ScrollableCommonMethodComponent<Grid> & GridAttribute {

    /**
     * Grid is returned when the parameter is transferred.
     *
     * @params { Option<Scroller> } scroller
     * @params { Option<() -> Unit> } child
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller!: Option<Scroller> = Option.None, child!: () -> Unit = {=>}) {
        match(scroller) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkGridCreateScroller(v.getID())
                }
            case None =>
                unsafe {
                    FfiOHOSAceFrameworkGridCreate()
                }
        }
        this.child = child
    }

    /**
     * This parameter specifies the number of columns in the current grid layout.
     *
     * @params { String } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsTemplate(value: ?String): This {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value ?? "1fr").asResource()) {
                FfiOHOSAceFrameworkGridColumnsTemplate(unsafeValue.value)
            }
        }
        this
    }

    /**
     * Lets you set the number of rows in the current grid layout.
     *
     * @params { String } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowsTemplate(value: ?String): This {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value ?? "1fr").asResource()) {
                FfiOHOSAceFrameworkGridRowsTemplate(unsafeValue.value)
            }
        }
        this
    }

    /**
     * Allows you to set the spacing between columns.
     *
     * @params { Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsGap(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        var valueString: String = match (value_.unitType.getValue()) {
            case 0 => "${value_.value}px"
            case 1 => "${value_.value}vp"
            case 2 => "${value_.value}fp"
            case 3 => "${value_.value * 100.0}%"
            case 4 => "${value_.value}lpx"
            case _ => throw BusinessException(100001, "Internal error.")
        }

        unsafe {
            try (unsafeValue = LibC.mallocCString(valueString).asResource()) {
                FfiOHOSAceFrameworkGridColumnsGapWithString(unsafeValue.value)
            }
        }
        this
    }

    /**
     * Lets you set the spacing between rows.
     *
     * @params { Length } value
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowsGap(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 0.vp)
        var valueString: String = match (value_.unitType.getValue()) {
            case 0 => "${value_.value}px"
            case 1 => "${value_.value}vp"
            case 2 => "${value_.value}fp"
            case 3 => "${value_.value * 100.0}%"
            case 4 => "${value_.value}lpx"
            case _ => throw BusinessException(100001, "Internal error.")
        }

        unsafe {
            try (unsafeValue = LibC.mallocCString(valueString).asResource()) {
                FfiOHOSAceFrameworkGridRowsGapWithString(unsafeValue.value)
            }
        }
        this
    }

    /**
     * cached Count.
     *
     * @params { Int32 } count
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(value: ?Int32): This {
        cachedCount(value ?? 1, false)
    }

    /**
     * Called to set number of GridItems to be preloaded (cached) in LazyForEach / Repeat.
     *
     * @params { Int32 } count
     * @params { Bool } show
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(count: ?Int32, show: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridCachedCount(count ?? 1, show ?? false)
        }
        this
    }

    protected func scrollBarInner(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBar(value.getValue())
        }
        this
    }

    protected func scrollBarColorInner(color: ?ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBarColor(transAppResourceToResourceColor(color ?? 0x66182431))
        }
        this
    }

    protected func scrollBarWidthInner(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 4.vp)
        unsafe {
            FfiOHOSAceFrameworkGridScrollBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected func enableScrollInteractionInner(isEnable: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridEnableScrollInteraction(isEnable ?? true)
        }
        this
    }

    protected func nestedScrollInner(value: ?NestedScrollOptions): This {
        let tmpValue = value ?? NestedScrollOptions(NestedScrollMode.SelfOnly, NestedScrollMode.SelfOnly)
        let localScrollForward = (tmpValue.scrollForward ?? NestedScrollMode.SelfOnly).getValue()
        let localScrollBackward = (tmpValue.scrollBackward ?? NestedScrollMode.SelfOnly).getValue()
        unsafe {
            FfiOHOSAceFrameworkGridNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    protected func frictionInner(value: ?Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGridFriction(value ?? -1.0)
        }
        this
    }

    protected func frictionInner(value: ?AppResource): This {
        var realValue: Float64 = 0.0
        match (value) {
            case Some(v) => 
                let t = Float64.tryParse(getResourceString(v))
                match (t) {
                    case Some(n) => realValue = n
                    case None => BaseLog.debug("AppResource type param of friction func convert to Float64 fail.");
                }
            case None => realValue = -1.0
        }
        frictionInner(realValue)
    }

    protected func onReachStartInner(event: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnReachStart(Callback0Param<Unit>(event).getID())
        }
        this
    }

    protected func onReachEndInner(event: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnReachEnd(Callback0Param<Unit>(event).getID())
        }
        this
    }

    protected func onScrollStartInner(event: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollStart(Callback0Param<Unit>(event).getID())
        }
        this
    }

    protected func onScrollStopInner(event: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollStop(Callback0Param<Unit>(event).getID())
        }
        this
    }
}
