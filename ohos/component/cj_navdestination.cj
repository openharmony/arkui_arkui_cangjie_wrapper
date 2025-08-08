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
import std.deriving.*

@C
struct CJNavDestinationContext {
    CJNavDestinationContext(
        let pathInfo: CJNavPathInfo,
        let pathStack: Int64,
        let navDestinationId: UInt64
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavDestinationContext {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public NavDestinationContext(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let pathInfo: NavPathInfo,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let pathStack: NavPathStack,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let navDestinationId: String
    ) {}
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavDestinationCommonTitle {
    public NavDestinationCommonTitle(
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let `main`: String,
        @!APILevel[
            20,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let sub: String
    ) {}
}

@Derive[ToString, Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum NavDestinationMode {
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
    Dialog
    | ...

    func getValue(): Int32 {
        match (this) {
            case Standard => 0
            case Dialog => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

foreign {
    func FfiOHOSAceFrameworkNavdestinationCreate(): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnBackPressed(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnReady(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithString(value: CString): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithCommonTitle(`main`: CString, sub: CString): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithTitleHeight(builder: Int64, titleHeightMode: Int32): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithHeight(builder: Int64, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithStringOptions(value: CString, options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithBuilderOptions(builder: Int64, options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithCommonTitleOptions(`main`: CString, sub: CString,
        options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithTitleHeightOptions(builder: Int64, titleHeightMode: Int32,
        options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavdestinationSetTitleWithHeightOptions(builder: Int64, height: Float64, heightUnit: Int32,
        options: CJNavigationTitleOptions): Unit

    func FfiOHOSAceFrameworkNavdestinationSetHideTitleBar(value: Bool): Unit

    func FfiOHOSAceFrameworkNavdestinationSetMode(mode: Int32): Unit

    func FfiOHOSAceFrameworkNavdestinationSetBackButtonIconWithUrl(url: CString): Unit

    func FfiOHOSAceFrameworkNavdestinationSetBackButtonIconWithPixelMap(pixelMapId: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetMenus(menuItemHandle: VectorNavigationItemHandle): Unit

    func FfiOHOSAceFrameworkNavdestinationSetMenusWithBuilder(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationIgnoreLayoutSafeArea(types: VectorInt32Handle, edges: VectorInt32Handle): Unit

    func FfiOHOSAceFrameworkNavdestinationSetSystemBarStyle(styleColor: UInt32): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnShown(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnHidden(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnWillAppear(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnWillShow(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnWillHide(callback: Int64): Unit

    func FfiOHOSAceFrameworkNavdestinationSetOnWillDisappear(callback: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class NavDestination <: ContainerBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationCreate()
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
            FfiOHOSAceFrameworkNavdestinationCreate()
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
    public func onBackPressed(callback: () -> Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnBackPressed(Callback0Param<Bool>(callback).getID())
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
    public func onReady(callback: (NavDestinationContext) -> Unit): This {
        let wrapper = {
            context: CJNavDestinationContext =>
            let pathInfo = NavPathInfo(
                context.pathInfo.name.toString(),
                context.pathInfo.param.toString()
            )
            var id = context.navDestinationId.toString()
            if (!context.pathInfo.param.isNull()) {
                context.pathInfo.param.free()
            }
            if (!context.pathInfo.navDestinationId.isNull()) {
                context.pathInfo.navDestinationId.free()
            }
            let pathStack = RemoteDataManager
                .getInstance()
                .getOrCreate<NavPathStack>(context.pathStack, {_ => NavPathStack()})
            callback(NavDestinationContext(pathInfo, pathStack, id))
        }
        let lambdaData = Callback1Param<CJNavDestinationContext, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnReady(lambdaData.getID())
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
    public func title(value: String, options!: ?NavigationTitleOptions = None): This {
        unsafe {
            try (unsafeSrc = LibC.mallocCString(value).asResource()) {
                if (let Some(v) <- options) {
                    var options_ = convertNavigationTitleOptions2FFi(v)
                    FfiOHOSAceFrameworkNavdestinationSetTitleWithStringOptions(unsafeSrc.value, options_)
                } else {
                    FfiOHOSAceFrameworkNavdestinationSetTitleWithString(unsafeSrc.value)
                }
            }
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
        unsafe {
            if (let Some(v) <- options) {
                var options_ = convertNavigationTitleOptions2FFi(v)
                FfiOHOSAceFrameworkNavdestinationSetTitleWithBuilderOptions(Callback0Param<Unit>(builder).getID(),
                    options_)
            } else {
                FfiOHOSAceFrameworkNavdestinationSetTitleWithBuilder(Callback0Param<Unit>(builder).getID())
            }
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
    public func title(value: NavDestinationCommonTitle, options!: ?NavigationTitleOptions = None): This {
        unsafe {
            try (mainSrc = LibC.mallocCString(value.`main`).asResource(),
                subSrc = LibC.mallocCString(value.sub).asResource()) {
                if (let Some(v) <- options) {
                    var options_ = convertNavigationTitleOptions2FFi(v)
                    FfiOHOSAceFrameworkNavdestinationSetTitleWithCommonTitleOptions(mainSrc.value, subSrc.value,
                        options_)
                } else {
                    FfiOHOSAceFrameworkNavdestinationSetTitleWithCommonTitle(mainSrc.value, subSrc.value)
                }
            }
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
    public func title(builder: () -> Unit, height: TitleHeight, options!: ?NavigationTitleOptions = None): This {
        unsafe {
            if (let Some(v) <- options) {
                var options_ = convertNavigationTitleOptions2FFi(v)
                FfiOHOSAceFrameworkNavdestinationSetTitleWithTitleHeightOptions(Callback0Param<Unit>(builder).getID(),
                    height.getValue(), options_)
            } else {
                FfiOHOSAceFrameworkNavdestinationSetTitleWithTitleHeight(Callback0Param<Unit>(builder).getID(),
                    height.getValue())
            }
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
        var height_ = transAppResourceToLength(height)
        unsafe {
            if (let Some(v) <- options) {
                var options_ = convertNavigationTitleOptions2FFi(v)
                FfiOHOSAceFrameworkNavdestinationSetTitleWithHeightOptions(Callback0Param<Unit>(builder).getID(),
                    height_.value, height_.unitType.getValue(), options_)
            } else {
                FfiOHOSAceFrameworkNavdestinationSetTitleWithHeight(Callback0Param<Unit>(builder).getID(), height_.value,
                    height_.unitType.getValue())
            }
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
    public func hideTitleBar(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetHideTitleBar(value)
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
    public func mode(value: NavDestinationMode): This {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetMode(value.getValue())
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
    public func backButtonIcon(value: String): This {
        unsafe {
            try (unsafeSrc = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkNavdestinationSetBackButtonIconWithUrl(unsafeSrc.value)
            }
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
    public func backButtonIcon(value: AppResource): This {
        unsafe {
            try (unsafeSrc = LibC.mallocCString(getResourceMedia(value)).asResource()) {
                FfiOHOSAceFrameworkNavdestinationSetBackButtonIconWithUrl(unsafeSrc.value)
            }
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
    public func backButtonIcon(value: PixelMap): This {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetBackButtonIconWithPixelMap(value.getID())
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
    public func menus(values: Array<NavigationMenuItem>): This {
        unsafe {
            let valueHandle = FFIVectorNavigationItem(values.size)
            for (i in 0..values.size) {
                var unsafeValue: ?CString = None
                var unsafeIcon: ?CString = None
                try {
                    unsafeValue = LibC.mallocCString(values[i].value)
                    unsafeIcon = LibC.mallocCString(values[i].icon)
                    var isEnable = values[i].isEnable
                    var actionId = Callback0Param<Unit>(values[i].action).getID()
                    valueHandle.setElement(i,
                        NavigationItemFFI(unsafeValue.getOrThrow(), unsafeIcon.getOrThrow(), isEnable, actionId, 0,
                            unsafeValue.getOrThrow()))
                } catch (e: Exception) {} finally {
                    if (let Some(v) <- unsafeValue) {
                        LibC.free(v)
                    }
                    if (let Some(v) <- unsafeIcon) {
                        LibC.free(v)
                    }
                }
            }

            FfiOHOSAceFrameworkNavdestinationSetMenus(valueHandle.getNativeHandle())
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
    public func menus(value: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetMenusWithBuilder(Callback0Param<Unit>(value).getID())
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
    public func ignoreLayoutSafeArea(
        types!: Array<LayoutSafeAreaType> = [LayoutSafeAreaType.SYSTEM],
        edges!: Array<LayoutSafeAreaEdge> = [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM]
    ): This {
        let vecTypesHandle = FFIVectorInt32(types.size)
        for (i in 0..types.size) {
            vecTypesHandle.setElement(i, types[i].getValue())
        }
        let vecEdgesHandle = FFIVectorInt32(edges.size)
        for (i in 0..edges.size) {
            vecEdgesHandle.setElement(i, edges[i].getValue())
        }
        unsafe {
            FfiOHOSAceFrameworkNavdestinationIgnoreLayoutSafeArea(vecTypesHandle.getNativeHandle(),
                vecEdgesHandle.getNativeHandle())
            vecTypesHandle.free()
            vecEdgesHandle.free()
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
    public func systemBarStyle(style: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetSystemBarStyle(transAppResourceToResourceColor(style))
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
    public func onShown(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnShown(lambdaData.getID())
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
    public func onHidden(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnHidden(lambdaData.getID())
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
    public func onWillAppear(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnWillAppear(lambdaData.getID())
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
    public func onWillShow(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnWillShow(lambdaData.getID())
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
    public func onWillHide(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnWillHide(lambdaData.getID())
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
    public func onWillDisappear(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkNavdestinationSetOnWillDisappear(lambdaData.getID())
        }
        this
    }
}
