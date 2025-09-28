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

package ohos.arkui.component.page_transition

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

foreign func FfiPageTransitionEnterCreate(`type`: Int32, duration: Int32, curve: CString, delay: Int32): Unit

foreign func FfiPageTransitionExitCreate(`type`: Int32, duration: Int32, curve: CString, delay: Int32): Unit

foreign func FfiPageTransitionSlideEffect(slide_effect: Int32): Unit

foreign func FfiPageTransitionTranslate(x: Float64, y: Float64, z: Float64): Unit

foreign func FfiPageTransitionScalePointer(x: Float64, y: Float64, z: Float64, centerX: Float64, centerY: Float64): Unit

foreign func FfiPageTransitionSetOpacity(value: Float64): Unit

foreign func FfiPageTransitionOnEnter(callback: Int64): Unit

foreign func FfiPageTransitionOnExit(callback: Int64): Unit

class CallbackCJTransitionEvent <: BaseCallBack {
    CallbackCJTransitionEvent(let closuer: (Int32, Float64) -> Unit) {
        registerSelf()
    }

    protected func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw BusinessException(190002, "The callback function is invalid.")
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg0 = unsafe { CPointer<Int32>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        let ptrArg1 = unsafe { CPointer<Float64>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw BusinessException(190002, "The callback function is invalid.")
        }
        unsafe {
            let arg0 = ptrArg0.read()
            let arg1 = ptrArg1.read()
            closuer(arg0, arg1)
        }
    }
}
/**
* Callback used to report page trasition events.
* 
* @param { RouteType } type - transition route type
* @param { number } progress - transition progess
* @returns { This }
* @relation declare type PageTransitionCallback = (type: RouteType, progress: number) => void
*/
public type PageTransitionCallback = (RouteType, Float64) -> Unit
/**
* Declare the jump method.
* 
* @relation declare enum RouteType 
*/
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouteType {
    /**
    * The page is not redirected.
    * 
    * @relation None
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    /**
    * Go to the next page.
    * 
    * @relation Push
    */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    /**
    * Redirect to a specified page.
    * 
    * @relation Pop
    */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Pop
    | ...

    func getValue(): Int32 {
        match (this) {
            case None => 0
            case Push => 1
            case Pop => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }

    static func parse(value: Int32) {
        match (value) {
            case 0 => None
            case 1 => Push
            case 2 => Pop
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}
/**
* Declare the sliding effect of transition.
* 
* @relation declare enum SlideEffect 
*/
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SlideEffect {
    /**
    * Swipe left.
    * 
    * @relation Left
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    /**
    * Swipe right.
    * 
    * @relation Right
    */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    /**
    * Swipe top.
    * 
    * @relation Top
    */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    /**
    * Swipe bottom.
    * 
    * @relation Bottom
    */
    | @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | ...

    func getValue(): Int32 {
        match (this) {
            case Left => 1
            case Right => 2
            case Top => 3
            case Bottom => 4
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class CommonTransition {
    /**
    * Called when the slide in effect of the transition is set.
    * 
    * @param { SlideEffect } value
    * @returns { This } 
    * @relation slide(value: SlideEffect): T
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func slide(value: SlideEffect): This {
        unsafe {
            FfiPageTransitionSlideEffect(value.getValue())
        }
        this
    }
    /**
    * Called when the translation effect of page transition is set.
    * 
    * @param { Length } x 
    * @param { Length } y 
    * @param { Length } z
    * @returns { This } 
    * @relation translate(value: TranslateOptions): T
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x!: ?Length = None, y!: ?Length = None, z!: ?Length = None): This {
        var x_ = transAppResourceToLength(x ?? 0.vp)
        var y_ = transAppResourceToLength(y ?? 0.vp)
        var z_ = transAppResourceToLength(z ?? 0.vp)
        unsafe {
            FfiPageTransitionTranslate(x_.value, y_.value, z_.value)
        }
        this
    }
    /**
    * Called when setting the zoom effect of page transition.
    * 
    * @param { Float32 } x 
    * @param { Float32 } y
    * @param { Float32 } z
    * @param { Length } centerX 
    * @param { Length } centerY
    * @returns { This } 
    * @relation scale(value: ScaleOptions): T
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(
        x!: ?Float32 = None,
        y!: ?Float32 = None,
        z!: ?Float32 = None,
        centerX!: ?Length = None,
        centerY!: ?Length = None
    ): This {
        unsafe {
            FfiPageTransitionScalePointer(Float64(x ?? 1.0), Float64(y ?? 1.0), Float64(z ?? 1.0), 
                transAppResourceToLength(centerX ?? 50.percent).value, transAppResourceToLength(centerY ?? 50.percent).value)
        }
        this
    }
    /**
    * Called when the transparency value of the starting point of entry or the ending point of exit is set.
    * 
    * @param { Float64 } value
    * @returns { This } 
    * @relation opacity(value: number): T
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func opacity(value: Float64): This {
        unsafe {
            FfiPageTransitionSetOpacity(value)
        }
        this
    }
}
/**
* Defines PageTransitionEnter Component.
* 
* @relation declare const PageTransitionEnter: PageTransitionEnterInterface
*/
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionEnter <: CommonTransition {
    /**
    * Called when page Jump animation is used.
    * 
    * @param { RouteType } routeType
    * @param { Int32 } duration
    * @param { Curve } curve
    * @param { Int32 } delay
    * @returns { This } 
    * @relation (value: PageTransitionOptions): PageTransitionEnterInterface
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        routeType!: ?RouteType = Option.None,
        duration!: ?Int32 = None,
        curve!: ?Curve = None,
        delay!: ?Int32 = None
    ) {
        let tmpRouteType = routeType ?? RouteType.None
        let tmpCurve = curve ?? Curve.Linear
        unsafe {
            try (cCurve = LibC.mallocCString(tmpCurve.getValue()).asResource()) {
                FfiPageTransitionEnterCreate(tmpRouteType.getValue(), duration ?? 1000, cCurve.value, delay ?? 0)
            }
        }
    }
    /**
    * Called frame by frame to customize pageTransition animation when the page enters.
    * The incoming parameter is the normalized progress of the current incoming animation.
    * 
    * @param { PageTransitionCallback } event
    * @returns { This } 
    * @throws { BusinessException } 190002 - The callback function is invalid.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEnter(event: ?PageTransitionCallback) {
        let tmpEvent = event ?? { _, _ =>}
        let wrapper = {
            ty: Int32, progress: Float64 => tmpEvent(RouteType.parse(ty), progress)
        }
        let lambdaData = CallbackCJTransitionEvent(wrapper)
        unsafe {
            FfiPageTransitionOnEnter(lambdaData.getID())
        }
        this
    }
}
/**
* Provide an interface to set transition style when a page exits.
* 
* @relation declare const PageTransitionExit: PageTransitionExitInterface
*/
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionExit <: CommonTransition {
    /**
    * Called when page Jump animation is used.
    * 
    * @param { RouteType } routeType
    * @param { Int32 } duration
    * @param { Curve } curve
    * @param { Int32 } delay
    * @returns { This } 
    * @relation (value: PageTransitionOptions): PageTransitionEnterInterface
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        routeType!: ?RouteType = Option.None,
        duration!: ?Int32 = None,
        curve!: ?Curve = None,
        delay!: ?Int32 = None
    ) {
        let tmpRouteType = routeType ?? RouteType.None
        let tmpCurve = curve ?? Curve.Linear
        unsafe {
            try (cCurve = LibC.mallocCString(tmpCurve.getValue()).asResource()) {
                FfiPageTransitionExitCreate(tmpRouteType.getValue(), duration ?? 1000, cCurve.value, delay ?? 0)
            }
        }
    }
    /**
    * Called frame by frame to customize pageTransition animation when the page exits.
    * The input parameter is the normalized progress of the current exit animation.
    * 
    * @param { PageTransitionCallback } event
    * @returns { This } 
    * @relation onExit(event: PageTransitionCallback): PageTransitionExitInterface
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onExit(event: ?PageTransitionCallback) {
        let tmpEvent = event ?? { _, _ =>}
        let wrapper = {
            ty: Int32, progress: Float64 => tmpEvent(RouteType.parse(ty), progress)
        }
        let lambdaData = CallbackCJTransitionEvent(wrapper)
        unsafe {
            FfiPageTransitionOnExit(lambdaData.getID())
        }
        this
    }
}
