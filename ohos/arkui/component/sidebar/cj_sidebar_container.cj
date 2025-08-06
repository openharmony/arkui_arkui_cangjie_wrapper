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

package ohos.arkui.component.sidebar

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

@C
struct CJSideBarIconStyle {
    CJSideBarIconStyle(
        let shown: CString,
        let hidden: CString,
        let switching: CString
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkStackSetWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkStackSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkStackSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonIconOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shown: ResourceStr
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hidden: ResourceStr
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var switching: ResourceStr
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: ResourceStr, hidden!: ResourceStr, switching!: ResourceStr = "") {
        this.shown = shown
        this.hidden = hidden
        this.switching = switching
    }
}

@C
struct CJSideBarButtonStyle {
    CJSideBarButtonStyle(
        let left: Float64,
        let top: Float64,
        let width: Float64,
        let height: Float64,
        let icons: CJSideBarIconStyle
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonStyle {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icons: ButtonIconOptions
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        left!: Float64 = 16.0,
        top!: Float64 = 48.0,
        width!: Float64 = 24.0,
        height!: Float64 = 24.0,
        icons!: ButtonIconOptions = ButtonIconOptions(shown: "", hidden: "")
    ) {
        this.left = left
        this.top = top
        this.width = width
        this.height = height
        this.icons = icons
    }
}

@C
struct CJDividerStyle {
    CJDividerStyle(
        let strokeWidth: Float64,
        let strokeWidthUnit: Int32,
        let hasColor: Bool,
        let color: UInt32,
        let startMargin: Float64,
        let startMarginUnit: Int32,
        let endMargin: Float64,
        let endMarginUnit: Int32
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DividerStyle {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var startMargin: Length
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var endMargin: Length

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length, color!: ?ResourceColor = 0x08000000, startMargin!: Length = 0.vp,
        endMargin!: Length = 0.vp) {
        this.strokeWidth = transAppResourceToLength(strokeWidth)
        if (let Some(v) <- color) {
            this.color = v
        } else {
            this.color = color
        }
        this.startMargin = transAppResourceToLength(startMargin)
        this.endMargin = transAppResourceToLength(endMargin)
    }

    func getNative(): CJDividerStyle {
        if (let Some(v) <- color) {
            return CJDividerStyle(strokeWidth.value, strokeWidth.unitType.getValue(), true,
                transAppResourceToResourceColor(v), startMargin.value, startMargin.unitType.getValue(), endMargin.value,
                endMargin.unitType.getValue())
        }
        return CJDividerStyle(strokeWidth.value, strokeWidth.unitType.getValue(), false, 0, startMargin.value,
            startMargin.unitType.getValue(), endMargin.value, endMargin.unitType.getValue())
    }
}

foreign {
    func FfiOHOSAceFrameworkSideBarCreate(ty: Int32): Unit

    func FfiOHOSAceFrameworkSideBarShowSideBar(isShow: Bool): Unit

    func FfiOHOSAceFrameworkSideBarControlButton(style: CJSideBarButtonStyle): Unit

    func FfiOHOSAceFrameworkSideBarShowControlButton(isShow: Bool): Unit

    func FfiOHOSAceFrameworkSideBarOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkSideBarSideBarWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSideBarMinSideBarWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSideBarMaxSideBarWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSideBarAutoHide(autoHide: Bool): Unit

    func FfiOHOSAceFrameworkSideBarSideBarPosition(position: Int32): Unit

    func FfiOHOSAceFrameworkSideBarPop(): Unit

    func FfiOHOSAceFrameworkSideBarDividerNull(): Unit

    func FfiOHOSAceFrameworkSideBarDivider(info: CJDividerStyle): Unit

    func FfiOHOSAceFrameworkSideBarMinContentWidth(width: Float64, unit: Int32): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SideBarContainer <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(sideBarType: SideBarContainerType, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkSideBarCreate(sideBarType.getValue())
        }
        this.child = child
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showSideBar(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarShowSideBar(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controlButton(value: ButtonStyle): This {
        unsafe {
            try (shownStr = LibC.mallocCString(transResourceMediaToString(value.icons.shown)).asResource(),
                hiddenStr = LibC.mallocCString(transResourceMediaToString(value.icons.hidden)).asResource(),
                switchingStr = LibC.mallocCString(transResourceMediaToString(value.icons.switching)).asResource()) {
                FfiOHOSAceFrameworkSideBarControlButton(
                    CJSideBarButtonStyle(
                        value.left,
                        value.top,
                        value.width,
                        value.height,
                        CJSideBarIconStyle(
                            shownStr.value,
                            hiddenStr.value,
                            switchingStr.value
                        )
                    )
                )
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showControlButton(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarShowControlButton(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkSideBarOnChange(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideBarWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSideBarSideBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minSideBarWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSideBarMinSideBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxSideBarWidth(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSideBarMaxSideBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoHide(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarAutoHide(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideBarPosition(value: SideBarPosition): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarSideBarPosition(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(value: ?DividerStyle): This {
        unsafe {
            if (let Some(v) <- value) {
                FfiOHOSAceFrameworkSideBarDivider(v.getNative())
            } else {
                FfiOHOSAceFrameworkSideBarDividerNull()
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minContentWidth(value: Length): This {
        unsafe {
            let wid = transAppResourceToLength(value)
            FfiOHOSAceFrameworkSideBarMinContentWidth(wid.value, wid.unitType.getValue())
        }
        this
    }

    protected override func widthInner(value: Length): This {
        unsafe {
            let wid = transAppResourceToLength(value)
            FfiOHOSAceFrameworkStackSetWidth(wid.value, wid.unitType.getValue())
        }
        this
    }

    protected override func heightInner(value: Length): This {
        unsafe {
            let hei = transAppResourceToLength(value)
            FfiOHOSAceFrameworkStackSetHeight(hei.value, hei.unitType.getValue())
        }
        this
    }

    protected override func sizeInner(width: Length, height: Length): This {
        unsafe {
            let w = transAppResourceToLength(width)
            let h = transAppResourceToLength(height)
            FfiOHOSAceFrameworkStackSetSize(w.value, w.unitType.getValue(), h.value, h.unitType.getValue())
        }
        this
    }

    protected override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSideBarPop()
        }
    }
}
