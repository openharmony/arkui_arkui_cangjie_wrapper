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

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SymbolRenderingStrategy {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SINGLE
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MULTIPLE_COLOR
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    MULTIPLE_OPACITY
    | ...

    func getValue(): Int32 {
        match (this) {
            case SINGLE => 0
            case MULTIPLE_COLOR => 1
            case MULTIPLE_OPACITY => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parseValue(value: Int32): SymbolRenderingStrategy {
        match (value) {
            case 0 => SINGLE
            case 1 => MULTIPLE_COLOR
            case 2 => MULTIPLE_OPACITY
            case _ => SINGLE
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum SymbolEffectStrategy {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    SCALE
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    HIERARCHICAL
    | ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case SCALE => 1
            case HIERARCHICAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parseValue(value: Int32): SymbolEffectStrategy {
        match (value) {
            case 0 => NONE
            case 1 => SCALE
            case 2 => HIERARCHICAL
            case _ => NONE
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EffectScope {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    LAYER
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    WHOLE
    | ...

    func getValue(): Int32 {
        match (this) {
            case LAYER => 0
            case WHOLE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EffectDirection {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    DOWN
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    UP
    | ...

    func getValue(): Int32 {
        match (this) {
            case DOWN => 0
            case UP => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum EffectFillStyle {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    CUMULATIVE
    | @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    ITERATIVE
    | ...

    func getValue(): Int32 {
        match (this) {
            case CUMULATIVE => 0
            case ITERATIVE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

enum SymbolEffectType {
    NONE
    | SCALE
    | HIERARCHICAL
    | APPEAR
    | DISAPPEAR
    | BOUNCE
    | PULSE
    | REPLACE

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case SCALE => 1
            case HIERARCHICAL => 2
            case APPEAR => 3
            case DISAPPEAR => 4
            case BOUNCE => 5
            case PULSE => 6
            case REPLACE => 7
        }
    }
}

@C
struct EffectOptions {
    EffectOptions(
        let effectType: Int32,
        let effectScope: Int32,
        let effectDirection: Int32,
        let fillStyle: Int32,
        let isActive: Bool,
        let triggerValue: Int32,
        let activeExist: Bool,
        let triggerExist: Bool
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkSymbolGlyphCreate(symbolId: UInt32): Unit

    func FfiOHOSAceFrameworkSymbolGlyphFontColor(colors: VectorUInt32Handle): Unit

    func FfiOHOSAceFrameworkSymbolGlyphFontSize(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSymbolGlyphFontWeight(fontWeight: CString): Unit

    func FfiOHOSAceFrameworkSymbolGlyphRenderingStrategy(value: Int32): Unit

    func FfiOHOSAceFrameworkSymbolGlyphEffectStrategy(value: Int32): Unit

    func FfiOHOSAceFrameworkSymbolGlyphSymbolEffect(effectOptions: EffectOptions): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class SymbolEffect {
    SymbolEffect(
        let effectType!: SymbolEffectType = SymbolEffectType.NONE,
        let scope!: ?EffectScope = None,
        let direction!: ?EffectDirection = None,
        let fillStyle!: ?EffectFillStyle = None
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scope!: EffectScope = EffectScope.LAYER, direction!: EffectDirection = EffectDirection.DOWN) {
        super(effectType: SymbolEffectType.SCALE, scope: scope, direction: direction)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class HierarchicalSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fillStyle!: EffectFillStyle = EffectFillStyle.CUMULATIVE) {
        super(effectType: SymbolEffectType.HIERARCHICAL, fillStyle: fillStyle)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AppearSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scope!: EffectScope = EffectScope.LAYER) {
        super(effectType: SymbolEffectType.APPEAR, scope: scope)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DisappearSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scope!: EffectScope = EffectScope.LAYER) {
        super(effectType: SymbolEffectType.DISAPPEAR, scope: scope)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BounceSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scope!: EffectScope = EffectScope.LAYER, direction!: EffectDirection = EffectDirection.DOWN) {
        super(effectType: SymbolEffectType.BOUNCE, scope: scope, direction: direction)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ReplaceSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(scope!: EffectScope = EffectScope.LAYER) {
        super(effectType: SymbolEffectType.REPLACE, scope: scope)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PulseSymbolEffect <: SymbolEffect {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(effectType: SymbolEffectType.PULSE)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SymbolGlyph <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphCreate(0x0)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: AppResource) {
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphCreate(getResourceSymbolId(value))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: Array<Color>): This {
        let colors = FFIVectorUInt32(value.size)
        for (i in 0..value.size) {
            colors.setElement(i, value[i].toUInt32())
        }
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphFontColor(colors.getNativeHandle())
        }
        colors.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: Array<UInt32>): This {
        let colors = FFIVectorUInt32(value.size)
        for (i in 0..value.size) {
            colors.setElement(i, value[i])
        }
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphFontColor(colors.getNativeHandle())
        }
        colors.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: Array<AppResource>): This {
        let colors = FFIVectorUInt32(value.size)
        for (i in 0..value.size) {
            colors.setElement(i, getResourceColor(value[i]).toUInt32())
        }
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphFontColor(colors.getNativeHandle())
        }
        colors.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(size: Length): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphFontSize(size_.value, getLengthUnitOrFp(size_).getValue());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            let unsafeContent = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkSymbolGlyphFontWeight(unsafeContent);
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func renderingStrategy(value: SymbolRenderingStrategy): This {
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphRenderingStrategy(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func effectStrategy(value: SymbolEffectStrategy): This {
        unsafe {
            FfiOHOSAceFrameworkSymbolGlyphEffectStrategy(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func symbolEffect(symbolEffect: SymbolEffect, isActive!: ?Bool = None): This {
        unsafe {
            var effectType: Int32 = symbolEffect.effectType.getValue()
            var scope: Int32 = 0
            var direction: Int32 = 0
            var fillStyle: Int32 = 0
            var isActiveValue: Bool = false
            var activeExist: Bool = false
            if (let Some(v) <- symbolEffect.scope) {
                scope = v.getValue()
            }
            if (let Some(v) <- symbolEffect.direction) {
                direction = v.getValue()
            }
            if (let Some(v) <- symbolEffect.fillStyle) {
                fillStyle = v.getValue()
            }
            if (let Some(v) <- isActive) {
                isActiveValue = v
                activeExist = true
            }
            FfiOHOSAceFrameworkSymbolGlyphSymbolEffect(
                EffectOptions(effectType, scope, direction, fillStyle, isActiveValue, -1, activeExist, false))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func symbolEffect(symbolEffect: SymbolEffect, triggerValue!: Int32): This {
        unsafe {
            var effectType: Int32 = symbolEffect.effectType.getValue()
            var scope: Int32 = 0
            var direction: Int32 = 0
            var fillStyle: Int32 = 0
            if (let Some(v) <- symbolEffect.scope) {
                scope = v.getValue()
            }
            if (let Some(v) <- symbolEffect.direction) {
                direction = v.getValue()
            }
            if (let Some(v) <- symbolEffect.fillStyle) {
                fillStyle = v.getValue()
            }
            FfiOHOSAceFrameworkSymbolGlyphSymbolEffect(
                EffectOptions(effectType, scope, direction, fillStyle, false, triggerValue, false, true))
        }
        this
    }
}
