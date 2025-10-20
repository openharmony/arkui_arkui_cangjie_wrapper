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

package ohos.arkui.component.custom_view

import ohos.ffi.*
import ohos.labels.APILevel
import ohos.base.ReuseParams
import std.collection.HashMap
import std.collection.ArrayList

/**
 * Definition of RemoteView class.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class RemoteView <: FFIData {
    /**
     * Constructor of RemoteView.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }

    /**
     * Build the view component.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func build(): Unit // abstract

    /**
     * Do a rerender.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rerender(): Unit {}

    /**
     * Purge element ids no longer in use.
     *
     * @param { Int64 } _ - Element id.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func purgeVariableDependenciesOnElmtId(_: Int64): Unit {}
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

    /**
     * Force complete rerender.
     *
     * @param { Bool } deep - Whether to rerender components recursive.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func forceCompleteRerender(deep: Bool): Unit {}
    protected open func onDidBuild(): Unit {}
    protected open func aboutToReuseInternal(_: ReuseParams): Unit {}
    protected open func aboutToRecycleInternal(): Unit {}
    protected open func recycleSelf(_: String): Unit {}
}
