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

protected package ohos.arkui.component.text_timer

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

public type VectorNativeTextTimerShadow = CPointer<Unit>

foreign {
    func FfiTextTimerCreateVectorNativeTextShadow(size: Int64): VectorNativeTextTimerShadow

    func FfiTextTimerVectorNativeTextShadowSetElement(vec: VectorNativeTextTimerShadow, index: Int64,
        thisShadow: NativeTextTimerShadow): Unit

    func FfiTextTimerVectorNativeTextShadowDelete(vec: VectorNativeTextTimerShadow): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend ShadowOptions {
    func optionToNativeTextTimerShadow(): NativeTextTimerShadow {
        return NativeTextTimerShadow(this.radius, this.offsetX, this.offsetY, this.color, this.fill, this.shadowType)
    }
}

@C
struct NativeTextTimerShadow {
    NativeTextTimerShadow(
        let radius: Float64,
        let offsetX: Float64,
        let offsetY: Float64,
        let color: UInt32,
        let fill: Bool,
        let shadowType: UInt32
    ) {}
}

class TextTimerVectorNativeTextShadow {
    private let vecHandle: VectorNativeTextTimerShadow

    init(vec: VectorNativeTextTimerShadow) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FfiTextTimerCreateVectorNativeTextShadow(size) }
    }

    func setElement(index: Int64, value: NativeTextTimerShadow): Unit {
        unsafe { FfiTextTimerVectorNativeTextShadowSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FfiTextTimerVectorNativeTextShadowDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeTextTimerShadow {
        vecHandle
    }
}

foreign {
    func FfiOHOSAceFrameworkTextTimerCreate(isCountDown: Bool, count: Int64, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextTimerSetFormat(value: CString): Unit

    func FfiOHOSAceFrameworkTextTimerSetOnTimer(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextTimerSetFontSize(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextTimerSetFontColor(textColor: UInt32): Unit

    func FfiOHOSAceFrameworkTextTimerSetFontStyle(fontStyle: Int32): Unit

    func FfiOHOSAceFrameworkTextTimerSetFontWeight(fontWeight: CString): Unit

    func FfiOHOSAceFrameworkTextTimerSetFontFamily(fontFamily: CString): Unit

    func FfiOHOSAceFrameworkTextTimerSetTextShadow(value: VectorNativeTextTimerShadow): Unit

    func FfiOHOSAceFrameworkTextTimerControllerCtor(): Int64

    func FfiOHOSAceFrameworkTextTimerControllerStart(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextTimerControllerPause(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextTimerControllerReset(selfID: Int64): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextTimerController <: RemoteDataLite {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkTextTimerControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start() {
        unsafe {
            FfiOHOSAceFrameworkTextTimerControllerStart(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pause() {
        unsafe {
            FfiOHOSAceFrameworkTextTimerControllerPause(this.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset() {
        unsafe {
            FfiOHOSAceFrameworkTextTimerControllerReset(this.getID())
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class TextTimer <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(isCountDown!: Bool = false, count!: Int64 = 60000,
        controller!: TextTimerController = TextTimerController()) {
        unsafe {
            FfiOHOSAceFrameworkTextTimerCreate(isCountDown, count, controller.getID())
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func format(value: String): This {
        unsafe {
            let valueCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextTimerSetFormat(valueCString)
            LibC.free(valueCString)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTimer(callback: (Int64, Int64) -> Unit): This {
        let lambdaData = Callback2Param<Int64, Int64, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetOnTimer(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetFontColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetFontStyle(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkTextTimerSetFontWeight(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: String): This {
        unsafe {
            var unsafeFontFamily = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextTimerSetFontFamily(unsafeFontFamily)
            LibC.free(unsafeFontFamily)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        fontFamily(getResourceString(content))
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(values: Array<ShadowOptions>): This {
        let vecValueHandle = TextTimerVectorNativeTextShadow(values.size)
        for (i in 0..values.size) {
            vecValueHandle.setElement(i, values[i].optionToNativeTextTimerShadow())
        }
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetTextShadow(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.COLOR,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        color!: Color = Color.BLACK,
        fill!: Bool = false
    ): This {
        let thisShadow: NativeTextTimerShadow = NativeTextTimerShadow(radius, offsetX, offsetY, color.toUInt32(), fill,
            shadowType.getValue())
        let vecValueHandle = TextTimerVectorNativeTextShadow(1)
        vecValueHandle.setElement(0, thisShadow)
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetTextShadow(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.COLOR,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        color!: UInt32,
        fill!: Bool = false
    ): This {
        textShadow(
            radius: radius,
            shadowType: shadowType,
            offsetX: offsetX,
            offsetY: offsetY,
            color: Color(color),
            fill: fill
        )
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(
        radius!: Float64,
        shadowType!: ShadowType = ShadowType.COLOR,
        offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0,
        color!: AppResource,
        fill!: Bool = false
    ): This {
        textShadow(
            radius: radius,
            shadowType: shadowType,
            offsetX: offsetX,
            offsetY: offsetY,
            color: Color(getResourceColor(color).toUInt32()),
            fill: fill
        )
        this
    }
}
