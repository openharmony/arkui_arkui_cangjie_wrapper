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

package ohos.state_manage

import std.collection.ArrayList
import ohos.labels.APILevel

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ObservedObject <: ObservedComplexAbstract {
    private let publishVars: ArrayList<ObservedPropertyAbstract> = ArrayList<ObservedPropertyAbstract>()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPublishVar(publishVar: ObservedPropertyAbstract) {
        publishVars.add(publishVar)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPublishVar(): ArrayList<ObservedPropertyAbstract> {
        return publishVars
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func subscribeInner(observer: Observer): Unit {
        for (publishVar in publishVars) {
            publishVar.subscribeEx(observer)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func unsubscribeInner(observer: Observer): Unit {
        for (publishVar in publishVars) {
            publishVar.unsubscribeEx(observer)
        }
    }
}
