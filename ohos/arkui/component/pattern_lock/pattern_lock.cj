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

package ohos.arkui.component.pattern_lock

import ohos.arkui.component.common.{CommonMethodComponent}
import ohos.arkui.component.util.{transAppResourceToLength, transAppResourceToResourceColor}
import ohos.base.{ResourceColor, Length, VectorInt32Handle, FFIVectorInt32, LengthProp}
import ohos.ffi.{RemoteDataLite, releaseFFIData, Callback1Param}
import ohos.labels.APILevel

@C
struct CJCircleStyleOptions {
    CJCircleStyleOptions(
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let enableWaveEffect: Bool
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkPatternLockCreate(controller: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockActivateCircleStyle(options: CJCircleStyleOptions): Unit

    func FfiOHOSAceFrameworkPatternLockonDotConnect(callback: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockOnPatternComplete(callback: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockSelectedColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockAutoReset(value: Bool): Unit

    func FfiOHOSAceFrameworkPatternLockPathColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockActiveColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockRegularColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkPatternLockCircleRadius(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPatternLockSideLength(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPatternLockStrokeWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkPatternLockControllerCreate(): Int64

    func FfiOHOSAceFrameworkPatternLockControllerReset(selfID: Int64): Unit

    func FfiOHOSAceFrameworkPatternLockControllerSetChallengeResult(selfID: Int64, challengeResult: Int64): Unit
}

/**
 * Provides methods for control pattern lock component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PatternLockController <: RemoteDataLite {
    /**
     * A constructor used to create a PatternLockController instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe { FfiOHOSAceFrameworkPatternLockControllerCreate() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Reset pattern lock.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reset(): Unit {
        unsafe {
            FfiOHOSAceFrameworkPatternLockControllerReset(this.getID())
        }
    }
}

/**
 * Defines PatternLock Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PatternLock <: CommonMethodComponent<PatternLock> & PatternLockAttribute {
    /**
     * Constructor.
     *
     * @param { ?PatternLockController } [controller] - Sets PatternLock component controller, which can be used to control component status reset.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: ?PatternLockController = None) {
        unsafe {
            FfiOHOSAceFrameworkPatternLockCreate(controller?.getID() ?? -1)
        }
    }

    /**
     * Sets the fill color of the grid dot in the selected state.
     *
     * @param { ?ResourceColor } value - Fill color of the grid dot in the selected state.
     * @default { ?ResourceColor } - 0xff182431
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ?ResourceColor): This {
        let tmpValue = value ?? 0xFF182431
        unsafe {
            FfiOHOSAceFrameworkPatternLockSelectedColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Sets the path color.
     *
     * @param { ?ResourceColor } value - Path color.
     * @default { ?ResourceColor } - 0x33182431
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pathColor(value: ?ResourceColor): This {
        let tmpValue = value ?? 0x33182431
        unsafe {
            FfiOHOSAceFrameworkPatternLockPathColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Sets the fill color of the grid dot in the activated state, which is when the dot is highlighted but not selected.
     *
     * @param { ?ResourceColor } value - Fill color of the grid dot in the activated state.
     * @default { ?ResourceColor } - 0xff182431
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func activeColor(value: ?ResourceColor): This {
        let tmpValue = value ?? 0xFF182431
        unsafe {
            FfiOHOSAceFrameworkPatternLockActiveColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Sets the fill color of the grid dot in the unselected state.
     *
     * @param { ?ResourceColor } value - Fill color of the grid dot in the unselected state.
     * @default { ?ResourceColor } - 0xff182431
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func regularColor(value: ?ResourceColor): This {
        let tmpValue = value ?? 0xFF182431
        unsafe {
            FfiOHOSAceFrameworkPatternLockRegularColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Sets whether to allow the user to reset the component status (that is, clear the input) by touching the component
     * again after the input is complete.
     *
     * @param { ?Bool } value - Whether to allow the user to reset the component status (that is, clear the input) by
     * touching the component again after the input is complete. The default value is true.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoReset(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockAutoReset(value ?? true)
        }
        this
    }

    /**
     * Sets the radius of the dots in a grid.
     *
     * <p><strong>NOTE</strong>:
     * <br>If this attribute is set to 0 or a negative value, the default value is used.
     * </p>
     *
     * @param { ?Length } value - Radius of the dots in a grid. The default value is 6.vp.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func circleRadius(value: ?Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockCircleRadius(transAppResourceToLength(value ?? 6.0.vp).value,
                transAppResourceToLength(value ?? 6.0.vp).unitType.getValue())
        }
        this
    }

    /**
     * Sets the width and height (same value) of the component.
     *
     * <p><strong>NOTE</strong>:
     * <br>If this attribute is set to 0 or a negative number, the component is not displayed.
     * </p>
     *
     * @param { ?Length } value - Width and height of the component. The default value is 288.vp.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideLength(value: ?Length): This {
        let tmpValue = value ?? 288.0.vp
        unsafe {
            FfiOHOSAceFrameworkPatternLockSideLength(transAppResourceToLength(tmpValue).value,
                transAppResourceToLength(tmpValue).unitType.getValue())
        }
        this
    }

    /**
     * Sets the width of the path stroke.
     *
     * <p><strong>NOTE</strong>:
     * <br>If this attribute is set to **0** or a negative value, the path stroke is not displayed.
     * </p>
     *
     * @param { ?Length } value - Width of the path stroke. The default value is 12.vp.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pathStrokeWidth(value: ?Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockStrokeWidth(transAppResourceToLength(value ?? 12.0.vp).value,
                transAppResourceToLength(value ?? 12.0.vp).unitType.getValue())
        }
        this
    }

    /**
     * Invoked when the pattern password input is complete.
     *
     * @param { ?(Array<Int32>) -> Unit } callback - Callback function triggered when pattern password input is complete.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPatternComplete(callback: ?(Array<Int32>) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        let wrapper = {
            ffiVector: VectorInt32Handle =>
            let handle = FFIVectorInt32(ffiVector)
            var arr: Array<Int32> = Array<Int32>(handle.getSize()) {
                idx => handle.getElement(idx)
            }
            tmpCallback(arr)
        }
        let lambdaData = Callback1Param<VectorInt32Handle, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkPatternLockOnPatternComplete(lambdaData.getID())
        }
        this
    }
}
