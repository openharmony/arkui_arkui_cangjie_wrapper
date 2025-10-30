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

import ohos.arkui.component.common.{CommonMethodComponent, FlexDirection, FlexWrap, FlexAlign, ItemAlign}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length, LengthProp}
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

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit
}

/**
 * Defines Flex Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Flex <: CommonMethodComponent<Flex> & FlexAttribute {
    /**
     * Defines the constructor of Flex.
     *
     * @param { ?FlexDirection } direction - Direction in which child components are arranged in the Flex component.
     * @param { ?FlexWrap } wrap - Whether the Flex component has a single line or multiple lines.
     * @param { ?FlexAlign } justifyContent - Alignment mode of the child components in the Flex component along the main axis.
     * @param { ?ItemAlign } alignItems - Alignment mode of the child components in the Flex component along the cross axis.
     * @param { ?FlexAlign } alignContent - Alignment mode of the child components in a multi-row Flex component along the cross axis.
     * @param { () -> Unit } child - The child component to be added to the Flex component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(direction!: ?FlexDirection = None, wrap!: ?FlexWrap = None,
        justifyContent!: ?FlexAlign = None, alignItems!: ?ItemAlign = None,
        alignContent!: ?FlexAlign = None, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkFlexCreateWithParams(
                CJFlexParams(
                    (direction ?? FlexDirection.Row).getValue(),
                    (wrap ?? FlexWrap.NoWrap).getValue(),
                    (justifyContent ?? FlexAlign.Start).getValue(),
                    (alignItems ?? ItemAlign.Start).getValue(),
                    (alignContent ?? FlexAlign.Start).getValue()
                )
            )
        }
        this.child = child
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkFlexSetFlexWidth(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) => 
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    FfiOHOSAceFrameworkFlexSetFlexHeight(value_.value, value_.unitType.getValue())
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        if (width.isNone() || height.isNone()) {
            widthInner(width)
            heightInner(height)
        } else {
            var width_ = transAppResourceToLength(width ?? 0.0.vp)
            var height_ = transAppResourceToLength(height ?? 0.0.vp)
            unsafe {
                FfiOHOSAceFrameworkFlexSetFlexSize(width_.value, width_.unitType.getValue(), height_.value,
                    height_.unitType.getValue())
            }
        }
        this
    }
}
