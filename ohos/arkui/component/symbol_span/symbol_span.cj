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

package ohos.arkui.component.symbol_span

import ohos.base.*

foreign {
    func FfiOHOSAceFrameworkSymbolSpanCreate(id: UInt32): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetFontColor(array: VectorUInt32Handle): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetFontSize(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetFontWeight(value: CString): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetSymbolRenderingStrategy(strategy: Int32): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetEffectStrategy(strategy: Int32): Unit
}