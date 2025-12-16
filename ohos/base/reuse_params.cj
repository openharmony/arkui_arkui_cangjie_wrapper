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

import std.collection.HashMap
import ohos.labels.{APILevel, Hide}

/**
 * Defines class ReuseParams.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ReuseParams {
    private var maps: HashMap<String, Any>

    /**
     * ReuseParams constructor.
     *
     * @param { Array<(String, Any)> } arr - The params array
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arr: Array<(String, Any)>) {
        maps = HashMap<String, Any>(arr.size, {
            i => (arr[i][0], arr[i][1])
        })
    }

    protected prop size: Int64 {
        get() {
            maps.size
        }
    }

    /**
     * Gets the value of the specified key.
     *
     * @param { String } key - The key to get value
     * @returns { ?T } - The value associated with the key, or null if not found
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get<T>(key: String): ?T {
        let anyVal = maps.get(key)
        if (let Some(v) <- anyVal) {
            return (v as T) ?? Option<T>.None
        }
        Option<T>.None
    }

    protected func contains(key: String): Bool {
        maps.contains(key)
    }

    protected func add(key: String, value: Any): ?Any {
        maps.add(key, value)
    }
}
