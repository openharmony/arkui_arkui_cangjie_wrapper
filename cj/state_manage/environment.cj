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

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.*

foreign {
    func FfiOHOSAceFrameworkEnvironmentGetAccessibilityEnabled(): NativeOptionBool

    func FfiOHOSAceFrameworkEnvironmentGetColorMode(): NativeOptionInt32

    func FfiOHOSAceFrameworkEnvironmentGetFontScale(): NativeOptionFloat32

    func FfiOHOSAceFrameworkEnvironmentGetFontWeightScale(): NativeOptionFloat32

    func FfiOHOSAceFrameworkEnvironmentGetLayoutDirection(): NativeOptionInt32

    func FfiOHOSAceFrameworkEnvironmentGetLanguageCode(): NativeOptionCString
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ColorMode {
    Light
    | Dark
    | ...

    func getValue(): Int32 {
        match (this) {
            case Light => 0
            case Dark => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ColorMode {
        if (val == 1) {
            return Dark
        } else {
            return Light
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutDirection {
    Ltr
    | Rtl
    | ...

    func getValue(): Int32 {
        match (this) {
            case Ltr => 1
            case Rtl => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): LayoutDirection {
        if (val == 0) {
            return Rtl
        } else {
            return Ltr
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Environment {
    protected static var instance: ?Environment = None
    protected let props: HashMap<String, ObservedPropertyAbstract>

    private init() {
        props = HashMap<String, ObservedPropertyAbstract>()
    }

    private static func getOrCreate(): Environment {
        match (Environment.instance) {
            case None => Environment.instance = Environment()
            case Some(v) => ()
        }
        Environment.instance.getOrThrow()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func aboutToBeDeleted(): Unit {
        if (Environment.instance.isNone()) {
            return
        }
        Environment.getOrCreate().innerAboutToBeDeleted()
        Environment.instance = None
    }

    /**
     * get keys from envionment
     *
     * @return EquatableCollection<String>
     * @since 10
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): EquatableCollection<String> {
        Environment.getOrCreate().innerKeys()
    }

    /**
     * save the environment variables of the device to AppStorage.
     *
     * @return Bool
     * @since 10
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func envProp<T>(key: String, defaultValue: T): Bool {
        return Environment.getOrCreate().innerEnvProp<T>(key, defaultValue)
    }

    private func innerSetAndPut<T>(key: String, value: T): Unit {
        let val = AppStorage.setAndProp<T>(key, value)
        props.add(key, val)
    }

    private func innerEnvProp<T>(key: String, value: T): Bool {
        unsafe {
            var propVal = AppStorage.`prop`<T>(key)
            if (!propVal.isNone()) {
                return false
            }
            match (key) {
                case "accessibilityEnabled" =>
                    let res = FfiOHOSAceFrameworkEnvironmentGetAccessibilityEnabled()
                    if (res.hasValue) {
                        let val = AppStorage.setAndProp<Bool>(key, res.value)
                        props.add(key, val)
                    } else {
                        innerSetAndPut<T>(key, value)
                    }
                case "colorMode" =>
                    let res = FfiOHOSAceFrameworkEnvironmentGetColorMode()
                    if (res.hasValue) {
                        let val = AppStorage.setAndProp<ColorMode>(key, ColorMode.parse(res.value))
                        props.add(key, val)
                    } else {
                        innerSetAndPut<T>(key, value)
                    }
                case "fontScale" =>
                    let res = FfiOHOSAceFrameworkEnvironmentGetFontScale()
                    if (res.hasValue) {
                        let val = AppStorage.setAndProp<Float32>(key, res.value)
                        props.add(key, val)
                    } else {
                        innerSetAndPut<T>(key, value)
                    }
                case "fontWeightScale" =>
                    let res = FfiOHOSAceFrameworkEnvironmentGetFontWeightScale()
                    if (res.hasValue) {
                        let val = AppStorage.setAndProp<Float32>(key, res.value)
                        props.add(key, val)
                    } else {
                        innerSetAndPut<T>(key, value)
                    }
                case "layoutDirection" =>
                    let res = FfiOHOSAceFrameworkEnvironmentGetLayoutDirection()
                    if (res.hasValue) {
                        let val = AppStorage.setAndProp<LayoutDirection>(key, LayoutDirection.parse(res.value))
                        props.add(key, val)
                    } else {
                        innerSetAndPut<T>(key, value)
                    }
                case "languageCode" =>
                    let res = FfiOHOSAceFrameworkEnvironmentGetLanguageCode()
                    if (res.hasValue) {
                        let val = AppStorage.setAndProp<String>(key, res.value.toString())
                        props.add(key, val)
                    } else {
                        innerSetAndPut<T>(key, value)
                    }
                    // res.value always malloced in native side
                    res.free()
                case _ =>
                    BaseLog.warn("Environment: invalid key: ${key}")
                    return false
            }
            return true
        }
    }

    private func innerKeys(): EquatableCollection<String> {
        props.keys()
    }

    private func innerAboutToBeDeleted(): Unit {
        for (key in innerKeys()) {
            AppStorage.delete(key)
        }
    }
}
