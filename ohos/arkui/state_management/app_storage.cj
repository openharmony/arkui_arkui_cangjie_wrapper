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

package ohos.arkui.state_management

import ohos.base.*
import ohos.labels.APILevel
import std.collection.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class AppStorage {
    protected static var instance: ?AppStorage = None

    private var storage: LocalStorage = LocalStorage()

    private static func getOrCreate(): AppStorage {
        match (AppStorage.instance) {
            case None => AppStorage.instance = AppStorage()
            case Some(v) => ()
        }
        return AppStorage.instance.getOrThrow()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func link<T>(propName: String): ?ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.link<T>(propName)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.setAndLink<T>(propName, defaultValue)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func `prop`<T>(propName: String): ?ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.`prop`<T>(propName)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T> {
        return AppStorage.getOrCreate().storage.setAndProp<T>(propName, defaultValue)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func has(propName: String): Bool {
        return AppStorage.getOrCreate().storage.has(propName)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func get<T>(propName: String): ?T {
        return AppStorage.getOrCreate().storage.get<T>(propName)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func set<T>(propName: String, newValue: T): Bool {
        return AppStorage.getOrCreate().storage.set<T>(propName, newValue)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func setOrCreate<T>(propName: String, newValue: T): Unit {
        AppStorage.getOrCreate().storage.setOrCreate<T>(propName, newValue)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func delete(propName: String): Bool {
        AppStorage.getOrCreate().storage.delete(propName)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): EquatableCollection<String> {
        return AppStorage.getOrCreate().storage.keys()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func size(): Int64 {
        return AppStorage.getOrCreate().storage.size()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func clear(): Bool {
        return AppStorage.getOrCreate().storage.clear()
    }
}
