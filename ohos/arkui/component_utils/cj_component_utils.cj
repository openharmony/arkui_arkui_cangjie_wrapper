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

package ohos.arkui.component_utils

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign func FFIOHOSAceFrameworkComponentUtilsGetById(id: CString): CComponentInfo

@C
struct CSize {
    let width: Float32
    let height: Float32
    init(width: Float32, height: Float32) {
        this.width = width
        this.height = height
    }
    func parseToCJ(): Size {
        Size(this.width, this.height)
    }
}

/**
 * Defines the size property.
 *
 * @relation export interface Size
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Size {
    /**
     * Defines the width property.
     *
     * @relation width: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float32

    /**
     * Defines the height property.
     *
     * @relation height: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float32

    /**
     * Create an Object of Size.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width: Float32, height: Float32) {
        this.width = width
        this.height = height
    }
}

@C
struct COffset {
    COffset(let x: Float32, let y: Float32) {}

    func parseToCJ(): Offset {
        Offset(this.x, this.y)
    }
}

/**
 * Defines the offset property.
 *
 * @relation export interface Offset
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    /**
     * Coordinate x of the Position.
     *
     * @relation x: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32

    /**
     * Coordinate y of the Position.
     *
     * @relation y: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32

    /**
     * Create an Object of Offset.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x: Float32, y: Float32) {
        this.x = x
        this.y = y
    }
}

@C
struct CTranslateResult {
    CTranslateResult(
        let x: Float64,
        let y: Float64,
        let z: Float64
    ) {}

    func parseToCJ(): TranslateResult {
        TranslateResult(this.x, this.y, this.z)
    }
}

/**
 * Translation Result
 *
 * @relation export interface TranslateResult
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TranslateResult {
    /**
     * Indicates the translation distance of the x-axis, in vp.
     *
     * @relation x: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Indicates the translation distance of the y-axis, in vp.
     *
     * @relation y: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Indicates the translation distance of the z-axis, in vp.
     *
     * @relation z: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float64

    /**
     * Create an Object of Offset.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x: Float64, y: Float64, z: Float64) {
        this.x = x
        this.y = y
        this.z = z
    }
}

@C
struct CScaleResult {
    CScaleResult(let x: Float64, let y: Float64, let z: Float64, let centerX: Float64, let centerY: Float64) {}

    func parseToCJ(): ScaleResult {
        ScaleResult(this.x, this.y, this.z, this.centerX, this.centerY)
    }
}

/**
 * Scale Result
 *
 * @relation export interface ScaleResult
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleResult {
    /**
     * Zoom factor of the x-axis.
     *
     * @relation x: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Zoom factor of the y-axis.
     *
     * @relation z: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Zoom factor of the z-axis.
     *
     * @relation z: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float64

    /**
     * Transform the x-axis coordinate of the center point.
     *
     * @relation centerX: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Float64

    /**
     * Transform the y-axis coordinate of the center point.
     *
     * @relation centerY: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Float64

    /**
     * Defines ScaleResult Type.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x: Float64, y: Float64, z: Float64, centerX: Float64, centerY: Float64) {
        this.x = x
        this.y = y
        this.z = z
        this.centerX = centerX
        this.centerY = centerY
    }
}

@C
struct CRotateResult {
    CRotateResult(
        let x: Float64,
        let y: Float64,
        let z: Float64,
        let centerX: Float64,
        let centerY: Float64,
        let angle: Float64
    ) {}

    func parseToCJ(): RotateResult {
        RotateResult(this.x, this.y, this.z, this.centerX, this.centerY, this.angle)
    }
}

/**
 * Rotation Result.
 *
 * @relation export interface RotateResult
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotateResult {
    /**
     * Axis of rotation vector x coordinate.
     *
     * @relation x: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Axis of rotation vector y coordinate.
     *
     * @relation y: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Axis of rotation vector z coordinate.
     *
     * @relation z: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float64

    /**
     * Transform the x-axis coordinate of the center point.
     *
     * @relation centerX: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Float64

    /**
     * Transform the y-axis coordinate of the center point.
     *
     * @relation centerY: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Float64

    /**
     * Rotation angle.
     *
     * @relation angle: number
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var angle: Float64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    /**
     * Defines RotateResult Type.
     */
    public init(x: Float64, y: Float64, z: Float64, centerX: Float64, centerY: Float64, angle: Float64) {
        this.x = x
        this.y = y
        this.z = z
        this.centerX = centerX
        this.centerY = centerY
        this.angle = angle
    }
}

@C
struct CComponentInfo {
    CComponentInfo(
        let size: CSize,
        let localOffset: COffset,
        let windowOffset: COffset,
        let screenOffset: COffset,
        let translate: CTranslateResult,
        let scale: CScaleResult,
        let rotate: CRotateResult,
        let transform: CArrFloat32
    ) {}

    func parseToCJ(): ComponentInfo {
        let transform = if (this.transform.head.isNotNull()) {
            unsafe { VArray<Float32, $16> {i => this.transform.head.read(i)} }
        } else {
            VArray<Float32, $16>(repeat: 0.0)
        }
        ComponentInfo(
            this.size.parseToCJ(),
            this.localOffset.parseToCJ(),
            this.windowOffset.parseToCJ(),
            this.screenOffset.parseToCJ(),
            this.translate.parseToCJ(),
            this.scale.parseToCJ(),
            this.rotate.parseToCJ(),
            transform
        )
    }
}

/**
 * Component information.
 *
 * @relation export interface ComponentInfo
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentInfo {
    /**
     * component size.
     *
     * @relation size: Size
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Size

    /**
     * Obtain attribute information relative to the local.
     *
     * @relation localOffset: Offset
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localOffset: Offset

    /**
     * Obtain attribute information relative to the window.
     *
     * @relation windowOffset: Offset
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowOffset: Offset

    /**
     * Obtain attribute information relative to the screen.
     *
     * @relation screenOffset: Offset
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenOffset: Offset

    /**
     * Obtain attribute information for translation.
     *
     * @relation translate: TranslateResult
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var translate: TranslateResult

    /**
     * Obtain attribute information for rotate.
     *
     * @relation scale: ScaleResult
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: ScaleResult

    /**
     * Obtain attribute information for rotate.
     *
     * @relation rotate: RotateResult
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rotate: RotateResult

    /**
     * Obtain attribute information of the transformation matrix.
     *
     * @relation transform: Matrix4Result
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transform: VArray<Float32, $16>

    /**
     * constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size: Size, localOffset: Offset, windowOffset: Offset, screenOffset: Offset, translate: TranslateResult,
        scale: ScaleResult, rotate: RotateResult, transform: VArray<Float32, $16>) {
        this.size = size
        this.localOffset = localOffset
        this.windowOffset = windowOffset
        this.screenOffset = screenOffset
        this.translate = translate
        this.scale = scale
        this.rotate = rotate
        this.transform = transform
    }
}

/**
 * This module provides functionality for component coordinates and sizes.
 *
 * @relation declare namespace componentUtils
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentUtils {
    /**
     * Provide the ability to obtain the coordinates and size of component drawing areas.
     *
     * @param {string} id - component id.
     * @relation unction getRectangleById(id: string): ComponentInfo;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getRectangleById(id: String): ComponentInfo {
        var nativeInfo: CComponentInfo
        unsafe {
            var unsafeId = LibC.mallocCString(id)
            nativeInfo = FFIOHOSAceFrameworkComponentUtilsGetById(unsafeId)
            LibC.free(unsafeId)
        }
        nativeInfo.parseToCJ()
    }
}
