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

protected package ohos.arkui.component.grid

import ohos.arkui.component.common.*
import ohos.arkui.component.scroll.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class Grid <: ScrollableBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkGridCreate()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller) {
        unsafe {
            FfiOHOSAceFrameworkGridCreateScroller(scroller.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridCreate()
        }
        this.child = child
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scroller: Scroller, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkGridCreateScroller(scroller.getID())
        }
        this.child = child
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func columnsTemplate(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkGridColumnsTemplate(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rowsTemplate(value: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(value)
            FfiOHOSAceFrameworkGridRowsTemplate(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

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
            var unsafeValue = LibC.mallocCString(valueString)
            FfiOHOSAceFrameworkGridColumnsGapWithString(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

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
            var unsafeValue = LibC.mallocCString(valueString)
            FfiOHOSAceFrameworkGridRowsGapWithString(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBar(value: BarState): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBar(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkGridScrollBarColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scrollBarWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkGridScrollBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(cacheCount: Int32): This {
        cachedCount(cacheCount, false)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func cachedCount(cacheCount: Int32, show: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridCachedCount(cacheCount, show)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableScrollInteraction(isEnable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkGridEnableScrollInteraction(isEnable)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func nestedScroll(value: NestedScrollOptions): This {
        let localScrollForward = value.scrollForward.getValue()
        let localScrollBackward = value.scrollBackward.getValue()
        unsafe {
            FfiOHOSAceFrameworkGridNestedScroll(localScrollForward, localScrollBackward)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkGridFriction(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func friction(value: Int32): This {
        friction(Float64(value))
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollIndex(callback: (UInt32) -> Unit): This {
        let lambdaData = Callback1Param<UInt32, Unit>(callback);
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollIndex(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnReachStart(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReachEnd(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnReachEnd(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollStart(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onScrollStop(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkGridOnScrollStop(Callback0Param<Unit>(callback).getID())
        }
        this
    }
}
