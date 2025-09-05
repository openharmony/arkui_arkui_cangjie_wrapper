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

/**
 * Created on 2025/3/20
 */
package ohos_app_cangjie_entry
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewProp {
    @State var count: Int64 = 0
    @State var msg: String = "hello"
    @State var dataSource: ObservedArrayList<String> = ObservedArrayList<String>()
    func build() {
        Column {
            Button("This is a case of @Prop ${count} _____ ParentComponent")
            .id("ParentComponent")
            .onClick({evt =>
                count = count + 1
            })
            SubComponent(count: count)
                        Button("clear")
                .id("clear")
                .onClick {e =>
                dataSource.clear()
            }
            Button("update")
                .id("update")
                .onClick { e =>
                for (i in 0..20) {
                    dataSource.append("${i}")
                }

            }
            List() {
                ForEach(dataSource, itemGeneratorFunc: {item: String, i: Int64 =>
                    ListItem() {
                        Text(msg)
                    }
                })
        }
        }
    }
}

@Component
class SubComponent {
    @Prop var count: Int64
    func build() {
        Column {
            Button("This is a case of @Prop ${count} _____ SubComponent")
            .id("SubComponent")
            .onClick({evt =>
                count = count + 1
            })
        }
    }
}


