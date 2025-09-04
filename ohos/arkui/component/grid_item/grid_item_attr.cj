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

package ohos.arkui.component.grid_item

import ohos.arkui.component.common.*
import ohos.labels.APILevel

sealed interface GridItemAttribute <: CommonMethod<GridItemAttribute> {

    func columnStart(columnStart: Int32): GridItemAttribute

    func columnEnd(columnEnd: Int32): GridItemAttribute

    func rowStart(rowStart: Int32): GridItemAttribute

    func rowEnd(rowEnd: Int32): GridItemAttribute
}
