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

package ohos.arkui.component.custom_component

import ohos.arkui.component.common.*
import ohos.arkui.state_management.*
import ohos.labels.APILevel

/**
 * ViewBuilder class.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ViewBuilder {
    /**
     * Builds the view.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public let build: () -> Unit

    /**
     * Initializes a new instance of the ViewBuilder class.
     *
     * @param { () -> Unit } build
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public init(build: () -> Unit) {
        this.build = build
    }

}

/**
 * Binds the view builder to the custom view.
 *
 * @param { (CustomView) -> ViewBuilder } builder - Custom build function modified by @Builder.
 * @param { CustomView } thisView - Current page object.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func bind(builder: (CustomView) -> ViewBuilder, thisView: CustomView) {
    builder(thisView).build
}

/**
 * Binds the view builder to the custom view with one observed property.
 *
 * @param { (CustomView, ObservedProperty<T1>) -> ViewBuilder } builder - Custom build function modified by @Builder.
 * @param { CustomView } thisView - Current page object.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func bind<T1> (builder: (CustomView, ObservedProperty<T1>) -> ViewBuilder, thisView: CustomView) {
    {x1: T1 => builder(thisView, ObservedProperty("", x1)).build()}
}

/**
 * Binds the view builder to the custom view with two observed properties.
 *
 * @param { (CustomView, ObservedProperty<T1>, ObservedProperty<T2>) -> ViewBuilder } builder - Custom build function modified by @Builder.
 * @param { CustomView } thisView - Current page object.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func bind<T1, T2> (
    builder: (CustomView, ObservedProperty<T1>, ObservedProperty<T2>) -> ViewBuilder,
    thisView: CustomView
) {
    {x1: T1, x2: T2 => builder(thisView, ObservedProperty("", x1), ObservedProperty("", x2)).build()}
}

/**
 * Binds the view builder to the custom view with three observed properties.
 *
 * @param { (CustomView, ObservedProperty<T1>, ObservedProperty<T2>, ObservedProperty<T3>) -> ViewBuilder } builder - Custom build function modified by @Builder.
 * @param { CustomView } thisView - Current page object.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func bind<T1, T2, T3> (
    builder: (CustomView, ObservedProperty<T1>, ObservedProperty<T2>, ObservedProperty<T3>) -> ViewBuilder,
    thisView: CustomView
) {
    {
        x1: T1, x2: T2, x3: T3 => builder(thisView, ObservedProperty("", x1), ObservedProperty("", x2),
            ObservedProperty("", x3)).build()
    }
}

/**
 * LegalCallCheck class. Checks whether the view builder is called in the correct context.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public class LegalCallCheck {
    /**
     * Checks whether the view builder is called in the correct context.
     *
     * @param { ViewBuilder } _
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func check(_: ViewBuilder) {}

    /**
     * Checks whether the view builder is called in the correct context.
     *
     * @param { CustomView } _
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func check(_: CustomView) {}
}
