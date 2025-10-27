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

package ohos.arkui.component.text_timer

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource.*
import ohos.labels.APILevel

type VectorNativeTextTimerShadow = CPointer<Unit>

foreign {
    func FfiTextTimerCreateVectorNativeTextShadow(size: Int64): VectorNativeTextTimerShadow

    func FfiTextTimerVectorNativeTextShadowSetElement(vec: VectorNativeTextTimerShadow, index: Int64,
        thisShadow: NativeTextTimerShadow): Unit

    func FfiTextTimerVectorNativeTextShadowDelete(vec: VectorNativeTextTimerShadow): Unit
}

extend ShadowOptions {
    func optionToNativeTextTimerShadow(): NativeTextTimerShadow {
        return NativeTextTimerShadow(this.radius ?? 0.0,
            this.offsetX ?? 0.0, this.offsetY ?? 0.0, (this.color ?? Color.Black).toUInt32(), this.fill ?? false, (this.shadowType ?? ShadowType.Color).getValue())
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

/**
 * Provides a way to control the process.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextTimerController <: RemoteDataLite {
    /**
     * A constructor used to create a TextTimerController object.
     */
    @!APILevel[
        since: "22",
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

    /**
     * Provides a start event for timer.
     *
     * @returns { Unit } Returns nothing.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextTimerControllerStart(this.getID())
        }
    }

    /**
     * Provides a pause event for timer.
     *
     * @returns { Unit } Returns nothing.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pause(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextTimerControllerPause(this.getID())
        }
    }

    /**
     * Provides an event to reset timer.
     *
     * @returns { Unit } Returns nothing.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextTimerControllerReset(this.getID())
        }
    }
}

/**
 * Defines TextTimer Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextTimer <: CommonMethodComponent<TextTimer> & TextTimerAttribute {
    /**
     * A constructor used to create a TextTimer object.
     *
     * @param { ?Bool } isCountDown - Whether to count down.
     * @param { ?Int64 } count - The initial count value.
     * @param { ?TextTimerController } controller - The controller for the text timer.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(isCountDown!: ?Bool = None, count!: ?Int64 = None,
        controller!: ?TextTimerController = None) {
        let tmpController = controller ?? TextTimerController()
        unsafe {
            FfiOHOSAceFrameworkTextTimerCreate(isCountDown ?? false, count ?? 60000, tmpController.getID())
        }
    }

    /**
     * Sets the custom format.
     * The value must contain at least one of the following keywords: HH, mm, ss, and SS.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the specified date format is yy, MM, or dd, the default value is used instead.
     * </p>
     *
     * @param { ?String } value - Custom format.
     * @default 'HH:mm:ss.SS'
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func format(value: ?String): This {
        unsafe {
            let valueCString = LibC.mallocCString(value ?? "HH:mm:ss.SS")
            FfiOHOSAceFrameworkTextTimerSetFormat(valueCString)
            LibC.free(valueCString)
        }
        this
    }

    /**
     * Triggered when the time text changes.
     * This event is not triggered when the screen is locked or the application is running in the background.
     * When high-precision formats (such as SSS or SS) are used, the callback interval may vary.
     *
     * @param { ?(Int64, Int64) -> Unit } event - The callback function when the time text changes.
     *                                          The first parameter is the timestamp,
     *                                          and the second parameter is the elapsed time in milliseconds.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTimer(event: ?(Int64, Int64) -> Unit): This {
        let tmpEvent = event ?? { _, _ => }
        let lambdaData = Callback2Param<Int64, Int64, Unit>(tmpEvent)
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetOnTimer(lambdaData.getID())
        }
        this
    }

    /**
     * Sets the font size.
     *
     * @param { ?Length } value - Font size. The default font size is 16.fp.
     * <br>If fontSize is of the number type, the unit fp is used.
     * <br>The value cannot be a percentage.
     * @default 16.fp
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        var value_ = transAppResourceToLength(value ?? 16.0.fp)
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

    /**
     * Sets the font color.
     *
     * @param { ?ResourceColor } value - The font color.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetFontColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Sets the font style.
     *
     * @param { ?FontStyle } value - Font style.
     * @default FontStyle.Normal.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        let tmpValue = value ?? FontStyle.Normal
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetFontStyle(tmpValue.getValue())
        }
        this
    }

    /**
     * Sets the font weight.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the value is too large, the text may be clipped depending on the font.
     * </p>
     *
     * @param { ?FontWeight } value - Font weight.
     * <br>For the number type, Value range: [100, 900], at an interval of 100.
     * <br>A larger value indicates a heavier font weight.
     * <br>For the string type, only strings that represent a number.
     * @default 400
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        let tmpValue = value ?? FontWeight.Normal
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(tmpValue.getValue())
            FfiOHOSAceFrameworkTextTimerSetFontWeight(unsafeFontWeight)
            LibC.free(unsafeFontWeight)
        }
        this
    }

    /**
     * Sets the font family.
     *
     * @param { ?ResourceStr } value - Font family.
     * @default 'HarmonyOS Sans'.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        let value_ = transResourceStrToString(value ?? "HarmonyOS Sans")
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(value_).asResource()) {
                FfiOHOSAceFrameworkTextTimerSetFontFamily(unsafeFontFamily.value)
            }
        }
        this
    }

    /**
     * Sets the text shadow.
     * This API does not work with the fill attribute or coloring strategy.
     *
     * @param { ?Array<ShadowOptions> } value - The shadow options.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: ?Array<ShadowOptions>): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let vecValueHandle = TextTimerVectorNativeTextShadow(tmpValue.size)
        for (i in 0..tmpValue.size) {
            vecValueHandle.setElement(i, tmpValue[i].optionToNativeTextTimerShadow())
        }
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetTextShadow(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }

    /**
     * Sets the text shadow.
     * This API does not work with the fill attribute or coloring strategy.
     *
     * @param { ?ShadowOptions } value - The shadow options.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: ?ShadowOptions): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let thisShadow: NativeTextTimerShadow = NativeTextTimerShadow(tmpValue.radius ?? 0.0,
            tmpValue.offsetX ?? 0.0, tmpValue.offsetY ?? 0.0, transAppResourceToResourceColor(tmpValue.color ?? Color.Black), tmpValue.fill ?? false,
            (tmpValue.shadowType ?? ShadowType.Color).getValue())
        let vecValueHandle = TextTimerVectorNativeTextShadow(1)
        vecValueHandle.setElement(0, thisShadow)
        unsafe {
            FfiOHOSAceFrameworkTextTimerSetTextShadow(vecValueHandle.getNativeHandle())
        }
        vecValueHandle.free()
        this
    }
}
