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

    public func invoke(argc: Int32, argv: CPointer<CPointer<Unit>>, _: CPointer<Unit>): Unit {
        if (argc != 2) {
            throw InvalidArgsException()
        }
        if (argv.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw InvalidArgsException()
        }
        let ptrArg0 = unsafe { CPointer<Int32>(argv.read()) }
        if (ptrArg0.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw InvalidArgsException()
        }
        let ptrArg1 = unsafe { CPointer<Float64>(argv.read(1)) }
        if (ptrArg1.isNull()) {
            AppLog.error("Invalid argument, failed to invoke CallbackCJTransitionEvent")
            throw InvalidArgsException()
        }
        unsafe {
            let arg0 = ptrArg0.read()
            let arg1 = ptrArg1.read()
            closuer(arg0, arg1)
        }
    }
}

public type PageTransitionCallback = (RouteType, Float64) -> Unit

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouteType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Pop
    | ...

    func getValue(): Int32 {
        match (this) {
            case None => 0
            case Push => 1
            case Pop => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32) {
        match (value) {
            case 0 => None
            case 1 => Push
            case 2 => Pop
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SlideEffect {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        21,
        stagemodelonly: true,
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
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class CommonTransition {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func slide(value: SlideEffect): This {
        unsafe {
            FfiPageTransitionSlideEffect(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This {
        var x_ = transAppResourceToLength(x)
        var y_ = transAppResourceToLength(y)
        var z_ = transAppResourceToLength(z)
        AceLog.debug("translate in")
        unsafe {
            FfiPageTransitionTranslate(x_.value, y_.value, z_.value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(
        x!: Float32 = 1.0,
        y!: Float32 = 1.0,
        z!: Float32 = 1.0,
        centerX!: Length = 50.percent,
        centerY!: Length = 50.percent
    ): This {
        unsafe {
            FfiPageTransitionScalePointer(Float64(x), Float64(y), Float64(z), transAppResourceToLength(centerX).value,
                transAppResourceToLength(centerY).value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func opacity(value: Float64): This {
        AceLog.debug("translate in")
        unsafe {
            FfiPageTransitionSetOpacity(value)
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionEnter <: CommonTransition {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        routeType!: RouteType = RouteType.None,
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0
    ) {
        unsafe {
            try (cCurve = LibC.mallocCString(curve.getValue()).asResource()) {
                FfiPageTransitionEnterCreate(routeType.getValue(), duration, cCurve.value, delay)
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEnter(event: PageTransitionCallback) {
        let wrapper = {
            ty: Int32, progress: Float64 => event(RouteType.parse(ty), progress)
        }
        let lambdaData = CallbackCJTransitionEvent(wrapper)
        unsafe {
            FfiPageTransitionOnEnter(lambdaData.getID())
        }
        this
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionExit <: CommonTransition {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        routeType!: RouteType = RouteType.None,
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0
    ) {
        unsafe {
            try (cCurve = LibC.mallocCString(curve.getValue()).asResource()) {
                FfiPageTransitionExitCreate(routeType.getValue(), duration, cCurve.value, delay)
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onExit(event: PageTransitionCallback) {
        let wrapper = {
            ty: Int32, progress: Float64 => event(RouteType.parse(ty), progress)
        }
        let lambdaData = CallbackCJTransitionEvent(wrapper)
        unsafe {
            FfiPageTransitionOnExit(lambdaData.getID())
        }
        this
    }
}
