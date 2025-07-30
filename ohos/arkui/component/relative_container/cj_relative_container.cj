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
        this.id = unsafe { LibC.mallocCString(guideline.id) }
        this.direction = guideline.direction.getValue()
        this.position = CGuideLinePosition(guideline.position)
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
            this.id = unsafe { LibC.mallocCString(barrier.id) }
            this.direction = barrier.direction.getValue()

            let size = barrier.referencedId.size
            this.referencedId = if (size == 0) {
                CArrString(CPointer<CString>(), 0)
            } else {
                let ptr = unsafe { LibC.malloc<CString>(count: size) }
                if (ptr.isNull()) {
                    throw IllegalMemoryException("memory malloc failed.")
                }
                for (i in 0..size) {
                    unsafe { ptr.write(i, LibC.mallocCString(barrier.referencedId[i])) }
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BarrierStyle {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BarrierStyle(
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var id: String,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction: BarrierDirection,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var referencedId: Array<String>
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLinePosition {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public GuideLinePosition(
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var start!: ?Length = None,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var end!: ?Length = None
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLineStyle {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public GuideLineStyle(
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var id: String,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction: Axis,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var position: GuideLinePosition
    ) {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RelativeContainer <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe { FfiOHOSAceFrameworkRelativeContainerCreate() }
        this.child = child
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe { FfiOHOSAceFrameworkRelativeContainerCreate() }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func guideLine(value: Array<GuideLineStyle>): This {
        let cGuideLine = CGuideLineInfos(value)
        unsafe { FfiOHOSAceFrameworkReletiveContainerGuideLine(cGuideLine) }
        cGuideLine.free()
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barrier(value: Array<BarrierStyle>): This {
        let cBarrier = CBarrierInfos(value)
        unsafe { FfiOHOSAceFrameworkReletiveContainerBarrier(cBarrier) }
        cBarrier.free()
        this
    }
}
