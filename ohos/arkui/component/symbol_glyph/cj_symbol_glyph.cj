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

package ohos.arkui.component.symbol_glyph

import ohos.base.*

enum SymbolEffectType {
    NONE |
    SCALE |
    HIERARCHICAL |
    APPEAR |
    DISAPPEAR |
    BOUNCE |
    PULSE |
    REPLACE |
    ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case SCALE => 1
            case HIERARCHICAL => 2
            case APPEAR => 3
            case DISAPPEAR => 4
            case BOUNCE => 5
            case PULSE => 6
            case _ => 7
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
