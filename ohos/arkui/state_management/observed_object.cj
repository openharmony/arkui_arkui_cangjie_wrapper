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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.state_management

import std.collection.ArrayList
import ohos.labels.APILevel

/**
 * Defines class ObservedObject.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class ObservedObject <: ObservedComplexAbstract {
    private let publishVars: ArrayList<ObservedPropertyAbstract> = ArrayList<ObservedPropertyAbstract>()

    /**
     * Adds a published variable to the observed object.
     *
     * @param { ObservedPropertyAbstract } publishVar - The published variable to add.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addPublishVar(publishVar: ObservedPropertyAbstract) {
        publishVars.add(publishVar)
    }

    /**
     * Gets the list of published variables associated with this observed object.
     *
     * @returns { ArrayList<ObservedPropertyAbstract> } The list of published variables.
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPublishVar(): ArrayList<ObservedPropertyAbstract> {
        return publishVars
    }

    protected func subscribeInner(observer: Observer): Unit {
        for (publishVar in publishVars) {
            publishVar.subscribeEx(observer)
        }
    }

    protected func unsubscribeInner(observer: Observer): Unit {
        for (publishVar in publishVars) {
            publishVar.unsubscribeEx(observer)
        }
    }
}
