/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/*
 * 测试场景：单子容器 Badge 尾随块内直接包含 LazyForEach（与 ForEach 相同约束）
 * 预期错误：MacroErrorCode.InvalidParentChild（ForEachNotAllowedInMonadic）
 * 路径：diag_parser.validateChildComponents
 */
package ohos_app_cangjie_entry.component_constraint

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.component.lazy_for_each.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/**
 * 最小 IDataSource，仅用于触发 LazyForEach 语法路径
 */
class LazyForeachTestDs <: IDataSource<String> {
    public init() {}

    public func totalCount(): Int64 {
        1
    }

    public func getData(index: Int64): String {
        "x"
    }

    public func registerDataChangeListener(listener: DataChangeListener): Unit {}

    public func unregisterDataChangeListener(listener: DataChangeListener): Unit {}
}

@Entry
@Component
class MonadicLazyforeachInBadgeView {
    let ds: LazyForeachTestDs = LazyForeachTestDs()

    func build(): Unit {
        Badge() {
            LazyForEach(
                this.ds,
                itemGenerator: { item: String, index: Int64 =>
                    Text(item)
                }
            )
        }
    }
}
