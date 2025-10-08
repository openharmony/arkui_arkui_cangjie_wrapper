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

import std.collection.*
import ohos.labels.APILevel

/**
 * Defines interface CollectionEx.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CollectionEx<T> {
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop size: Int64
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    operator func [](idx: Int64, value!: T): Unit
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    operator func [](idx: Int64): T
}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend<T> Array<T> <: CollectionEx<T> {}

@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
extend<T> ArrayList<T> <: CollectionEx<T> {}
