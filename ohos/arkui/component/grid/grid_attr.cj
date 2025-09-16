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

package ohos.arkui.component.grid

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.arkui.component.scroll.*

sealed interface GridAttribute <: ScrollableCommonMethod<GridAttribute> {

    func columnsTemplate(value: ?String): GridAttribute

    func rowsTemplate(value: ?String): GridAttribute

    func columnsGap(value: ?Length): GridAttribute

    func rowsGap(value: ?Length): GridAttribute

    func cachedCount(count: ?Int32): GridAttribute

    func cachedCount(count: ?Int32, show: ?Bool): GridAttribute
}
