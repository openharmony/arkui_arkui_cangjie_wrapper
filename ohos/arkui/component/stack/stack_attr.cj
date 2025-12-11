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

package ohos.arkui.component.stack

import ohos.arkui.component.common.{CommonMethod, Alignment}
import ohos.labels.{APILevel, Hide}

/**
 * Defines the Stack attribute functions.
 * Provides methods for configuring the appearance and behavior of the Stack component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface StackAttribute <: CommonMethod<StackAttribute> {
    /**
    * Called when the alignment of items in the container is set.
    * Configures how child components are aligned within the stack container.
    *
    * @param { ?Alignment } value - Alignment of child components within the stack.
    * @returns { StackAttribute } Returns the stack attribute.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignContent(value: ?Alignment): StackAttribute
}
