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

package ohos.base

import std.collection.*
import ohos.labels.APILevel

/**
 * Defines interface CollectionEx.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface CollectionEx<T> {
    /**
     * The size of the collection.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    prop size: Int64
    /**
     * Sets the element at the specified index with a new element.
     *
     * @param { Int64 } idx - The index of the element to get.
     * @param { T } value - The new element.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    operator func [](idx: Int64, value!: T): Unit
    /**
     * Gets the element at the specified index.
     *
     * @param { Int64 } idx - The index of the element to get.
     * @returns { T }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    operator func [](idx: Int64): T
}

extend<T> Array<T> <: CollectionEx<T> {}

extend<T> ArrayList<T> <: CollectionEx<T> {}
