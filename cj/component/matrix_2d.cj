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
    func FfiOHOSAceFrameworkCanvasMatrixCtor(unit: Int32): Int64

    func FfiOHOSAceFrameworkCanvasMatrixIdentity(selfId: Int64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixInvert(selfId: Int64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixRotate(selfId: Int64, degree: Float64, rx: Float64, ry: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixTranslate(selfId: Int64, tx: Float64, ty: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixScale(selfId: Int64, sx: Float64, sy: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixGetScaleX(selfId: Int64): Float64

    func FfiOHOSAceFrameworkCanvasMatrixGetScaleY(selfId: Int64): Float64

    func FfiOHOSAceFrameworkCanvasMatrixGetRotateX(selfId: Int64): Float64

    func FfiOHOSAceFrameworkCanvasMatrixGetRotateY(selfId: Int64): Float64

    func FfiOHOSAceFrameworkCanvasMatrixGetTranslateX(selfId: Int64): Float64

    func FfiOHOSAceFrameworkCanvasMatrixGetTranslateY(selfId: Int64): Float64

    func FfiOHOSAceFrameworkCanvasMatrixSetScaleX(selfId: Int64, value: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixSetScaleY(selfId: Int64, value: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixSetRotateX(selfId: Int64, value: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixSetRotateY(selfId: Int64, value: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixSetTranslateX(selfId: Int64, value: Float64): Unit

    func FfiOHOSAceFrameworkCanvasMatrixSetTranslateY(selfId: Int64, value: Float64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Matrix2D <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT) {
        super(unsafe {
            let id = FfiOHOSAceFrameworkCanvasMatrixCtor(unit.getValue())
            id
        })
    }

    /**
     * Matrix2D constructor.
     *
     * @since 14
     */
    init(selfID: Int64) {
        super(selfID)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop scaleX: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetScaleX(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixSetScaleX(this.getID(), value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop scaleY: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetScaleY(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixSetScaleY(this.getID(), value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop rotateX: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetRotateX(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixSetRotateX(this.getID(), value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop rotateY: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetRotateY(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixSetRotateY(this.getID(), value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop translateX: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetTranslateX(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixSetTranslateX(this.getID(), value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop translateY: Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetTranslateY(this.getID())
            }
        }
        set(value) {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixSetTranslateY(this.getID(), value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func identity(): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixIdentity(this.getID());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixInvert(this.getID());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(degree: Float64, rx!: Float64 = 0.0, ry!: Float64 = 0.0): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixRotate(this.getID(), degree, rx, ry);
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(tx!: Float64 = 0.0, ty!: Float64 = 0.0): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixTranslate(this.getID(), tx, ty);
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(sx!: Float64 = 1.0, sy!: Float64 = 1.0): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixScale(this.getID(), sx, sy);
        }
        this
    }
}
