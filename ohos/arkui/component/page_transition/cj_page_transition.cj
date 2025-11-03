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

package ohos.arkui.component.page_transition

import ohos.arkui.component.common.{Curve}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length, AppLog, LengthProp}
import ohos.ffi.{BaseCallBack}
import ohos.labels.APILevel
import std.deriving.Derive
import ohos.business_exception.BusinessException

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
* Callback used to report page transition events.
* 
* @param { RouteType } type - transition route type
* @param { Float64 } progress - transition progress. The value ranges from 0 to 1.
*/
public type PageTransitionCallback = (RouteType, Float64) -> Unit

/**
* Declare the jump method.
*/
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouteType {
    /**
    * The page is not redirected.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    /**
    * Go to the next page.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    /**
    * Redirect to a specified page.
    */
    | @!APILevel[
        since: "22",
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
*/
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SlideEffect {
    /**
    * Swipe left.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    /**
    * Swipe right.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    /**
    * Swipe top.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    /**
    * Swipe bottom.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    |
    /**
     *  Swipe start.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    Start
    |
    /**
     *  Swipe end.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    End
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

/**
* Provides interfaces for common transitions.
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class CommonTransition {
    /**
    * Called when the slide in effect of the transition is set.
    * 
    * @param { SlideEffect } value - Page transition slide effect.
    * @returns { This }
    */
    @!APILevel[
        since: "22",
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
     * @param { ?Length } [x] - X coordinate to translate to.
     * @param { ?Length } [y] - Y coordinate to translate to.
     * @param { ?Length } [z] - Z coordinate to translate to.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
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
    * @param { ?Float32 } x - The degree of scaling along the X-axis, 1 is original scale.
    * @param { ?Float32 } y - The degree of scaling along the Y-axis, 1 is original scale.
    * @param { ?Float32 } z - The degree of scaling along the Z-axis, 1 is original scale.
    * @param { ?Length } centerX - X coordinate of the scale center.
    * @param { ?Length } centerY - Y coordinate of the scale center.
    * @returns { This } 
    */
    @!APILevel[
        since: "22",
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
    * @param { Float64 } value - The opacity to transition to. The value ranges from 0 to 1.
    * @returns { This } 
    */
    @!APILevel[
        since: "22",
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
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionEnter <: CommonTransition {
    /**
    * Called when page Jump animation is used.
    * 
    * @param { ?RouteType } routeType - The transition route type. The default value is RouteType.None.
    * @param { ?Int32 } duration - The transition duration, in milliseconds. The default value is 1000.
    * @param { ?Curve } curve - The transition curve. The default value is Curve.Linear.
    * @param { ?Int32 } delay - The transition delay, in milliseconds. The default value is 0.
    */
    @!APILevel[
        since: "22",
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
    * @param { ?PageTransitionCallback } event - The callback on transition enter.
    * @returns { This } 
    * @throws { BusinessException } 190002 - The callback function is invalid.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEnter(event: ?PageTransitionCallback): This {
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
* Provide a class to set transition style when a page exits.
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionExit <: CommonTransition {
    /**
     * Called when page Jump animation is used.
     *
     * @param { ?RouteType } [routeType] - The transition route type. The default value is RouteType.None.
     * @param { ?Int32 } [duration] - The transition duration, in milliseconds. The default value is 1000.
     * @param { ?Curve } [curve] - The transition curve. The default value is Curve.Linear.
     * @param { ?Int32 } [delay] - The transition delay, in milliseconds. The default value is 0.
     * @returns { PageTransitionExit }
     */
    @!APILevel[
        since: "22",
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
    * @param { ?PageTransitionCallback } event - The callback on transition exit.
    * @returns { This } 
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onExit(event: ?PageTransitionCallback): This {
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
