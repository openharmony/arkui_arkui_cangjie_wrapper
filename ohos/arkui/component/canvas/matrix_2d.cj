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

package ohos.arkui.component.canvas

import ohos.arkui.component.common.{LengthMetricsUnit}
import ohos.ffi.{releaseFFIData, RemoteDataLite}
import ohos.labels.{APILevel, Hide}

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

/**
 * 2D transformation matrix, supporting rotation, translation, and scaling of the X-axis and Y-axis
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Matrix2D <: RemoteDataLite {
    /**
     * Constructs a 2D change matrix object. The default value is the unit matrix.
     *
     * @param { ?LengthMetricsUnit } unit - the unit mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(unit!: ?LengthMetricsUnit = None) {
        super(unsafe {
            let tmpUnit = unit ?? LengthMetricsUnit.Default
            let id = FfiOHOSAceFrameworkCanvasMatrixCtor(tmpUnit.getValue())
            id
        })
    }

    init(selfID: Int64) {
        super(selfID)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Horizontal Zoom.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop scaleX: ?Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetScaleX(this.getID())
            }
        }
        set(value) {
            match (value) {
                case Some(v) => 
                    unsafe {
                        FfiOHOSAceFrameworkCanvasMatrixSetScaleX(this.getID(), v)
                    }
                case None => ()
            }
        }
    }

    /**
     * Vertical Zoom.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop scaleY: ?Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetScaleY(this.getID())
            }
        }
        set(value) {
            match (value) {
                case Some(v) => 
                    unsafe {
                        FfiOHOSAceFrameworkCanvasMatrixSetScaleY(this.getID(), v)
                    }
                case None => ()
            }
        }
    }

    /**
     * Horizontal Tilt.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop rotateX: ?Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetRotateX(this.getID())
            }
        }
        set(value) {
            match (value) {
                case Some(v) => 
                    unsafe {
                        FfiOHOSAceFrameworkCanvasMatrixSetRotateX(this.getID(), v)
                    }
                case None => ()
            }
        }
    }

    /**
     * Vertical Tilt.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop rotateY: ?Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetRotateY(this.getID())
            }
        }
        set(value) {
            match (value) {
                case Some(v) => 
                    unsafe {
                        FfiOHOSAceFrameworkCanvasMatrixSetRotateY(this.getID(), v)
                    }
                case None => ()
            }
        }
    }

    /**
     * Horizontal movement.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop translateX: ?Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetTranslateX(this.getID())
            }
        }
        set(value) {
            match (value) {
                case Some(v) => 
                    unsafe {
                        FfiOHOSAceFrameworkCanvasMatrixSetTranslateX(this.getID(), v)
                    }
                case None => ()
            }
        }
    }

    /**
     * Vertical movement.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public mut prop translateY: ?Float64 {
        get() {
            unsafe {
                FfiOHOSAceFrameworkCanvasMatrixGetTranslateY(this.getID())
            }
        }
        set(value) {
            match (value) {
                case Some(v) => 
                    unsafe {
                        FfiOHOSAceFrameworkCanvasMatrixSetTranslateY(this.getID(), v)
                    }
                case None => ()
            }
        }
    }

    /**
     * Transforms the current 2D matrix back to the identity matrix (i.e., without any rotational
     * translation scaling effect).
     *
     * @returns { This } - The instance of the matrix.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func identity(): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixIdentity(this.getID());
        }
        this
    }

    /**
     * Transform the current 2D matrix into an inverse matrix (that is, the transformation effect
     * is the opposite effect of the original).
     *
     * @returns { This } - The instance of the matrix.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixInvert(this.getID());
        }
        this
    }

    /**
     * Adds the rotation effect of the X and Y axes to the current matrix.
     *
     * @param { ?Float64 } degree - The rotation angle, clockwise in radians.
     * @param { ?Float64 } rx - Rotation effect of the X-axis.
     * @param { ?Float64 } ry - Rotation effect of the Y-axis.
     * @returns { This } - The instance of the matrix.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(degree: ?Float64, rx!: ?Float64 = None, ry!: ?Float64 = None): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixRotate(this.getID(), degree ?? 0.0, rx ?? 0.0, ry ?? 0.0);
        }
        this
    }

    /**
     * Adds the translation effect of the X and Y axes to the current matrix.
     *
     * @param { ?Float64 } tx - X-axis translation effect.
     * @param { ?Float64 } ty - Y-axis translation effect.
     * @returns { This } - The instance of the matrix.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(tx!: ?Float64 = None, ty!: ?Float64 = None): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixTranslate(this.getID(), tx ?? 0.0, ty ?? 0.0);
        }
        this
    }

    /**
     * Adds the scaling effect of the X and Y axes to the current matrix.
     *
     * @param { ?Float64 } sx - X-axis scaling effect.
     * @param { ?Float64 } sy - Y-axis scaling effect.
     * @returns { This } - The instance of the matrix.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(sx!: ?Float64 = None, sy!: ?Float64 = None): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasMatrixScale(this.getID(), sx ?? 1.0, sy ?? 1.0);
        }
        this
    }
}
