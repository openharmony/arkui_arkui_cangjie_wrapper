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

package ohos.arkui.component.relative_container

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct CLength {
    CLength(
        let value: Float64,
        let unit: Int32
    ) {}
}

@C
struct CGuideLinePosition {
    CGuideLinePosition(
        let start: CLength,
        let end: CLength
    ) {}

    init(position: GuideLinePosition) {
        this.start = match (position.start) {
            case Some(v) => CLength(v.value, v.unitType.getValue())
            case None => CLength(Float64(0), -1)
        }

        this.end = match (position.end) {
            case Some(v) => CLength(v.value, v.unitType.getValue())
            case None => CLength(Float64(0), -1)
        }
    }
}

@C
struct CGuideLineStyle {
    CGuideLineStyle(
        let id: CString,
        let direction: Int32,
        let position: CGuideLinePosition
    ) {}

    init(guideline: GuideLineStyle) {
        this.id = unsafe { LibC.mallocCString(guideline.id ?? throw IllegalArgumentException("The type now is not supported.")) }
        this.direction = (guideline.direction ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
        this.position = CGuideLinePosition(guideline.position ?? throw IllegalArgumentException("The type now is not supported."))
    }

    func free(): Unit {
        unsafe { LibC.free(id) }
    }
}

@C
struct CGuideLineInfos {
    CGuideLineInfos(
        let size: Int64,
        let guideline: CPointer<CGuideLineStyle>
    ) {}

    init(infos: Array<GuideLineStyle>) {
        this.size = infos.size
        this.guideline = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CGuideLineStyle>(count: size) }
            if (ptr.isNull()) {
                throw IllegalMemoryException("memory malloc failed.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, CGuideLineStyle(infos[i])) }
            }
            ptr
        } else {
            CPointer<CGuideLineStyle>()
        }
    }

    func free(): Unit {
        if (!guideline.isNull()) {
            for (i in 0..size) {
                unsafe { guideline.read(i).free() }
            }
            unsafe { LibC.free<CGuideLineStyle>(guideline) }
        }
    }
}

@C
struct CBarrierStyle {
    var id: CString = CString(CPointer<UInt8>())
    var direction: Int32 = -1
    var referencedId: CArrString = CArrString(CPointer<CString>(), 0)

    CBarrierStyle(
        id: CString,
        direction: Int32,
        referencedId: CArrString
    ) {
        this.id = id
        this.direction = direction
        this.referencedId = referencedId
    }

