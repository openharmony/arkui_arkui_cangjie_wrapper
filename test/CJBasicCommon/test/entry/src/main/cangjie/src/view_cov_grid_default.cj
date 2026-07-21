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

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

func makeGridColOptionsNone(): GridColOptions {
    let opts = GridColOptions()
    opts.xs = Option<Int32>.None
    opts.sm = Option<Int32>.None
    opts.md = Option<Int32>.None
    opts.lg = Option<Int32>.None
    opts.xl = Option<Int32>.None
    opts.xxl = Option<Int32>.None
    return opts
}

@Entry
@Component
class ViewCovGridColDefault {
    func build() {
        Scroll() {
            Column {
                GridRow() {
                    GridCol(span: makeGridColOptionsNone(), offset: makeGridColOptionsNone(), order: makeGridColOptionsNone()) { Text("gridColDefault") }
                }
            }
        }.id("ViewCovGridColDefault")
    }
}
