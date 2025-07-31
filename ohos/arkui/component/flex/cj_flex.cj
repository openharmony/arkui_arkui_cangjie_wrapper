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

package ohos.arkui.component.flex

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.labels.APILevel

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

foreign {
    func FfiOHOSAceFrameworkFlexCreate(): Unit

    func FfiOHOSAceFrameworkFlexCreateWithParams(params: CJFlexParams): Unit

    func FfiOHOSAceFrameworkFlexSetFlexWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkFlexSetFlexHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkFlexSetFlexSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkFlexCreateByOptions(options: CJFlexOptions): Unit
}

/**
 * Defines Flex Component.
 *
 * @relation const Flex: FlexInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Flex <: ContainerBase {
    /**
    * Defines the constructor of Flex.
    *
    * @param { FlexDirection } direction
    * @param { FlexWrap } wrap
    * @param { FlexAlign } justifyContent
    * @param { ItemAlign } alignItems
    * @param { FlexAlign } alignContent
    * @returns { Flex }
    * @relation (value?: FlexOptions): FlexAttribute
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(direction!: FlexDirection = FlexDirection.Row, wrap!: FlexWrap = FlexWrap.NoWrap,
        justifyContent!: FlexAlign = FlexAlign.Start, alignItems!: ItemAlign = ItemAlign.Start,
        alignContent!: FlexAlign = FlexAlign.Start, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkFlexCreateWithParams(
                CJFlexParams(
                    direction.getValue(),
                    wrap.getValue(),
                    justifyContent.getValue(),
                    alignItems.getValue(),
                    alignContent.getValue()
                )
            )
        }
        this.child = child
    }

    @!APILevel[
        21,
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
        21,
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
        21,
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
