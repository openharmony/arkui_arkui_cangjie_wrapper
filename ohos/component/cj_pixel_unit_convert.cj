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

import std.math.*

foreign func FfiOHOSAceFrameworkVp2Px(value: Float64): Float64

foreign func FfiOHOSAceFrameworkPx2Vp(value: Float64): Float64

foreign func FfiOHOSAceFrameworkFp2Px(value: Float64): Float64

foreign func FfiOHOSAceFrameworkPx2Fp(value: Float64): Float64

foreign func FfiOHOSAceFrameworkLpx2Px(value: Float64): Float64

foreign func FfiOHOSAceFrameworkPx2Lpx(value: Float64): Float64

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func vp2px(value: Length): Option<Length> {
    var value_ = transAppResourceToLength(value)
    if (value_.unitType.getValue() != LENGTH_VP) {
        return Option<Length>.None
    }
    var newValue = unsafe { FfiOHOSAceFrameworkVp2Px(value_.value) }
    if (newValue.isNaN()) {
        return Option<Length>.None
    }
    Option<Length>.Some(newValue.px)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func px2vp(value: Length): Option<Length> {
    var value_ = transAppResourceToLength(value)
    if (value_.unitType.getValue() != LENGTH_PX) {
        return Option<Length>.None
    }
    var newValue = unsafe { FfiOHOSAceFrameworkPx2Vp(value_.value) }
    if (newValue.isNaN()) {
        return Option<Length>.None
    }
    Option<Length>.Some(newValue.vp)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func fp2px(value: Length): Option<Length> {
    var value_ = transAppResourceToLength(value)
    if (value_.unitType.getValue() != LENGTH_FP) {
        return Option<Length>.None
    }
    var newValue = unsafe { FfiOHOSAceFrameworkFp2Px(value_.value) }
    if (newValue.isNaN()) {
        return Option<Length>.None
    }
    Option<Length>.Some(newValue.px)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func px2fp(value: Length): Option<Length> {
    var value_ = transAppResourceToLength(value)
    if (value_.unitType.getValue() != LENGTH_PX) {
        return Option<Length>.None
    }
    var newValue = unsafe { FfiOHOSAceFrameworkPx2Fp(value_.value) }
    if (newValue.isNaN()) {
        return Option<Length>.None
    }
    Option<Length>.Some(newValue.fp)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func lpx2px(value: Length): Option<Length> {
    var value_ = transAppResourceToLength(value)
    if (value_.unitType.getValue() != LENGTH_LPX) {
        return Option<Length>.None
    }
    var newValue = unsafe { FfiOHOSAceFrameworkLpx2Px(value_.value) }
    if (newValue.isNaN()) {
        return Option<Length>.None
    }
    Option<Length>.Some(newValue.px)
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func px2lpx(value: Length): Option<Length> {
    var value_ = transAppResourceToLength(value)
    if (value_.unitType.getValue() != LENGTH_PX) {
        return Option<Length>.None
    }
    var newValue = unsafe { FfiOHOSAceFrameworkPx2Lpx(value_.value) }
    if (newValue.isNaN()) {
        return Option<Length>.None
    }
    Option<Length>.Some(newValue.lpx)
}
