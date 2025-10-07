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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.grid

import ohos.arkui.component.common.*
import ohos.arkui.component.scroll.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.resource.*
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
 * @relation declare const Grid: GridInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Grid <: ScrollableBase {

    /**
     * Grid is returned when the parameter is transferred.
     *
     * @param { Option<Scroller> } scroller
     * @param { Option<() -> Unit> } child
     * @returns { This }
     * @relation (scroller?: Scroller, layoutOptions?: GridLayoutOptions): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { String } value
     * @returns { This }
     * @relation columnsTemplate(value: string): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsTemplate(value: String): This {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkGridColumnsTemplate(unsafeValue.value)
            }
        }
        this
    }

    /**
     * Lets you set the number of rows in the current grid layout.
     *
     * @param { String } value
     * @returns { This }
     * @relation rowsTemplate(value: string): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowsTemplate(value: String): This {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkGridRowsTemplate(unsafeValue.value)
            }
        }
        this
    }

    /**
     * Allows you to set the spacing between columns.
     *
     * @param { Length } value
     * @returns { This }
     * @relation columnsGap(value: Length): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsGap(value: Length): This {
        var value_ = transAppResourceToLength(value)
        var valueString: String = match (value_.unitType.getValue()) {
            case 0 => "${value_.value}px"
            case 1 => "${value_.value}vp"
            case 2 => "${value_.value}fp"
            case 3 => "${value_.value * 100.0}%"
            case 4 => "${value_.value}lpx"
            case _ => throw IllegalArgumentException("Unreachable")
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
     * @param { Length } value
     * @returns { This }
     * @relation rowsGap(value: Length): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowsGap(value: Length): This {
        var value_ = transAppResourceToLength(value)
        var valueString: String = match (value_.unitType.getValue()) {
            case 0 => "${value_.value}px"
            case 1 => "${value_.value}vp"
            case 2 => "${value_.value}fp"
            case 3 => "${value_.value * 100.0}%"
            case 4 => "${value_.value}lpx"
            case _ => throw IllegalArgumentException("Unreachable")
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
     * @param { Int32 } count
     * @returns { This }
     * @relation cachedCount(value: number): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(count: Int32): This {
        cachedCount(count, false)
    }

    /**
     * Called to set number of GridItems to be preloaded (cached) in LazyForEach / Repeat.
     *
     * @param { Int32 } count
     * @param { Bool } show
     * @returns { This }
     * @relation cachedCount(count: number, show: boolean): GridAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(count: Int32, show: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridCachedCount(count, show)
        }
        this
    }

    protected func scrollBarInner(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBar(value.getValue())
        }
        this
    }

    protected func scrollBarColorInner(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBarColor(transAppResourceToResourceColor(color))
        }
        this
    }

    protected func scrollBarWidthInner(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkGridScrollBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    protected func enableScrollInteractionInner(isEnable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridEnableScrollInteraction(isEnable)
        }
        this
    }

    protected func nestedScrollInner(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkGridNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    protected func frictionInner(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGridFriction(value)
        }
        this
    }

    protected func frictionInner(value: AppResource): This {
        var realValue: Float64 = 0.0
        let t = Float64.tryParse(getResourceString(value))
        match (t) {
            case Some(n) => realValue = n
            case None => BaseLog.debug("AppResource type param of friction func convert to Float64 fail.");
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
