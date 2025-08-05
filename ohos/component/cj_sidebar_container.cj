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

package ohos.component

@C
struct CJSideBarIconStyle {
    CJSideBarIconStyle(
        let shown: CString,
        let hidden: CString,
        let switching: CString
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Icons {
    let shown: String
    let hidden: String
    let switching: String
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: String, hidden!: String, switching!: String = "") {
        this.shown = shown
        this.hidden = hidden
        this.switching = switching
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: String, hidden!: String, switching!: AppResource) {
        this.shown = shown
        this.hidden = hidden
        this.switching = getResourceMedia(switching)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: AppResource, hidden!: String, switching!: String = "") {
        this.shown = getResourceMedia(shown)
        this.hidden = hidden
        this.switching = switching
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: AppResource, hidden!: String, switching!: AppResource) {
        this.shown = getResourceMedia(shown)
        this.hidden = hidden
        this.switching = getResourceMedia(switching)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: String, hidden!: AppResource, switching!: String = "") {
        this.shown = shown
        this.hidden = getResourceMedia(hidden)
        this.switching = switching
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: String, hidden!: AppResource, switching!: AppResource) {
        this.shown = shown
        this.hidden = getResourceMedia(hidden)
        this.switching = getResourceMedia(switching)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: AppResource, hidden!: AppResource, switching!: String = "") {
        this.shown = getResourceMedia(shown)
        this.hidden = getResourceMedia(hidden)
        this.switching = switching
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: AppResource, hidden!: AppResource, switching!: AppResource) {
        this.shown = getResourceMedia(shown)
        this.hidden = getResourceMedia(hidden)
        this.switching = getResourceMedia(switching)
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonStyle {
    let left: Int64
    let top: Int64
    let width: Int64
    let height: Int64
    let icons: Icons
    public init(
        left!: Int64 = 16,
        top!: Int64 = 48,
        width!: Int64 = 32,
        height!: Int64 = 32,
        icons!: Icons = Icons(shown: "", hidden: "")
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SideBarDividerStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let strokeWidth: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let color: ?ResourceColor
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let startMargin: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let endMargin: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: Length, color!: ?ResourceColor = Option<ResourceColor>.None, startMargin!: Length = 0.vp,
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

/**
 * SideBarContainer Component.
 *
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SideBarContainer <: ContainerBase {
    public init(`type`: SideBarContainerType, content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkSideBarCreate(`type`.getValue())
        }
        this.child = content
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: () -> Unit) {
        this(SideBarContainerType.Embed, content)
    }

    /**
     * Callback showControlButton function when setting the status of sidebar
     *
     * @param isShow: Bool
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showSideBar(isShow: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarShowSideBar(isShow)
        }
        this
    }

    /**
     * Callback controlButton function when setting the style of button
     *
     * @param value: ButtonStyle
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controlButton(value: ButtonStyle): This {
        unsafe {
            try (shownStr = LibC.mallocCString(value.icons.shown).asResource(),
                hiddenStr = LibC.mallocCString(value.icons.hidden).asResource(),
                switchingStr = LibC.mallocCString(value.icons.switching).asResource()) {
                FfiOHOSAceFrameworkSideBarControlButton(
                    CJSideBarButtonStyle(
                        Float64(value.left),
                        Float64(value.top),
                        Float64(value.width),
                        Float64(value.height),
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

    /**
     * Callback showControlButton function when setting the status of button
     *
     * @param isShow: Bool
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showControlButton(isShow: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarShowControlButton(isShow)
        }
        this
    }

    /**
     * Trigger callback when sidebar style of showing change finished.
     *
     * @param callback: (Bool)->Unit
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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

    /**
     * Sets the length of sidebar.
     *
     * @param value: Length
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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

    /**
     * Sets the min length of sidebar.
     *
     * @param value: Length
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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

    /**
     * Sets the max length of sidebar.
     *
     * @param value: Length
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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

    /**
     * Sets whether to automatically hide when drag sidebar width is less than the minimum width.
     *
     * @param value: Bool
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoHide(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarAutoHide(value)
        }
        this
    }

    /**
     * Called when determining the location of the sidebar.
     *
     * @param value: SideBarPosition
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideBarPosition(value: SideBarPosition): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarSideBarPosition(value.getValue())
        }
        this
    }

    /**
     * Set divider style for sideBarContainer
     *
     * @param value: SideBarDividerStyle
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(value!: ?SideBarDividerStyle = None): This {
        unsafe {
            if (let Some(v) <- value) {
                FfiOHOSAceFrameworkSideBarDivider(v.getNative())
            } else {
                FfiOHOSAceFrameworkSideBarDividerNull()
            }
        }
        this
    }

    /**
     * Sets the min length of content.
     *
     * @param value: SideBarPosition
     * @return SideBarContainer component instance
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(value: Length): This {
        unsafe {
            let wid = transAppResourceToLength(value)
            FfiOHOSAceFrameworkStackSetWidth(wid.value, wid.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(value: Length): This {
        unsafe {
            let hei = transAppResourceToLength(value)
            FfiOHOSAceFrameworkStackSetHeight(hei.value, hei.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
        unsafe {
            let wid = transAppResourceToLength(width)
            let hei = transAppResourceToLength(height)
            FfiOHOSAceFrameworkStackSetSize(wid.value, wid.unitType.getValue(), hei.value, hei.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected override func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkSideBarPop()
        }
    }
}
