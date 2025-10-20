/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

package ohos.arkui.component.navigation

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive
import std.collection.HashMap
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkNavigationCreateWithPathInfos(pathInfos: Int64): Unit
    func FfiOHOSAceFrameworkNavigationSetNavDestination(builder: Int64): Unit
    func FfiOHOSAceFrameworkNavPathStackCreate(): Int64
    func FfiOHOSAceFrameworkNavPathStackPushPath(id: Int64, info: CJNavPathInfo, options: CJNavOptions): Unit
    func FfiOHOSAceFrameworkNavPathStackPop(id: Int64, result: CString, animated: Bool): CJNavPathInfo
    func FfiOHOSAceFrameworkNavigationSetTitleWithOptions(title: CString, withOptions: Bool,
        options: CJNavigationTitleOptions): Unit
    func FfiOHOSAceFrameworkNavigationSetTitleWithBuilderWithOptions(builder: Int64, withOptions: Bool,
        options: CJNavigationTitleOptions): Unit
    func FfiOHOSAceFrameworkNavigationSetHideTitleBarWithAnimated(isHide: Bool, animated: Bool): Unit
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
            if(!name.isNull()) {
                LibC.free(name)
            }
            if (!param.isNull()) {
                LibC.free(param)
            }
            if (!navDestinationId.isNull()) {
                LibC.free(navDestinationId)
            }
        }
    }
}

@C
struct CJNavOptions {
    CJNavOptions(
        let launchMode: Int32,
        let animated: Bool
    ) {}
}

