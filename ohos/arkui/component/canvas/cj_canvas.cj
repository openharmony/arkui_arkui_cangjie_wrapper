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

package ohos.arkui.component.canvas

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.arkui.component.native_struct.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.deriving.Derive

foreign {
    func FfiOHOSAceFrameworkCanvasCreate(contextId: Int64): Unit

    func FfiOHOSAceFrameworkCanvasOnReady(callback: Int64): Unit

    func FfiOHOSAceFrameworkRenderingContextCreateLinearGradient(
        selfId: Int64,
        x0: Float64,
        y0: Float64,
        x1: Float64,
        y1: Float64
    ): Int64

    func FfiOHOSAceFrameworkRenderingContextCreateRadialGradient(
        selfId: Int64,
        x0: Float64,
        y0: Float64,
        r0: Float64,
        x1: Float64,
        y1: Float64,
        r1: Float64
    ): Int64

    func FfiOHOSAceFrameworkCanvasGradientAddColorStop(selfId: Int64, offset: Float64, color: UInt32): Unit
}

@C
struct NativeTextMetrics {
    NativeTextMetrics(
        public var width: Float64,
        public var height: Float64
    ) {}

    func parseToCJ(): TextMetrics {
        return TextMetrics(width, height)
    }
}

@C
struct ImageInfo {
    ImageInfo(
        let flag: Int32,
        let sx: Float64,
        let sy: Float64,
        let sWidth: Float64,
        let sHeight: Float64,
        let dx: Float64,
        let dy: Float64,
        let dWidth: Float64,
        let dHeight: Float64
    ) {}
}

@Derive[Equatable]
enum CanvasImageType {
    CoordinatesOnly
    | CoordinatesAndSize
    | CoordinatesAndSizeWithSource

    func getValue(): Int32 {
        match (this) {
            case CoordinatesOnly => 0
            case CoordinatesAndSize => 1
            case CoordinatesAndSizeWithSource => 2
        }
    }
}
/**
 * This object allows you to set properties when creating a rendering context
 *
 * @relation declare class RenderingContextSettings
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RenderingContextSettings {
    /**
     * Indicates whether anti-aliasing is enabled for canvas. The default value is false.
     *
     * @relation antialias?: boolean
     */
    public var antialias: Bool

    /**
     * Create an RenderingContextSettings object based on the antialias and alpha.
     *
     * @relation constructor(antialias?: boolean)
     */
    public init(antialias!: Bool = false) {
        this.antialias = antialias
    }
}

/**
 * Size information of the text
 *
 * @relation declare interface TextMetrics
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextMetrics {
    /**
     * Indicates the width of a character string. The value is of the double type.
     *
     * @relation readonly width: number
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let width: Float64
    /**
     * Indicates the height of a character string. The value is of the double type.
     *
     * @relation readonly height: number
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let height: Float64

    init(width: Float64, height: Float64) {
        this.width = width
        this.height = height
    }
}

/**
 * Defines Canvas Component.
 *
 * @relation declare const Canvas: CanvasInterface
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Canvas <: ViewBase {
    /**
     * Construct a canvas component.
     *
     * @param { CanvasRenderingContext2D } context - Canvas context object.
     * @returns { This }
     * @relation (context?: CanvasRenderingContext2D | DrawingRenderingContext): CanvasAttribute
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(context: Option<CanvasRenderingContext2D>) {
        match (context) {
            case Some(value) => unsafe {
                    FfiOHOSAceFrameworkCanvasCreate(value.getID())
                }
            case None => ()
        }
    }

    /**
     * Event notification after the canvas component is constructed. You can draw the canvas at this time.
     *
     * @param { () -> Unit } callback
     * @returns { This }
     * @relation onReady(event: VoidCallback): CanvasAttribute
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onReady(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkCanvasOnReady(Callback0Param<Unit>(callback).getID())
        }
        this
    }
}

/**
 * Opaque objects that describe gradients, created by createLinearGradient() or createRadialGradient()
 *
 * @relation declare class CanvasGradient
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CanvasGradient <: RemoteDataLite {
    init(contextId: Int64, x0: Float64, y0: Float64, x1: Float64, y1: Float64) {
        super(unsafe {
            FfiOHOSAceFrameworkRenderingContextCreateLinearGradient(contextId, x0, y0, x1, y1)
        })
    }

    init(contextId: Int64, x0: Float64, y0: Float64, r0: Float64, x1: Float64, y1: Float64, r1: Float64) {
        super(unsafe {
            FfiOHOSAceFrameworkRenderingContextCreateRadialGradient(contextId, x0, y0, r0, x1, y1, r1)
        })
    }

    init(selfID: Int64) {
        super(selfID)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Add a breakpoint defined by offset and color to the gradient
     *
     * @param { Float64 } offset - Value between 0 and 1, out of range throws INDEX_SIZE_ERR error
     * @param { String } color - Set the gradient color.
     *    a SYNTAX_ERR error is thrown.
     * @relation addColorStop(offset: number, color: string): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addColorStop(offset: Float64, color: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasGradientAddColorStop(this.getID(), offset, transAppResourceToResourceColor(color))
        }
    }
}
