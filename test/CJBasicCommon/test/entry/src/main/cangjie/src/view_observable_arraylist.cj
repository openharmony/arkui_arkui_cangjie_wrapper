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
import std.collection.ArrayList

@Entry
@Component
class View_Observable_ArrayList {   
    var arrlist: ArrayList<Book2> = ArrayList<Book2>([Book2(title: "arrlist1", id: 123456), Book2(title: "arrlist2", id: 123456)])
    @State var obs_arrlist: ObservedArrayList<Book2> = ObservedArrayList<Book2>(arrlist)
    var tmp_arrlist: ArrayList<Book2> = ArrayList<Book2>([Book2(title: "tmp_arrlist1", id: 123456), Book2(title: "tmp_arrlist2", id: 123456)])
    var tmp_obs_arrlist: ObservedArrayList<Book2> = ObservedArrayList<Book2>(tmp_arrlist)
    var obs_arrlist_size: Int64 = 0
    var obs_arrlist_isempty: Bool = true
    var tmp_obs_arrlist_isempty: Bool = false
    var tmp_array: Array<Book2> = [Book2(title: "set_arr1", id: 123456), Book2(title: "set_arr2", id: 123456)]


    protected override func aboutToAppear() {
        // tmp_arrlist = ArrayList<Book2>([Book2(title: "test_appendall_1", id: 123456), Book2(title: "test_appendall_2", id: 123456)])
        // obs_arrlist.appendAll(tmp_arrlist)
        // 调用obs_arrlist_test 里的 append那些方法
        

    }

    protected override func aboutToDisappear() {

        obs_arrlist.unsubscribeAll()
        tmp_obs_arrlist.unsubscribeAll()


    }

    public func removeif_predicate(test_book: Book2): Bool{
        if(test_book.id == 0){
            return true
        }
        return false
    }


    func build() {
        Column {
            Text("obs_arrlist[0].title is ${obs_arrlist[0].title}").id("obs_arrlist_firbook")
            Text("obs_arrlist_size[0] is ${obs_arrlist_size}").id("obs_arrlist_size")
            Text("obs_arrlist_isempty is ${obs_arrlist_isempty}").id("obs_arrlist_isempty")
            Text("tmp_obs_arrlist[0].title is ${tmp_obs_arrlist[0].title}").id("tmp_obs_arrlist_firbook")
            Text("tmp_obs_arrlist_isempty is ${tmp_obs_arrlist_isempty}").id("tmp_obs_arrlist_isempty")
            Text("arrlist[0].title is ${arrlist[0].title}").id("arrlist_firbok")
        
            Button("test_arrlist_get").onClick{ e =>
                obs_arrlist[0] = Book2(title: "test_get", id: 123456)
                arrlist = obs_arrlist.get()
            }.id("test_arrlist_get")

            Button("test_set_arr").onClick{ e =>
                obs_arrlist.set(tmp_array)
            }.id("test_set_arr")

            Button("test_set_arrlist").onClick{ e =>
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_set_arrlist1", id: 123456), Book2(title: "test_setarrlist2", id: 123456)])
                obs_arrlist.set(tmp_arrlist)
            }.id("test_set_arrlist")

            Button("test_set_oca").onClick{ e =>
                tmp_obs_arrlist[0].title = "test_set_oca"
                obs_arrlist.set(tmp_obs_arrlist)
            }.id("test_set_oca")

            Button("test_arrlist_prop_size").onClick{ e =>
                obs_arrlist_size = obs_arrlist.size
            }.id("test_arrlist_prop_size")

            Button("test_arrlist_clone").onClick{ e =>
                obs_arrlist[0].title = "test_clone"
                tmp_obs_arrlist = obs_arrlist.clone()
            }.id("test_arrlist_clone")

            Button("test_arrlist_clear").onClick{ e =>
                tmp_obs_arrlist.clear()
                tmp_obs_arrlist_isempty = tmp_obs_arrlist.isEmpty()
                tmp_obs_arrlist.clear()
            }.id("test_arrlist_clear")

            Button("test_appendAll").onClick{ e =>
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_appendAll_1", id: 123456), Book2(title: "test_appendAll_2", id: 123456)])
                obs_arrlist.clear()
                obs_arrlist.appendAll(ArrayList<Book2>())
                obs_arrlist.appendAll(tmp_arrlist)
            }.id("test_appendAll")

            Button("test_arrlist_insert").onClick{ e =>
                obs_arrlist.insert(0, Book2(title: "test_insert1", id: 123456))
            }.id("test_arrlist_insert")

            Button("test_arrlist_insertAll").onClick{ e =>
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_insertAll_1", id: 123456), Book2(title: "test_insertAll_2", id: 123456)])
                obs_arrlist.insertAll(0, ArrayList<Book2>())
                obs_arrlist.insertAll(0, tmp_arrlist)
            }.id("test_arrlist_insertAll")

            Button("test_prepend").onClick{ e =>
                obs_arrlist.prepend(Book2(title: "test_prepend", id: 123456))
            }.id("test_prepend")

            Button("test_prependAll").onClick{ e =>
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_prependAll_1", id: 123456), Book2(title: "test_prependAll_2", id: 123456)])
                obs_arrlist.prependAll(ArrayList<Book2>())
                obs_arrlist.prependAll(tmp_arrlist)
            }.id("test_prependAll")

            Button("test_remove").onClick{ e =>
                obs_arrlist.clear()
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_remove_1", id: 123456), Book2(title: "test_remove_2", id: 123456)])
                obs_arrlist.appendAll(tmp_arrlist)
                obs_arrlist.remove(0)
            }.id("test_remove")

            Button("test_remove_range").onClick{ e =>
                obs_arrlist.clear()
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_remove_range_1", id: 123456), Book2(title: "test_remove_range_2", id: 123456), 
                                                                                                Book2(title: "test_remove_range_3", id: 123456)])
                obs_arrlist.appendAll(tmp_arrlist)
                obs_arrlist.remove(Range<Int64>(0,1,1, true, true, true))
            }.id("test_remove_range")

            Button("test_removeif").onClick{ e =>
                let predicate: (test_book: Book2) -> Bool
                predicate = removeif_predicate
                obs_arrlist.clear()
                tmp_arrlist = ArrayList<Book2>([Book2(title: "test_removeif1", id: 0), Book2(title: "test_removeif2", id: 123456)])
                obs_arrlist.appendAll(tmp_arrlist)
                obs_arrlist.removeIf(predicate)
            }.id("test_removeif")

        
        }
        

    }
}

@Observed
class Book2{
    @Publish var title: String = ""
    @Publish var price: Int64 = 9
    var id: Int64
}