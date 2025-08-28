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

package ohos.arkui.component.pattern_lock

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.arkui.component.view.*
import ohos.base.*
import ohos.ffi.*
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
 *
 * @relation class PatternLockController
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PatternLockController <: RemoteDataLite {
    /**
     * A constructor used to create a PatternLockController instance.
     *
     * @relation constructor()
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     *
     * @relation reset(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 *
 * @relation const PatternLock: PatternLockInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PatternLock <: ViewBase {
    /**
     * Constructor.
     *
     * @param { PatternLockController } [controller]  controller
     * @returns { PatternLock }
     * @relation (controller?: PatternLockController): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @param { ResourceColor } value - Fill color of the grid dot in the selected state, Default value is '#ff182431'.
     * @returns { This }
     * @relation selectedColor(value: ResourceColor): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockSelectedColor(value.toUInt32())
        }
        this
    }

    /**
     * Sets the path color.
     *
     * @param { ResourceColor } value - Path color.
     * @returns { This }
     * @relation pathColor(value: ResourceColor): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pathColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockPathColor(value.toUInt32())
        }
        this
    }

    /**
     * Sets the fill color of the grid dot in the activated state, which is when the dot is highlighted but not selected.
     *
     * @param { ResourceColor } value - Fill color of the grid dot in the activated state.
     * @returns { This }
     * @relation activeColor(value: ResourceColor): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func activeColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockActiveColor(value.toUInt32())
        }
        this
    }

    /**
     * Sets the fill color of the grid dot in the unselected state.
     *
     * @param { ResourceColor } value - Fill color of the grid dot in the unselected state, Default value is '#ff182431'.
     * @returns { This }
     * @relation regularColor(value: ResourceColor): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func regularColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockRegularColor(value.toUInt32())
        }
        this
    }

    /**
     * Sets whether to allow the user to reset the component status (that is, clear the input) by touching the component
     * again after the input is complete.
     *
     * @param { Bool } value - Whether to allow the user to reset the component status (that is, clear the input) by
     * touching the component again after the input is complete, Default value is true.
     * @returns { This }
     * @relation autoReset(value: boolean): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func autoReset(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockAutoReset(value)
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
     * @param { Length } value - Radius of the dots in a grid, Default value is 6vp.
     * @returns { This }
     * @relation circleRadius(value: Length): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func circleRadius(value: Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockCircleRadius(transAppResourceToLength(value).value,
                transAppResourceToLength(value).unitType.getValue())
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
     * @param { Length } value - Width and height of the component, Default value is 288vp.
     * @returns { This }
     * @relation sideLength(value: Length): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func sideLength(value: Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockSideLength(transAppResourceToLength(value).value,
                transAppResourceToLength(value).unitType.getValue())
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
     * @param { Length } value - Width of the path stroke, Default value is 12vp.
     * @returns { This }
     * @relation pathStrokeWidth(value: number | string): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pathStrokeWidth(value: Length): This {
        unsafe {
            FfiOHOSAceFrameworkPatternLockStrokeWidth(transAppResourceToLength(value).value,
                transAppResourceToLength(value).unitType.getValue())
        }
        this
    }

    /**
     * Invoked when the pattern password input is complete.
     *
     * @param { function } callback
     * @returns { This }
     * @relation onPatternComplete(callback: (input: Array<number>) => void): PatternLockAttribute
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPatternComplete(callback: (Array<Int32>) -> Unit): This {
        let wrapper = {
            ffiVector: VectorInt32Handle =>
            let handle = FFIVectorInt32(ffiVector)
            var arr: Array<Int32> = Array<Int32>(handle.getSize()) {
                idx => handle.getElement(idx)
            }
            callback(arr)
        }
        let lambdaData = Callback1Param<VectorInt32Handle, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkPatternLockOnPatternComplete(lambdaData.getID())
        }
        this
    }
}