    init(barrier: BarrierStyle) {
        try {
            this.id = unsafe { LibC.mallocCString(barrier.id ?? throw IllegalArgumentException("The type now is not supported.")) }
            this.direction = (barrier.direction ?? throw IllegalArgumentException("The type now is not supported.")).getValue()
            let  tmpReferencedId = barrier.referencedId ?? throw IllegalArgumentException("The type now is not supported.")
            let size = tmpReferencedId.size
            this.referencedId = if (size == 0) {
                CArrString(CPointer<CString>(), 0)
            } else {
                let ptr = unsafe { LibC.malloc<CString>(count: size) }
                if (ptr.isNull()) {
                    throw IllegalMemoryException("memory malloc failed.")
                }
                for (i in 0..size) {
                    unsafe { ptr.write(i, LibC.mallocCString(tmpReferencedId[i])) }
                }
                CArrString(ptr, size)
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        unsafe { LibC.free(id) }
        referencedId.free()
    }
}

@C
struct CBarrierInfos {
    CBarrierInfos(
        let size: Int64,
        let barrier: CPointer<CBarrierStyle>
    ) {}

    init(barrierInfos: Array<BarrierStyle>) {
        this.size = barrierInfos.size
        this.barrier = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CBarrierStyle>(count: size) }
            if (ptr.isNull()) {
                throw IllegalMemoryException("memory malloc failed.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, CBarrierStyle(barrierInfos[i])) }
            }
            ptr
        } else {
            CPointer<CBarrierStyle>()
        }
    }

    func free(): Unit {
        if (!barrier.isNull()) {
            for (i in 0..size) {
                unsafe { barrier.read(i).free() }
            }
            unsafe { LibC.free<CBarrierStyle>(barrier) }
        }
    }
}

foreign {
    func FfiOHOSAceFrameworkRelativeContainerCreate(): Unit

    func FfiOHOSAceFrameworkReletiveContainerGuideLine(guidelineInfos: CGuideLineInfos): Unit

    func FfiOHOSAceFrameworkReletiveContainerBarrier(barrierInfos: CBarrierInfos): Unit
}

/**
 * Specifies the BarrierStyle of relative container
 *
 * @relation interface BarrierStyle
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BarrierStyle {
    /**
    * Specifies the id of barrier
    *
    * @type { string }
    * @relation id : string
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: ?String

    /**
    * Specifies the direction of barrier
    *
    * @type { BarrierDirection }
    * @relation direction : BarrierDirection
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: ?BarrierDirection

    /**
    * Specifies the referencedId of barrier
    *
    * @type { Array<string> }
    * @relation referencedId : Array<string>
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var referencedId: ?Array<String>

    /**
    * Defines the constructor of BarrierStyle.
    *
    * @param { String } id
    * @param { BarrierDirection } direction
    * @param { Array<String> } referencedId
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: ?String, direction: ?BarrierDirection, referencedId: ?Array<String>) {
        this.id = id ?? throw IllegalArgumentException("The type now is not supported.")
        this.direction = direction ?? throw IllegalArgumentException("The type now is not supported.")
        this.referencedId = referencedId ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * Specifies the position of guideLine
 *
 * @relation interface GuideLinePosition
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLinePosition {
    /**
    * Specifies the distance to start of container
    *
    * @type { ?Length }
    * @relation start? : Dimension
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: ?Length

    /**
    * Specifies the distance to end of container
    *
    * @type { ?Length }
    * @relation end? : Dimension
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: ?Length

    /**
    * Defines the constructor of GuideLinePosition.
    *
    * @param { ?Length } start
    * @param { ?Length } end
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start!: ?Length = None, end!: ?Length = None) {
        this.start = start
        this.end = end
    }
}

/**
 * Specifies the GuideLineStyle of relative container
 *
 * @relation interface GuideLineStyle
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLineStyle {
    /**
    * Specifies the id of guideLine
    *
    * @type { String }
    * @relation id : string
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: ?String

    /**
    * Specifies the direction of guideLine
    *
    * @type { Axis }
    * @relation direction : Axis
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: ?Axis

    /**
    * Specifies the position of guideLine
    *
    * @type { GuideLinePosition }
    * @relation position : GuideLinePosition
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var position: ?GuideLinePosition
    /**
    * Defines the constructor of GuideLineStyle.
    *
    * @param { String } id
    * @param { Axis } direction
    * @param { GuideLinePosition } position
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: ?String, direction: ?Axis, position: ?GuideLinePosition) {
        this.id = id ?? throw IllegalArgumentException("The type now is not supported.")
        this.direction = direction ?? throw IllegalArgumentException("The type now is not supported.")
        this.position = position ?? throw IllegalArgumentException("The type now is not supported.")
    }
}

/**
 * RelativeContainer
 *
 * @relation const RelativeContainer: RelativeContainerInterface
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RelativeContainer <: CommonMethodComponent<RelativeContainerAttribute> & RelativeContainerAttribute {
    /**
    * Constructor of relativeContainer
    *
    * @param { () -> Unit } child
    * @returns { This }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = {=>}) {
        unsafe { FfiOHOSAceFrameworkRelativeContainerCreate() }
        this.child = child
    }

    /**
    * Specifies guideLines of relativeContainer
    *
    * @param { Array<GuideLineStyle> } value
    * @returns { This }
    * @relation guideLine(value: Array<GuideLineStyle>): RelativeContainerAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func guideLine(value: ?Array<GuideLineStyle>): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let cGuideLine = CGuideLineInfos(tmpValue)
        unsafe { FfiOHOSAceFrameworkReletiveContainerGuideLine(cGuideLine) }
        cGuideLine.free()
        this
    }

    /**
    * Specifies barriers of relativeContainer
    *
    * @param { Array<BarrierStyle> } value
    * @returns { This }
    * @relation barrier(value: Array<BarrierStyle>): RelativeContainerAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barrier(value: ?Array<BarrierStyle>): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        let cBarrier = CBarrierInfos(tmpValue)
        unsafe { FfiOHOSAceFrameworkReletiveContainerBarrier(cBarrier) }
        cBarrier.free()
        this
    }
}
