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

foreign func FfiPageTransitionEnterCreate(`type`: Int32, duration: Int32, curve: CString, delay: Int32): Unit

foreign func FfiPageTransitionExitCreate(`type`: Int32, duration: Int32, curve: CString, delay: Int32): Unit

foreign func FfiPageTransitionSlideEffect(slide_effect: Int32): Unit

foreign func FfiPageTransitionTranslate(x: Float64, y: Float64, z: Float64): Unit

foreign func FfiPageTransitionScalePointer(x: Float64, y: Float64, z: Float64, centerX: Float64, centerY: Float64): Unit

foreign func FfiPageTransitionSetOpacity(value: Float64): Unit

foreign func FfiPageTransitionOnEnter(callback: Int64): Unit

foreign func FfiPageTransitionOnExit(callback: Int64): Unit

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum RouteType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    None
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Push
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
}

type CJRouteType = Int32

func cjRouteTypeParse(cjv: CJRouteType): RouteType {
    if (cjv == 0) {
        return RouteType.Pop
    } else if (cjv == 1) {
        return RouteType.Push
    } else {
        return RouteType.None
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SlideEffect {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Left
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Right
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    START
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    END
    | ...

    func getValue(): Int32 {
        match (this) {
            case Left => 1
            case Right => 2
            case Top => 3
            case Bottom => 4
            case START => 5
            case END => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public PageTransitionOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var `type`!: RouteType = RouteType.None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var duration!: Int32 = 1000,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var curve!: Curve = Curve.Linear,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var delay!: Int32 = 0
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class PageTransition {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func opacity(value: Int64) {
        opacity(Float64(value))
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionEnter <: PageTransition {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: PageTransitionOptions) {
        unsafe {
            try (cCurve = LibC.mallocCString(value.curve.getValue()).asResource()) {
                FfiPageTransitionEnterCreate(value.`type`.getValue(), value.duration, cCurve.value, value.delay)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEnter(event: (RouteType, Float64) -> Unit) {
        let wrapper = {
            ty: CJRouteType, progress: Float64 => event(cjRouteTypeParse(ty), progress)
        }
        let lambdaData = CallbackCJTransitionEvent(wrapper)
        unsafe {
            FfiPageTransitionOnEnter(lambdaData.getID())
        }
        this
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PageTransitionExit <: PageTransition {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: PageTransitionOptions) {
        unsafe {
            try (cCurve = LibC.mallocCString(value.curve.getValue()).asResource()) {
                FfiPageTransitionExitCreate(value.`type`.getValue(), value.duration, cCurve.value, value.delay)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onExit(event: (RouteType, Float64) -> Unit) {
        let wrapper = {
            ty: CJRouteType, progress: Float64 => event(cjRouteTypeParse(ty), progress)
        }
        let lambdaData = CallbackCJTransitionEvent(wrapper)
        unsafe {
            FfiPageTransitionOnExit(lambdaData.getID())
        }
        this
    }
}
