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
struct CJFlexParams {
    CJFlexParams(
        let direction: Int32,
        let wrap: Int32,
        let justifyContent: Int32,
        let alignItems: Int32,
        let alignContent: Int32
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
public class FlexParams {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public FlexParams(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction!: FlexDirection = FlexDirection.Row,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var wrap!: FlexWrap = FlexWrap.NoWrap,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var justifyContent!: FlexAlign = FlexAlign.Start,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var alignItems!: ItemAlign = ItemAlign.Start,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var alignContent!: FlexAlign = FlexAlign.Start
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FlexSpaceOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var mainSpace: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var crossSpace: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public FlexSpaceOptions(mainSpace!: Length = 0.px, crossSpace!: Length = 0.px) {
        this.mainSpace = transAppResourceToLength(mainSpace)
        this.crossSpace = transAppResourceToLength(crossSpace)
    }
}

@C
struct CJFlexOptions {
    CJFlexOptions(
        let direction: Int32,
        let wrap: Int32,
        let justifyContent: Int32,
        let alignItems: Int32,
        let alignContent: Int32,
        let mainSpace: Float64,
        let mainSpaceUnit: Int32,
        let crossSpace: Float64,
        let crossSpaceUnit: Int32
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
public class FlexOptions {
    @!APILevel[
        16,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public FlexOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var direction!: FlexDirection = FlexDirection.Row,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var wrap!: FlexWrap = FlexWrap.NoWrap,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var justifyContent!: FlexAlign = FlexAlign.Start,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var alignItems!: ItemAlign = ItemAlign.Start,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var alignContent!: FlexAlign = FlexAlign.Start,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var space!: FlexSpaceOptions = FlexSpaceOptions()
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkFlexCreate(): Unit

    func FfiOHOSAceFrameworkFlexCreateWithParams(params: CJFlexParams): Unit

    func FfiOHOSAceFrameworkFlexSetFlexWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkFlexSetFlexHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkFlexSetFlexSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkFlexCreateByOptions(options: CJFlexOptions): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Flex <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public Flex(value: FlexParams) {
        unsafe {
            FfiOHOSAceFrameworkFlexCreateWithParams(
                CJFlexParams(
                    value.direction.getValue(),
                    value.wrap.getValue(),
                    value.justifyContent.getValue(),
                    value.alignItems.getValue(),
                    value.alignContent.getValue()
                )
            )
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: FlexParams, child: () -> Unit) {
        this(value)
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
    public init(child: () -> Unit) {
        this(FlexParams(), child)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: FlexOptions) {
        unsafe {
            FfiOHOSAceFrameworkFlexCreateByOptions(
                CJFlexOptions(
                    value.direction.getValue(),
                    value.wrap.getValue(),
                    value.justifyContent.getValue(),
                    value.alignItems.getValue(),
                    value.alignContent.getValue(),
                    value.space.mainSpace.value,
                    value.space.mainSpace.unitType.getValue(),
                    value.space.crossSpace.value,
                    value.space.crossSpace.unitType.getValue()
                )
            )
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
    public init(value: FlexOptions, child: () -> Unit) {
        this(value)
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
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkFlexSetFlexWidth(value_.value, value_.unitType.getValue())
        }
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
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkFlexSetFlexHeight(value_.value, value_.unitType.getValue())
        }
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
    public override func size(width!: Length, height!: Length): This {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkFlexSetFlexSize(width_.value, width_.unitType.getValue(), height_.value,
                height_.unitType.getValue())
        }
        this
    }
}
