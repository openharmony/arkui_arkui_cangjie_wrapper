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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewObservable {
    @State var arr: ObservedArrayList<Int64> = ObservedArrayList<Int64>([1, 2])
    @State var arr2: ObservedArrayList<Book> = ObservedArrayList<Book>([Book(title: "myBook", id: 3214324)])

    
    @State var book_arr: ObservedArrayList<Book> = ObservedArrayList<Book>([Book(title: "book1", id: 123456),
                                                                            Book(title: "book2", id: 123456)])
    @State var store_arr: ObservedArrayList<Store> = ObservedArrayList<Store>([Store(addre: "store_addre1", size: 70),
                                                                            Store(addre: "store_addre2", size: 70)])
    @State var arr_test3: ObservedArrayList<Int64> = ObservedArrayList<Int64>([1, 2])
    var arr_test3_value:ArrayList<Int64> = ArrayList<Int64>([0,0])
    var arr_test3_size: Int64 = 0
    let test_array = [11,22,33]
    var tmp_arr : ObservedArrayList<Int64> = ObservedArrayList<Int64>([111, 222])
    var tmp_store_arr: ObservedArrayList<Store> = ObservedArrayList<Store>([Store(addre: "tmp_store_addre1", size: 70),
                                                                            Store(addre: "tmp_store_addre2", size: 70)])

    protected override func aboutToAppear() {
        let book = Book(title: "myBook2", id: 32143245)
        arr2.append(book)
        arr2[1].title = "myBook1"
    }

    protected override func aboutToDisappear() {
        arr2.unsubscribeAll()
    }

    func build() {
        Column {
            Text("arr[0] is ${arr[0]}").id("text1")
            Button("click").onClick { e =>
                arr[0] = 0
            }.id("click")

            Button("click2").onClick{ e =>
                arr[0] = 0
            }.id("click2")

            Text("arr_test3_value[0] is ${arr_test3_value[0]}").id("arr3_value_text")
            Text("arr_test3_index[0] is ${arr_test3[0]}").id("arr3_text")
            Text("arr_test3_size is ${arr_test3_size}").id("arr3_size_text")
            Button("test_array_get").onClick{ e =>
                arr_test3_value = arr_test3.get()
            }.id("test_array_get")
            Button("test_array_setA").onClick{ e =>
                arr_test3.set(test_array)
            }.id("test_array_setA")
            Button("test_array_setOCA").onClick{ e =>
                arr_test3.set(tmp_arr)
                
                store_arr[0] = Store(addre: "store_addre", size: 130)
                store_arr.set(tmp_store_arr)
                book_arr.subscribeInner(this)
                book_arr.unsubscribeInner(this)
            }.id("test_array_setOCA")
            Button("test_array_prop_size").onClick{ e =>
                arr_test3_size = arr_test3.size
            }.id("test_array_prop_size")

        }

    }
}

@Observed
class Book{
    @Publish var title: String = ""
    @Publish var price: Int64 = 9
    var id: Int64
}

@Observed
public class Store{
    @Publish var addre: String = ""
    @Publish var size: Int64 = 100
}