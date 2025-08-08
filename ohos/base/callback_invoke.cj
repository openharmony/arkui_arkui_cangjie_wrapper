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

package ohos.base

import ohos.labels.APILevel

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CallbackObject {}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback0Argument <: CallbackObject {
    public open func invoke(): Unit
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback1Argument<A> <: CallbackObject {
    public open func invoke(arg: A): Unit
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback2Argument<A, B> <: CallbackObject {
    public open func invoke(arg1: A, arg2: B): Unit
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback3ArgumentWithReturn<A, B, C, D> <: CallbackObject {
    public open func invoke(arg1: A, arg2: B, arg3: C): D
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback1ArgumentWithReturn<A, B> <: CallbackObject {
    public open func invoke(arg1: A): B
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CallbackWithReturn<A> <: CallbackObject {
    public open func invoke(): A
}
