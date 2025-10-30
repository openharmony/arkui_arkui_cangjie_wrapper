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

import ohos.ffi.{FFIData}
import ohos.labels.APILevel
import ohos.base.ReuseParams
import std.collection.HashMap
import std.collection.ArrayList

/**
 * Definition of RemoteView class.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class RemoteView <: FFIData {
    /**
     * Constructor of RemoteView.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super()
    }

    /**
     * Define declarative UI descriptions for custom component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func build(): Unit // abstract

    /**
     * Do a rerender.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func rerender(): Unit {}

    /**
     * Purge element ids no longer in use.
     *
     * @param { Int64 } _ - Element id.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func purgeVariableDependenciesOnElmtId(_: Int64): Unit {}
    /**
     * Invoked after a new instance of the custom component is created
     * and before its build() function is executed. You can change state variables in aboutToAppear.
     * The change will take effect when you execute the build() function next time.
     * The aboutToAppear lifecycle callback of a custom component with a custom layout
     * is invoked during the layout process.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func aboutToAppear(): Unit {}
    /**
     * Invoked each time the page is displayed, for example, during page redirection.
     * When the application is switched to the foreground.
     * It works only for the custom components decorated by **@Entry**.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func onPageShow(): Unit {}
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    /**
     * Invoked each time the page is hidden, for example, during page redirection.
     * When the application is switched to the background. 
     * It works only for the custom components decorated by **@Entry**.
     */
    protected open func onPageHide(): Unit {}
    /**
     * Invoked when the user clicks the Back button.
     * It works only for the custom components decorated by @Entry.
     * The value **true** means that the page executes its own return logic.
     * And **false** (default) means that the default return logic is used.
     * @returns { Bool }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func onBackPress(): Bool {
        false
    }
    protected open func updateWithJson(_: String): Unit {}
    /**
     * PageTransition Method and it is migrated from class CustomComponent.
     * Implement Animation when enter this page or move to other pages.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func pageTransition(): Unit {}
    protected open func onAboutToRender(): Unit {}
    protected open func onAfterRender(): Unit {}
    /**
     * Invoked when this component is about to disappear.
     * Do not change state variables in the aboutToDisappear function as doing this can cause unexpected errors.
     * For example, the modification of the @Link decorated variable may cause unstable application running.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func aboutToDisappear(): Unit {}
    protected open func onAboutToBeDeleted(): Unit {}

    /**
     * Force complete rerender.
     *
     * @param { Bool } deep - Whether to rerender components recursive.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public open func forceCompleteRerender(deep: Bool): Unit {}
    /**
     * The callback method after the custom component is built and it is migrated from class CustomComponent.
     *
     * Triggered when the custom component has been built.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func onDidBuild(): Unit {}
    protected open func aboutToReuseInternal(_: ReuseParams): Unit {}
    protected open func aboutToRecycleInternal(): Unit {}
    protected open func recycleSelf(_: String): Unit {}
}
