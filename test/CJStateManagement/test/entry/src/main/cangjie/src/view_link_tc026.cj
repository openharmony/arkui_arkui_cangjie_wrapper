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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

/**
 * TC_026: @Link Two-way Binding (Collection Types)
 * Test Scenario: Parent and child components share collection state through @Link
 * Expected Result: Collection modifications are synchronized between parent and child components
 */
@Component
class LinkChildComponentTC026 {
    @Link var linkedArray: ObservedArrayList<Int64>
    @Link var linkedList: ObservedArrayList<String>

    func build(): Unit {
        Column() {
            Text("Child Component (Can Modify Collections)")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .id("child_title")
            
            Text("Linked Array Size: ${this.linkedArray.size}")
                .id("child_array_size_text")
            
            Button("Child: Add to Array")
                .id("child_add_array_button")
                .onClick({ e =>
                    this.linkedArray.append(Int64(this.linkedArray.size))
                })
            
            Button("Child: Remove from Array")
                .id("child_remove_array_button")
                .onClick({ e =>
                    if (this.linkedArray.size > 0) {
                        this.linkedArray.remove(this.linkedArray.size - 1)
                    }
                })
            
            Button("Child: Clear Array")
                .id("child_clear_array_button")
                .onClick({ e => this.linkedArray.clear() })
            
            Text("Linked List Size: ${this.linkedList.size}")
                .id("child_list_size_text")
            
            Button("Child: Add to List")
                .id("child_add_list_button")
                .onClick({ e =>
                    this.linkedList.append("Child Item ${this.linkedList.size}")
                })
            
            Button("Child: Remove from List")
                .id("child_remove_list_button")
                .onClick({ e =>
                    if (this.linkedList.size > 0) {
                        this.linkedList.remove(this.linkedList.size - 1)
                    }
                })
            
            ForEach(
                this.linkedArray,
                itemGeneratorFunc: { item: Int64, index: Int64 =>
                    Text("Array[${index}]: ${item}")
                        .fontSize(14)
                        .padding(5)
                        .id("child_array_item_${index}")
                }
            )
        }
        .padding(10)
        .backgroundColor(0xE0E0E0)
        .margin(top: 10)
    }
}

@Entry
@Component
class ViewLinkTC026 {
    @State var parentArray: ObservedArrayList<Int64> = ObservedArrayList<Int64>([1, 2, 3])
    @State var parentList: ObservedArrayList<String> = ObservedArrayList<String>(["Item1", "Item2"])

    func build(): Unit {
        Scroll() {
            Column() {
                Text("TC_026: @Link Two-way Binding (Collection Types)")
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .margin(top: 10, bottom: 10)
                    .id("test_title")

                Text("Parent Component")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .id("parent_title")
                
                Text("Parent Array Size: ${this.parentArray.size}")
                    .id("parent_array_size_text")
                
                Button("Parent: Add to Array")
                    .id("parent_add_array_button")
                    .onClick({ e =>
                        this.parentArray.append(Int64(this.parentArray.size + 1))
                    })
                
                Button("Parent: Remove from Array")
                    .id("parent_remove_array_button")
                    .onClick({ e =>
                        if (this.parentArray.size > 0) {
                            this.parentArray.remove(this.parentArray.size - 1)
                        }
                    })
                
                Button("Parent: Clear Array")
                    .id("parent_clear_array_button")
                    .onClick({ e => this.parentArray.clear() })
                
                Text("Parent List Size: ${this.parentList.size}")
                    .id("parent_list_size_text")
                
                Button("Parent: Add to List")
                    .id("parent_add_list_button")
                    .onClick({ e =>
                        this.parentList.append("Parent Item ${this.parentList.size + 1}")
                    })
                
                Button("Parent: Remove from List")
                    .id("parent_remove_list_button")
                    .onClick({ e =>
                        if (this.parentList.size > 0) {
                            this.parentList.remove(this.parentList.size - 1)
                        }
                    })
                
                Button("Reset Collections")
                    .id("reset_collections_button")
                    .onClick({ e =>
                        this.parentArray = ObservedArrayList<Int64>([1, 2, 3])
                        this.parentList = ObservedArrayList<String>(["Item1", "Item2"])
                    })

                ForEach(
                    this.parentArray,
                    itemGeneratorFunc: { item: Int64, index: Int64 =>
                        Text("Array[${index}]: ${item}")
                            .fontSize(14)
                            .padding(5)
                            .id("parent_array_item_${index}")
                    }
                )

                // Note: Cannot call .id() directly after custom component constructor
                // Wrap it in a container and set id on the container
                Column() {
                    LinkChildComponentTC026(
                        linkedArray: this.parentArray,
                        linkedList: this.parentList
                    )
                }
                .id("child_component")
            }
            .width(100.percent)
            .padding(10)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF1F3F5)
    }
}

