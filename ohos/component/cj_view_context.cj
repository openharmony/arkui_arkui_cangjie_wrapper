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

foreign func FfiOHOSAceFrameworkViewContextAnimation(option: NativeOptionAnimateParam): Unit

foreign func FfiOHOSAceFrameworkViewContextAnimationTo(option: NativeAnimateParam, callback: Int64, isImmediately: Bool): Unit

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func animateTo(animation: AnimateParam, callback: () -> Unit): Unit {
    let lambdaData = Callback0Param<Unit>(callback)
    unsafe {
        FfiOHOSAceFrameworkViewContextAnimationTo(parseAnimateParam(animation), lambdaData.getID(), false)
    }
}
