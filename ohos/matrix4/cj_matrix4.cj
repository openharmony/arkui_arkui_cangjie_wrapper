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

package ohos.matrix4

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct FfiScaleParams {
    FfiScaleParams(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let centerX: Float32,
        let centerY: Float32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleOption {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let x: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let y: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let z: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let centerX: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let centerY: Float32

    public init(
        x!: Float32 = 1.0,
        y!: Float32 = 1.0,
        z!: Float32 = 1.0,
        centerX!: Float32 = 0.0,
        centerY!: Float32 = 0.0
    ) {
        this.x = x
        this.y = y
        this.z = z
        this.centerX = centerX
        this.centerY = centerY
    }
}

@C
struct FfiRotateParams {
    FfiRotateParams(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let angle: Float32,
        let centerX: Float32,
        let centerY: Float32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotateOption {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let x: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let y: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let z: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let angle: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let centerX: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let centerY: Float32

    public init(
        x!: Float32 = 0.0,
        y!: Float32 = 0.0,
        z!: Float32 = 0.0,
        angle!: Float32 = 0.0,
        centerX!: Float32 = 0.0,
        centerY!: Float32 = 0.0
    ) {
        this.x = x
        this.y = y
        this.z = z
        this.angle = angle
        this.centerX = centerX
        this.centerY = centerY
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
public class TranslateOption {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let x: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let y: Float32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let z: Float32

    public init(
        x!: Float32 = 0.0,
        y!: Float32 = 0.0,
        z!: Float32 = 0.0
    ) {
        this.x = x
        this.y = y
        this.z = z
    }
}

@C
struct FfiPoint {
    FfiPoint(
        let x: Float64,
        let y: Float64
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Point {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let x: Float64
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let y: Float64

    public init(
        x: Float64,
        y: Float64
    ) {
        this.x = x
        this.y = y
    }
}

@C
struct FfiPolyToPolyOptions {
    FfiPolyToPolyOptions(
        let srcX: VectorInt32Handle,
        let srcY: VectorInt32Handle,
        let srcIndex: Int32,
        let dstX: VectorInt32Handle,
        let dstY: VectorInt32Handle,
        let dstIndex: Int32,
        let pointCount: Int32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PolyToPolyOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let src: Array<Point>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let srcIndex: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let dst: Array<Point>
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let dstIndex: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let pointCount: Int32

    public init(
        src!: Array<Point>,
        srcIndex!: Int32 = 0,
        dst!: Array<Point>,
        dstIndex!: Int32 = 0,
        pointCount!: Int32 = Int32(src.size) / 2
    ) {
        this.src = src
        this.srcIndex = srcIndex
        this.dst = dst
        this.dstIndex = dstIndex
        this.pointCount = pointCount
    }
}

foreign {
    func FfiOHOSMatrix4Init(array: VectorFloat64Handle): Int64

    func FfiOHOSMatrix4Identity(): Int64

    func FfiOHOSMatrix4Copy(id: Int64): Int64

    func FfiOHOSMatrix4Invert(id: Int64): Unit

    func FfiOHOSMatrix4Combine(origin: Int64, target: Int64): Unit

    func FfiOHOSMatrix4Translate(id: Int64, x: Float32, y: Float32, z: Float32): Unit

    func FfiOHOSMatrix4Scale(id: Int64, params: FfiScaleParams): Unit

    func FfiOHOSMatrix4Rotate(id: Int64, params: FfiRotateParams): Unit

    func FfiOHOSMatrix4TransformPoint(id: Int64, ffiPoint: FfiPoint): FfiPoint

    func FfiOHOSMatrix4Skew(id: Int64, x: Float32, y: Float32): Unit

    func FfiOHOSMatrix4SetPolyToPoly(id: Int64, option: FfiPolyToPolyOptions): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Matrix4Transit {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: Int64

    public init(id: Int64) {
        this.id = id
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copy(): Matrix4Transit {
        let copyId = unsafe { FfiOHOSMatrix4Copy(this.id) }
        if (copyId == -1) {
            throw IllegalArgumentException("matrix4.copy: invalid matrix instance")
        }
        let matrix: Matrix4Transit = Matrix4Transit(copyId)
        return matrix
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func invert(): This {
        unsafe {
            FfiOHOSMatrix4Invert(this.id)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func combine(target: Matrix4Transit): This {
        unsafe {
            FfiOHOSMatrix4Combine(this.id, target.id)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func translate(option: TranslateOption): This {
        unsafe {
            FfiOHOSMatrix4Translate(this.id, option.x, option.y, option.z)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func scale(params: ScaleOption): This {
        unsafe {
            FfiOHOSMatrix4Scale(
                this.id,
                FfiScaleParams(
                    params.x,
                    params.y,
                    params.z,
                    params.centerX,
                    params.centerY
                )
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func rotate(params: RotateOption): This {
        unsafe {
            FfiOHOSMatrix4Rotate(
                this.id,
                FfiRotateParams(
                    params.x,
                    params.y,
                    params.z,
                    params.angle,
                    params.centerX,
                    params.centerY
                )
            )
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func transformPoint(options: VArray<Float64, $2>): Array<Float64> {
        unsafe {
            let transPoint = FfiOHOSMatrix4TransformPoint(
                this.id,
                FfiPoint(
                    options[0],
                    options[1]
                )
            )
            let pValue: Array<Float64> = [transPoint.x, transPoint.y]
            return pValue
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func skew(x: Float32, y: Float32): This {
        unsafe {
            FfiOHOSMatrix4Skew(this.id, x, y)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setPolyToPoly(options: PolyToPolyOptions): This {
        unsafe {
            let srcPoint = options.src
            let dstPoint = options.dst
            let srcXValueHandle = FFIVectorInt32(srcPoint.size)
            let srcYValueHandle = FFIVectorInt32(srcPoint.size)
            let dstXValueHandle = FFIVectorInt32(dstPoint.size)
            let dstYValueHandle = FFIVectorInt32(dstPoint.size)
            for (i in 0..srcPoint.size) {
                srcXValueHandle.setElement(i, Int32(srcPoint[i].x))
                srcYValueHandle.setElement(i, Int32(srcPoint[i].y))
            }
            for (i in 0..dstPoint.size) {
                dstXValueHandle.setElement(i, Int32(dstPoint[i].x))
                dstYValueHandle.setElement(i, Int32(dstPoint[i].y))
            }
            FfiOHOSMatrix4SetPolyToPoly(
                this.id,
                FfiPolyToPolyOptions(
                    srcXValueHandle.getNativeHandle(),
                    srcYValueHandle.getNativeHandle(),
                    options.srcIndex,
                    dstXValueHandle.getNativeHandle(),
                    dstYValueHandle.getNativeHandle(),
                    options.dstIndex,
                    options.pointCount
                )
            )
            srcXValueHandle.free()
            srcYValueHandle.free()
            dstXValueHandle.free()
            dstYValueHandle.free()
        }
        this
    }
}

public class Matrix4 {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func initialize(array: Array<Float64>): Matrix4Transit {
        unsafe {
            let vecValueHandle = FFIVectorFloat64(array.size)
            for (i in 0..array.size) {
                vecValueHandle.setElement(i, array[i])
            }
            let matId = FfiOHOSMatrix4Init(vecValueHandle.getNativeHandle())
            if (matId == -1) {
                throw IllegalArgumentException("matrix4.init: input invalid")
            }
            vecValueHandle.free()
            let matrix: Matrix4Transit = Matrix4Transit(matId)
            return matrix
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func identity(): Matrix4Transit {
        let matId = unsafe { FfiOHOSMatrix4Identity() }
        if (matId == -1) {
            throw IllegalArgumentException("matrix4.identity: build matrix failed")
        }
        let matrix: Matrix4Transit = Matrix4Transit(matId)
        return matrix
    }
}
