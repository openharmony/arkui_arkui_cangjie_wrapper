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

foreign {
    func FfiOHOSAceFrameworkSymbolSpanCreate(id: UInt32): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetFontColor(array: VectorUInt32Handle): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetFontSize(size: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetFontWeight(value: CString): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetSymbolRenderingStrategy(strategy: Int32): Unit

    func FfiOHOSAceFrameworkSymbolSpanSetEffectStrategy(strategy: Int32): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SymbolSpan <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: AppResource) {
        unsafe {
            let symbolId = getResourceSymbolId(value)
            FfiOHOSAceFrameworkSymbolSpanCreate(symbolId)
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
        var valueArray = Array<UInt32>(value.size, {i => value[i].toUInt32()})
        fontColor(valueArray)
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: Array<UInt32>): This {
        let vecFFi = FFIVectorUInt32(value.size)
        for (idx in 0..value.size) {
            vecFFi.setElement(idx, value[idx])
        }
        unsafe {
            FfiOHOSAceFrameworkSymbolSpanSetFontColor(vecFFi.getNativeHandle())
        }
        vecFFi.free()
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
        var colorList = Array<UInt32>(value.size, {i => getResourceColor(value[i]).toUInt32()})
        fontColor(colorList)
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSymbolSpanSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
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
    public func fontWeight(value: Int64): This {
        fontWeight(value.toString())
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: String): This {
        unsafe {
            let valueStr = LibC.mallocCString(value)
            FfiOHOSAceFrameworkSymbolSpanSetFontWeight(valueStr)
            LibC.free(valueStr)
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
        fontWeight(value.getValue())
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
            FfiOHOSAceFrameworkSymbolSpanSetSymbolRenderingStrategy(value.getValue())
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
            FfiOHOSAceFrameworkSymbolSpanSetEffectStrategy(value.getValue())
        }
        this
    }
}
