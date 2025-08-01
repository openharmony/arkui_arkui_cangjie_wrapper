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

package ohos.arkui.component.refresh

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRefreshCreate(refreshing: Bool, offset: Float64, offsetUnit: Int32, friction: Int32): Unit

    func FfiOHOSAceFrameworkRefreshCreateWithChangeEvent(refreshing: Bool, offset: Float64, offsetUnit: Int32,
        friction: Int32, callback: Int64): Unit

    func FfiOHOSAceFrameworkRefreshOffset(offset: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkRefreshPullToRefresh(value: Bool): Unit

    func FfiOHOSAceFrameworkRefreshPullDownRatio(value: Float64): Unit

    func FfiOHOSAceFrameworkRefreshResetPullDownRatio(): Unit

    func FfiOHOSAceFrameworkRefreshOnStateChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkRefreshOnRefreshing(callback: Int64): Unit

    func FfiOHOSAceFrameworkRefreshOnOffsetChange(callback: Int64): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RefreshParams {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var refreshing: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var changeEvent: (Bool) -> Unit

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(refreshing!: Bool) {
        this.refreshing = refreshing
        this.changeEvent = {_ =>}
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(refreshing!: (Bool, (Bool) -> Unit)) {
        this.refreshing = refreshing[0]
        this.changeEvent = refreshing[1]
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Refresh <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(refreshparams: RefreshParams, content: () -> Unit) {
        var offset: Length = 16.vp
        var friction: Int32 = 62
        let wrapper = {
            value: Bool =>
            refreshparams.changeEvent(value)
        }
        let lambdaData = Callback1Param<Bool, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRefreshCreateWithChangeEvent(
                refreshparams.refreshing,
                offset.value,
                offset.unitType.getValue(),
                friction,
                lambdaData.getID()
            )
        }
        this.child = content
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStateChange(callback: (RefreshStatus) -> Unit): This {
        let wrapper = {
            value: Int32 => callback(RefreshStatus.parseValue(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRefreshOnStateChange(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onRefreshing(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkRefreshOnRefreshing(lambdaData.getID())
        }
        this
    }
}
