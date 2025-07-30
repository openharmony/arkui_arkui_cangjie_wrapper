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

package ohos.display

import ohos.base.*
import ohos.labels.*

@C
struct RetStruct {
    RetStruct(
        let code: Int32,
        let len: Int64,
        let data: CPointer<Unit>
    ) {}
}

@C
struct CRect {
    CRect(
        var left: Int32,
        var top: Int32,
        var width: UInt32,
        var height: UInt32
    ) {}
}

/**
* Rectangle
*
* @relation interface Rect
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Rect {
    /**
    * The Y-axis coordinate of the upper left vertex of the rectangle, in pixels.
    *
    * @relation left: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public var left: Int32
    /**
    * The Y-axis coordinate of the upper left vertex of the rectangle, in pixels.
    *
    * @relation top: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public var top: Int32
    /**
    * Width of the rectangle, in pixels.
    *
    * @relation width: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public var width: UInt32
    /**
    * Height of the rectangle, in pixels.
    *
    * @relation height: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public var height: UInt32

    /**
    * Rect constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public init(
        left!: Int32,
        top!: Int32,
        width!: UInt32,
        height!: UInt32
    ) {
        this.left = left
        this.top = top
        this.width = width
        this.height = height
    }

    init(cRect: CRect) {
        this.left = cRect.left
        this.top = cRect.top
        this.width = cRect.width
        this.height = cRect.height
    }
}

@C
struct CWaterfallDisplayAreaRects {
    CWaterfallDisplayAreaRects(
        let left: CRect,
        let top: CRect,
        let right: CRect,
        let bottom: CRect
    ) {}
}

/**
* Curved area rects of the waterfall display.
*
* @relation export interface WaterfallDisplayAreaRects
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class WaterfallDisplayAreaRects {
    /**
    * Indicates the size of left side curved area of the waterfall screen.
    *
    * @relation readonly left: Rect
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public let left: Rect
    /**
    * Indicates the size of top side curved area of the waterfall screen.
    *
    * @relation readonly top: Rect
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public let top: Rect
    /**
    * Indicates the size of right side curved area of the waterfall screen.
    *
    * @relation readonly right: Rect
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public let right: Rect
    /**
    * Indicates the size of bottom side curved area of the waterfall screen.
    *
    * @relation readonly bottom: Rect
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public let bottom: Rect

    /**
    * WaterfallDisplayAreaRects constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public init(
        left!: Rect,
        top!: Rect,
        right!: Rect,
        bottom!: Rect
    ) {
        this.left = left
        this.top = top
        this.right = right
        this.bottom = bottom
    }

    init(cWaterfallDisplayAreaRects: CWaterfallDisplayAreaRects) {
        this.left = Rect(cWaterfallDisplayAreaRects.left)
        this.top = Rect(cWaterfallDisplayAreaRects.top)
        this.right = Rect(cWaterfallDisplayAreaRects.right)
        this.bottom = Rect(cWaterfallDisplayAreaRects.bottom)
    }
}

@C
struct CCutoutInfo {
    CCutoutInfo(
        let boundingRects: CPointer<CRect>,
        let number: Int64,
        let waterfallDisplayAreaRects: CWaterfallDisplayAreaRects
    ) {}
}

/**
* Cutout information of the display.
*
* @relation export interface CutoutInfo
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class CutoutInfo {
    /**
    * Bounding rectangles of the cutout areas of the display.
    *
    * @relation readonly boundingRects: Array<Rect>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public let boundingRects: Array<Rect>
    /**
    * Rectangles of curved parts on each side of a waterfall display.
    *
    * @relation readonly waterfallDisplayAreaRects: WaterfallDisplayAreaRects
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public let waterfallDisplayAreaRects: WaterfallDisplayAreaRects

    /**
    * CutoutInfo constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public init(
        boundingRects!: Array<Rect>,
        waterfallDisplayAreaRects!: WaterfallDisplayAreaRects
    ) {
        this.boundingRects = boundingRects
        this.waterfallDisplayAreaRects = waterfallDisplayAreaRects
    }

    init(cCutoutInfo: CCutoutInfo) {
        let ptr = cCutoutInfo.boundingRects
        this.boundingRects = unsafe {
            Array<Rect>(cCutoutInfo.number, {i => Rect(ptr.read(i))})
        }
        this.waterfallDisplayAreaRects = WaterfallDisplayAreaRects(cCutoutInfo.waterfallDisplayAreaRects)
    }
}

@C
struct CFoldCreaseRegion {
    CFoldCreaseRegion(
        let displayId: UInt32,
        let number: Int64,
        let creaseRects: CPointer<CRect>
    ) {}
}

/**
* Fold Crease Region
*
* @relation export interface FoldCreaseRegion
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public class FoldCreaseRegion {
    /**
    * The display ID is used to identify the screen where the crease is located.
    *
    * @relation readonly displayId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public let displayId: UInt32
    /**
    * Crease Region.
    *
    * @relation readonly creaseRects: Array<Rect>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public let creaseRects: Array<Rect>

    /**
    * FoldCreaseRegion constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public init(
        displayId!: UInt32,
        creaseRects!: Array<Rect>
    ) {
        this.displayId = displayId
        this.creaseRects = creaseRects
    }

    init(cFoldCreaseRegion: CFoldCreaseRegion) {
        let ptr = cFoldCreaseRegion.creaseRects
        this.creaseRects = unsafe {
            Array<Rect>(cFoldCreaseRegion.number, {i => Rect(ptr.read(i))})
        }
        this.displayId = cFoldCreaseRegion.displayId
    }
}

@C
struct CDisplayPhysicalResolution {
    CDisplayPhysicalResolution(
        let foldDisplayMode: UInt32,
        let physicalWidth: UInt32,
        let physicalHeight: UInt32
    ) {}
}
