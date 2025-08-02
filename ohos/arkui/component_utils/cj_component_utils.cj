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

protected package ohos.arkui.component_utils

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign func FFIOHOSAceFrameworkComponentUtilsGetById(id: CString): CComponentInfo

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@C
public struct CSize {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let width: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]    
    let height: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(width: Float32, height: Float32) {
        this.width = width
        this.height = height
    }    

    func parseToCJ(): Size {
        Size(this.width, this.height)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Size {
    @!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var width: Float32
    @!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var height: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]    
    public init(width: Float32, height: Float32) {
        this.width = width
        this.height = height
    }
}

@C
struct COffset {
    COffset(
        let x: Float32,
        let y: Float32
    ) {}

    func parseToCJ(): Offset {
        Offset(this.x, this.y)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Offset {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
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
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}

    func parseToCJ(): TranslateResult {
        TranslateResult(this.x, this.y, this.z)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TranslateResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]    
    public init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }
}

@C
struct CScaleResult {
    CScaleResult(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let centerX: Float32,
        let centerY: Float32
    ) {}

    func parseToCJ(): ScaleResult {
        ScaleResult(this.x, this.y, this.z, this.centerX, this.centerY)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ScaleResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]    
    public init(x: Float32, y: Float32, z: Float32, centerX: Float32 , centerY: Float32) {
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
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let centerX: Float32,
        let centerY: Float32,
        let angle: Float32
    ) {}

    func parseToCJ(): RotateResult {
        RotateResult(this.x, this.y, this.z, this.centerX, this.centerY, this.angle)
    }
}


@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RotateResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var x: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var y: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var z: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerX: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var centerY: Float32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var angle: Float32    
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]    
    public init(x: Float32, y: Float32, z: Float32, centerX: Float32 , centerY: Float32, angle: Float32) {
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
            unsafe { Array<Float32>(this.transform.size, {i => this.transform.head.read(i)}) }
        } else {
            Array<Float32>()
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var size: Size
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localOffset: Offset
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var windowOffset: Offset
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var screenOffset: Offset
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var translate: TranslateResult
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: ScaleResult
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var rotate: RotateResult
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var transform: Array<Float32>  

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size: Size, localOffset: Offset, windowOffset: Offset, screenOffset: Offset,
        translate: TranslateResult, scale: ScaleResult, rotate: RotateResult, transform: Array<Float32>  ) {
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentUtils {
    @!APILevel[
        21,
        stagemodelonly: true,
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
