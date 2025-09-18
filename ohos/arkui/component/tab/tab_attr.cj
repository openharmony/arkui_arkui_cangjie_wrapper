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

package ohos.arkui.component.tab

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.resource.*

sealed interface TabsAttribute <: CommonMethod<TabsAttribute> {

    func barWidth(value: ?Length): TabsAttribute

    func barHeight(value: ?Length): TabsAttribute

    func vertical(value: ?Bool): TabsAttribute

    func scrollable(value: ?Bool): TabsAttribute

    func barMode(value: ?BarMode): TabsAttribute

    func animationDuration(value: ?Float32): TabsAttribute

    func onChange(event: ?Callback<Int32, Unit>): TabsAttribute
}


sealed interface TabContentAttribute <: CommonMethod<TabContentAttribute> {

    func tabBar(content: ?ResourceStr): TabContentAttribute

    func tabBar(icon!: ?ResourceStr, text!: ?ResourceStr): TabContentAttribute

    func tabBar(content: ?CustomBuilder): TabContentAttribute
}
