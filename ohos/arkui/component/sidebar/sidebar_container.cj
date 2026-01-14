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

package ohos.arkui.component.sidebar

import ohos.arkui.component.common.{CommonMethodComponent, SideBarContainerType, SideBarPosition}
import ohos.arkui.component.util.{transResourceMediaToString, transAppResourceToLength, transAppResourceToResourceColor, lessNotEqual}
import ohos.base.{ResourceStr, Length, ResourceColor, LengthProp}
import ohos.ffi.{Callback1Param}
import ohos.labels.{APILevel}

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

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit

    func FfiOHOSAceFrameworkSideBarResetControlButton(): Unit

    func FfiOHOSAceFrameworkSideBarResetControlButtonIcons(): Unit
}

/**
 * Defines the icon resources for different states of the sidebar control button.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonIconOptions {
    /**
     * Defines whether an icon is shown.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shown: ?ResourceStr

    /**
     * Defines whether an icon is hidden.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hidden: ?ResourceStr

    /**
     * Defines whether an icon is switching.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var switching: ?ResourceStr

    /**
     * Constructs a button style icons.
     *
     * @param { ?ResourceStr } shown
     * @param { ?ResourceStr } hidden
     * @param { ?ResourceStr } switching
     */ 
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(shown!: ?ResourceStr, hidden!: ?ResourceStr, switching!: ?ResourceStr = None) {
        this.shown = shown
        this.hidden = hidden
        this.switching = switching ?? ""
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

/**
 * Defines the appearance and positioning of the sidebar control button.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonStyle {
    /**
     * Set the left of control button
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: ?Float64

    /**
     * Set the top of control button
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: ?Float64

    /**
     * Set the width of control button
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: ?Float64

    /**
     * Set the height of control button
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: ?Float64

    /**
     * Set the button icon when sidebar status has changed
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icons: ?ButtonIconOptions

    /**
     * Constructs a button style.
     *
     * @param { ?Float64 } left
     * @param { ?Float64 } top
     * @param { ?Float64 } width
     * @param { ?Float64 } icons
     * @param { ?ButtonIconOptions } icons
     */ 
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        left!: ?Float64 = None,
        top!: ?Float64 = None,
        width!: ?Float64 = None,
        height!: ?Float64 = None,
        icons!: ?ButtonIconOptions = None
    ) {
        this.left = left ?? 16.0
        this.top = top ?? 48.0
        this.width = width ?? 24.0
        this.height = height ?? 24.0
        this.icons = icons ?? ButtonIconOptions(shown: "", hidden: "")
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

/**
 * Provides a class for the style of a divider including stroke width, color, start margin and end margin.
 * Defines the appearance properties of the divider between the sidebar and main content.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DividerStyle {
    /**
     * Define the stroke width of the divider
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: ?Length

    /**
     * Define the color width of the divider
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor

    /**
     * Define the start margin of the divider
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var startMargin: ?Length

    /**
     * Define the end margin of the divider
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var endMargin: ?Length

    /**
     * Constructs a divider style.
     *
     * @param { ?Length } strokeWidth
     * @param { ?ResourceColor } color
     * @param { ?Length } startMargin
     * @param { ?Length } endMargin
     */ 
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(strokeWidth!: ?Length, color!: ?ResourceColor = None, startMargin!: ?Length = None,
        endMargin!: ?Length = None) {
        let tmpStrokeWidth = strokeWidth ?? 1.vp
        this.strokeWidth = transAppResourceToLength(tmpStrokeWidth)
        this.color = color ?? 0x08000000
        this.startMargin = transAppResourceToLength(startMargin ?? 0.vp)
        this.endMargin = transAppResourceToLength(endMargin ?? 0.vp)
    }

    func getNative(): CJDividerStyle {
        if (let Some(v) <- color) {
            return CJDividerStyle((strokeWidth ?? 1.vp).value,
                (strokeWidth ?? 1.vp).unitType.getValue(), true,
                transAppResourceToResourceColor(v), (startMargin ?? 0.vp).value, (startMargin ?? 0.vp).unitType.getValue(), (endMargin ?? 0.vp).value,
                (endMargin ?? 0.vp).unitType.getValue())
        }
        return CJDividerStyle((strokeWidth ?? 1.vp).value,
            (strokeWidth ?? 1.vp).unitType.getValue(), false, 0, (startMargin ?? 0.vp).value,
            (startMargin ?? 0.vp).unitType.getValue(), (endMargin ?? 0.vp).value, (endMargin ?? 0.vp).unitType.getValue())
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
 * A container component that provides a collapsible sidebar for navigation or additional content.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SideBarContainer <: CommonMethodComponent<SideBarContainer> & SideBarContainerAttribute {
    /**
     * Constructs a sidebar container.
     *
     * @param { ?SideBarContainerType } sideBarType
     * @param { () -> Unit } child
     */ 
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(sideBarType!: ?SideBarContainerType = None, child!: () -> Unit = {=>}) {
        let tmpSideBarType = sideBarType ?? SideBarContainerType.Embed

        unsafe {
            FfiOHOSAceFrameworkSideBarCreate(tmpSideBarType.getValue())
        }
        this.child = child
    }

    /**
     * Callback showControlButton function when setting the status of sidebar
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showSideBar(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarShowSideBar(value ?? true)
        }
        this
    }

    /**
     * Callback controlButton function when setting the style of button
     *
     * @param { ?ButtonStyle } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func controlButton(value: ?ButtonStyle): This {
        if (value.isNone()) {
            unsafe {
                FfiOHOSAceFrameworkSideBarResetControlButton()
            }
            return this
        }
        let v = value.getOrThrow()
        if (v.icons.isNone()) {
            unsafe {
                FfiOHOSAceFrameworkSideBarResetControlButtonIcons()
            }
        } else {
            unsafe {
                try (shownStr = LibC.mallocCString(transResourceMediaToString((v.icons ?? ButtonIconOptions(shown: "", hidden: "")).shown ?? "")).asResource(),
                    hiddenStr = LibC.mallocCString(transResourceMediaToString((v.icons ?? ButtonIconOptions(shown: "", hidden: "")).hidden ?? "")).asResource(),
                    switchingStr = LibC.mallocCString(transResourceMediaToString((v.icons ?? ButtonIconOptions(shown: "", hidden: "")).switching ?? "")).asResource()) {
                    FfiOHOSAceFrameworkSideBarControlButton(
                        CJSideBarButtonStyle(
                            v.left ?? 16.0,
                            v.top ?? 48.0,
                            v.width ?? 24.0,
                            v.height ?? 24.0,
                            CJSideBarIconStyle(
                                shownStr.value,
                                hiddenStr.value,
                                switchingStr.value
                            )
                        )
                    )
                }
            }
        }
        this
    }

    /**
     * Callback showControlButton function when setting the status of button
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showControlButton(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarShowControlButton(value ?? true)
        }
        this
    }

    /**
     * Trigger callback when sidebar style of showing change finished.
     *
     * @param { ?(Bool) -> Unit } callback
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        let lambdaData = Callback1Param<Bool, Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkSideBarOnChange(lambdaData.getID())
        }
        this
    }

    /**
     * Sets the length of sidebar.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideBarWidth(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 240.vp)
        unsafe {
            FfiOHOSAceFrameworkSideBarSideBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the min length of sidebar.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minSideBarWidth(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 240.vp)
        unsafe {
            FfiOHOSAceFrameworkSideBarMinSideBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets the max length of sidebar.
     *
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxSideBarWidth(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 280.vp)
        unsafe {
            FfiOHOSAceFrameworkSideBarMaxSideBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    /**
     * Sets whether to automatically hide when drag sidebar width is less than the minimum width.
     *
     * @param { ?Bool } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoHide(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarAutoHide(value ?? true)
        }
        this
    }

    /**
     * Called when determining the location of the sidebar.
     *
     * @param { ?SideBarPosition } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideBarPosition(value: ?SideBarPosition): This {
        unsafe {
            FfiOHOSAceFrameworkSideBarSideBarPosition((value ?? SideBarPosition.Start).getValue())
        }
        this
    }

    /**
     * Set divider style for sideBarContainer
     *
     * @param { ?DividerStyle } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
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

    /**
     * Sets the min length of content.
     * 
     * @param { ?Length } value
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minContentWidth(value: ?Length): This {
        unsafe {
            let wid = transAppResourceToLength(value ?? 360.vp)
            FfiOHOSAceFrameworkSideBarMinContentWidth(wid.value, wid.unitType.getValue())
        }
        this
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetWidthWithEmpty()
                    } else {
                        FfiOHOSAceFrameworkStackSetWidth(value_.value, value_.unitType.getValue())
                    }
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetHeightWithEmpty()
                    } else {
                        FfiOHOSAceFrameworkStackSetHeight(value_.value, value_.unitType.getValue())
                    }
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        let w = transAppResourceToLength(width ?? (-1.0).vp)
        let h = transAppResourceToLength(height ?? (-1.0).vp)
        if (lessNotEqual(h.value, 0.0) || lessNotEqual(w.value, 0.0)) {
            widthInner(width)
            heightInner(height)
            return this
        }
        unsafe {
            let w = transAppResourceToLength(width ?? 0.0.vp)
            let h = transAppResourceToLength(height ?? 0.0.vp)
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
