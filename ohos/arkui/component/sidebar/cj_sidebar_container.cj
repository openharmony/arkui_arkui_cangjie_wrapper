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

/**
 * ButtonStyle icons.
 *
 * @relation interface ButtonIconOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonIconOptions {
    /**
     * Defines whether an icon is shown.
     * Anonymous Object Rectification.
     *
     * @type { ResourceStr }
     * @relation shown: string | PixelMap | Resource;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shown: ResourceStr

    /**
     * Defines whether an icon is hidden.
     * Anonymous Object Rectification.
     *
     * @type { ResourceStr }
     * @relation hidden: string | PixelMap | Resource;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var hidden: ResourceStr

    /**
     * Defines whether an icon is switching.
     * Anonymous Object Rectification.
     *
     * @type { ResourceStr }
     * @relation switching?: string | PixelMap | Resource;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var switching: ResourceStr

    /**
     * Constructs a button style icons.
     *
     * @param { ResourceStr } shown
     * @param { ResourceStr } hidden
     * @param { ResourceStr } switching
     * @returns { This }
     */ 
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

/**
 * Sets the control button style
 *
 * @relation interface ButtonStyle
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ButtonStyle {
    /**
     * Set the left of control button
     *
     * @type { Float64 }
     * @relation left?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Float64

    /**
     * Set the top of control button
     *
     * @type { Float64 }
     * @relation top?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Float64

    /**
     * Set the width of control button
     *
     * @type { Float64 }
     * @relation width?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64

    /**
     * Set the height of control button
     *
     * @type { Float64 }
     * @relation height?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64

    /**
     * Set the button icon when sidebar status has changed
     * Anonymous Object Rectification.
     *
     * @type { ButtonIconOptions }
     * @relation icons?: ButtonIconOptions;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icons: ButtonIconOptions

    /**
     * Constructs a button style.
     *
     * @param { Float64 } left
     * @param { Float64 } top
     * @param { Float64 } width
     * @param { Float64 } icons
     * @param { ButtonIconOptions } icons
     * @returns { This }
     */ 
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

/**
 * Provides an interface for the style of a divider including stroke width, color, start margin and end margin
 *
 * @relation interface DividerStyle
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DividerStyle {
    /**
     * Define the stroke width of the divider
     *
     * @type { Length }
     * @relation strokeWidth: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var strokeWidth: Length

    /**
     * Define the color width of the divider
     *
     * @type { ResourceColor }
     * @relation color?: ResourceColor;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: ?ResourceColor

    /**
     * Define the start margin of the divider
     *
     * @type { Length }
     * @relation startMargin?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var startMargin: Length

    /**
     * Define the end margin of the divider
     *
     * @type { Length }
     * @relation endMargin?: Length;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var endMargin: Length

    /**
     * Constructs a divider style.
     *
     * @param { Length } strokeWidth
     * @param { ResourceColor } color
     * @param { Length } startMargin
     * @param { Length } endMargin
     * @returns { This }
     */ 
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

/**
 * Defines SideBarContainer Component.
 *
 * @relation declare const SideBarContainer: SideBarContainerInterface;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SideBarContainer <: ContainerBase {
    /**
     * Constructs a sidebar container.
     *
     * @param { SideBarContainerType } sideBarType
     * @param { function } child
     * @returns { This }
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(sideBarType!: SideBarContainerType = SideBarContainerType.Embed, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkSideBarCreate(sideBarType.getValue())
        }
        this.child = child
    }

    /**
     * Callback showControlButton function when setting the status of sidebar
     *
     * @param { Bool } value
     * @returns { This }
     * @relation showSideBar(value: boolean): SideBarContainerAttribute;
     */
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

    /**
     * Callback controlButton function when setting the style of button
     *
     * @param { ButtonStyle } value
     * @returns { This }
     * @relation controlButton(value: ButtonStyle): SideBarContainerAttribute;
     */
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

    /**
     * Callback showControlButton function when setting the status of button
     *
     * @param { Bool } value
     * @returns { This }
     * @relation showControlButton(value: boolean): SideBarContainerAttribute;
     */
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

    /**
     * Trigger callback when sidebar style of showing change finished.
     *
     * @param { function } callback
     * @returns { This }
     * @relation onChange(callback: (value: boolean) => void): SideBarContainerAttribute;
     */
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

    /**
     * Sets the length of sidebar.
     *
     * @param { Length } value
     * @returns { This }
     * @relation sideBarWidth(value: Length): SideBarContainerAttribute;
     */
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

    /**
     * Sets the min length of sidebar.
     *
     * @param { Length } value
     * @returns { This }
     * @relation minSideBarWidth(value: Length): SideBarContainerAttribute;
     */
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

    /**
     * Sets the max length of sidebar.
     *
     * @param { Length } value
     * @returns { This }
     * @relation maxSideBarWidth(value: Length): SideBarContainerAttribute;
     */
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

    /**
     * Sets whether to automatically hide when drag sidebar width is less than the minimum width.
     *
     * @param { Bool } value
     * @returns { This }
     * @relation autoHide(value: boolean): SideBarContainerAttribute;
     */
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

    /**
     * Called when determining the location of the sidebar.
     *
     * @param { SideBarPosition } value
     * @returns { This }
     * @relation sideBarPosition(value: SideBarPosition): SideBarContainerAttribute;
     */
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

    /**
     * Set divider style for sideBarContainer
     *
     * @param { DividerStyle } value
     * @returns { This }
     * @relation divider(value: DividerStyle | null): SideBarContainerAttribute;
     */
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

    /**
     * Sets the min length of content.
     * 
     * @param { Length } value
     * @returns { This }
     * @relation minContentWidth(value: Dimension): SideBarContainerAttribute;
     */
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
