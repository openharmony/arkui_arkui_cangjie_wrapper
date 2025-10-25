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

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.*
import std.deriving.Derive
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFrameworkEnvironmentGetAccessibilityEnabled(): NativeOptionBool

    func FfiOHOSAceFrameworkEnvironmentGetColorMode(): NativeOptionInt32

    func FfiOHOSAceFrameworkEnvironmentGetFontScale(): NativeOptionFloat32

    func FfiOHOSAceFrameworkEnvironmentGetFontWeightScale(): NativeOptionFloat32

    func FfiOHOSAceFrameworkEnvironmentGetLayoutDirection(): NativeOptionInt32

    func FfiOHOSAceFrameworkEnvironmentGetLanguageCode(): NativeOptionCString
}

/**
 * Defines the ColorMode of device.
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum ColorMode {
    /**
     * Light mode.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Light
    |
    /**
     * Dark mode.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Dark
    | ...

    func getValue(): Int32 {
        match (this) {
            case Light => 0
            case Dark => 1
            case _ => throw BusinessException(100001, "Internal error.")
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

/**
 * Defines the LayoutDirection of device.
 */
@Derive[Equatable]
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LayoutDirection {
    /**
     * Elements are laid out from left to right.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Ltr
    |
    /**
     * Elements are laid out from right to left.
     */
    @!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Rtl
    |
    /**
     * Elements are laid out from auto.
     */
    @!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Auto
    | ...

    static func parse(val: Int32): LayoutDirection {
        return match (val) {
            case 0 => Rtl
            case 1 => Ltr
            case _ => Auto
        }
    }
}

/**
 * Defines the Environment interface.
 */
@!APILevel[
    22,
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
        Environment.instance.getOrThrow({
            => BusinessException(100001, "Internal error.")
        })
    }

    /**
     * Cleans up the environment properties and releases resources.
     * This function deletes all environment properties from AppStorage
     * and clears the internal instance reference.
     * If the instance is already None, this function returns immediately.
     *
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func aboutToBeDeleted(): Unit {
        if (Environment.instance.isNone()) {
            return
        }
        Environment.getOrCreate().innerAboutToBeDeleted()
        Environment.instance = None
    }

    /**
     * Returns an Array<string> of all environment property keys.
     *
     * @returns { Array<string> } all environment property keys.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func keys(): Array<String> {
        Environment.getOrCreate().innerKeys().toArray()
    }

    /**
     * Creates a new property in AppStorage. The UI framework implementation takes care of updating
     * its value whenever the named device environment property changes. Recommended use is at app startup.
     * The function call fails and returns false if a property with given name exists in AppStorage already.
     * It is wrong API use to access a property with given name in AppStorage before calling Environment.envProp.
     *
     * @param { String } key - environment property
     * @param { T } value - is the default value if cannot get the environment property value
     * @returns { Bool } false if method failed.
     * @throws { BusinessException } 100001 - Internal error.
     */
    @!APILevel[
        22,
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
            var propVal = AppStorage.property<T>(key)
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
