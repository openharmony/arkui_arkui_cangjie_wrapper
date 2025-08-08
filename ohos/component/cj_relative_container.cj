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
struct CLocalizedBarrierStyle {
    var id: CString = CString(CPointer<UInt8>())
    var localizedDirection: Int32 = -1
    var referencedId: CArrString = CArrString(CPointer<CString>(), 0)

    CLocalizedBarrierStyle(
        id: CString,
        localizedDirection: Int32,
        referencedId: CArrString
    ) {
        this.id = id
        this.localizedDirection = localizedDirection
        this.referencedId = referencedId
    }

    init(LocalizedBarrier: LocalizedBarrierStyle) {
        try {
            this.id = unsafe { LibC.mallocCString(LocalizedBarrier.id) }
            this.localizedDirection = LocalizedBarrier.localizedDirection.getValue()

            let size = LocalizedBarrier.referencedId.size
            this.referencedId = if (size == 0) {
                CArrString(CPointer<CString>(), 0)
            } else {
                let ptr = unsafe { LibC.malloc<CString>(count: size) }
                if (ptr.isNull()) {
                    throw IllegalMemoryException("memory malloc failed.")
                }
                for (i in 0..size) {
                    unsafe { ptr.write(i, LibC.mallocCString(LocalizedBarrier.referencedId[i])) }
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

@C
struct CLocalizedBarrierInfos {
    CLocalizedBarrierInfos(
        let size: Int64,
        let localizedBarrier: CPointer<CLocalizedBarrierStyle>
    ) {}

    init(barrierInfos: Array<LocalizedBarrierStyle>) {
        this.size = barrierInfos.size
        this.localizedBarrier = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CLocalizedBarrierStyle>(count: size) }
            if (ptr.isNull()) {
                throw IllegalMemoryException("memory malloc failed.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, CLocalizedBarrierStyle(barrierInfos[i])) }
            }
            ptr
        } else {
            CPointer<CLocalizedBarrierStyle>()
        }
    }

    func free(): Unit {
        if (!localizedBarrier.isNull()) {
            for (i in 0..size) {
                unsafe { localizedBarrier.read(i).free() }
            }
            unsafe { LibC.free<CLocalizedBarrierStyle>(localizedBarrier) }
        }
    }
}

@C
struct CJAlignRuleOption {
    var leftAnchor: CString = CString(CPointer<UInt8>())
    var leftHorizontalAlign: Int32 = -1
    var rightAnchor: CString = CString(CPointer<UInt8>())
    var rightHorizontalAlign: Int32 = -1
    var middleAnchor: CString = CString(CPointer<UInt8>())
    var middleHorizontalAlign: Int32 = -1
    var topAnchor: CString = CString(CPointer<UInt8>())
    var topVerticalAlign: Int32 = -1
    var bottomAnchor: CString = CString(CPointer<UInt8>())
    var bottomVerticalAlign: Int32 = -1
    var centerAnchor: CString = CString(CPointer<UInt8>())
    var centerVerticalAlign: Int32 = -1
    var horizontalBias: CPointer<Float32> = CPointer<Float32>()
    var verticalBias: CPointer<Float32> = CPointer<Float32>()

    init(option: AlignRuleOption) {
        try {
            if (let Some(v) <- option.left) {
                leftAnchor = unsafe { LibC.mallocCString(v.anchor) }
                leftHorizontalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.right) {
                rightAnchor = unsafe { LibC.mallocCString(v.anchor) }
                rightHorizontalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.middle) {
                middleAnchor = unsafe { LibC.mallocCString(v.anchor) }
                middleHorizontalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.top) {
                topAnchor = unsafe { LibC.mallocCString(v.anchor) }
                topVerticalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.bottom) {
                bottomAnchor = unsafe { LibC.mallocCString(v.anchor) }
                bottomVerticalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.center) {
                centerAnchor = unsafe { LibC.mallocCString(v.anchor) }
                centerVerticalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.bias) {
                if (let Some(horizontal) <- v.horizontal) {
                    horizontalBias = unsafe { LibC.malloc<Float32>() }
                    if (horizontalBias.isNull()) {
                        throw IllegalMemoryException("memory malloc failed.")
                    }
                    unsafe { horizontalBias.write(horizontal) }
                }
                if (let Some(vertival) <- v.vertical) {
                    verticalBias = unsafe { LibC.malloc<Float32>() }
                    if (verticalBias.isNull()) {
                        throw IllegalMemoryException("memory malloc failed.")
                    }
                    unsafe { verticalBias.write(vertival) }
                }
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    init(option: LocalizedAlignRuleOptions) {
        try {
            if (let Some(v) <- option.start) {
                leftAnchor = unsafe { LibC.mallocCString(v.anchor) }
                leftHorizontalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.end) {
                rightAnchor = unsafe { LibC.mallocCString(v.anchor) }
                rightHorizontalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.middle) {
                middleAnchor = unsafe { LibC.mallocCString(v.anchor) }
                middleHorizontalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.top) {
                topAnchor = unsafe { LibC.mallocCString(v.anchor) }
                topVerticalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.bottom) {
                bottomAnchor = unsafe { LibC.mallocCString(v.anchor) }
                bottomVerticalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.center) {
                centerAnchor = unsafe { LibC.mallocCString(v.anchor) }
                centerVerticalAlign = v.align.getValue()
            }
            if (let Some(v) <- option.bias) {
                if (let Some(horizontal) <- v.horizontal) {
                    horizontalBias = unsafe { LibC.malloc<Float32>() }
                    if (horizontalBias.isNull()) {
                        throw IllegalMemoryException("memory malloc failed.")
                    }
                    unsafe { horizontalBias.write(horizontal) }
                }
                if (let Some(vertival) <- v.vertical) {
                    verticalBias = unsafe { LibC.malloc<Float32>() }
                    if (verticalBias.isNull()) {
                        throw IllegalMemoryException("memory malloc failed.")
                    }
                    unsafe { verticalBias.write(vertival) }
                }
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(leftAnchor)
            LibC.free(rightAnchor)
            LibC.free(middleAnchor)
            LibC.free(topAnchor)
            LibC.free(bottomAnchor)
            LibC.free(centerAnchor)
            LibC.free<Float32>(horizontalBias)
            LibC.free<Float32>(verticalBias)
        }
    }
}

@C
struct CJChainInfo {
    CJChainInfo(
        let direction: Int32,
        let style: Int32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedHorizontalAlignParam {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LocalizedHorizontalAlignParam(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var anchor!: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var align!: HorizontalAlign
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedVerticalAlignParam {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LocalizedVerticalAlignParam(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var anchor!: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var align!: VerticalAlign
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedAlignRuleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LocalizedAlignRuleOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var start!: ?LocalizedHorizontalAlignParam = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var end!: ?LocalizedHorizontalAlignParam = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var middle!: ?LocalizedHorizontalAlignParam = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var top!: ?LocalizedVerticalAlignParam = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var bottom!: ?LocalizedVerticalAlignParam = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var center!: ?LocalizedVerticalAlignParam = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var bias!: ?Bias = None
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkRelativeContainerCreate(): Unit

    func FfiOHOSAceFrameworkReletiveContainerGuideLine(guidelineInfos: CGuideLineInfos): Unit

    func FfiOHOSAceFrameworkReletiveContainerBarrier(barrierInfos: CBarrierInfos): Unit

    func FfiOHOSAceFrameworkReletiveContainerLocalizedBarrier(barrierInfos: CLocalizedBarrierInfos): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BarrierStyle {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public BarrierStyle(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var id: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction: BarrierDirection,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var referencedId: Array<String>
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedBarrierStyle {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public LocalizedBarrierStyle(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var id: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var localizedDirection: LocalizedBarrierDirection,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var referencedId: Array<String>
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLinePosition {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public GuideLinePosition(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var start!: ?Length = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var end!: ?Length = None
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLineStyle {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public GuideLineStyle(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var id: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction: Axis,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var position: GuideLinePosition
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AlignRuleOption {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public AlignRuleOption(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var left!: ?HorizontalAnchor = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var right!: ?HorizontalAnchor = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var middle!: ?HorizontalAnchor = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var top!: ?VerticalAnchor = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var bottom!: ?VerticalAnchor = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var center!: ?VerticalAnchor = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var bias!: ?Bias = None
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class HorizontalAnchor {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public HorizontalAnchor(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var anchor: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var align: HorizontalAlign
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class VerticalAnchor {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public VerticalAnchor(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var anchor: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var align: VerticalAlign
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Bias {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public Bias(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var horizontal!: ?Float32 = None,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var vertical!: ?Float32 = None
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RelativeContainer <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child: () -> Unit) {
        unsafe { FfiOHOSAceFrameworkRelativeContainerCreate() }
        this.child = child
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe { FfiOHOSAceFrameworkRelativeContainerCreate() }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barrier(value: Array<BarrierStyle>): This {
        let cBarrier = CBarrierInfos(value)
        unsafe { FfiOHOSAceFrameworkReletiveContainerBarrier(cBarrier) }
        cBarrier.free()
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
    public func barrier(value: Array<LocalizedBarrierStyle>): This {
        let cBarrier = CLocalizedBarrierInfos(value)
        unsafe { FfiOHOSAceFrameworkReletiveContainerLocalizedBarrier(cBarrier) }
        cBarrier.free()
        this
    }
}
