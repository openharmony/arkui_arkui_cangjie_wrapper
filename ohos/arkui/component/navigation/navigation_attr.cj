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

package ohos.arkui.component.navigation

import ohos.arkui.component.common.*
import ohos.base.*

sealed interface NavigationAttribute <: CommonMethod<NavigationAttribute> {

    func navDestination(builder: ?(String) -> Unit): NavigationAttribute

    func title(value: ?ResourceStr, options!: ?NavigationTitleOptions): NavigationAttribute

    func title(value: ?CustomBuilder, options!: ?NavigationTitleOptions): NavigationAttribute

    func hideTitleBar(hide: ?Bool, animated!: ?Bool): NavigationAttribute
}

sealed interface NavDestinationAttribute <: CommonMethod<NavDestinationAttribute> {

    func onBackPressed(callback: ?() -> Bool): NavDestinationAttribute

    func onReady(callback: ?Callback<NavDestinationContext, Unit>): NavDestinationAttribute

    func title(value: ?ResourceStr, options!: ?NavigationTitleOptions): NavDestinationAttribute

    func title(value: ?CustomBuilder, options!: ?NavigationTitleOptions): NavDestinationAttribute

    func hideTitleBar(value: ?Bool): NavDestinationAttribute
}
