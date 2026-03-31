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
 * 复杂场景：@Component 与 @Observed 混合，Observed 子类违规
 * 测试场景：Component 内 @State var book: Book，Book 为 @Observed 类且含构造函数
 * 预期错误：MacroErrorCode.InvalidConstructor（@Observed 不允许构造函数）
 * 验证：Component 引用 Observed 类型时，Observed 类的校验仍会触发
 */
package ohos_app_cangjie_entry.complex

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Observed
class Book {
    var title: String = ""
    init() {}
}

@Entry
@Component
class ComponentObservedChildInvalidView {
    @State var book: Book = Book()

    func build(): Unit {
        Column() {
            Text(this.book.title)
        }
    }
}
