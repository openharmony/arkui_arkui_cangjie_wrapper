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
/**
 * Called when the drop-down refresh is set.
 *
 * @relation interface RefreshOptions
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RefreshOptions {
    /**
    * Whether the current component is being refreshed.
    *
    * @relation refreshing: boolean
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var refreshing: ?Bool
    /**
    * Whether the current event has changed
    *
    * @relation changeEvent: boolean
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var changeEvent: ?(Bool) -> Unit
    /**
    * Defines the options of refresh component.
    * 
    * @param { Bool } refreshing
    * @returns { This }
    * @relation (value: RefreshOptions): RefreshAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(refreshing!: ?Bool) {
        this.refreshing = refreshing ?? throw IllegalArgumentException("The type now is not supported.")
        this.changeEvent = {_ =>}
    }
    /**
    * Defines the options of refresh component.
    * 
    * @param { (Bool, (Bool) -> Unit) } refreshing
    * @returns { This }
    * @relation (value: RefreshOptions): RefreshAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(refreshing!: ?(Bool, (Bool) -> Unit)) {
        let tmpRefreshing = refreshing ?? throw IllegalArgumentException("The type now is not supported.")
        this.refreshing = tmpRefreshing[0]
        this.changeEvent = tmpRefreshing[1]
    }
}
/**
* Defines Refresh Component.
* 
* @relation declare const Refresh: RefreshInterface
*/
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Refresh <: CommonMethodComponent<RefreshAttribute> & RefreshAttribute {
    /**
    * Defines Refresh Component.
    * 
    * @param { RefreshOptions } value
    * @param { () -> Unit } content
    * @returns { This }
    * @relation (value: RefreshOptions): RefreshAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: ?RefreshOptions, child: () -> Unit) {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var offset: Length = 16.vp
        var friction: Int32 = 62
        let wrapper = {
            result: Bool =>
            (tmpValue.changeEvent ?? {_ =>})(result)
        }
        let lambdaData = Callback1Param<Bool, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRefreshCreateWithChangeEvent(
                (tmpValue.refreshing ?? throw IllegalArgumentException("The type now is not supported.")),
                offset.value,
                offset.unitType.getValue(),
                friction,
                lambdaData.getID()
            )
        }
        this.child = child
    }
    /**
    * Called when the refresh state changes.
    * 
    * @param { (RefreshStatus) -> Unit } callback
    * @returns { This }
    * @relation onStateChange(callback: (state: RefreshStatus) => void): RefreshAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStateChange(callback: ?(RefreshStatus) -> Unit): This {
        let tmpCallback = callback ?? throw IllegalArgumentException("The type now is not supported.")
        let wrapper = {
            value: Int32 => tmpCallback(RefreshStatus.parseValue(value))
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkRefreshOnStateChange(lambdaData.getID())
        }
        this
    }
    /**
    * Called when the refresh state is entered.
    * 
    * @param { () -> Unit } callback
    * @returns { This }
    * @relation onRefreshing(callback: () => void): RefreshAttribute
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onRefreshing(callback: ?() -> Unit): This {
        let tmpCallback = callback ?? throw IllegalArgumentException("The type now is not supported.")
        let lambdaData = Callback0Param<Unit>(tmpCallback)
        unsafe {
            FfiOHOSAceFrameworkRefreshOnRefreshing(lambdaData.getID())
        }
        this
    }
}
