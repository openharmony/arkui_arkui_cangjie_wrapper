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

import ohos.image.PixelMap
import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkNavigationCreate(): Unit

    func FfiOHOSAceFrameworkNavigationCreateWithPathInfos(pathInfos: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetNavDestination(builder: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetTitle(title: CString): Unit

    func FfiOHOSAceFrameworkNavigationSetTitleWithBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetSubTitle(subTitle: CString): Unit

    func FfiOHOSAceFrameworkNavigationSetTitleWithOptions(title: CString, withOptions: Bool,
        options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavigationSetTitleWithBuilderWithOptions(builder: Int64, withOptions: Bool,
        options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavigationSetTitleWithCommon(mainTitle: CString, subTitle: CString, withOptions: Bool,
        options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavigationSetTitleWithCustom(builder: Int64, height: Float64, heightUnit: Int32,
        withOptions: Bool, options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavigationSetMenus(array: VectorNavigationItemHandle): Unit

    func FfiOHOSAceFrameworkNavigationSetMenusWithBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetTitleMode(titleMode: Int32): Unit

    func FfiOHOSAceFrameworkNavigationSetToolBar(array: VectorNavigationItemHandle): Unit

    func FfiOHOSAceFrameworkNavigationSetToolBarWithBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetToolBarWithOptions(array: VectorNavigationItemHandle, withOptions: Bool,
        options: CJNavigationToolbarOptions): Unit

    func FfiOHOSAceFrameworkNavigationSetToolBarWithBuilderWithOptions(builder: Int64, withOptions: Bool,
        options: CJNavigationToolbarOptions): Unit

    func FfiOHOSAceFrameworkNavigationSetHideToolBar(isHide: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetHideToolBarWithAnimated(isHide: Bool, animated: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetHideTitleBar(isHide: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetHideTitleBarWithAnimated(isHide: Bool, animated: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetHideBackButton(isHide: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetNavBarWidth(width: Float64, widthUnit: Int32): Unit

    func FfiOHOSAceFrameworkNavigationSetNavBarPosition(position: Int32): Unit

    func FfiOHOSAceFrameworkNavigationSetMode(mode: Int32): Unit

    func FfiOHOSAceFrameworkNavigationSetBackButtonIcon(icon: CString): Unit

    func FfiOHOSAceFrameworkNavigationSetBackButtonIconWithPixelMap(id: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetHideNavBar(isHide: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetNavBarWidthRange(min: Float64, minUnit: Int32, max: Float64, maxUnit: Int32): Unit

    func FfiOHOSAceFrameworkNavigationSetMinContentWidth(min: Float64, minUnit: Int32): Unit

    func FfiOHOSAceFrameworkNavigationSetSystemBarStyle(color: UInt32): Unit

    func FfiOHOSAceFrameworkNavigationSetOnTitleModeChanged(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetOnNavBarStateChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavigationSetOnNavigationModeChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavPathStackCreate(): Int64

    func FfiOHOSAceFrameworkNavPathStackPushPath(id: Int64, info: CJNavPathInfo, options: CJNavigationOptions): Unit

    func FfiOHOSAceFrameworkNavPathStackReplacePath(id: Int64, info: CJNavPathInfo, options: CJNavigationOptions): Unit

    func FfiOHOSAceFrameworkNavPathStackRemoveByIndexes(id: Int64, indexes: VectorInt32Handle): Int32

    func FfiOHOSAceFrameworkNavPathStackRemoveByName(id: Int64, name: CString): Int32

    func FfiOHOSAceFrameworkNavPathStackRemoveByNavDestinationId(id: Int64, name: CString): Bool

    func FfiOHOSAceFrameworkNavPathStackPopToName(id: Int64, name: CString, result: CString, animated: Bool): Int32

    func FfiOHOSAceFrameworkNavPathStackPopToIndex(id: Int64, index: Int32, result: CString, animated: Bool): Unit

    func FfiOHOSAceFrameworkNavPathStackMoveToTop(id: Int64, name: CString, animated: Bool): Int32

    func FfiOHOSAceFrameworkNavPathStackMoveIndexToTop(id: Int64, index: Int32, animated: Bool): Unit

    func FfiOHOSAceFrameworkNavPathStackClear(id: Int64, animated: Bool): Unit

    func FfiOHOSAceFrameworkNavPathStackGetAllPathName(id: Int64): VectorStringHandle

    func FfiOHOSAceFrameworkNavPathStackGetParamByIndex(id: Int64, index: Int32): CString

    func FfiOHOSAceFrameworkNavPathStackGetParamByName(id: Int64, name: CString): VectorStringHandle

    func FfiOHOSAceFrameworkNavPathStackGetIndexByName(id: Int64, name: CString): VectorInt32Handle

    func FfiOHOSAceFrameworkNavPathStackSize(id: Int64): Int32

    func FfiOHOSAceFrameworkNavPathStackDisableAnimation(id: Int64, animated: Bool): Unit

    func FfiOHOSAceFrameworkNavPathStackGetParent(id: Int64): Int64

    func FfiOHOSAceFrameworkNavPathStackPop(id: Int64, result: CString, animated: Bool): CJNavPathInfo

    func FfiOHOSAceFrameworkNavigationSetRecoverable(recoverable: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetEnableDragBar(enableDragBar: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetEnableModeChangeAnimation(isEnabled: Bool): Unit

    func FfiOHOSAceFrameworkNavigationSetIgnoreLayoutSafeArea(types: VectorInt32Handle, edges: VectorInt32Handle): Unit

    func FFICJCommonCreateVectorNavigationItem(size: Int64): VectorNavigationItemHandle

    func FFICJCommonVectorNavigationItemSetElement(vec: VectorNavigationItemHandle, index: Int64,
        value: NavigationItemFFI): Unit

    func FFICJCommonVectorNavigationItemGetElement(vec: VectorNavigationItemHandle, index: Int64): NavigationItemFFI

    func FFICJCommonVectorNavigationItemDelete(vec: VectorNavigationItemHandle): Unit

    func FFICJCommonVectorNavigationItemGetSize(vec: VectorNavigationItemHandle): Int64
}

@C
struct NavigationItemFFI {
    NavigationItemFFI(
        let value: CString,
        let icon: CString,
        let isEnable: Bool,
        let action: Int64,
        let status: Int32,
        let activeIcon: CString
    ) {}
}

type VectorNavigationItemHandle = CPointer<Unit>

class FFIVectorNavigationItem {
    private let vecHandle: VectorNavigationItemHandle

    init(vec: VectorNavigationItemHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCommonCreateVectorNavigationItem(size) }
    }

    func setElement(index: Int64, value: NavigationItemFFI): Unit {
        unsafe { FFICJCommonVectorNavigationItemSetElement(vecHandle, index, value) }
    }

    func getElement(index: Int64): NavigationItemFFI {
        unsafe { FFICJCommonVectorNavigationItemGetElement(vecHandle, index) }
    }

    func free(): Unit {
        unsafe { FFICJCommonVectorNavigationItemDelete(vecHandle) }
    }

    func getSize(): Int64 {
        unsafe { FFICJCommonVectorNavigationItemGetSize(vecHandle) }
    }

    func getNativeHandle(): VectorNavigationItemHandle {
        vecHandle
    }
}

@C
struct CJNavigationTitleOptions {
    CJNavigationTitleOptions(
        // backgroundColor
        var isBackgroundColorValid: Bool,
        var backgroundColor: UInt32,
        // backgroundBlurStyle
        var isBackgroundBlurStyleValid: Bool,
        var backgroundBlurStyle: Int32,
        // barStyle
        var isBarStyleValid: Bool,
        var barStyle: Int32,
        // paddingStart
        var isPaddingStartValid: Bool,
        var paddingStart: Float64,
        var paddingStartUnit: Int32,
        // paddingEnd
        var isPaddingEndValid: Bool,
        var paddingEnd: Float64,
        var paddingEndUnit: Int32
    ) {}

    init() {
        this.isBackgroundColorValid = false
        this.backgroundColor = 0
        this.isBackgroundBlurStyleValid = false
        this.backgroundBlurStyle = 0
        this.isBarStyleValid = false
        this.barStyle = 0
        this.isPaddingStartValid = false
        this.paddingStart = 0.0
        this.paddingStartUnit = 0
        this.isPaddingEndValid = false
        this.paddingEnd = 0.0
        this.paddingEndUnit = 0
    }
}

@C
struct CJNavigationToolbarOptions {
    CJNavigationToolbarOptions(
        // backgroundColor
        var isBackgroundColorValid: Bool,
        var backgroundColor: UInt32,
        // backgroundBlurStyle
        var isBackgroundBlurStyleValid: Bool,
        var backgroundBlurStyle: Int32,
        // barStyle
        var isBarStyleValid: Bool,
        var barStyle: Int32
    ) {}

    init() {
        this.isBackgroundColorValid = false
        this.backgroundColor = 0
        this.isBackgroundBlurStyleValid = false
        this.backgroundBlurStyle = 0
        this.isBarStyleValid = false
        this.barStyle = 0
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ToolbarItemStatus {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Disabled
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Active
    | ...

    func getValue(): Int32 {
        return match (this) {
            case Normal => 0
            case Disabled => 1
            case Active => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavBarPosition {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    | ...

    func getValue(): Int32 {
        return match (this) {
            case Start => 0
            case End => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavigationMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stack
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Split
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    func toInt32(): Int32 {
        match (this) {
            case Stack => return 0
            case Split => return 1
            case Auto => return 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parseValue(value: Int32): NavigationMode {
        match (value) {
            case 0 => Stack
            case 1 => Split
            case 2 => Auto
            case _ => Stack
        }
    }

    func toString(): String {
        match (this) {
            case Stack => "Stack"
            case Split => "Split"
            case Auto => "Auto"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationTitleOptions {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NavigationTitleOptions(
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundColor!: ?ResourceColor = None,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundBlurStyle!: ?BlurStyle = None,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var barStyle!: ?BarStyle = None,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var paddingStart!: ?Length = None,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var paddingEnd!: ?Length = None
    ) {}
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationToolbarOptions {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NavigationToolbarOptions(
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundColor!: ?ResourceColor = None,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var backgroundBlurStyle!: ?BlurStyle = None,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var barStyle!: ?BarStyle = None
    ) {}
}

func convertNavigationTitleOptions2FFi(value: NavigationTitleOptions): CJNavigationTitleOptions {
    var ret: CJNavigationTitleOptions = CJNavigationTitleOptions()
    ret.isBackgroundColorValid = false
    ret.isBackgroundBlurStyleValid = false
    ret.isBarStyleValid = false
    ret.isPaddingStartValid = false
    ret.isPaddingEndValid = false
    if (let Some(v) <- value.backgroundColor) {
        ret.isBackgroundColorValid = true
        ret.backgroundColor = transAppResourceToResourceColor(v)
    }
    if (let Some(v) <- value.backgroundBlurStyle) {
        ret.isBackgroundBlurStyleValid = true
        ret.backgroundBlurStyle = v.getValue()
    }
    if (let Some(v) <- value.barStyle) {
        ret.isBarStyleValid = true
        ret.barStyle = v.getValue()
    }
    if (let Some(v) <- value.paddingStart) {
        ret.isPaddingStartValid = true
        var paddingStart_ = transAppResourceToLength(v)
        ret.paddingStart = paddingStart_.value
        ret.paddingStartUnit = paddingStart_.unitType.getValue()
    }
    if (let Some(v) <- value.paddingEnd) {
        ret.isPaddingEndValid = true
        var paddingEnd_ = transAppResourceToLength(v)
        ret.paddingEnd = paddingEnd_.value
        ret.paddingEndUnit = paddingEnd_.unitType.getValue()
    }
    ret
}

func convertNavigationToolbarOptions2FFi(value: NavigationToolbarOptions): CJNavigationToolbarOptions {
    var ret: CJNavigationToolbarOptions = CJNavigationToolbarOptions()
    ret.isBackgroundColorValid = false
    ret.isBackgroundBlurStyleValid = false
    ret.isBarStyleValid = false
    if (let Some(v) <- value.backgroundColor) {
        ret.isBackgroundColorValid = true
        ret.backgroundColor = transAppResourceToResourceColor(v)
    }
    if (let Some(v) <- value.backgroundBlurStyle) {
        ret.isBackgroundBlurStyleValid = true
        ret.backgroundBlurStyle = v.getValue()
    }
    if (let Some(v) <- value.barStyle) {
        ret.isBarStyleValid = true
        ret.barStyle = v.getValue()
    }
    ret
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationMenuItem {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String = ""
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: String = ""
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isEnable: Bool = true
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: () -> Unit = {=>}

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value!: String,
        icon!: ?String = None,
        isEnable!: ?Bool = None,
        action!: Option<() -> Unit> = None
    ) {
        this.value = value
        if (let Some(v) <- icon) {
            this.icon = v
        }
        if (let Some(v) <- isEnable) {
            this.isEnable = v
        }
        if (let Some(v) <- action) {
            this.action = v
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value!: AppResource,
        icon!: ?AppResource = None,
        isEnable!: ?Bool = None,
        action!: Option<() -> Unit> = None
    ) {
        this.value = getResourceString(value)
        if (let Some(v) <- icon) {
            this.icon = getResourceMedia(v)
        }
        if (let Some(v) <- isEnable) {
            this.isEnable = v
        }
        if (let Some(v) <- action) {
            this.action = v
        }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ToolBarItem {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String = ""
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: String = ""
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var action: () -> Unit = {=>}
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var status: ToolbarItemStatus = ToolbarItemStatus.Normal
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var activeIcon: String = ""

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value!: String,
        icon!: ?String = None,
        action!: ?() -> Unit = None,
        status!: ?ToolbarItemStatus = None,
        activeIcon!: ?String = None
    ) {
        this.value = value
        if (let Some(v) <- icon) {
            this.icon = v
        }
        if (let Some(v) <- action) {
            this.action = v
        }
        if (let Some(v) <- status) {
            this.status = v
        }
        if (let Some(v) <- activeIcon) {
            this.activeIcon = v
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value!: AppResource,
        icon!: ?AppResource = None,
        action!: ?() -> Unit = None,
        status!: ?ToolbarItemStatus = None,
        activeIcon!: ?AppResource = None
    ) {
        this.value = getResourceString(value)
        if (let Some(v) <- icon) {
            this.icon = getResourceMedia(v)
        }
        if (let Some(v) <- action) {
            this.action = v
        }
        if (let Some(v) <- status) {
            this.status = v
        }
        if (let Some(v) <- activeIcon) {
            this.activeIcon = getResourceMedia(v)
        }
    }
}

@C
struct CJNavPathInfo {
    CJNavPathInfo(
        let id: Int64,
        let name: CString,
        let param: CString,
        let onPop: Int64,
        let onPopValid: Bool,
        let index: Int32,
        let navDestinationId: CString,
        let isEntry: Bool,
        let valid: Int32
    ) {}

    func free(): Unit {
        unsafe {
            if (!name.isNull()) {
                name.free()
            }
            if (!param.isNull()) {
                param.free()
            }
            if (!navDestinationId.isNull()) {
                navDestinationId.free()
            }
        }
    }
}

@C
struct CJPopInfo {
    CJPopInfo(
        let info: CJNavPathInfo,
        let result: CString
    ) {}

    func free(): Unit {
        unsafe {
            info.free()
            if (!result.isNull()) {
                result.free()
            }
        }
    }
}

@C
struct CJNavigationOptions {
    CJNavigationOptions(
        let launchMode: Int32,
        let animated: Bool
    ) {}
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopInfo {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public PopInfo(
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let info: NavPathInfo,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let result: String
    ) {}
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavPathInfo <: FFIData {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: String
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var param: String
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onPop: Option<(PopInfo) -> Unit> = None

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(name: String, param: String) {
        this.name = name
        this.param = param
        registerSelf()
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(name: String, param: String, onPop: Option<(PopInfo) -> Unit>) {
        this.name = name
        this.param = param
        this.onPop = onPop
        registerSelf()
    }

    func getNative(): CJNavPathInfo {
        unsafe {
            var onPopId = -1
            var onPopValid = false
            if (let Some(v) <- onPop) {
                let wrapper = {
                    cjPopInfo: CJPopInfo =>
                    let pathInfo = FFIDataManager.getInstance().getData<NavPathInfo>(cjPopInfo.info.id)
                    if (let Some(p) <- pathInfo) {
                        v(PopInfo(p, cjPopInfo.result.toString()))
                    }
                    cjPopInfo.free()
                }
                onPopId = Callback1Param<CJPopInfo, Unit>(wrapper).getID()
                onPopValid = true
            }

            return CJNavPathInfo(
                this.getID(),
                LibC.mallocCString(name),
                LibC.mallocCString(param),
                onPopId,
                onPopValid,
                -1,
                LibC.mallocCString(""),
                false,
                0
            )
        }
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationOptions {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var launchMode: LaunchMode = LaunchMode.Standard
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var animated: Bool = true

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(launchMode!: LaunchMode = LaunchMode.Standard, animated!: Bool = true) {
        this.launchMode = launchMode
        this.animated = animated
    }

    func getNative(): CJNavigationOptions {
        return CJNavigationOptions(launchMode.getValue(), animated)
    }
}

@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationCommonTitle {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var `main`: String

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var sub: String

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(`main`: String, sub: String) {
        this.`main` = `main`
        this.sub = sub
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LaunchMode {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MoveToTopSingleTon
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PopToSingleTon
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NewInstance
    | ...

    func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case MoveToTopSingleTon => 1
            case PopToSingleTon => 2
            case NewInstance => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

public class NavPathStack <: RemoteData {
    var isExistObj: Bool = true

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkNavPathStackCreate()
        })
        RemoteDataManager.getInstance().register(this)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPath(info: NavPathInfo): Unit {
        pushPath(info, options: NavigationOptions(animated: true))
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPath(info: NavPathInfo, animated!: Bool): Unit {
        pushPath(info, options: NavigationOptions(animated: animated))
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPath(info: NavPathInfo, options!: NavigationOptions): Unit {
        unsafe {
            let cjNavPathInfo = info.getNative()
            FfiOHOSAceFrameworkNavPathStackPushPath(getID(), cjNavPathInfo, options.getNative())
            cjNavPathInfo.free()
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPathByName(name: String, param: String, animated!: Bool = true): Unit {
        pushPath(NavPathInfo(name, param), animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPathByName(name: String, param: String, onPop: (PopInfo) -> Unit, animated!: Bool = true) {
        pushPath(NavPathInfo(name, param, onPop), animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushDestination(info: NavPathInfo) {
        pushPath(info)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushDestination(info: NavPathInfo, animated!: Bool = true) {
        pushPath(info, animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushDestination(info: NavPathInfo, options!: NavigationOptions) {
        pushPath(info, options: options)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushDestinationByName(name: String, param: String, animated!: Bool = true): Unit {
        pushPath(NavPathInfo(name, param), animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushDestinationByName(name: String, param: String, onPop: (PopInfo) -> Unit, animated!: Bool = true): Unit {
        pushPath(NavPathInfo(name, param, onPop), animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func replacePath(info: NavPathInfo, animated!: Bool = true): Unit {
        replacePath(info, options: NavigationOptions(animated: animated))
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func replacePath(info: NavPathInfo, options!: NavigationOptions): Unit {
        unsafe {
            let cjNavPathInfo = info.getNative()
            FfiOHOSAceFrameworkNavPathStackReplacePath(getID(), cjNavPathInfo, options.getNative())
            cjNavPathInfo.free()
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func replacePathByName(name: String, param: String, animated!: Bool = true): Unit {
        replacePath(NavPathInfo(name, param), animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeByIndexes(indexes: Array<Int32>): Int32 {
        unsafe {
            let vecFFi = FFIVectorInt32(indexes.size)
            for (i in 0..indexes.size) {
                vecFFi.setElement(i, indexes[i])
            }
            let count = FfiOHOSAceFrameworkNavPathStackRemoveByIndexes(getID(), vecFFi.getNativeHandle())
            vecFFi.free()
            return count
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeByName(name: String): Int32 {
        unsafe {
            let nameCString = LibC.mallocCString(name)
            let count = FfiOHOSAceFrameworkNavPathStackRemoveByName(getID(), nameCString)
            nameCString.free()
            return count
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeByNavDestinationId(navDestinationId: String): Bool {
        unsafe {
            let navDestinationIdCString = LibC.mallocCString(navDestinationId)
            let result = FfiOHOSAceFrameworkNavPathStackRemoveByNavDestinationId(getID(), navDestinationIdCString)
            navDestinationIdCString.free()
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(): Option<NavPathInfo> {
        return pop("")
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(animated!: Bool): Option<NavPathInfo> {
        return pop("", animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(result: String, animated!: Bool = true): Option<NavPathInfo> {
        unsafe {
            let resultCString = LibC.mallocCString(result)
            let retFFi = FfiOHOSAceFrameworkNavPathStackPop(getID(), resultCString, animated)
            resultCString.free()
            if (retFFi.valid == -1) {
                return None
            } else {
                let ret = NavPathInfo(retFFi.name.toString(), retFFi.param.toString())
                retFFi.free()
                return ret
            }
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popToName(name: String, animated!: Bool = true): Int32 {
        return popToName(name, "", animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popToName(name: String, result: String, animated!: Bool = true): Int32 {
        unsafe {
            let nameCString = LibC.mallocCString(name)
            let resultCString = LibC.mallocCString(result)
            let ret = FfiOHOSAceFrameworkNavPathStackPopToName(getID(), nameCString, resultCString, animated)
            nameCString.free()
            resultCString.free()
            return ret
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popToIndex(index: Int32, animated!: Bool = true): Unit {
        popToIndex(index, "", animated: animated)
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popToIndex(index: Int32, result: String, animated!: Bool = true): Unit {
        unsafe {
            let resultCString = LibC.mallocCString(result)
            FfiOHOSAceFrameworkNavPathStackPopToIndex(getID(), index, resultCString, animated)
            resultCString.free()
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveToTop(name: String, animated!: Bool = true): Int32 {
        unsafe {
            let nameCString = LibC.mallocCString(name)
            let ret = FfiOHOSAceFrameworkNavPathStackMoveToTop(getID(), nameCString, animated)
            nameCString.free()
            return ret
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func moveIndexToTop(index: Int32, animated!: Bool = true): Unit {
        unsafe {
            FfiOHOSAceFrameworkNavPathStackMoveIndexToTop(getID(), index, animated)
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func clear(animated!: Bool = true): Unit {
        unsafe {
            FfiOHOSAceFrameworkNavPathStackClear(getID(), animated)
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getAllPathName(): Array<String> {
        unsafe {
            let ffiList = FFIVectorString(FfiOHOSAceFrameworkNavPathStackGetAllPathName(getID()))
            let list = Array<String>(ffiList.getSize(), {
                i => ffiList.getElement(i)
            })
            ffiList.free()
            return list
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getParamByIndex(index: Int32): String {
        unsafe {
            let paramCString = FfiOHOSAceFrameworkNavPathStackGetParamByIndex(getID(), index)
            let ret = paramCString.toString()
            paramCString.free()
            return ret
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getParamByName(name: String): Array<String> {
        unsafe {
            let nameCString = LibC.mallocCString(name)
            let ffiList = FFIVectorString(FfiOHOSAceFrameworkNavPathStackGetParamByName(getID(), nameCString))
            let list = Array<String>(ffiList.getSize(), {
                i => ffiList.getElement(i)
            })
            ffiList.free()
            nameCString.free()
            return list
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getIndexByName(name: String): Array<Int32> {
        unsafe {
            let nameCString = LibC.mallocCString(name)
            let ffiList = FFIVectorInt32(FfiOHOSAceFrameworkNavPathStackGetIndexByName(getID(), nameCString))
            let list = Array<Int32>(ffiList.getSize(), {
                i => ffiList.getElement(i)
            })
            ffiList.free()
            nameCString.free()
            return list
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func size(): Int32 {
        unsafe {
            return FfiOHOSAceFrameworkNavPathStackSize(getID())
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func disableAnimation(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkNavPathStackDisableAnimation(getID(), value)
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getParent(): Option<NavPathStack> {
        unsafe {
            let parentId = FfiOHOSAceFrameworkNavPathStackGetParent(getID())
            if (parentId < 0) {
                return None
            }
            let pathStack = RemoteDataManager
                .getInstance()
                .getOrCreate<NavPathStack>(
                    parentId,
                    {
                        id =>
                        let obj = NavPathStack()
                        obj.isExistObj = false
                        return obj
                    }
                )
            if (!pathStack.isExistObj) {
                RemoteDataManager.getInstance().releaseData(pathStack.getID())
                return None
            }
            return pathStack
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Navigation <: ContainerBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkNavigationCreateWithPathInfos(NavPathStack().getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkNavigationCreateWithPathInfos(NavPathStack().getID())
        }
        this.child = child
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(pathInfos: NavPathStack) {
        unsafe {
            FfiOHOSAceFrameworkNavigationCreateWithPathInfos(pathInfos.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(pathInfos: NavPathStack, child: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkNavigationCreateWithPathInfos(pathInfos.getID())
        }
        this.child = child
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func navDestination(builder: (String) -> Unit): This {
        let wrapper = {
            value: CString => builder(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkNavigationSetNavDestination(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(title: String, options!: ?NavigationTitleOptions = None): This {
        var options_ = CJNavigationTitleOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationTitleOptions2FFi(value)
            withOptions_ = true
        }
        unsafe {
            var unsafeContent = LibC.mallocCString(title)
            FfiOHOSAceFrameworkNavigationSetTitleWithOptions(unsafeContent, withOptions_, options_)
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(title: AppResource, options!: ?NavigationTitleOptions = None): This {
        var options_ = CJNavigationTitleOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationTitleOptions2FFi(value)
            withOptions_ = true
        }
        unsafe {
            var unsafeContent = LibC.mallocCString(getResourceString(title))
            FfiOHOSAceFrameworkNavigationSetTitleWithOptions(unsafeContent, withOptions_, options_)
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(builder: () -> Unit, options!: ?NavigationTitleOptions = None): This {
        var options_ = CJNavigationTitleOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationTitleOptions2FFi(value)
            withOptions_ = true
        }

        unsafe {
            FfiOHOSAceFrameworkNavigationSetTitleWithBuilderWithOptions(Callback0Param<Unit>(builder).getID(),
                withOptions_, options_)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(mainTitle: String, subTitle: String, options!: ?NavigationTitleOptions = None): This {
        var options_ = CJNavigationTitleOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationTitleOptions2FFi(value)
            withOptions_ = true
        }

        unsafe {
            var mainContent = LibC.mallocCString(mainTitle)
            var subContent = LibC.mallocCString(subTitle)
            FfiOHOSAceFrameworkNavigationSetTitleWithCommon(mainContent, subContent, withOptions_, options_)
            LibC.free(mainContent)
            LibC.free(subContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(builder: () -> Unit, height: Length, options!: ?NavigationTitleOptions = None): This {
        var options_ = CJNavigationTitleOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationTitleOptions2FFi(value)
            withOptions_ = true
        }
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkNavigationSetTitleWithCustom(Callback0Param<Unit>(builder).getID(), height_.value,
                height_.unitType.getValue(), withOptions_, options_)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(value: NavigationCommonTitle, options!: ?NavigationTitleOptions = None): This {
        var options_ = CJNavigationTitleOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationTitleOptions2FFi(value)
            withOptions_ = true
        }
        unsafe {
            var mainContent = LibC.mallocCString(value.`main`)
            var subContent = LibC.mallocCString(value.sub)
            FfiOHOSAceFrameworkNavigationSetTitleWithCommon(mainContent, subContent, withOptions_, options_)
            LibC.free(mainContent)
            LibC.free(subContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menus(array: Array<NavigationMenuItem>): This {
        unsafe {
            let valueHandle = FFIVectorNavigationItem(array.size)
            for (i in 0..array.size) {
                var unsafeValue = LibC.mallocCString(array[i].value)
                var unsafeIcon = LibC.mallocCString(array[i].icon)
                var isEnable = array[i].isEnable
                var actionId = Callback0Param<Unit>(array[i].action).getID()
                valueHandle.setElement(
                    i, NavigationItemFFI(unsafeValue, unsafeIcon, isEnable, actionId, 0, unsafeValue)
                )
                LibC.free(unsafeValue)
                LibC.free(unsafeIcon)
            }

            FfiOHOSAceFrameworkNavigationSetMenus(valueHandle.getNativeHandle())
            valueHandle.free()
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func menus(builder: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetMenusWithBuilder(Callback0Param<Unit>(builder).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func titleMode(titleMode: NavigationTitleMode): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetTitleMode(titleMode.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toolbarConfiguration(array: Array<ToolBarItem>, options!: ?NavigationToolbarOptions = None): This {
        var options_ = CJNavigationToolbarOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationToolbarOptions2FFi(value)
            withOptions_ = true
        }
        unsafe {
            let valueHandle = FFIVectorNavigationItem(array.size)
            for (i in 0..array.size) {
                var unsafeValue = LibC.mallocCString(array[i].value)
                var unsafeIcon = LibC.mallocCString(array[i].icon)
                var actionId = Callback0Param<Unit>(array[i].action).getID()
                var unsafeActiveIcon = LibC.mallocCString(array[i].activeIcon)
                valueHandle.setElement(i,
                    NavigationItemFFI(unsafeValue, unsafeIcon, false, actionId, array[i].status.getValue(),
                        unsafeActiveIcon))
                LibC.free(unsafeValue)
                LibC.free(unsafeIcon)
                LibC.free(unsafeActiveIcon)
            }

            FfiOHOSAceFrameworkNavigationSetToolBarWithOptions(valueHandle.getNativeHandle(), withOptions_, options_)
            valueHandle.free()
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toolbarConfiguration(builder: () -> Unit, options!: ?NavigationToolbarOptions = None): This {
        var options_ = CJNavigationToolbarOptions()
        var withOptions_ = false
        if (let Some(value) <- options) {
            options_ = convertNavigationToolbarOptions2FFi(value)
            withOptions_ = true
        }
        unsafe {
            FfiOHOSAceFrameworkNavigationSetToolBarWithBuilderWithOptions(Callback0Param<Unit>(builder).getID(),
                withOptions_, options_)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideToolBar(isHide: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideToolBar(isHide)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideToolBar(isHide: Bool, animated!: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideToolBarWithAnimated(isHide, animated)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideTitleBar(isHide: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideTitleBar(isHide)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideTitleBar(isHide: Bool, animated!: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideTitleBarWithAnimated(isHide, animated)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideBackButton(isHide: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideBackButton(isHide)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func navBarWidth(width: Length): This {
        var value_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkNavigationSetNavBarWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func navBarPosition(position: NavBarPosition): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetNavBarPosition(position.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func mode(mode: NavigationMode): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetMode(mode.toInt32())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backButtonIcon(icon: String): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(icon)
            FfiOHOSAceFrameworkNavigationSetBackButtonIcon(unsafeContent)
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backButtonIcon(icon: PixelMap): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetBackButtonIconWithPixelMap(icon.getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func backButtonIcon(icon: AppResource): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(getResourceMedia(icon))
            FfiOHOSAceFrameworkNavigationSetBackButtonIcon(unsafeContent)
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideNavBar(isHide: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideNavBar(isHide)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func navBarWidthRange(value: (Length, Length)): This {
        var min_ = transAppResourceToLength(value[0])
        var max_ = transAppResourceToLength(value[1])
        unsafe {
            FfiOHOSAceFrameworkNavigationSetNavBarWidthRange(min_.value, min_.unitType.getValue(), max_.value,
                max_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minContentWidth(min: Length): This {
        var value_ = transAppResourceToLength(min)
        unsafe {
            FfiOHOSAceFrameworkNavigationSetMinContentWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func systemBarStyle(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetSystemBarStyle(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTitleModeChange(callback: (NavigationTitleMode) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetOnTitleModeChanged(
                Callback1Param<Int32, Unit>(
                    {
                        evt: Int32 =>
                        var resolved = NavigationTitleMode.parseValue(evt)
                        callback(resolved)
                    }
                ).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onNavBarStateChange(callback: (Bool) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetOnNavBarStateChange(Callback1Param<Bool, Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onNavigationModeChange(callback: (NavigationMode) -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetOnNavigationModeChange(
                Callback1Param<Int32, Unit>(
                    {
                        evt: Int32 =>
                        var resolved = NavigationMode.parseValue(evt)
                        callback(resolved)
                    }
                ).getID())
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func recoverable(recoverable: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetRecoverable(recoverable)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableDragBar(isEnabled: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetEnableDragBar(isEnabled)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableModeChangeAnimation(isEnabled: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetEnableModeChangeAnimation(isEnabled)
        }
        this
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ignoreLayoutSafeArea(types!: ?Array<LayoutSafeAreaType> = None,
        edges!: ?Array<LayoutSafeAreaEdge> = None): This {
        let typeArr = types ?? [LayoutSafeAreaType.SYSTEM]
        let edgeArr = edges ?? [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM]

        var vecTypesHandle: ?FFIVectorInt32 = None
        var vecEdgesHandle: ?FFIVectorInt32 = None
        try {
            vecTypesHandle = FFIVectorInt32(typeArr.size)
            for (i in 0..typeArr.size) {
                vecTypesHandle?.setElement(i, typeArr[i].getValue())
            }
            vecEdgesHandle = FFIVectorInt32(edgeArr.size)
            for (i in 0..edgeArr.size) {
                vecEdgesHandle?.setElement(i, edgeArr[i].getValue())
            }
            unsafe {
                FfiOHOSAceFrameworkNavigationSetIgnoreLayoutSafeArea(vecTypesHandle.getOrThrow().getNativeHandle(),
                    vecEdgesHandle.getOrThrow().getNativeHandle())
            }
        } finally {
            vecTypesHandle?.free()
            vecEdgesHandle?.free()
        }

        this
    }
}
