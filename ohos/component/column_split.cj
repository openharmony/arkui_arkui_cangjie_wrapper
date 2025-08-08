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
struct DividerParam {
    DividerParam(
        let startMargin: Float64,
        let startMarginUnit: Int32,
        let endMargin: Float64,
        let endMarginUnit: Int32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkColumnSplitCreate(): Unit

    func FfiOHOSAceFrameworkColumnSplitResizeable(value: Bool): Unit

    func FfiOHOSAceFrameworkColumnSplitDivider(params: DividerParam): Unit

    func FfiOHOSAceFrameworkColumnSplitClip(isClip: Bool): Unit

    func FfiOHOSAceFrameworkColumnSplitClipByShape(shapeId: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ColumnSplit <: ContainerBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkColumnSplitCreate()
        }
        this.child = content
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resizeable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkColumnSplitResizeable(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func divider(startMargin!: Length = 0.vp, endMargin!: Length = 0.vp): This {
        unsafe {
            FfiOHOSAceFrameworkColumnSplitDivider(
                DividerParam(
                    transAppResourceToLength(startMargin).value,
                    transAppResourceToLength(startMargin).unitType.getValue(),
                    transAppResourceToLength(endMargin).value,
                    transAppResourceToLength(endMargin).unitType.getValue(),
                )
            )
        }
        this
    }
}
