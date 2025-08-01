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

package ohos.arkui.component.custom_view

import ohos.ffi.*
import ohos.labels.APILevel
import std.collection.HashMap
import std.collection.ArrayList

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class RemoteView <: FFIData {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func build(): Unit // abstract

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rerender(): Unit {} // abstract

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func purgeVariableDependenciesOnElmtId(_: Int64): Unit {} // abstract
    protected open func aboutToAppear(): Unit {}
    protected open func onPageShow(): Unit {}
    protected open func onPageHide(): Unit {}
    protected open func onBackPress(): Bool {
        false
    }
    protected open func updateWithJson(_: String): Unit {}
    protected open func pageTransition(): Unit {}
    protected open func onAboutToRender(): Unit {}
    protected open func onAfterRender(): Unit {}
    protected open func aboutToDisappear(): Unit {}
    protected open func onAboutToBeDeleted(): Unit {}
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func forceCompleteRerender(deep: Bool): Unit {}
    protected open func onDidBuild(): Unit {}
    protected open func aboutToReuseInternal(_: ReuseParams): Unit {}
    protected open func aboutToRecycleInternal(): Unit {}
    protected open func recycleSelf(_: String): Unit {}
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ReuseParams <: FFIData {
    private var maps: HashMap<String, Any>

    public init() {
        super()
        maps = HashMap<String, Any>()
    }

    // used by @Component
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arr: Array<(String, Any)>) {
        super()
        maps = HashMap<String, Any>(arr.size, {
            i => (arr[i][0], arr[i][1])
        })
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop size: Int64 {
        get() {
            maps.size
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get(key: String): ?Any {
        maps.get(key)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue<T>(key: String): ?T {
        let anyVal = maps.get(key)
        if (let Some(v) <- anyVal) {
            return (v as T) ?? Option<T>.None
        }
        Option<T>.None
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contains(key: String): Bool {
        maps.contains(key)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func add(key: String, value: Any): ?Any {
        maps.add(key, value)
    }
}
