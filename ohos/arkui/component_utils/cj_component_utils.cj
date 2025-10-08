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

/**
 * The information of a transformation matrix.
 */
public type Matrix4Result = VArray<Float64, $16>

foreign func FFIOHOSAceFrameworkComponentUtilsGetById(id: CString): CComponentInfo

@C
struct CSize {
    let width: Float64
    let height: Float64
    init(width: Float64, height: Float64) {
        this.width = width
        this.height = height
    }
    func parseToCJ(): Size {
        Size(this.width, this.height)
    }
}

/**
 * Defines the size property.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Size {
    /**
     * Defines the width property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float64

    /**
     * Defines the height property.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float64

    /**
     * Create an Object of Size.
     *
     * @params { Float64 } width
     * @params { Float64 } height
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width: Float64, height: Float64) {
        this.width = width
        this.height = height
    }
}

@C
struct COffset {
    COffset(let x: Float64, let y: Float64) {}

    func parseToCJ(): Offset {
        Offset(this.x, this.y)
    }
}

/**
 * Defines the offset property.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    /**
     * Coordinate x of the Position.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Coordinate y of the Position.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Create an Object of Offset.
     *
     * @params { Float64 } x
     * @params { Float64 } y
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(x: Float64, y: Float64) {
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TranslateResult {
    /**
     * Indicates the translation distance of the x-axis, in vp.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Indicates the translation distance of the y-axis, in vp.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Indicates the translation distance of the z-axis, in vp.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float64

    /**
     * Create an Object of Offset.
     *
     * @params { Float64 } x
     * @params { Float64 } y
     * @params { Float64 } z
     * @returns { This }
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleResult {
    /**
     * Zoom factor of the x-axis.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Zoom factor of the y-axis.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Zoom factor of the z-axis.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float64

    /**
     * Transform the x-axis coordinate of the center point.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Float64

    /**
     * Transform the y-axis coordinate of the center point.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Float64

    /**
     * Defines ScaleResult Type.
     *
     * @params { Float64 } x
     * @params { Float64 } y
     * @params { Float64 } z
     * @params { Float64 } centerX
     * @params { Float64 } centerY
     * @returns { This }
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotateResult {
    /**
     * Axis of rotation vector x coordinate.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float64

    /**
     * Axis of rotation vector y coordinate.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float64

    /**
     * Axis of rotation vector z coordinate.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float64

    /**
     * Transform the x-axis coordinate of the center point.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Float64

    /**
     * Transform the y-axis coordinate of the center point.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Float64

    /**
     * Rotation angle.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var angle: Float64

    /**
     * Defines RotateResult Type.
     *
     * @params { Float64 } x
     * @params { Float64 } y
     * @params { Float64 } z
     * @params { Float64 } centerX
     * @params { Float64 } centerY
     * @params { Float64 } angle
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
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
            unsafe { VArray<Float64, $16> {i => Float64(this.transform.head.read(i))} }
        } else {
            VArray<Float64, $16>(repeat: 0.0)
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentInfo {
    /**
     * component size.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Size

    /**
     * Obtain attribute information relative to the local.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localOffset: Offset

    /**
     * Obtain attribute information relative to the window.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowOffset: Offset

    /**
     * Obtain attribute information relative to the screen.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenOffset: Offset

    /**
     * Obtain attribute information for translation.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var translate: TranslateResult

    /**
     * Obtain attribute information for rotate.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: ScaleResult

    /**
     * Obtain attribute information for rotate.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rotate: RotateResult

    /**
     * Obtain attribute information of the transformation matrix.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transform: Matrix4Result

    /**
     * ComponentInfo constructor.
     *
     * @params { Size } size
     * @params { Offset } localOffset
     * @params { Offset } windowOffset
     * @params { Offset } screenOffset
     * @params { TranslateResult } translate
     * @params { ScaleResult } scale
     * @params { RotateResult } rotate
     * @params { Matrix4Result } transform
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size: Size, localOffset: Offset, windowOffset: Offset, screenOffset: Offset, translate: TranslateResult,
        scale: ScaleResult, rotate: RotateResult, transform: Matrix4Result) {
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
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentUtils {
    /**
     * Provide the ability to obtain the coordinates and size of component drawing areas.
     *
     * @params { string } id - component id.
     * @returns { ComponentInfo }
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