/**
 * Indicates the information of the popped page.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PopInfo {
    /**
     * The info of the popped page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let info: NavPathInfo

    /**
     * The result of the popped page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let result: String

    init(info: NavPathInfo, result: String) {
        this.info = info
        this.result = result
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
                LibC.free(result)
            }
        }
    }
}

/**
 * Indicates the options of Navigation's Titlebar.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationTitleOptions {
    /**
     * Background color of the title bar. If this parameter is not set, the default color is used.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundColor: ?ResourceColor
    /**
     * Background blur style of the title bar. If this parameter is not set, the background
     * blur effect is disabled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var backgroundBlurStyle: ?BlurStyle
    /**
     * Layout style of the title bar.
     * <br>Default value: **BarStyle.STANDARD**.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var barStyle: ?BarStyle
    /**
     * Set title bar start padding.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var paddingStart: ?Length
    /**
     * Set title bar end padding.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var paddingEnd: ?Length

    /**
     * Constructor of NavigationTitleOptions
     * @param { ?ResourceColor } backgroundColor
     * @param { ?BlurStyle } backgoundBlurStyle
     * @param { ?BarStyle } barStyle
     * @param { ?Length } paddingStart
     * @param { ?Length } paddingEnd
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        backgroundColor!: ?ResourceColor = None,
        backgroundBlurStyle!: ?BlurStyle = None,
        barStyle!: ?BarStyle = None,
        paddingStart!: ?Length = None,
        paddingEnd!: ?Length = None
    ) {
        this.backgroundColor = backgroundColor
        this.backgroundBlurStyle = backgroundBlurStyle
        this.barStyle = barStyle
        this.paddingStart = paddingStart
        this.paddingEnd = paddingEnd
    }

    func toNative(): CJNavigationTitleOptions {
        var ret = CJNavigationTitleOptions()
        if (let Some(v) <- this.backgroundColor) {
            ret.isBackgroundColorValid = true
            ret.backgroundColor = transAppResourceToResourceColor(v)
        }
        if (let Some(v) <- this.backgroundBlurStyle) {
            ret.isBackgroundBlurStyleValid = true
            ret.backgroundBlurStyle = v.getValue()
        }
        if (let Some(v) <- this.barStyle) {
            ret.isBarStyleValid = true
            ret.barStyle = v.getValue()
        }
        if (let Some(v) <- this.paddingStart) {
            ret.isPaddingStartValid = true
            var paddingStart_ = transAppResourceToLength(v)
            ret.paddingStart = paddingStart_.value
            ret.paddingStartUnit = paddingStart_.unitType.getValue()
        }
        if (let Some(v) <- this.paddingEnd) {
            ret.isPaddingEndValid = true
            var paddingEnd_ = transAppResourceToLength(v)
            ret.paddingEnd = paddingEnd_.value
            ret.paddingEndUnit = paddingEnd_.unitType.getValue()
        }
        ret
    }
}

@C
struct CJNavigationTitleOptions {
    var isBackgroundColorValid: Bool
    var backgroundColor: UInt32
    var isBackgroundBlurStyleValid: Bool
    var backgroundBlurStyle: Int32
    var isBarStyleValid: Bool
    var barStyle: Int32
    var isPaddingStartValid: Bool
    var paddingStart: Float64
    var paddingStartUnit: Int32
    var isPaddingEndValid: Bool
    var paddingEnd: Float64
    var paddingEndUnit: Int32
    init() {
        this.isBackgroundColorValid = false
        this.backgroundColor = 0
        this.isBackgroundBlurStyleValid = false
        this.backgroundBlurStyle =  0
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

/**
 * Defines the mode of stack operation.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LaunchMode {
    /**
     * Default navigation stack operation mode.<br>In this mode,
     * push operations add the specified **NavDestination**page to
     * the stack; replace operations replace the current top **NavDestination** page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard
    |
    /**
     * When the NavDestination with a specified name exists, it will be moved to top of stack,
     * otherwise, the behavior will be consistent with the STANDARD mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MoveToTopSingleTon
    |
    /**
     * When the NavDestination with a specified name exists, the stack will pop until that NavDestination,
     * otherwise, the behavior will be consistent with the STANDARD mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PopToSingleTon
    |
    /**
     * This mode creates an instance of **NavDestination**. Compared with
     * **STANDARD**, this mode does not reuse the instance with the same name in the stack.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NewInstance
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case MoveToTopSingleTon => 1
            case PopToSingleTon => 2
            case NewInstance => 3
            case _  => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Indicates the options of stack operation.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavigationOptions {
    /**
     * Navigation stack operation mode.
     * <br>Default value: **LaunchMode.STANDARD**.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var launchMode: ?LaunchMode

    /**
     * Whether to support transition animation.
     * <br>Default value: **true**.
     * <br>**true**: The transition animation is supported.
     * <br>**false**: The transition animation is not supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var animated: ?Bool
    /**
     * Constructor of NavigationOptions.
     *
     * @param { ?LaunchMode } launchMode
     * @param { ?Bool } animated
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(launchMode!: ?LaunchMode = None, animated!: ?Bool = None) {
        this.launchMode = launchMode ?? LaunchMode.Standard
        this.animated = animated ?? true
    }

    func getNative(): CJNavOptions {
        return CJNavOptions(
            (launchMode ?? LaunchMode.Standard).getValue(),
            animated ?? true
        )
    }
}

/**
 * Declare BarStyle enum.
 */
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum BarStyle {
    /**
     * In this mode, the title bar or toolbar is laid out above the content area.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Standard
    |
    /**
     *  In this mode, the title bar or toolbar is overlaid on top of the content area.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Stack
    |
    ...

    protected func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case Stack => 1
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Indicates the information of NavDestination.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavPathInfo <: FFIData {
    /**
     * Name of the navigation destination page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var name: ?String
    /**
     * Detailed parameters of the navigation destination page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var param: ?String
    /**
     * Callback returned when pop is called on the navigation destination page.
     * It is invoked only after the **result** parameter is set in pop.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var onPop: ?Callback<PopInfo, Unit> = None
    /**
     * Creates an instance of NavPathInfo.
     *
     * @param { ?String } name - The name of NavDestination.
     * @param { ?String } param - The detailed parameter of the NavDestination.
     * @param { ?Callback<PopInfo, Unit> } onPop - Callback returned when pop is called on the navigation destination page.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(name!: ?String, param!: ?String, onPop!: ?Callback<PopInfo, Unit> = None) {
        this.name = name ?? ""
        this.param = param ?? ""
        this.onPop = onPop
        registerSelf()
    }

    func getNative(): CJNavPathInfo {
        unsafe {
            var onPopId = -1
            var onPopValid = false
            if (let Some(call) <- onPop) {
                let wrapper = {
                    cjPopInfo: CJPopInfo =>
                    let pathInfo = FFIDataManager.getInstance().getData<NavPathInfo>(cjPopInfo.info.id)
                    if (let Some(info) <- pathInfo) {
                        call(PopInfo(info, cjPopInfo.result.toString()))
                    }
                    cjPopInfo.free()
                }
                onPopId = Callback1Param<CJPopInfo, Unit>(wrapper).getID()
                onPopValid = true
            }

            return CJNavPathInfo(
                this.getID(),
                LibC.mallocCString(name ?? ""),
                LibC.mallocCString(param ?? ""),
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

func freePathInfo(info: CJNavPathInfo): Unit {
    unsafe {
        if (!info.name.isNull()) {
            LibC.free(info.name)
        }
        if (!info.param.isNull()) {
            LibC.free(info.param)
        }
        if (!info.navDestinationId.isNull()) {
            LibC.free(info.navDestinationId)
        }
    }
}

/**
 * Indicates the information of NavDestinations. Providers methods for controlling destination page in the stack
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavPathStack <: RemoteData {
    private var id: Int64 = 0
    /**
     * Creates an instance of NavPathStack.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(
            unsafe { FfiOHOSAceFrameworkNavPathStackCreate() }
        )
        RemoteDataManager.getInstance().register(this)
        id = getID()
    }

    ~init() {
        releaseFFIData(id)
    }

    /**
     * Pushes the navigation destination page specified by **info** onto the navigation stack.
     * Depending on the launchMode specified in the **options** parameter, different behaviors will be triggered.
     *
     * @param { ?NavPathInfo } info - Indicates the NavDestination to be pushed.
     * @param { ?NavigationOptions } options - Indicates the navigation options.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPath(info: ?NavPathInfo, options!: ?NavigationOptions = None): Unit {
        unsafe {
            let cjInfo = info ?? NavPathInfo(name: "", param: "")
            let cjOptions = options ?? NavigationOptions()
            let cInfo = cjInfo.getNative()
            FfiOHOSAceFrameworkNavPathStackPushPath(getID(), cInfo, cjOptions.getNative())
            cInfo.free()
        }
    }

    /**
     * Pushes the specified NavDestination into the stack.
     *
     * @param { ?String } name - Indicates the name of the NavDestination to be pushed.
     * @param { ?String } param - Indicates the detailed parameter of the NavDestination to be pushed.
     * @param { ?Bool } animated - Indicates whether the transition is animated.
     * <br>Default value: **true**.
     * <br>**true**: The transition animation is supported. **false**: The transition animation is not supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushPathByName(name: ?String, param: ?String, animated!: ?Bool = None) {
        let tmpName = name ?? ""
        let tmpParam = param ?? ""
        pushPath(NavPathInfo(name: tmpName, param: tmpParam), options: NavigationOptions(animated: animated))
    }

    /**
     * Pops the top NavDestination out of the stack.
     *
     * @param { ?Bool } animated - Indicates whether the transition is animated. Default value is **true**.
     * @returns { ?NavPathInfo } Returns the top NavPathInfo if the stack is not empty, otherwise returns None.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pop(animated!: ?Bool = None): ?NavPathInfo {
        unsafe {
            try (
                tmp = LibC.mallocCString("").asResource()
            ) {
                let ffiRes = FfiOHOSAceFrameworkNavPathStackPop(getID(), tmp.value, animated ?? true)
                if (ffiRes.valid == -1) {
                    return None
                } else {
                    let res = NavPathInfo(name: ffiRes.name.toString(), param: ffiRes.param.toString())
                    freePathInfo(ffiRes)
                    return res
                }
            }
        }
        None
    }
}

/**
 * Defines Navigation Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Navigation <: CommonMethodComponent<Navigation> & NavigationAttribute {
    static var navParamsMap: HashMap<String, Any> = HashMap<String, Any>()
    /**
     * Constructor of Navigation.
     *
     * @param { () -> Unit } child
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = { => }) {
        unsafe {
            FfiOHOSAceFrameworkNavigationCreateWithPathInfos(NavPathStack().getID())
        }
        this.child = child
    }

    /**
     * Constructor of Navigation.
     *
     * @param { ?NavPathStack } pathInfos
     * @param { () -> Unit } child
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(pathInfos: ?NavPathStack, child!: () -> Unit = { => }) {
        let tmpPathInfos = pathInfos ?? NavPathStack()
        unsafe {
            FfiOHOSAceFrameworkNavigationCreateWithPathInfos(tmpPathInfos.getID())
        }
        this.child = child
    }

    /**
     * Set builder for user-defined NavDestination component.
     *
     * @param { ?(String, Any) -> Unit } builder - The builder function of NavDestination component.
     * @returns { This } Returns the instance of the Navigation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func navDestination(builder: ?(String, Any) -> Unit): This {
        let tmpBuilder = builder ?? { _: String, _: Any => }
        let wrapper = { value: CString =>
            let name = value.toString()
            let param = Navigation.navParamsMap[name]
            tmpBuilder(name, param)
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkNavigationSetNavDestination(lambdaData.getID())
        }
        this
    }
    /**
     * Navigation title.
     *
     * @param { ?ResourceStr } value - Navigation title.
     * @param { ?NavigationTitleOptions } options - Indicates the options of titlebar.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(value: ?ResourceStr, options!: ?NavigationTitleOptions = None): This {
        var opt = CJNavigationTitleOptions()
        var withOpt = false
        if (let Some(v) <- options) {
            opt = v.toNative()
            withOpt = true
        }
        unsafe {
            try (cTitle = LibC.mallocCString(transResourceStrToString(value ?? "")).asResource()) {
                FfiOHOSAceFrameworkNavigationSetTitleWithOptions(cTitle.value, withOpt, opt)
            }
        }
        this
    }

    /**
     * Navigation title.
     *
     * @param { ?CustomBuilder } value - Navigation title.
     * @param { ?NavigationTitleOptions } options - Indicates the options of titlebar.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func title(value: ?CustomBuilder, options!: ?NavigationTitleOptions = None): This {
        var opt = CJNavigationTitleOptions()
        var withOpt = false
        if (let Some(v) <- options) {
            opt = v.toNative()
            withOpt = true
        }
        unsafe {
            FfiOHOSAceFrameworkNavigationSetTitleWithBuilderWithOptions(
                Callback0Param<Unit>(value ?? { => }).getID(), withOpt, opt)
        }
        this
    }
    /**
     * Sets whether to hide the title bar and whether to animate the visibility change.
     *
     * @param { ?Bool } hide - Whether to hide the title bar.
     * <br>Default value is **false**. **true**: Hide the title bar. **false**: Show the title bar.
     * @param { ?Bool } animated - Whether to animate the visibility change.
     * <br>Default value is **false**.
     * <br>**true**: Animate the visibility change. **false**: Do not animate the visibility change.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func hideTitleBar(hide: ?Bool, animated!: ?Bool = None): This {
        unsafe {
            FfiOHOSAceFrameworkNavigationSetHideTitleBarWithAnimated(hide ?? false, animated ?? false)
        }
        this
    }
}
